using DevExpress.Web.ASPxTreeList;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DetailProjet : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsCallback) {

            GridProjet.FocusedRowIndex = -1;

            }
    }

    protected void DropDownTypeProjet_CustomJSProperties(object sender, DevExpress.Web.CustomJSPropertiesEventArgs e)
    {
        ASPxTreeList tree = DropDownTypeProjet.FindControl("treeListType") as ASPxTreeList;

        Hashtable depNames = new Hashtable();
        foreach (TreeListNode node in tree.GetVisibleNodes())
            depNames.Add(node.Key, node["Type"]);
        e.Properties["cpDepName"] = depNames;
    }

    protected void CallbackDetailProjet_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
    {


        var select = GridProjet.FocusedRowIndex;

        if (select != -1) { 

        CallbackDetailProjet.JSProperties["cp_Insert"] = "";

        DataLayerExperienceDataContext Layer = new DataLayerExperienceDataContext();


        var reference = GridProjet.GetRowValues(GridProjet.FocusedRowIndex, "Reference").ToString();

        var req = (from q in Layer.GetDetailProjet(reference) select q).ToList();

        var chois = e.Parameter;


            if (chois == "Ajouter")
            {

                ASPxTreeList TreeType = DropDownTypeProjet.FindControl("treeListType") as ASPxTreeList;

                var don = TreeType.FocusedNode.Key;

                var Descrition = TxtDescription.Text;
                var Phase = TxttypePhase.Value.ToString();
                var TypeProjet = don.ToString();
                var Client = cmbClient.Value.ToString();
                var Task = cmbTackForce.Text;
                var Classe = cmbClasse.Value.ToString();
                var Revision = GridLookup.Text;
                var DD = txtDateDebut.Value.ToString();
                var DF = TxtDateFin.Value.ToString();
                var MemoClien = MemoClient.Text;
                var MemoRemarqProje = MemoRemarqProjet.Text;


                if (req.Count() == 0)
                {
                    Layer.insertDetailProjet(reference, Descrition, Client, Phase, TypeProjet, Task, Classe, Revision, DD, DF, MemoClien, MemoRemarqProje);
                    CallbackDetailProjet.JSProperties["cp_Insert"] = "Ajouté avec succès";
                }
                else
                {
                    Layer.updatDetailProjet(reference, Descrition, Client, Phase, TypeProjet, Task, Classe, Revision, DD, DF, MemoClien, MemoRemarqProje);
                    CallbackDetailProjet.JSProperties["cp_Insert"] = "Modifié avec succès";
                }

            }

            else if (chois == "Detail")
            {


                if (req.Count() != 0)
                {
                    TxtRef.Text = req[0].reference;
                    TxtDescription.Text = req[0].Description;
                    TxttypePhase.Text = req[0].Phase;
                    DropDownTypeProjet.Text = req[0].Type;
                    cmbClient.Text = req[0].Client;
                    cmbTackForce.Text = req[0].taskforce;
                    cmbClasse.Text = req[0].Classe;
                    GridLookup.Text = req[0].Revision;
                    txtDateDebut.Value = req[0].DD;
                    TxtDateFin.Value = req[0].DF;
                    MemoClient.Text = req[0].RemarqClient;
                    MemoRemarqProjet.Text = req[0].RemarqProjet;
                    SqlDataDiscipline.SelectParameters["Reference"].DefaultValue = reference;
                }
            }

        CallbackDetailProjet.DataBind();
        }

        //GridDiscipline
        // SqlDataDiscipline

    }

  
}