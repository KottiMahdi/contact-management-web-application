<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CalenderContact.aspx.cs" Inherits="CalenderContact" %>

<%@ Register Assembly="DevExpress.Web.v20.1, Version=20.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.ASPxScheduler.v20.1, Version=20.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxScheduler" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.XtraScheduler.v20.1.Core, Version=20.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraScheduler" TagPrefix="dx" %>
<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">

        <div style="color: #7092BE; width: 100%; font-family: Segoe UI; font-size: 16pt; font-weight: bold; text-align: left; padding-bottom: 5px;">
            Evenements
        </div>

        <div>

            <style>
                .HeaderTitle {
                    text-align: center;
                    font-family: Tahoma;
                    font-weight: bold;
                    font-size: 12px;
                    writing-mode: unset;
                }

                .HeaderTitleDate {
                    text-align: left;
                    font-family: Tahoma;
                    font-weight: bold;
                    font-size: 12px;
                    padding-left: 5px;
                }

                .label_td {
                    padding-left: 5px;
                    font-family: Tahoma;
                    font-size: 12px;
                    padding-right: 5px;
                    font-weight: bold;
                    width: 250px;
                    /*background-color:#DBEBFF;*/
                    height: 18px;
                    /*border: 1px Solid #AECAF0;*/
                    border: 1px solid #A3C0E8;
                    background-color: #DBEBFF;
                }

                .xPane_header_expanded {
                    width: 100%;
                    text-align: center;
                    font-weight: normal;
                    text-align: center;
                    border-top: 1px Solid #A3C0E8;
                    border-left: 1px Solid #A3C0E8;
                    border-right: 1px Solid #A3C0E8;
                    color: #283B56;
                    background-color: #F7FAFF;
                    font: 12px Tahoma;
                }

                .xPane_header_collapsed {
                    width: 100%;
                    text-align: center;
                    font-weight: normal;
                    text-align: center;
                    border: 1px Solid #A3C0E8;
                    color: #283B56;
                    background-color: #F7FAFF;
                    font: 12px Tahoma;
                }

                .dxsc-rh-content .dxsc-rh-rotated-caption span {
                    transform: rotate(180deg);
                    -ms-transform: rotate(180deg);
                    -webkit-transform: rotate(180deg);
                    text-overflow: ellipsis;
                    overflow: hidden;
                    writing-mode: horizontal-tb;
                }

                .dxscApt .dxsc-apt-wrapper {
                    position: relative;
                    height: 100%;
                    background: none !important;
                    box-sizing: border-box;
                }

                .dxscAppointment_Aqua {
                    color: black;
                    font-size: 0.91em;
                    border: solid 1px #398bb1;
                    padding: 0;
                    margin: 0;
                    cursor: default;
                    width: 100%;
                    height: 100%;
                    overflow: hidden;
                    -moz-box-sizing: content-box;
                    box-sizing: content-box;
                }


                body {
                    padding: 0;
                    margin: 0;
                    background-color: #F4F0DB;
                    font: 14px Tahoma;
                }

                .panelContent {
                    font-size: 14px;
                    text-align: center;
                    white-space: normal;
                }

                .bodyContent {
                    margin: 0 auto;
                    width: 80%;
                    min-width: 180px;
                    line-height: 150%;
                    text-align: center;
                }

                    .bodyContent h3 {
                        padding: 40px 0 20px;
                    }

                .leftPanel {
                    width: 20%;
                    max-width: 250px;
                    min-width: 80px;
                    background-color: #F3EAFB !important;
                }

                .topPanel {
                    background-color: #DBF4DE !important;
                    padding: 20px 0 20px !important;
                }

                .bottomPanel {
                    background-color: #DBEBF4 !important;
                    padding: 20px 0 20px !important;
                }
            </style>
            <script type="text/javascript">
                function SchMaintenancePrev_MenuItemClicked(e) {
                    var name = e.itemName;
                    if (name == "add") AddFicheintervention();
                }
                function SchMaintenancePrev_Init(s, e) {
                    var popup = window.parent;
                    popup.window['SchMaintenancePrev'] = SchMaintenancePrev;
                }
                function DefaultAppointmentMenuHandler(sch, s, args) {
                    if (args.item.GetItemCount() <= 0) {

                        if (args.item.name == "Deletes") DeleteEvenement();
                        if (args.item.name == "edit") EditEvenement();
                        if (args.item.name == "consult") ShowConsultEvenement();
                        if (args.item.name == "SendEmail") RapportMaintenance_Prev();
                        if (args.item.name == "add") AddFicheintervention();

                    }


                }
                function EditEvenement() {
                    var id = SchMaintenancePrev.GetSelectedAppointmentIds();
                    if (id != null) {
                        window.parent.popup("ModifierEvenement.aspx?ID=" + id, 400, 800, "Modifier évenement");

                    }
                }
                function ShowConsultEvenement() {

                    var id = SchMaintenancePrev.GetSelectedAppointmentIds();

                    if (id != null) {

                        window.parent.popup("ConsultEvenement.aspx?ID=" + id, 800, 500, "Consulter l'evenement");
                    }
                }
                function RapportMaintenance_Prev() {

                    var id = SchMaintenancePrev.GetSelectedAppointmentIds();
                    if (id != null) {
                        window.parent.popup("SendEmail.aspx", 850, 900, "Send Email");
                    }

                }
                function AddFicheintervention() {

                    window.parent.popup("AjouterEvenement.aspx", 800, 500, "Ajouter l'evenement");

                }
                function onMenuPopup(s, e) {
                    var appointmentIds = SchMaintenancePrev.GetSelectedAppointmentIds();
                    SchMaintenancePrev.GetAppointmentProperties(appointmentIds[0], 'Description', OnGetAppointmentProps);

                }
                function OnGetAppointmentProps(value) {




                    if (value == "Envoyer") {

                        try { APPOINTMENTMENU.GetItem(0).SetVisible(true); } catch (e) { }
                        try { APPOINTMENTMENU.GetItem(1).SetVisible(false); } catch (e) { }
                        try { APPOINTMENTMENU.GetItem(2).SetVisible(true); } catch (e) { }
                        try { APPOINTMENTMENU.GetItem(3).SetVisible(true); } catch (e) { }
                        try { APPOINTMENTMENU.GetItem(4).SetVisible(false); } catch (e) { }
                        try { APPOINTMENTMENU.GetItem(5).SetVisible(false); } catch (e) { }

                    }

                    if (value == "En cours") {
                        try { APPOINTMENTMENU.GetItem(0).SetVisible(true); } catch (e) { }
                        try { APPOINTMENTMENU.GetItem(1).SetVisible(true); } catch (e) { }
                        try { APPOINTMENTMENU.GetItem(2).SetVisible(true); } catch (e) { }
                        try { APPOINTMENTMENU.GetItem(3).SetVisible(true); } catch (e) { }
                        try { APPOINTMENTMENU.GetItem(4).SetVisible(true); } catch (e) { }
                        try { APPOINTMENTMENU.GetItem(5).SetVisible(false); } catch (e) { }


                    }






                }
                function cmbAtelierSelIdxChgd(s, e) {
                    SchMaintenancePrev.PerformCallback();
                }
            </script>



            <dx:ASPxScheduler ID="SchMaintenancePrev" runat="server" OptionsView-VerticalScrollBarMode="Visible"
                AppointmentDataSourceID="SqlPrevSchedulingDataSource" Theme="Office365" ClientInstanceName="SchMaintenancePrev"
                ResourceDataSourceID="CarsDataSource"
                OptionsBehavior-ClientTimeZoneId="W. Central Africa Standard Time"
                ActiveViewType="Timeline" GroupType="Resource" ResourceNavigator-Mode="Tokens" LimitInterval-AllDay="True"
                OnPopupMenuShowing="SchMaintenancePrev_PopupMenuShowing">

                <OptionsCustomization
                    AllowAppointmentDrag="None"
                    AllowAppointmentDragBetweenResources="None"
                    AllowAppointmentEdit="None"
                    AllowInplaceEditor="None"
                    AllowAppointmentConflicts="Forbidden"
                    AllowDisplayAppointmentDependencyForm="Always" />
                <ClientSideEvents MenuItemClicked="function(s, e) {SchMaintenancePrev_MenuItemClicked(e); }"
                    Init="SchMaintenancePrev_Init"
                    AppointmentDoubleClick="EditEvenement" />
                <ResourceNavigator Visibility="Always" Mode="Tokens">
                    <SettingsTokens ShowResourceColor="true" />

                </ResourceNavigator>
                <Storage EnableReminders="false">
                    <Appointments ResourceSharing="True">

                        <Mappings AppointmentId="ID_Intervention" End="datefin" Start="datedebut" Location="TypeEv" Subject="Code_Interv" Description="Statut" ResourceId="ID_Entreprise" Label="Statut" />

                    </Appointments>
                    <Resources>
                        <Mappings ResourceId="ID_Entreprise" Caption="Etreprise" />
                        <Mappings ResourceId="ID_Entreprise" Caption="Nom" />

                    </Resources>
                </Storage>
                <Views>

                    <DayView Enabled="true" ResourcesPerPage="10">
                        <DayViewStyles ScrollAreaHeight="350"></DayViewStyles>
                    </DayView>

                    <WorkWeekView Enabled="False" ResourcesPerPage="10"></WorkWeekView>
                    <WeekView Enabled="true" ResourcesPerPage="10"></WeekView>
                    <MonthView Enabled="False" ResourcesPerPage="10"></MonthView>

                    <AgendaView Enabled="False">
                        <AppointmentDisplayOptions ShowLabel="false" ShowRecurrence="false" ShowReminder="false" StatusDisplayType="Never" />
                    </AgendaView>

                    <TimelineView CellAutoHeightOptions-Mode="FitToContent"
                        AppointmentDisplayOptions-ShowReminder="False"
                        AppointmentDisplayOptions-ShowRecurrence="False"
                        AppointmentDisplayOptions-TimeDisplayType="Clock"
                        AppointmentDisplayOptions-SnapToCellsMode="Auto"
                        ShowMoreButtons="true"
                        AppointmentDisplayOptions-StatusDisplayType="Time"
                        AppointmentDisplayOptions-EndTimeVisibility="Always"
                        AppointmentDisplayOptions-StartTimeVisibility="Always"
                        NavigationButtonVisibility="never"
                        DisplayedIntervalCount="14"
                        IntervalCount="28">

                        <TimelineViewStyles ScrollAreaHeight="370px">
                            <VerticalResourceHeader Width="370px" CssClass="HeaderTitle"></VerticalResourceHeader>
                        </TimelineViewStyles>

                        <Templates>
                            <HorizontalAppointmentTemplate>

                                <div style="text-align: center; border: solid 1px Gray;">
                                    <dx:ASPxPanel Height="5px" Visible="true" ID="ASPxLabel2" runat="server" BackColor='<%#((HorizontalAppointmentTemplateContainer)Container).AppointmentViewInfo.AppointmentStyle.BackColor = 
                                    Container.AppointmentViewInfo.Appointment.Location.ToString() == "Réunion" ? System.Drawing.Color.FromArgb(148, 0, 211): 
                                    Container.AppointmentViewInfo.Appointment.Location.ToString() == "Formation" ? System.Drawing.Color.FromArgb(178, 34, 34) :System.Drawing.Color.FromArgb(178, 34, 34) %>'>
                                    </dx:ASPxPanel>

                                    <dx:ASPxPanel ID="pl" runat="server"
                                        BackColor='<%#((HorizontalAppointmentTemplateContainer)Container).AppointmentViewInfo.AppointmentStyle.BackColor = 
                                    Container.AppointmentViewInfo.Appointment.LabelKey.ToString() == "En cours" ? System.Drawing.Color.FromArgb(135, 206, 250) : 
                                    Container.AppointmentViewInfo.Appointment.LabelKey.ToString() == "Envoyer" ? System.Drawing.Color.FromArgb(205, 250, 133) : System.Drawing.Color.FromArgb(205, 250, 133) %>'
                                        ForeColor='<%#((HorizontalAppointmentTemplateContainer)Container).AppointmentViewInfo.AppointmentStyle.ForeColor = 
                                    Container.AppointmentViewInfo.Appointment.LabelKey.ToString() == "En cours" ? System.Drawing.Color.Gray : 
                                    Container.AppointmentViewInfo.Appointment.LabelKey.ToString() == "Envoyer" ? System.Drawing.Color.Gray : System.Drawing.Color.Gray %>'
                                        Width="100%" Height="100%">

                                        <PanelCollection>
                                            <dx:PanelContent>

                                                <div style="text-align: center">

                                                    <div style="border-bottom: 1px Solid; text-align: center; font-size: x-small; font-weight: bold;">
                                                        <%# ((HorizontalAppointmentTemplateContainer)(Container.Parent)).AppointmentViewInfo.Appointment.Subject %>
                                                    </div>
                                                    <table style="text-align: center; width: 90px">
                                                        <tr>
                                                            <td style="font-size: 11px; text-align: center;">
                                                                <%# ((HorizontalAppointmentTemplateContainer)(Container.Parent)).AppointmentViewInfo.Appointment.Start.TimeOfDay %>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="font-size: 11px; text-align: center;">
                                                                <%# ((HorizontalAppointmentTemplateContainer)(Container.Parent)).AppointmentViewInfo.Appointment.End.TimeOfDay %>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </div>
                                            </dx:PanelContent>
                                        </PanelCollection>
                                    </dx:ASPxPanel>


                                </div>

                            </HorizontalAppointmentTemplate>
                        </Templates>

                    </TimelineView>

                </Views>


            </dx:ASPxScheduler>



            <asp:SqlDataSource ID="SqlPrevSchedulingDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:RessourceConnectionString %>"
                SelectCommand="GetListEvenementCalend" SelectCommandType="StoredProcedure" CancelSelectOnNullParameter="false"></asp:SqlDataSource>
            <asp:SqlDataSource ID="CarsDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:RessourceConnectionString %>"
                SelectCommand="GetListEntreprise" SelectCommandType="StoredProcedure"></asp:SqlDataSource>



        </div>
    </form>
</body>
</html>
