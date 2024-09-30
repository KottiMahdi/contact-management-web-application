<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PermissionProjet.aspx.cs" Inherits="PermissionProjet" %>

<%@ Register Assembly="DevExpress.Web.v20.1, Version=20.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <script type="text/javascript">


                function CallInterface() {
                    GridProjet.PerformCallback();
                }
            </script>
            <script type="text/javascript">

                function GridMenuDetaiSerItemClick(e) {
                    if (e.item == null) return;
                    var name = e.item.name;
                    if (name == "DetailProj") window.parent.AffectationRessourceProj();

                }

                function EndCallback(s,e) {

                    var chois = s.cp_add;
                  
                    if (chois == "Ajoute") {
                        txterror.SetText("Ajouté avec succès");
                        PopupAlert.Show();
                    }
                    
                }
            </script>
            

            <dx:ASPxSplitter ID="ASPxSpli" runat="server" Theme="Glass" Width="100%" FullscreenMode="True"
                ShowCollapseBackwardButton="True" ShowCollapseForwardButton="True" Orientation="Vertical"
                Height="100%">
                <Panes>
                    <dx:SplitterPane Name="Pane 1" ScrollBars="Auto">
                        <Panes>
                            <dx:SplitterPane Size="30%" Name="NavBarContainerProject" ShowCollapseBackwardButton="True" ScrollBars="Auto">
                                <ContentCollection>
                                    <dx:SplitterContentControl ID="TreeNomProject" runat="server">
                                        <dx:ASPxPopupMenu ID="ASPxPopupDetailSErMenu" runat="server" ClientInstanceName="ASPxPopupDetailSErMenu" CssPostfix="Glass" Theme="Glass">
                                            <Items>
                                                <dx:MenuItem Name="DetailProj" Text="Multiple Ajouté">
                                                    <Image Height="16px" Url="~/Image/Add.png" Width="16px">
                                                    </Image>
                                                </dx:MenuItem>
                                            </Items>
                                            <SubMenuStyle GutterWidth="0px" />
                                            <ClientSideEvents ItemClick="function(s, e) {GridMenuDetaiSerItemClick(e);}" />
                                        </dx:ASPxPopupMenu>
                                        <dx:ASPxGridView ID="GridRessource" ClientInstanceName="GridRessource" Width="100%" Theme="Glass" runat="server"
                                            AutoGenerateColumns="False"
                                            DataSourceID="sqlRessource" KeyFieldName="Matricule">
                                            <ClientSideEvents ContextMenu="function(s, e) {
                                 var x = ASPxClientUtils.GetEventX(e.htmlEvent);
                                 var y = ASPxClientUtils.GetEventY(e.htmlEvent);
   
                          if(e.objectType == 'row'){
                           GridRessource.SetFocusedRowIndex(e.index);
                           ASPxPopupDetailSErMenu.ShowAtPos(x,y); 
                                                          }
                            }"
                                                FocusedRowChanged="CallInterface" />

                                            <Columns>

                                                <dx:GridViewDataColumn FieldName="Matricule" Visible="true" VisibleIndex="1"></dx:GridViewDataColumn>

                                                <dx:GridViewDataTextColumn FieldName="NomPrenom" Caption="Nom et Prénom" VisibleIndex="2">
                                                    <EditFormSettings Visible="false" />
                                                </dx:GridViewDataTextColumn>

                                            </Columns>

                                            <SettingsBehavior AllowFocusedRow="True"></SettingsBehavior>
                                            <SettingsPager PageSize="5">
                                                <PageSizeItemSettings Visible="true" Position="Right" ShowAllItem="true">
                                                </PageSizeItemSettings>
                                            </SettingsPager>
                                            <Settings VerticalScrollableHeight="500" VerticalScrollBarMode="Visible"></Settings>
                                        </dx:ASPxGridView>

                                        <asp:SqlDataSource ID="sqlRessource" runat="server"
                                            ConnectionString="<%$ ConnectionStrings:PointeuseConnectionString %>"
                                            SelectCommand="GetEmployeebyPermission" SelectCommandType="StoredProcedure"></asp:SqlDataSource>



                                    </dx:SplitterContentControl>
                                </ContentCollection>
                            </dx:SplitterPane>
                            <dx:SplitterPane MinSize="100px" Name="editorsContainer" ScrollBars="Auto"
                                ShowCollapseForwardButton="True" Size="77%">
                                <ContentCollection>
                                    <dx:SplitterContentControl ID="SplitterContentControl1" runat="server">

                                        <dx:ASPxFormLayout ID="ASPxFormLayout2" ClientInstanceName="FormLayoutDEtailStatusProg" runat="server" ColCount="1" Width="100%">
                                            <Items>
                                                <dx:LayoutGroup Caption="Projets / Interface" Width="100%" ColCount="6">
                                                    <Items>
                                                        <dx:LayoutItem ShowCaption="False" ColSpan="1" Width="100%">
                                                            <LayoutItemNestedControlCollection>
                                                                <dx:LayoutItemNestedControlContainer>

                                                                    <dx:ASPxGridView ID="GridProjet" ClientInstanceName="GridProjet" Width="100%" Theme="Glass" runat="server" 
                                                                        AutoGenerateColumns="False" OnCustomCallback="GridProjet_CustomCallback" OnLoad="GridProjet_Load" 
                                                                        OnHtmlRowPrepared="GridProjet_HtmlRowPrepared"   OnCommandButtonInitialize="GridProjet_CommandButtonInitialize"
                                                                        DataSourceID="SqlDataProjet" KeyFieldName="id">
                                                                        <ClientSideEvents
                                                                            Init="function(s, e) {
	                                                                         var popup = window.parent.window.parent;
	                                                                         popup.window['GridProjet'] = GridProjet;}"
                                                                            EndCallback="function(s, e) {EndCallback(s,e);}" />

                                                                        <Columns>
                                                                            <dx:GridViewCommandColumn ButtonType="Image" Caption=" " Width="25px" VisibleIndex="0"
                                                                                ShowSelectCheckbox="false"
                                                                                ShowDeleteButton="true"
                                                                                ShowCancelButton="false"
                                                                                ShowUpdateButton="false">
                                                                            </dx:GridViewCommandColumn>
                                                                            <dx:GridViewDataTextColumn FieldName="id"  Visible="false" VisibleIndex="1">
                                                                            </dx:GridViewDataTextColumn>
                                                                            <dx:GridViewDataTextColumn FieldName="Matricule"  Visible="false" VisibleIndex="2">
                                                                            </dx:GridViewDataTextColumn>
                                                                            <dx:GridViewDataTextColumn FieldName="Projet" SortOrder="Ascending" Width="100%" Caption="Projet" VisibleIndex="3">
                                                                                <EditFormSettings Visible="false" />
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                        <SettingsCommandButton>
                                                                            <DeleteButton>
                                                                                <Image Url="~/image/delete.gif" Width="15px" Height="15px"  />
                                                                            </DeleteButton>
                                                                        </SettingsCommandButton>
                                                                        <SettingsBehavior    AllowFocusedRow="True"></SettingsBehavior>
                                                                        <SettingsPager PageSize="1000">
                                                                            <PageSizeItemSettings Visible="true" Position="Right" ShowAllItem="true">
                                                                            </PageSizeItemSettings>
                                                                        </SettingsPager>
                                                                        <Settings  ShowFooter="True" ShowGroupPanel="true" ShowGroupFooter="VisibleIfExpanded" VerticalScrollableHeight="420" VerticalScrollBarMode="Visible" HorizontalScrollBarMode="Visible"></Settings>
                                                                        <SettingsEditing EditFormColumnCount="1"    />
                                                                        <EditFormLayoutProperties>
                                                                            <SettingsAdaptivity AdaptivityMode="SingleColumnWindowLimit" SwitchToSingleColumnAtWindowInnerWidth="768" />
                                                                        </EditFormLayoutProperties>
                                                                    </dx:ASPxGridView>

                                                                    <asp:SqlDataSource ID="SqlDataProjet" runat="server" ConnectionString="<%$ ConnectionStrings:PointeuseConnectionString %>"
                                                                         SelectCommand="GeprojetByMatricule"     SelectCommandType="StoredProcedure"
                                                                         DeleteCommand="DeletePermissionByProj" DeleteCommandType="StoredProcedure">
                                                                        <DeleteParameters>
                                                                             <asp:Parameter Name="id" />
                                                                        </DeleteParameters>
                                                                        <SelectParameters>
                                                                            <asp:Parameter Name="Matricule" />
                                                                        </SelectParameters>
                                                                    </asp:SqlDataSource>
                                                                </dx:LayoutItemNestedControlContainer>
                                                            </LayoutItemNestedControlCollection>
                                                        </dx:LayoutItem>
                                                    </Items>
                                                </dx:LayoutGroup>
                                            </Items>
                                        </dx:ASPxFormLayout>







                                    </dx:SplitterContentControl>
                                </ContentCollection>
                            </dx:SplitterPane>
                        </Panes>
                        <ContentCollection>
                            <dx:SplitterContentControl ID="SplitterContentControl2" runat="server" SupportsDisabledAttribute="True">
                            </dx:SplitterContentControl>
                        </ContentCollection>
                    </dx:SplitterPane>
                </Panes>
            </dx:ASPxSplitter>

            <dx:ASPxPopupControl ID="PopupAlert" runat="server" HeaderText="Information" ClientInstanceName="PopupAlert"
    Width="400px" PopupHorizontalAlign="WindowCenter"
    PopupVerticalAlign="WindowCenter" Theme="Glass">

    <contentcollection>
        <dx:PopupControlContentControl ID="PopupControlContentControl1" runat="server">



            <table width="100%">
                <tr>
                    <td align="center">

                        <dx:ASPxLabel ID="txterror" ClientInstanceName="txterror" runat="server" ForeColor="Maroon"></dx:ASPxLabel>

                    </td>


                </tr>
                <tr>

                    <td align="center">
                        <dx:ASPxButton ID="ASPxButton3" runat="server" Text="OK" Width="100%" AutoPostBack="False"
                            Theme="Glass">
                            <ClientSideEvents Click="function(s, e) { 
                                
                                PopupAlert.Hide();
                                   window.parent.dnnModal.closePopUp(false);
                                }" />
                        </dx:ASPxButton>
                    </td>
                </tr>
                
            </table>



        </dx:PopupControlContentControl>
    </contentcollection>
</dx:ASPxPopupControl>

        </div>
    </form>
</body>
</html>
