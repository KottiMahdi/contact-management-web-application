using System;
using System.Collections.Generic;
using System.Data;
using System.Data.OleDb;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DetailPriorite : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void GridPriority_CustomCallback(object sender, DevExpress.Web.ASPxGridViewCustomCallbackEventArgs e)
    {
        SqlDataPriority.SelectParameters["Reference"].DefaultValue = cmbAffaire.Text;
        GridPrioritbyRef.DataBind();
    }

    protected void GridPriority_Load(object sender, EventArgs e)
    {
        SqlDataPriority.SelectParameters["Reference"].DefaultValue = cmbAffaire.Text;
        GridPrioritbyRef.DataBind();
    }


    // Button Update
    protected void B_UploadPCQP_Click(object sender, System.Web.UI.ImageClickEventArgs e)
    {
        var Utilisa = Page.Session["UtilisateurSession"];

        if (FileUpload1.HasFile)
        {
            try
            {
                // alter path for your project
                lblMessage.Visible = true;
                FileUpload1.SaveAs(Server.MapPath("~/Files/Archives DCR/DCR" + "-" + Utilisa + "-" + DateTime.Now.ToString("yyyy-MM-dd HH-mm-ss") + ".xlsx"));
                FileUpload1.SaveAs(Server.MapPath("~/DCR.xlsx"));



                lblMessage.InnerHtml = "Nom de fichier: " + FileUpload1.PostedFile.FileName + "<br>" + "Utilisateur: " + Utilisa + "<br>" + "Nom archive: " + "DCR" + DateTime.Now.ToString("yyyy-MM-dd HH-mm-ss") + "<br>" + "Taille du fichier: " + FileUpload1.PostedFile.ContentLength + " kb<br>";




                B_ImportPCQ.Visible = true;
                B_UploadPCQP.Visible = false;

            }

            catch (Exception ex)
            {
                lblMessage.InnerHtml = "Error: " + ex.Message.ToString();
            }
        }
        else
            lblMessage.InnerHtml = "Choisir le dossier";
    }

    protected void B_ImportPCQP_Click(object sender, System.Web.UI.ImageClickEventArgs e)
    {
        try
        {

            Session["tmpError"] = null;
            lblMessage.InnerHtml = "";

            DataTable dt = this.ObtenerDatosDesdeExcel(Server.MapPath("~/DCR.xlsx"), "DocumentEtude");

            int k = 0;


            DataLayerExperienceDataContext Layer = new DataLayerExperienceDataContext();


            while (k < dt.Rows.Count)
            {
                Layer.InsertDocumentEtude(dt.Rows[k][0].ToString(), dt.Rows[k][1].ToString(), dt.Rows[k][2].ToString(), dt.Rows[k][3].ToString(), dt.Rows[k][4].ToString(), dt.Rows[k][5].ToString(), dt.Rows[k][6].ToString(), dt.Rows[k][7].ToString(), dt.Rows[k][8].ToString(), dt.Rows[k][9].ToString(), dt.Rows[k][10].ToString(), dt.Rows[k][11].ToString());

                k = k + 1;
            }





            if (Session["tmpError"] != null)
            {
                lblMessage.InnerHtml = "Erreur d'importation de ligne";
                Session["tmpError"] = null;
            }
            else
            {
                lblMessage.InnerHtml = "Succès operation";
            }

        }


        catch (Exception ex)
        {
            lblMessage.InnerHtml = "Vérifier le format du document";
        }
    }

    private string[] ConvertToStringArray(System.Array values)
    {
        string[] theArray = new string[values.Length - 1 + 1];
        for (int i = 1; i <= values.Length; i++)
        {
            if (values.GetValue(1, i) == null)
                theArray[i - 1] = "";
            else
                theArray[i - 1] = (string)values.GetValue(1, i).ToString();
        }
        return theArray;
    }

    protected OleDbCommand ExcelConnection()
    {

        // Connect to the Excel Spreadsheet
        string xConnStr = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source= " + Server.MapPath("~/DCR.xlsx") + ";Extended Properties=\"Excel 7.0;HDR=YES;\"";

        // create your excel connection object using the connection string
        OleDbConnection objXConn = new OleDbConnection(xConnStr);
        objXConn.Open();
        // use a SQL Select command to retrieve the data from the Excel Spreadsheet
        // the "table name" is the name of the worksheet within the spreadsheet
        // in this case, the worksheet name is "Members" and is coded as: [Members$]
        OleDbCommand objCommand = new OleDbCommand("Select * FROM [DocumentEtude$]", objXConn);
        return objCommand;
    }

    private DataTable ObtenerDatosDesdeExcel(string strArchivo, string strHoja)
    {
        string strConexionExcel = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + strArchivo + ";Extended Properties='Excel 12.0;HDR=YES;'";
        string strSQL = "SELECT * FROM [" + strHoja + "$]";

        try
        {
            OleDbConnection objConexionExcel = new OleDbConnection(strConexionExcel);
            OleDbCommand objCmdExcel = new OleDbCommand(strSQL, objConexionExcel);
            objConexionExcel.Open();
            OleDbDataAdapter da = new OleDbDataAdapter(objCmdExcel);
            DataSet ds = new DataSet();
            da.Fill(ds);
            da.Dispose();
            objCmdExcel.Dispose();
            objConexionExcel.Close();
            return ds.Tables[0];
        }
        catch (Exception ex)
        {
            lblMessage.InnerHtml = "Error: " + ex.Message.ToString();
            return null/* TODO Change to default(_) if this is not a reference type */;
        }
    }

    protected void toolBarTchDiscs_ItemClick(object source, DevExpress.Web.MenuItemEventArgs e)
    {
        B_ImportPCQ.Visible = false;
        B_UploadPCQP.Visible = true;
        lblMessage.Visible = false;
    }

}