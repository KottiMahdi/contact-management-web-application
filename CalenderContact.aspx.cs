using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System;
using System.Web.UI.WebControls;
using DevExpress.Web.ASPxScheduler;

using DevExpress.XtraScheduler;
 
using DevExpress.Web;
 
public partial class CalenderContact : System.Web.UI.Page
{
    protected void SchMaintenancePrev_PopupMenuShowing(object sender, DevExpress.Web.ASPxScheduler.PopupMenuShowingEventArgs e)
    {
        if (e.Menu.MenuId == SchedulerMenuItemId.AppointmentMenu)
        {
            e.Menu.ClientSideEvents.ItemClick = string.Format("function(s, e) {{ DefaultAppointmentMenuHandler({0}, s, e); }}", SchMaintenancePrev.ClientInstanceName);
        }

        if (e.Menu.MenuId.Equals(SchedulerMenuItemId.DefaultMenu))
        {
            e.Menu.ClientInstanceName = "DEFAULTMENU";

            ManageDefaultMenuItems(e.Menu);

             


            e.Menu.Items.FindByName("add").Text = "Ajouter l'evenement";
            e.Menu.Items.FindByName("add").Image.Url = "~/Image/GMAO/order-16.png";
            e.Menu.Items.FindByName("add").Image.Width = 16;
            e.Menu.Items.FindByName("add").Image.Height = 16;
            e.Menu.Items.FindByName("add").Index = 0;
 
            //if (SchMaintenancePrev.ActiveViewType == SchedulerViewType.Timeline)
            //{
            //    e.Menu.Items.FindByName("TimeScaleEnable").Text = DotNetNuke.Services.Localization.Localization.GetString("schedTimeScaleEnable", ressFilePath);
            //    e.Menu.Items.FindByName("TimeScaleEnable!0").Text = DotNetNuke.Services.Localization.Localization.GetString("Year", ressFilePath);
            //    e.Menu.Items.FindByName("TimeScaleEnable!1").Text = DotNetNuke.Services.Localization.Localization.GetString("Month", ressFilePath);
            //    e.Menu.Items.FindByName("TimeScaleVisible").Text = DotNetNuke.Services.Localization.Localization.GetString("schedTimeScaleVisible", ressFilePath);
            //    e.Menu.Items.FindByName("TimeScaleVisible!0").Text = DotNetNuke.Services.Localization.Localization.GetString("Year", ressFilePath);
            //    e.Menu.Items.FindByName("TimeScaleVisible!1").Text = DotNetNuke.Services.Localization.Localization.GetString("Month", ressFilePath);
            //}


        }

        if (e.Menu.MenuId.Equals(SchedulerMenuItemId.AppointmentMenu))
        {
            e.Menu.ClientInstanceName = "APPOINTMENTMENU";

            ManageAppointmentMenuItems(e.Menu);
            //  Appointment menu Items customization
            e.Menu.Items.FindByName("consult").Text = "Consulter l'evenement";
            e.Menu.Items.FindByName("consult").Image.Url = "~/Image/Zooming.Icon.png";
            e.Menu.Items.FindByName("consult").Image.Width = 16;
            e.Menu.Items.FindByName("consult").Image.Height = 16;
            e.Menu.Items.FindByName("consult").Index = 0;

            e.Menu.Items.FindByName("SendEmail").Text = "Envoyer Email";
            e.Menu.Items.FindByName("SendEmail").Image.Url = "~/Image/GMAO/property-16.png";
            e.Menu.Items.FindByName("SendEmail").Image.Width = 16;
            e.Menu.Items.FindByName("SendEmail").Image.Height = 16;
            e.Menu.Items.FindByName("SendEmail").Index = 1;


            e.Menu.Items.FindByName("add").Text = "Ajouter l'evenement";
            e.Menu.Items.FindByName("add").Image.Url = "~/Image/GMAO/order-16.png";
            e.Menu.Items.FindByName("add").Image.Width = 16;
            e.Menu.Items.FindByName("add").Image.Height = 16;
            e.Menu.Items.FindByName("add").Index = 2;


            e.Menu.Items.FindByName("edit").Text = "Modifier l'evenement";
            e.Menu.Items.FindByName("edit").Image.Url = "~/Image/GMAO/date.png";
            e.Menu.Items.FindByName("edit").Image.Width = 16;
            e.Menu.Items.FindByName("edit").Image.Height = 16;
            e.Menu.Items.FindByName("edit").Index = 3;


            e.Menu.Items.FindByName("Deletes").Text = "Supprimer l'evenement";
            e.Menu.Items.FindByName("Deletes").Image.Url = "~/Image/GMAO/close.png";
            e.Menu.Items.FindByName("Deletes").Image.Width = 16;
            e.Menu.Items.FindByName("Deletes").Image.Height = 16;
            e.Menu.Items.FindByName("Deletes").Index = 4;

        }

        e.Menu.ClientSideEvents.PopUp = "onMenuPopup";
    }
    protected void ManageAppointmentMenuItems(ASPxSchedulerPopupMenu menu)
    {
        //add item

        menu.Items.Add("consult", "consult");
        menu.Items.Add("SendEmail", "SendEmail");
        menu.Items.Add("add", "add");
        menu.Items.Add("edit", "edit");
        menu.Items.Add("Deletes", "Deletes");
    }
    protected void ManageDefaultMenuItems(ASPxSchedulerPopupMenu menu)
    {
        //add item

        menu.Items.Add("add", "add");


        //Remove Unusual item
        RemoveMenuItem(menu, "NewAppointment");
        RemoveMenuItem(menu, "NewRecurringEvent");
        RemoveMenuItem(menu, "NewRecurringAppointment");
        RemoveMenuItem(menu, "NewAllDayEvent");
        RemoveMenuItem(menu, "GotoDate");
        RemoveMenuItem(menu, "GotoThisDay");

        RemoveMenuItem(menu, "SwitchTimeScale!01:00:00");
        RemoveMenuItem(menu, "SwitchTimeScale!00:30:00");
        RemoveMenuItem(menu, "SwitchTimeScale!00:15:00");
        RemoveMenuItem(menu, "SwitchTimeScale!00:10:00");
        RemoveMenuItem(menu, "SwitchTimeScale!00:06:00");
        RemoveMenuItem(menu, "SwitchTimeScale!00:05:00");

    }
    protected void RemoveMenuItem(ASPxSchedulerPopupMenu menu, string menuItemName)
    {
        DevExpress.Web.MenuItem item = menu.Items.FindByName(menuItemName);
        if (item != null)
        {
            menu.Items.Remove(item);

        }
    }
  
}