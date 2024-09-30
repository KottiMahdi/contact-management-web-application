using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.NetworkInformation;
using System.Windows.Forms;
using System.Text;
using System.Net;

public partial class ParametrageNomenclatureIP : System.Web.UI.Page
{
    private static int postep;
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void GridIPAffecter_CustomCallback(object sender, DevExpress.Web.ASPxGridViewCustomCallbackEventArgs e)
    {
        try
        {
            DataLayerExperienceDataContext Layer = new DataLayerExperienceDataContext();
        Layer.InsertMachineIP(TxtAlias.Text, TxtDevice.Text, TxtRef.Text, TxtIP.Text, TxtPord.Text, Convert.ToBoolean(TxtEnable.Text), TxtAdministrateur.Text);
        GridIPAffecter.DataBind();
        }


        catch (Exception ex)
        {

            var Mess = ex.InnerException.Message;
        }
    }


    protected void callbac_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
    {
        
        try
        { 
        callbac.JSProperties["cp_Etat"] = "";
        txtAddress.Text = " ";
        TxtRoundTrip.Text = " ";
        txtlive.Text = " ";
        txtfragment.Text = " ";
        txtsize.Text = " ";

        // Ping's the local machine.
        Ping pingSender = new Ping();
        var IP = TxtIP.Text;

        // Create a buffer of 32 bytes of data to be transmitted.
        string data = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa";
        byte[] buffer = Encoding.ASCII.GetBytes(data);

        // Wait 10 seconds for a reply.
        int timeout = 10000;

        // Set options for transmission:
        // The data can go through 64 gateways or routers
        // before it is destroyed, and the data packet
        // cannot be fragmented.
        PingOptions options = new PingOptions(64, true);
        PingReply reply = pingSender.Send(IP, timeout, buffer, options);

        if (reply.Status == IPStatus.Success)
        {
            txtAddress.Text = reply.Address.ToString();
            TxtRoundTrip.Text = reply.RoundtripTime.ToString();
            txtlive.Text = reply.Options.Ttl.ToString();
            txtfragment.Text = reply.Options.DontFragment.ToString();
            txtsize.Text= reply.Buffer.Length.ToString();

            callbac.JSProperties["cp_Etat"] = "Success";

        }
        else
        {
            
            callbac.JSProperties["cp_Etat"] = "Timeout";
        }
        }


        catch (Exception ex)
        {

            var Mess = ex.InnerException.Message ;
        }
    }

    protected void cbkTimer_Callback(object source, DevExpress.Web.CallbackEventArgs e)
    {
        e.Result = postep.ToString();
    }

    protected void ProgCallback_Callback(object source, DevExpress.Web.CallbackEventArgs e)
    {
      
        int count = 100;

        for (int i = 0; i < count; i++)
        {
            postep = i + 1;
           
           System.Threading.Thread.Sleep(100);
           
        }
    }
}