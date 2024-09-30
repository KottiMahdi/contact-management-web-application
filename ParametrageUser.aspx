<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ParametrageUser.aspx.cs" Inherits="ParametrageUser" %>
<%@ Register Assembly="DevExpress.Web.v20.1, Version=20.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
  <script type="text/javascript">

      function focusedCallabck() {

          GridRessource.PerformCallback();
      }

  </script>


</head>
<body>
    <form id="form1" runat="server">
    <div>
   <dx:ASPxSplitter ID="ASPxSpli" runat="server" Theme="Glass" Width="100%" FullscreenMode="True"
                ShowCollapseBackwardButton="True" ShowCollapseForwardButton="True" Orientation="Vertical" Height="100%">
                <Panes>
                    <dx:SplitterPane Name="Pane 1" ScrollBars="Auto">
                        <Panes>
                            <dx:SplitterPane Size="30%" Name="NavBarContainerProject" ShowCollapseBackwardButton="True" ScrollBars="Auto">
                                <ContentCollection>
                                    <dx:SplitterContentControl ID="TreeNomProject" runat="server">
                                        <dx:ASPxFormLayout ID="ASPxFormLayout3" ClientInstanceName="FormLayoutDEtailStatusProg" runat="server" ColCount="1" Width="100%">
                                            <Items>
                                                <dx:LayoutGroup Caption="Pointeuses" Width="100%" ColCount="1">
                                                    <Items>

                                                        <dx:LayoutItem ShowCaption="False" Width="100%" ColSpan="1">
                                                            <LayoutItemNestedControlCollection>
                                                                <dx:LayoutItemNestedControlContainer>
                                                                    <dx:ASPxGridView ID="GridPointeuse" ClientInstanceName="GridPointeuse" DataSourceID="SqlIPAffecter" 
                                                                        KeyFieldName="device_id"
                                            Width="100%" Theme="Glass" runat="server">
                                                                        <ClientSideEvents FocusedRowChanged="focusedCallabck" />
                                            <Columns>
                                                <dx:GridViewDataTextColumn FieldName="device_id" VisibleIndex="2" Visible="false" Width="100px">
                                                </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn FieldName="IP" VisibleIndex="2" Width="100px">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="MachineAlias" VisibleIndex="2" Width="220px">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="MachineNom" VisibleIndex="2" Visible="false" Width="200px">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="MachineReference" VisibleIndex="2" Visible="false" Width="200px">
                                                </dx:GridViewDataTextColumn>
                                            
                                                <dx:GridViewDataTextColumn FieldName="Port" Width="100px" Visible="false" Caption="Port" VisibleIndex="3">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Enabled" Width="100px" Visible="false" Caption="Enabled" VisibleIndex="3">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Administrateur" Visible="false" Caption="Administrateur" VisibleIndex="3">
                                                </dx:GridViewDataTextColumn>
                                            </Columns>
                                            <SettingsEditing Mode="EditForm" />
                                            <SettingsBehavior ConfirmDelete="True" />
                                            
                                            <SettingsPager PageSize="20" EnableAdaptivity="true">
                                                <PageSizeItemSettings Visible="true" Position="Right" ShowAllItem="true">
                                                </PageSizeItemSettings>
                                            </SettingsPager>
                                            <SettingsBehavior AutoExpandAllGroups="True" AllowFocusedRow="true" />
                                            <Settings ShowFooter="false" ShowGroupFooter="VisibleIfExpanded" ShowGroupedColumns="false" ShowColumnHeaders="true"
                                                ShowTitlePanel="false" VerticalScrollableHeight="600" VerticalScrollBarMode="Visible"></Settings>
                                        </dx:ASPxGridView>

                                        <asp:SqlDataSource ID="SqlIPAffecter" runat="server" ConnectionString="<%$ ConnectionStrings:PointeuseConnectionString %>"
                                            SelectCommand="SelecttMAchineIP" SelectCommandType="StoredProcedure">
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
                            <dx:SplitterPane MinSize="100px" Name="editorsContainer" ScrollBars="Auto"
                                ShowCollapseForwardButton="True" Size="77%">
                                <ContentCollection>
                                    <dx:SplitterContentControl ID="SplitterContentControl1" runat="server">

                                        <dx:ASPxFormLayout ID="ASPxFormLayout1" ClientInstanceName="FormLayoutDEtailStatusProg" runat="server" ColCount="1" Width="100%">
                                            <Items>
                                                <dx:LayoutGroup Caption="Ressources / Pointeuse" Width="100%" ColCount="1">
                                                    <Items>
                                                        <dx:LayoutItem ShowCaption="False" Width="100%">
                                                            <LayoutItemNestedControlCollection>
                                                                <dx:LayoutItemNestedControlContainer>

                                                                    <dx:ASPxGridView ID="GridRessource" ClientInstanceName="GridRessource"  OnCustomCallback="GridRessource_CustomCallback"
                                                                         DataSourceID="SqlDataRessource" runat="server" Width="100%" Theme="Glass" AutoGenerateColumns="False" KeyFieldName="idUser">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn FieldName="idUser" Visible="false" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0">
                                                                            </dx:GridViewDataTextColumn>
                                                                            <dx:GridViewDataTextColumn FieldName="ipAddress" Caption="Address" ShowInCustomizationForm="True" VisibleIndex="1">
                                                                            </dx:GridViewDataTextColumn>
                                                                            <dx:GridViewDataTextColumn FieldName="machineNumber" Caption="Machine Number" ShowInCustomizationForm="True" VisibleIndex="1">
                                                                                <EditFormSettings Visible="False" />
                                                                            </dx:GridViewDataTextColumn>

                                                                            <dx:GridViewDataTextColumn FieldName="sdwEnrollNumber"  Caption="Matricule" ShowInCustomizationForm="True" VisibleIndex="2">
                                                                            </dx:GridViewDataTextColumn>
                                                                            <dx:GridViewDataTextColumn FieldName="sName" Caption="Nom" ShowInCustomizationForm="True" VisibleIndex="3">
                                                                            </dx:GridViewDataTextColumn>
                                                                            <dx:GridViewDataTextColumn FieldName="idwFingerIndex" Caption="Finger Index" ShowInCustomizationForm="True" VisibleIndex="4">
                                                                            </dx:GridViewDataTextColumn>
                                                                            <dx:GridViewDataDateColumn FieldName="sTmpData" Caption="Date" ShowInCustomizationForm="True" VisibleIndex="5">
                                                                            </dx:GridViewDataDateColumn>
                                                                            <dx:GridViewDataTextColumn FieldName="iPrivilege" Caption="Privilege" ShowInCustomizationForm="True" VisibleIndex="6">
                                                                            </dx:GridViewDataTextColumn>
                                                                            <dx:GridViewDataTextColumn FieldName="sPassword" Caption="Password" ShowInCustomizationForm="True" VisibleIndex="7">
                                                                            </dx:GridViewDataTextColumn>
                                                                            <dx:GridViewDataCheckColumn FieldName="bEnabled" Caption="Enabled" ShowInCustomizationForm="True" VisibleIndex="8">
                                                                            </dx:GridViewDataCheckColumn>
                                                                            <dx:GridViewDataTextColumn FieldName="iFlag" Caption="Flag" ShowInCustomizationForm="True" VisibleIndex="9">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                        <SettingsPager PageSize="30" EnableAdaptivity="true">
                                                                            <PageSizeItemSettings Visible="true" Position="Right" ShowAllItem="true">
                                                                            </PageSizeItemSettings>
                                                                        </SettingsPager>
                                                                    </dx:ASPxGridView>

                                                                    <asp:SqlDataSource ID="SqlDataRessource" runat="server" ConnectionString="<%$ ConnectionStrings:PointeuseConnectionString %>"
                                                                        SelectCommand="select_Employee_Pointeuse" SelectCommandType="StoredProcedure">
                                                                        <SelectParameters>
                                                                            <asp:Parameter Name="ipAddress" />
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
    </div>
    </form>
</body>
</html>
