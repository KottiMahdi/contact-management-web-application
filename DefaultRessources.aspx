<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DefaultRessources.aspx.cs" Inherits="DefaultRessources" %>

<%@ Register Assembly="DevExpress.Web.v20.1, Version=20.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>

<body>
    <form id="form1" runat="server">
        <script type="text/javascript">

            function RowChangedSociete() {
                gridSociete.GetRowValues(gridSociete.GetFocusedRowIndex(), 'ID_Entreprise', SelectItem);
            }

            function SelectItem(values) {
                GridRessouerce.PerformCallback(values);
            }



        </script>
        <script type="text/javascript">

            function GridMenuDetaiSerItemClick(e) {
                if (e.item == null) return;
                var name = e.item.name;
                if (name == "AddEntr") window.parent.AddEntreprise();
                if (name == "AddContact") AddContact();
                if (name == "DetailEntr") showDetailEntr();



                if (name == "DeletEntre") showDeletEntre();
                if (name == "ModEntr") showModEntr();

            }



            function GridMenuDetaiEvenmItemClick(e) {
                if (e.item == null) return;
                var name = e.item.name;

                if (name == "AddEven") AddEven();


            }

            function GridMenuDetaiEvenmItemAttribuClick(e) {
                if (e.item == null) return;
                var name = e.item.name;
                if (name == "detailAttribu") ShowGestionAccess();
            }

          
 





            function ShowGestionAccess() {
                gridEven.GetRowValues(gridEven.GetFocusedRowIndex(), 'ID_Evenement', GetGestionAccessCallback);
            }
            function GetGestionAccessCallback() {
                CallbackGestionAcces.PerformCallback();
                popupAcces.Show();
            }



            function AddEven() {
                GridRessouerce.GetRowValues(GridRessouerce.GetFocusedRowIndex(), 'ID_Contact', SelectAddEvenement);
            }



            function SelectAddEvenement(Values) {

                window.parent.Ajouter_Evenement(Values)

            }

            function CallbackInsert() {

                window.parent.AddEntreprise();
            }
            function AddContact() {

                gridSociete.GetRowValues(gridSociete.GetFocusedRowIndex(), 'ID_Entreprise', SelectAddContac);

            }

            function SelectAddContac(Values) {

                window.parent.AddContact(Values)

            }


            function AddEntr() {

                gridSociete.GetRowValues(gridSociete.GetFocusedRowIndex(), 'ID_Entreprise', SelectAddEntreprise);

            }

            function SelectAddEntreprise(Values) {

                window.parent.AjoutEntreprise(Values)

            }

            function showModEntr() {

                gridSociete.GetRowValues(gridSociete.GetFocusedRowIndex(), 'ID_Entreprise', SelectShowUpdateEntreprise);
            }
            function SelectShowUpdateEntreprise(value) {

                window.parent.ModifierEntreprise(value);

            }


            function showDeletEntre() {


                gridSociete.GetRowValues(gridSociete.GetFocusedRowIndex(), 'Nom', SelectshowSuppEntre);

            }
            function SelectshowSuppEntre(value) {


                txterror.SetText("Souhaitez-vous réellement supprimer " + value + " ? ");
                PopupAlerts.Show();
            }


            function EndcallbacSupprimer(s, e) {



                var choix = s.cp_Exist;

                if (choix == "Supp") {
                    txterrorSuc.SetText("Supprimer avec succès");
                    PopupAlertsSuc.Show();
                }
                if (choix == "Exist") {
                    txterrorVali.SetText("Attention vous êtes sur le point de supprimer l'intégralité de la fiche entreprise.");
                    PopupValider.Show();




                }






            }

            function showDetailEntr() {

                gridSociete.GetRowValues(gridSociete.GetFocusedRowIndex(), 'ID_Entreprise', SelectShowItemEntr);

            }

            function SelectShowItemEntr(value) {

                window.parent.DetailEntreprise(value);


            }


            function CallEven() {
                gridEven.PerformCallback();
            }



            function CallbakAddAccesExit() {
                popupAcces.Hide();
                window.parent.dnnModal.load();
            }

            function CallbakAddAcces() {
                callbAddGestionAcces.PerformCallback();
            }
            function EndCallbackAccess() {
                PopupAlertAcces.Show();
                txterrorAcc.SetText("Ajouté avec success");
            }



        </script>


        <dx:ASPxPopupMenu ID="ASPxPopupDetailEvenMenu" runat="server" ClientInstanceName="ASPxPopupDetailEvenMenu" CssPostfix="Glass" Theme="Glass">
            <Items>


                <dx:MenuItem Name="AddEven" Text="Ajouter Evenement">
                    <Image Height="16px" Url="~/Image/action.png" Width="16px">
                    </Image>
                </dx:MenuItem>
            </Items>
            <SubMenuStyle GutterWidth="0px" />
            <ClientSideEvents ItemClick="function(s, e) {GridMenuDetaiEvenmItemClick(e);}" />
        </dx:ASPxPopupMenu>


     
        

        <dx:ASPxPopupMenu ID="ASPxPopupDetailEvenAttriMenu" runat="server" ClientInstanceName="ASPxPopupDetailEvenAttriMenu" CssPostfix="Glass" Theme="Glass">
            <Items>

                <dx:MenuItem Name="detailAttribu" Text="Détails attribut">
                    <Image Height="16px" Url="~/Image/action.png" Width="16px">
                    </Image>
                </dx:MenuItem>
                   
            </Items>
            <SubMenuStyle GutterWidth="0px" />
            <ClientSideEvents ItemClick="function(s, e) {GridMenuDetaiEvenmItemAttribuClick(e);}" />
        </dx:ASPxPopupMenu>
           <div style="color: #7092BE; width: 100%; font-family: Segoe UI; font-size: 16pt; font-weight: bold; text-align: left; padding-bottom: 5px;">
    Contacts
</div>
        <dx:ASPxSplitter ID="ASPxSplitter1" runat="server" Theme="Glass" Width="100%" Height="100%"
            FullscreenMode="True"
            ShowCollapseBackwardButton="True" ShowCollapseForwardButton="True">
            <Panes>
                <dx:SplitterPane Size="25%">

                    <Panes>
                        <dx:SplitterPane>
                            <ContentCollection>
                                <dx:SplitterContentControl runat="server">

                                    <dx:ASPxPopupMenu ID="ASPxPopupDetailSErMenu" runat="server" ClientInstanceName="ASPxPopupDetailSErMenu" CssPostfix="Glass" Theme="Glass">
                                        <Items>

                                            <dx:MenuItem Name="DetailEntr" Text="Entreprise">
                                                <Image Height="16px" Url="~/Image/action.png" Width="16px"></Image>


                                                <Items>
                                                    <dx:MenuItem Name="DetailEntr" Text="Détails Entreprise">
                                                        <Image Height="16px" Url="~/Image/details-40.png" Width="16px">
                                                        </Image>
                                                    </dx:MenuItem>
                                                    <dx:MenuItem Name="AddEntr" Text="Ajouter Entreprise">
                                                        <Image Height="16px" Url="~/Image/Add.png" Width="16px">
                                                        </Image>
                                                    </dx:MenuItem>
                                                    <dx:MenuItem Name="ModEntr" Text="Modifier Entreprise">
                                                        <Image Height="16px" Url="~/Image/Add.png" Width="16px">
                                                        </Image>
                                                    </dx:MenuItem>
                                                    <dx:MenuItem Name="DeletEntre" Text="Supprimer Entreprise">
                                                        <Image Height="16px" Url="~/Image/Delete_32x32.png" Width="16px">
                                                        </Image>
                                                    </dx:MenuItem>
                                                </Items>



                                            </dx:MenuItem>
                                            <dx:MenuItem Name="AddContact" Text="Ajouter Contact">
                                                <Image Height="16px" Url="~/Image/action.png" Width="16px">
                                                </Image>
                                            </dx:MenuItem>
                                        </Items>
                                        <SubMenuStyle GutterWidth="0px" />
                                        <ClientSideEvents ItemClick="function(s, e) {GridMenuDetaiSerItemClick(e);}" />
                                    </dx:ASPxPopupMenu>

                                    <dx:ASPxGridView ID="gridSociete" ClientInstanceName="gridSociete" runat="server" AutoGenerateColumns="False"
                                        DataSourceID="SqlDataSocieteDetail" OnCustomCallback="gridSociete_CustomCallback" Theme="Glass" Width='100%' KeyFieldName="ID_Entreprise">
                                        <ClientSideEvents Init="function(s, e) { 
                      var popup = window.parent; 
                      popup.window['gridSociete'] = gridSociete;}"
                                            FocusedRowChanged="RowChangedSociete" ContextMenu="function(s, e) {
                                 var x = ASPxClientUtils.GetEventX(e.htmlEvent);
                                 var y = ASPxClientUtils.GetEventY(e.htmlEvent);
   
                          if(e.objectType == 'row'){
                           gridSociete.SetFocusedRowIndex(e.index);
                           ASPxPopupDetailSErMenu.ShowAtPos(x,y); 
                                                          }
                            }" />
                                        <SettingsSearchPanel Visible="True" />
                                        <SettingsBehavior AllowFocusedRow="true" />
                                        <Toolbars>
                                            <dx:GridViewToolbar>
                                                <SettingsAdaptivity Enabled="true" EnableCollapseToSideMenu="true" EnableCollapseRootItemsToIcons="true" />

                                                <Items>
                                                    <dx:GridViewToolbarItem Alignment="Right" Command="New">
                                                        <Template>
                                                            <dx:ASPxButton HorizontalAlign="Center" runat="server" Text=" " RenderMode="Link" AutoPostBack="false">
                                                                <Image Url="Image/add_large.png" Width="25px"></Image>
                                                                <ClientSideEvents Click="CallbackInsert" />
                                                            </dx:ASPxButton>

                                                        </Template>
                                                    </dx:GridViewToolbarItem>

                                                </Items>
                                            </dx:GridViewToolbar>
                                        </Toolbars>
                                        <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="DataAware" />

                                        <Columns>

                                            <dx:GridViewDataTextColumn Visible="false" FieldName="ID_Entreprise" ReadOnly="True" VisibleIndex="1" ShowInCustomizationForm="True"
                                                Caption="Entreprise">
                                                <EditFormSettings Visible="False" />
                                            </dx:GridViewDataTextColumn>

                                            <dx:GridViewDataTextColumn FieldName="Nom" VisibleIndex="2" ShowInCustomizationForm="True" Caption="Entreprise">
                                            </dx:GridViewDataTextColumn>
                                        </Columns>

                                        <Settings VerticalScrollableHeight="500" VerticalScrollBarMode="Visible" />
                                    </dx:ASPxGridView>

                                    <asp:SqlDataSource ID="SqlDataSocieteDetail" runat="server" ConnectionString="<%$ ConnectionStrings:RessourceConnectionString %>"
                                        SelectCommand="GetEntreprise" SelectCommandType="StoredProcedure"></asp:SqlDataSource>


                                </dx:SplitterContentControl>
                            </ContentCollection>
                        </dx:SplitterPane>
                    </Panes>


                    <ContentCollection>
                        <dx:SplitterContentControl runat="server"></dx:SplitterContentControl>
                    </ContentCollection>


                </dx:SplitterPane>
                <dx:SplitterPane>

                    <Panes>
                        <dx:SplitterPane Size="41%">
                            <Panes>
                                <dx:SplitterPane>
                                    <ContentCollection>
                                        <dx:SplitterContentControl runat="server">
                                            <dx:ASPxGridView ID="GridRessouerce" runat="server" AutoGenerateColumns="False" ClientInstanceName="GridRessouerce"
                                                DataSourceID="SqlDataContact" KeyFieldName="ID_Contact" OnLoad="GridRessouerce_Load" OnCustomCallback="GridRessouerce_CustomCallback" Theme="Glass" Width="100%">
                                                <ClientSideEvents FocusedRowChanged="CallEven" Init="function(s, e) { 
                      var popup = window.parent; 
                      popup.window['GridRessouerce'] = GridRessouerce;}"
                                                    ContextMenu="function(s, e) {
                                 var x = ASPxClientUtils.GetEventX(e.htmlEvent);
                                 var y = ASPxClientUtils.GetEventY(e.htmlEvent);
   
                          if(e.objectType == 'row'){
                           GridRessouerce.SetFocusedRowIndex(e.index);
                           ASPxPopupDetailEvenMenu.ShowAtPos(x,y); 
                                                          }
                            }" />




                                                <Columns>

                                                    <dx:GridViewCommandColumn ShowDeleteButton="True" ShowInCustomizationForm="True" ShowNewButtonInHeader="false" VisibleIndex="0" Width="30px">
                                                    </dx:GridViewCommandColumn>

                                                    <dx:GridViewDataTextColumn FieldName="ID_Contact" ReadOnly="True" VisibleIndex="1" Visible="False">
                                                        <EditFormSettings Visible="False" />
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn FieldName="Nom" VisibleIndex="3">
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn FieldName="Prenom" VisibleIndex="4">
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn FieldName="Telephone" Caption="Téléphone" Width="70px" VisibleIndex="5">
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn FieldName="Mobile" Width="70px" VisibleIndex="6">
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn FieldName="E_mail"  VisibleIndex="7">
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn FieldName="Suivi_par" VisibleIndex="10">
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataComboBoxColumn Caption="Civ" Width="50px" FieldName="ID_Civ" VisibleIndex="2" ShowInCustomizationForm="True">
                                                        <PropertiesComboBox DataSourceID="Civilite" TextField="Civilite" ValueField="ID_Civ">
                                                        </PropertiesComboBox>
                                                    </dx:GridViewDataComboBoxColumn>
                                                    <dx:GridViewDataComboBoxColumn Caption="Fonction" FieldName="ID_Fonction" VisibleIndex="8" ShowInCustomizationForm="True">
                                                        <PropertiesComboBox DataSourceID="Fonction" TextField="Fonction" ValueField="ID_Fonction">
                                                        </PropertiesComboBox>
                                                    </dx:GridViewDataComboBoxColumn>
                                                    <dx:GridViewDataComboBoxColumn FieldName="ID_Entreprise" Visible="false" VisibleIndex="9" ShowInCustomizationForm="True">
                                                        <PropertiesComboBox DataSourceID="SqlEntreprise" ValueField="ID_Entreprise" TextField="Nom">
                                                        </PropertiesComboBox>
                                                    </dx:GridViewDataComboBoxColumn>
                                                </Columns>
                                                <SettingsBehavior AllowFocusedRow="true" />
                                                <SettingsEditing Mode="Batch">
                                                </SettingsEditing>
                                                <Settings ShowFilterRow="True" VerticalScrollableHeight="250" VerticalScrollBarMode="Visible" />
                                                <SettingsCommandButton>
                                                    <NewButton>
                                                        <Image Url="Image/add_large.png" Width="20px">
                                                        </Image>
                                                    </NewButton>
                                                    <UpdateButton>
                                                        <Image ToolTip="Save changes and close Edit Form" Url="Image/save.gif">
                                                        </Image>
                                                    </UpdateButton>
                                                    <CancelButton ButtonType="Image" RenderMode="Image">
                                                        <Image ToolTip="Close Edit Form without saving changes" Url="Image/cancel.gif">
                                                        </Image>
                                                    </CancelButton>
                                                    <DeleteButton>
                                                        <Image Url="Image/Delete_32x32.png" Width="20px">
                                                        </Image>
                                                    </DeleteButton>
                                                </SettingsCommandButton>
                                                <SettingsSearchPanel Visible="True" />
                                            </dx:ASPxGridView>
                                        </dx:SplitterContentControl>
                                    </ContentCollection>
                                </dx:SplitterPane>
                            </Panes>

                            <ContentCollection>
                                <dx:SplitterContentControl runat="server"></dx:SplitterContentControl>
                            </ContentCollection>

                        </dx:SplitterPane>
                        <dx:SplitterPane>
                            <Panes>
                                <dx:SplitterPane>
                                    <ContentCollection>
                                        <dx:SplitterContentControl runat="server"> 
                                    
                                            <dx:ASPxGridView ID="gridEven" runat="server" AutoGenerateColumns="False" ClientInstanceName="gridEven"   KeyFieldName="ID_Evenement"
                                                DataSourceID="SqlDataEvenement" OnCustomCallback="gridEven_CustomCallback" Theme="Glass" Width="100%">
                                              
                                               <ClientSideEvents  Init="function(s, e) { 
                      var popup = window.parent; 
                      popup.window['gridEven'] = gridEven;}" ContextMenu="function(s, e) {
                                 var x = ASPxClientUtils.GetEventX(e.htmlEvent);
                                 var y = ASPxClientUtils.GetEventY(e.htmlEvent);
   
                          if(e.objectType == 'row'){
                           gridEven.SetFocusedRowIndex(e.index);
                           ASPxPopupDetailEvenAttriMenu.ShowAtPos(x,y); 
                                                          }
                            }" 
                                                />
                                                
                                                 <Columns>

                                                    <dx:GridViewCommandColumn ShowDeleteButton="True" ShowInCustomizationForm="True" ShowNewButtonInHeader="false" VisibleIndex="0" Width="30px">
                                                    </dx:GridViewCommandColumn>

                                                    <dx:GridViewDataTextColumn FieldName="ID_Evenement" ReadOnly="True" VisibleIndex="1" Visible="False">
                                                        <EditFormSettings Visible="False" />
                                                    </dx:GridViewDataTextColumn>


                                                   <dx:GridViewDataTextColumn FieldName="Objet" VisibleIndex="4">
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn FieldName="DateDebut" Caption="Date début" VisibleIndex="5">
                                                    </dx:GridViewDataTextColumn>
                                                   <dx:GridViewDataTextColumn FieldName="Heure" Caption="Heure début" VisibleIndex="6">
                                                    </dx:GridViewDataTextColumn>
                                                   <dx:GridViewDataTextColumn FieldName="DateFin" Caption="Date Fin" VisibleIndex="7">
                                                    </dx:GridViewDataTextColumn>
                                                   <dx:GridViewDataTextColumn FieldName="HeureFin" Caption="Heure Fin"  VisibleIndex="8">
                                                    </dx:GridViewDataTextColumn>
                                                   <dx:GridViewDataTextColumn FieldName="Lieu" VisibleIndex="9">
                                                    </dx:GridViewDataTextColumn>
                                                  
                                                    <dx:GridViewDataComboBoxColumn FieldName="ID_TypeEv" ShowInCustomizationForm="True" VisibleIndex="3" Caption="Type">
                                                        <PropertiesComboBox DataSourceID="sqlGetType" TextField="TypeEv" ValueField="ID_Type">
                                                        </PropertiesComboBox>
                                                    </dx:GridViewDataComboBoxColumn>
                                                      <dx:GridViewDataTextColumn FieldName="DescriptionEv" Caption="Description" VisibleIndex="10">
                                                    </dx:GridViewDataTextColumn>
                                                 




                                                    
                                                </Columns>
                                                <SettingsCommandButton>
                                                    <NewButton>
                                                        <Image Url="Image/add_large.png" Width="20px">
                                                        </Image>
                                                    </NewButton>
                                                    <UpdateButton>
                                                        <Image ToolTip="Save changes and close Edit Form" Url="Image/save.gif">
                                                        </Image>
                                                    </UpdateButton>
                                                    <CancelButton ButtonType="Image" RenderMode="Image">
                                                        <Image ToolTip="Close Edit Form without saving changes" Url="Image/cancel.gif">
                                                        </Image>
                                                    </CancelButton>
                                                    <DeleteButton>
                                                        <Image Url="Image/Delete_32x32.png" Width="20px">
                                                        </Image>
                                                    </DeleteButton>
                                                </SettingsCommandButton>
                                                <Settings VerticalScrollableHeight="500" VerticalScrollBarMode="Visible" />
                                                <SettingsBehavior AllowFocusedRow="True" />
                                                <SettingsSearchPanel Visible="True" />
                                                <SettingsExport EnableClientSideExportAPI="True" ExcelExportMode="DataAware">
                                                </SettingsExport>
                                                
                                            </dx:ASPxGridView>
                                    
                                        </dx:SplitterContentControl>
                                    </ContentCollection>
                                </dx:SplitterPane>
                            </Panes>


                            <ContentCollection>
                                <dx:SplitterContentControl runat="server"></dx:SplitterContentControl>
                            </ContentCollection>


                        </dx:SplitterPane>
                    </Panes>
                    <ContentCollection>
                        <dx:SplitterContentControl runat="server"></dx:SplitterContentControl>
                    </ContentCollection>

                </dx:SplitterPane>
            </Panes>
        </dx:ASPxSplitter>


        <div>
            <asp:SqlDataSource ID="SqlDataContact" runat="server" ConnectionString="<%$ ConnectionStrings:RessourceConnectionString %>"
                SelectCommand="GetContact" SelectCommandType="StoredProcedure" DeleteCommand="DeleteContact" DeleteCommandType="StoredProcedure" InsertCommand="Insert_Contact" InsertCommandType="StoredProcedure" UpdateCommand="UpdateContact" UpdateCommandType="StoredProcedure">


                <DeleteParameters>
                    <asp:Parameter Name="ID_Contact" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="ID_Civ" Type="Int32" />
                    <asp:Parameter Name="Nom" Type="String" />
                    <asp:Parameter Name="Prenom" Type="String" />
                    <asp:Parameter Name="Telephone" Type="String" />
                    <asp:Parameter Name="Mobile" Type="String" />
                    <asp:Parameter Name="E_mail" Type="String" />
                    <asp:Parameter Name="ID_Fonction" Type="Int32" />
                    <asp:Parameter Name="ID_Entreprise" Type="Int32" />
                    <asp:Parameter Name="Suivi_par" Type="String" />
                </InsertParameters>


                <SelectParameters>
                    <asp:Parameter Name="ID_Entreprise" />
                </SelectParameters>




                <UpdateParameters>
                    <asp:Parameter Name="ID_Contact" Type="Int32" />
                    <asp:Parameter Name="ID_Civ" Type="Int32" />
                    <asp:Parameter Name="Nom" Type="String" />
                    <asp:Parameter Name="Prenom" Type="String" />
                    <asp:Parameter Name="Telephone" Type="Int32" />
                    <asp:Parameter Name="Mobile" Type="Int32" />
                    <asp:Parameter Name="E_mail" Type="String" />
                    <asp:Parameter Name="ID_Fonction" Type="Int32" />
                    <asp:Parameter Name="ID_Entreprise" Type="Int32" />
                    <asp:Parameter Name="Suivi_par" Type="String" />
                </UpdateParameters>




            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataEvenement" runat="server" ConnectionString="<%$ ConnectionStrings:RessourceConnectionString %>"
                SelectCommand="GetDetailEvenement" SelectCommandType="StoredProcedure" DeleteCommand="DeleteNomenclature_Evenement" DeleteCommandType="StoredProcedure">
                <DeleteParameters>
                    <asp:Parameter Name="ID_Evenement" Type="Int32" />
                </DeleteParameters>
                <SelectParameters>
                    <asp:Parameter Name="ID_Contact" />
                </SelectParameters>

            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataFonction" runat="server"
                ConnectionString="<%$ ConnectionStrings:RessourceConnectionString %>"
                SelectCommand="GetFonctions" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSociete" runat="server"
                ConnectionString="<%$ ConnectionStrings:RessourceConnectionString %>"
                SelectCommand="GetSociete" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
            <asp:SqlDataSource ID="Civilite" runat="server" ConnectionString="<%$ ConnectionStrings:RessourceConnectionString %>"
                SelectCommand="GetCiv" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
            <asp:SqlDataSource ID="Fonction" runat="server" ConnectionString="<%$ ConnectionStrings:RessourceConnectionString %>"
                SelectCommand="GetFonction" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlEntreprise" runat="server" ConnectionString="<%$ ConnectionStrings:RessourceConnectionString %>"
                SelectCommand="GetEntreprise" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
        </div>
        <dx:ASPxPopupControl ID="PopupAlertsSuc" ClientInstanceName="PopupAlertsSuc" AutoUpdatePosition="false"
            runat="server" Theme="Glass" Width="350px" HeaderText="Information"
            Modal="True"
            PopupHorizontalAlign="WindowCenter"
            PopupVerticalAlign="TopSides">
            <HeaderImage Url="~/Image/Session.jpg" Width="25">
            </HeaderImage>

            <ContentCollection>
                <dx:PopupControlContentControl ID="PopupControlContentControl3" runat="server">




                    <table style="width: 100%">
                        <tr style="text-align: center">

                            <td style="text-align: center">
                                <dx:ASPxLabel ID="txterrorSuc" runat="server" Font-Bold="true" ClientInstanceName="txterrorSuc" ForeColor="Red"></dx:ASPxLabel>
                                <br />
                                <br />
                            </td>

                        </tr>

                        <tr>

                            <td style="text-align: center">
                                <dx:ASPxButton ID="ASPxButton5" runat="server" Text="Fermer" Width="80px" AutoPostBack="False"
                                    Theme="Glass">
                                    <ClientSideEvents Click="function(s, e) {
                                                  
                                                   gridSociete.PerformCallback(); 
                                                   GridRessouerce.PerformCallback();
                                                   PopupAlertsSuc.Hide();  	
                                                   }"></ClientSideEvents>
                                </dx:ASPxButton>
                            </td>
                        </tr>
                    </table>
                </dx:PopupControlContentControl>

            </ContentCollection>
        </dx:ASPxPopupControl>

        <dx:ASPxPopupControl ID="PopupAlerts" ClientInstanceName="PopupAlerts" AutoUpdatePosition="false"
            runat="server" Theme="Glass" Width="350px" HeaderText="Information"
            Modal="True"
            PopupHorizontalAlign="WindowCenter"
            PopupVerticalAlign="TopSides">
            <HeaderImage Url="~/Image/Session.jpg" Width="25">
            </HeaderImage>

            <ContentCollection>
                <dx:PopupControlContentControl ID="PopupControlContentControl2" runat="server">




                    <table style="width: 100%">
                        <tr style="text-align: center">

                            <td style="text-align: center" colspan="3">
                                <dx:ASPxLabel ID="txterror" runat="server" Font-Bold="true" ClientInstanceName="txterror" ForeColor="Red"></dx:ASPxLabel>
                                <br />
                                <br />
                            </td>

                        </tr>

                        <tr>
                            <td style="text-align: right">
                                <dx:ASPxButton ID="ASPxButton1" runat="server" Text="Valider" Width="80px" AutoPostBack="False"
                                    Theme="Glass">
                                    <ClientSideEvents Click="function(s, e) {
                                                 callbacSupprimer.PerformCallback('supprimer');
                                                   	 gridSociete.PerformCallback(); 
                                                   GridRessouerce.PerformCallback();
                                                   PopupAlerts.Hide(); 
                                                   }"></ClientSideEvents>
                                </dx:ASPxButton>
                            </td>
                            <td style="width: 10px"></td>
                            <td style="text-align: left">
                                <dx:ASPxButton ID="ASPxButton14" runat="server" Text="Fermer" Width="80px" AutoPostBack="False"
                                    Theme="Glass">
                                    <ClientSideEvents Click="function(s, e) {
                                                   	 gridSociete.PerformCallback(); 
                                                   GridRessouerce.PerformCallback();
                                                   PopupAlerts.Hide();  	
                                                   }"></ClientSideEvents>
                                </dx:ASPxButton>
                            </td>
                        </tr>
                    </table>
                </dx:PopupControlContentControl>

            </ContentCollection>
        </dx:ASPxPopupControl>

        <dx:ASPxPopupControl ID="PopupValider" ClientInstanceName="PopupValider" AutoUpdatePosition="false"
            runat="server" Theme="Glass" Width="350px" HeaderText="Information"
            Modal="True"
            PopupHorizontalAlign="WindowCenter"
            PopupVerticalAlign="TopSides">
            <HeaderImage Url="~/Image/Session.jpg" Width="25">
            </HeaderImage>

            <ContentCollection>
                <dx:PopupControlContentControl ID="PopupControlContentControl1" runat="server">




                    <table style="width: 100%">
                        <tr style="text-align: center">

                            <td style="text-align: center" colspan="3">
                                <dx:ASPxLabel ID="txterrorVali" runat="server" Font-Bold="true" ClientInstanceName="txterrorVali" ForeColor="Red"></dx:ASPxLabel>
                                <br />
                                <br />
                            </td>

                        </tr>

                        <tr>
                            <td style="text-align: right">
                                <dx:ASPxButton ID="ASPxButton2" runat="server" Text="Valider" Width="80px" AutoPostBack="False"
                                    Theme="Glass">
                                    <ClientSideEvents Click="function(s, e) {
                                                 callbacSupprimer.PerformCallback('valider');
                                                   		 gridSociete.PerformCallback(); 
                                                   GridRessouerce.PerformCallback();
                                                   PopupValider.Hide();  
                                                   }"></ClientSideEvents>
                                </dx:ASPxButton>
                            </td>
                            <td style="width: 10px"></td>
                            <td style="text-align: left">
                                <dx:ASPxButton ID="ASPxButton3" runat="server" Text="Fermer" Width="80px" AutoPostBack="False"
                                    Theme="Glass">
                                    <ClientSideEvents Click="function(s, e) {
                                                  	 gridSociete.PerformCallback(); 
                                                   GridRessouerce.PerformCallback();
                                                   PopupValider.Hide();  
                                                   	
                                                   }"></ClientSideEvents>
                                </dx:ASPxButton>
                            </td>
                        </tr>
                    </table>
                </dx:PopupControlContentControl>

            </ContentCollection>
        </dx:ASPxPopupControl>


        <dx:ASPxCallback ID="callbacSupprimer" ClientInstanceName="callbacSupprimer" OnCallback="callbacSupprimer_Callback" runat="server">
            <ClientSideEvents EndCallback="function(s, e) {
                                                                              EndcallbacSupprimer(s,e); 
                                                                    }
                                                                    
                                                                    " />
        </dx:ASPxCallback>
        <br />
        <asp:SqlDataSource ID="DeleteEven" runat="server" ConnectionString="<%$ ConnectionStrings:RessourceConnectionString %>" SelectCommand="DeleteNomenclature_Evenement" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:Parameter Name="ID_Evenement" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <asp:SqlDataSource ID="sqlGetType" runat="server" ConnectionString="<%$ ConnectionStrings:RessourceConnectionString %>" SelectCommand="GetType" SelectCommandType="StoredProcedure">
        </asp:SqlDataSource>


        <dx:ASPxPopupControl ID="popupAcces" ClientInstanceName="popupAcces" runat="server" AllowDragging="true" Width="900px" Theme="Glass"
    PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" HeaderText="Gestion d'accès">
    <ContentCollection>
        <dx:PopupControlContentControl runat="server">
            <dx:ASPxCallbackPanel ID="CallbackGestionAcces" runat="server" Width="100%" ClientInstanceName="CallbackGestionAcces" OnCallback="CallbackGestionAcces_Callback"
                Theme="Aqua">
                <PanelCollection>
                    <dx:PanelContent ID="PanelContent5" runat="server">

                        <dx:ASPxFormLayout ID="ASPxFormLayout4" runat="server" EnableViewState="false" EncodeHtml="false"
                            RequiredMarkDisplayMode="RequiredOnly" Theme="Aqua" Width="100%" ColumnCount="1">
                            <Items>
                                <dx:LayoutGroup Caption="Attribut Evenement" GroupBoxStyle-Caption-Font-Bold="true" Width="100%">
                                    <Items>
                                        <dx:LayoutItem  ShowCaption="False">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer>

                                                    <dx:ASPxGridLookup ID="GrdValidateur" ClientInstanceName="GrdValidateur" BackColor="lightyellow" runat="server"  
                                                        Width="100%" AutoPostBack="false" Theme="Aqua" MultiTextSeparator=", " SelectionMode="Multiple"
                                                        DataSourceID="SqlListeEmployeValidateur" KeyFieldName="Matricule" TextFormatString="{0}">

                                                        <ValidationSettings Display="Dynamic" ErrorDisplayMode="ImageWithTooltip" ValidationGroup="GroupValidation">
                                                            <RequiredField IsRequired="true" ErrorText="*" />
                                                        </ValidationSettings>

                                                        <Columns>
                                                            <dx:GridViewDataTextColumn FieldName="users" Caption="Nom et Prénom" Width="270px" VisibleIndex="1"
                                                                Settings-AutoFilterCondition="Contains">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn FieldName="Matricule" Visible="false"></dx:GridViewDataTextColumn>
                                                        </Columns>

                                                        <GridViewProperties Settings-ShowTitlePanel="false">

                                                            <Settings ShowFilterRow="True" ShowStatusBar="Visible" />
                                                            <SettingsPager PageSize="7" EnableAdaptivity="true" />

                                                        </GridViewProperties>
                                                      

                                                    </dx:ASPxGridLookup>
                                                    <asp:SqlDataSource ID="SqlListeEmployeValidateur" runat="server" ConnectionString="<%$ ConnectionStrings:RessourceConnectionString %>"
                                                        SelectCommand="SelectEmployer" SelectCommandType="StoredProcedure"></asp:SqlDataSource>

                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                        
                                        
                                    </Items>
                                </dx:LayoutGroup>

                                <dx:LayoutGroup ShowCaption="False" GroupBoxStyle-Caption-Font-Bold="true" Width="100%">
                                    <Items>
                                        <dx:LayoutItem ShowCaption="False">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer>
                                                    <div align="right">
                                                        <table>
                                                            <tr>
                                                                <td height="3px"></td>
                                                            </tr>
                                                            <tr>

                                                                <td>
                                                                    <dx:ASPxButton ID="ASPxButton4" runat="server" Width="70px" ClientInstanceName="btnConfirmGest" Text="Valider" AutoPostBack="false">
                                                                        <Image Url="~/image/GMAO/Termi.png" Width="20px"></Image>
                                                                        <ClientSideEvents Click="CallbakAddAcces" />
                                                                    </dx:ASPxButton>
                                                                </td>
                                                                <td align="right" Width="110px">
                                                                    <dx:ASPxButton ID="ASPxButton6" runat="server" Width="70px" ClientInstanceName="btnAnnulerStep1" Text="Annuler" AutoPostBack="false">
                                                                        <Image Url="~/image/GMAO/close.png" Width="20px"></Image>
                                                                        <ClientSideEvents Click="CallbakAddAccesExit" />
                                                                    </dx:ASPxButton>
                                                                </td>

                                                            </tr>
                                                        </table>

                                                    </div>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                    </Items>
                                </dx:LayoutGroup>
                            </Items>
                        </dx:ASPxFormLayout>




                    </dx:PanelContent>
                </PanelCollection>
            </dx:ASPxCallbackPanel>
        </dx:PopupControlContentControl>
    </ContentCollection>
    <SettingsAdaptivity Mode="OnWindowInnerWidth" SwitchAtWindowInnerWidth="800" />

</dx:ASPxPopupControl>

<dx:ASPxCallback ID="callbAddGestionAcces" ClientInstanceName="callbAddGestionAcces" runat="server" OnCallback="callbAddGestionAcces_Callback">
    <ClientSideEvents EndCallback="function(s, e) {EndCallbackAccess(s,e);}" />
</dx:ASPxCallback>


        <dx:ASPxPopupControl ID="PopupAlertAcces" runat="server" HeaderText="Information" ClientInstanceName="PopupAlertAcces"
    Width="420px" PopupHorizontalAlign="WindowCenter"
    PopupVerticalAlign="WindowCenter" Theme="Glass">

    <ContentCollection>
        <dx:PopupControlContentControl ID="PopupControlContentControl4" runat="server">



            <table width="100%">
                <tr>
                    <td align="center" colspan="2">

                        <dx:ASPxLabel ID="txterrorAcc" ClientInstanceName="txterrorAcc" runat="server" Font-Bold="true" ForeColor="Maroon"></dx:ASPxLabel>

                    </td>


                </tr>
                <tr>
                    <td height="10px"></td>
                </tr>



                <tr>

                    <td align="center">
                        <dx:ASPxButton ID="ASPxButton7" runat="server" Text="Fermer" Width="100%" AutoPostBack="False"
                            Theme="Glass">
                            <ClientSideEvents Click="CallbakSynchAcces"></ClientSideEvents>
                        </dx:ASPxButton>
                    </td>
                </tr>
            </table>



        </dx:PopupControlContentControl>
    </ContentCollection>
</dx:ASPxPopupControl>


    </form>
</body>
</html>
