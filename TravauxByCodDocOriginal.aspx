<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TravauxByCodDocOriginal.aspx.cs" Inherits="TravauxByCodDocOriginal" %>
<%@ Register Assembly="DevExpress.Web.v20.1, Version=20.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <dx:ASPxFormLayout ID="FormLayoutTypeProjet" ClientInstanceName="FormLayoutTypeProjet" runat="server" ColCount="5" Width="100%">
                <Items>

                    <dx:LayoutGroup Caption="Travaux planifiés" Width="100%" ColCount="5" ColSpan="5">
                        <Items>
                            <dx:LayoutItem Caption="Type" ShowCaption="False" ColSpan="1">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer>
    <dx:ASPxGridView ID="GridTravauxbyRef" ClientInstanceName="GridTravauxbyRef" DataSourceID="SqlDataTravaux"
                                    
                                    KeyFieldName="id" Width="100%" Theme="Metropolis" runat="server">

                                    <Columns>

                                        <dx:GridViewDataTextColumn FieldName="id" Visible="false" VisibleIndex="0">
                                        </dx:GridViewDataTextColumn>

                                        <dx:GridViewDataTextColumn FieldName="Reference" Caption="Titre du document" VisibleIndex="1">
                                        </dx:GridViewDataTextColumn>

                                        <dx:GridViewDataTextColumn FieldName="ActivityID" Caption="Activity ID" VisibleIndex="2">
                                        </dx:GridViewDataTextColumn>

                                        <dx:GridViewDataTextColumn FieldName="CodeDocument" Caption="Code" VisibleIndex="3">
                                        </dx:GridViewDataTextColumn>

                                        <dx:GridViewDataTextColumn FieldName="ActivityName" Caption="Titre du document" VisibleIndex="4">
                                        </dx:GridViewDataTextColumn>

                                        <dx:GridViewDataTextColumn FieldName="OriginalDuration" Caption="Original Duration" VisibleIndex="5">
                                        </dx:GridViewDataTextColumn>

                                        <dx:GridViewDataTextColumn FieldName="DD" Caption="Date Début" VisibleIndex="6">
                                        </dx:GridViewDataTextColumn>

                                        <dx:GridViewDataTextColumn FieldName="DF" Caption="Date Fin" VisibleIndex="7">
                                        </dx:GridViewDataTextColumn>

                                    </Columns>

                                    <SettingsPager PageSize="10" EnableAdaptivity="true">
                                        <PageSizeItemSettings Visible="true" Position="Right" ShowAllItem="true">
                                        </PageSizeItemSettings>
                                    </SettingsPager>
                                    <SettingsBehavior AutoExpandAllGroups="True" AllowFocusedRow="true" />
                                    <Settings ShowFooter="false" ShowGroupFooter="VisibleIfExpanded" ShowGroupedColumns="false" ShowColumnHeaders="false" ShowTitlePanel="true"
                                        VerticalScrollableHeight="300" VerticalScrollBarMode="Visible"></Settings>
                                </dx:ASPxGridView>
                                <asp:SqlDataSource ID="SqlDataTravaux" runat="server" ConnectionString="<%$ ConnectionStrings:PointeuseConnectionString %>"
                                    SelectCommand="GetTravauxByReference" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:Parameter Name="Reference" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                         </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                        </Items>
                    </dx:LayoutGroup>

                    <dx:LayoutGroup ShowCaption="False" Width="100%" ColCount="5" ColSpan="5">
                        <Items>
                            <dx:LayoutItem Caption="Type" ShowCaption="False" ColSpan="1" HorizontalAlign="Right">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer>
                                        <dx:ASPxButton ID="btnValider" ClientInstanceName="btnValider" runat="server"
                                            AutoPostBack="False" Text="Fermer" Width="130px" Theme="Glass">
                                            <ClientSideEvents Click="function(s, e) {
                                                                               parent.window.popupWind.Hide(); 
                                                                    }
                                                                    
                                                                    " />
                                        </dx:ASPxButton>

                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>



                        </Items>
                    </dx:LayoutGroup>

                </Items>
            </dx:ASPxFormLayout>
    </div>
    </form>
</body>
</html>
