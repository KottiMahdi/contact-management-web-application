using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.OleDb;
using System.Data;

public partial class ListeControleProjet : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

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
                FileUpload1.SaveAs(Server.MapPath("~/Files/Archives Controle qualite Projet/QualiteProjet" + "-" + Utilisa + "-" + DateTime.Now.ToString("yyyy-MM-dd HH-mm-ss") + ".xlsx"));
                FileUpload1.SaveAs(Server.MapPath("~/ControleQualiteProjet.xlsx"));



                lblMessage.InnerHtml = "Nom de fichier: " + FileUpload1.PostedFile.FileName + "<br>" + "Utilisateur: " + Utilisa + "<br>" + "Nom archive: " + "QualiteProjet" + DateTime.Now.ToString("yyyy-MM-dd HH-mm-ss") + "<br>" + "Taille du fichier: " + FileUpload1.PostedFile.ContentLength + " kb<br>";




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

            DataTable dt = this.ObtenerDatosDesdeExcel(Server.MapPath("~/ControleQualiteProjet.xlsx"), "ControleQualiteProjet");

            int k = 0;


            //var Layer = new DataLayerPrimaveraDataContext();
            DataLayerExperienceDataContext Layer = new DataLayerExperienceDataContext();

            while (k < dt.Rows.Count)
            {
                Layer.InsertControleQualite(dt.Rows[k][0].ToString(), dt.Rows[k][1].ToString(), dt.Rows[k][2].ToString(), dt.Rows[k][3].ToString(), dt.Rows[k][4].ToString(), dt.Rows[k][5].ToString(), dt.Rows[k][6].ToString(), dt.Rows[k][7].ToString(), dt.Rows[k][8].ToString(), dt.Rows[k][9].ToString(), dt.Rows[k][10].ToString(), dt.Rows[k][11].ToString(), dt.Rows[k][12].ToString(), dt.Rows[k][13].ToString(), dt.Rows[k][14].ToString(), dt.Rows[k][15].ToString(), dt.Rows[k][16].ToString(), dt.Rows[k][17].ToString(), dt.Rows[k][18].ToString(), dt.Rows[k][19].ToString(), dt.Rows[k][20].ToString(), dt.Rows[k][21].ToString(), dt.Rows[k][22].ToString(), dt.Rows[k][23].ToString(), dt.Rows[k][24].ToString(), dt.Rows[k][25].ToString());

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
        string xConnStr = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source= " + Server.MapPath("~/ControleQualiteProjet.xlsx") + ";Extended Properties=\"Excel 7.0;HDR=YES;\"";

        // create your excel connection object using the connection string
        OleDbConnection objXConn = new OleDbConnection(xConnStr);
        objXConn.Open();
        // use a SQL Select command to retrieve the data from the Excel Spreadsheet
        // the "table name" is the name of the worksheet within the spreadsheet
        // in this case, the worksheet name is "Members" and is coded as: [Members$]
        OleDbCommand objCommand = new OleDbCommand("Select * FROM [ControleQualiteProjet$]", objXConn);
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