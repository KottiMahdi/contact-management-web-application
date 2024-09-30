<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DetailCodeDocument.aspx.cs" Inherits="DetailCodeDocument" %>

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
            <asp:SqlDataSource ID="SqlDCR" runat="server"
                ConnectionString="<%$ ConnectionStrings:PointeuseConnectionString %>"
                SelectCommand="GetDocumentEtudeByProjets" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:Parameter Name="Reference" />

                </SelectParameters>
            </asp:SqlDataSource>
            <dx:ASPxFormLayout ID="ASPxFormLayout1" ClientInstanceName="FormLayoutTypeProjet" runat="server" ColCount="1" Width="100%">
                <Items>
                    <dx:LayoutGroup Caption="Détail" Width="100%">
                        <Items>
                            <dx:LayoutItem ShowCaption="False">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer>
                                        <dx:ASPxGridView ID="ASPxGridView1" ClientInstanceName="GridDCR" runat="server"
                                            AutoGenerateColumns="False" KeyFieldName="id" DataSourceID="SqlDCR" Width="100%" EnableTheming="True">

                                            <Columns>
                                                <dx:GridViewDataTextColumn FieldName="id" Visible="false" VisibleIndex="0">
                                                </dx:GridViewDataTextColumn>


                                                <dx:GridViewDataTextColumn FieldName="TitreDocument" Caption="Titre du document" Width="50%" VisibleIndex="1">
                                                    <HeaderStyle HorizontalAlign="Center" BackColor="DodgerBlue"></HeaderStyle>
                                                    <GroupFooterCellStyle ForeColor="Brown" HorizontalAlign="Right" Font-Bold="true"></GroupFooterCellStyle>
                                                    <FooterCellStyle BackColor="#F5F5DC" HorizontalAlign="Right" Font-Bold="true" />
                                                    <EditFormSettings Visible="true"></EditFormSettings>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="CodeDocument" Caption="Réf EPPM" Width="200px" VisibleIndex="3">
                                                    <FooterCellStyle BackColor="#F5F5DC" ForeColor="Maroon" HorizontalAlign="Center" Font-Bold="true" />
                                                </dx:GridViewDataTextColumn>

                                                <dx:GridViewDataTextColumn FieldName="Rev" Caption="Rev" Width="80px" VisibleIndex="4">
                                                    <HeaderStyle HorizontalAlign="Center" BackColor="Violet"></HeaderStyle>
                                                    <FooterCellStyle BackColor="#F5F5DC" ForeColor="Maroon" HorizontalAlign="Center" Font-Bold="true" />
                                                    <GroupFooterCellStyle ForeColor="Black" HorizontalAlign="Right" Font-Bold="true"></GroupFooterCellStyle>
                                                    <EditFormSettings Visible="true"></EditFormSettings>
                                                </dx:GridViewDataTextColumn>

                                                <dx:GridViewDataProgressBarColumn FieldName="Avancement" VisibleIndex="5">
                                                    <HeaderStyle HorizontalAlign="Center" BackColor="Violet"></HeaderStyle>
                                                    <FooterCellStyle BackColor="#F5F5DC" HorizontalAlign="Right" Font-Bold="true" />
                                                    <EditFormSettings Visible="true"></EditFormSettings>
                                                </dx:GridViewDataProgressBarColumn>

                                            </Columns>

                                            <Settings VerticalScrollableHeight="100" VerticalScrollBarMode="Visible"></Settings>

                                        </dx:ASPxGridView>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>



                        </Items>
                    </dx:LayoutGroup>
                    <dx:LayoutGroup Caption="DCR" Width="100%">
                        <Items>
                            <dx:LayoutItem ShowCaption="False">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer>

                                        <dx:ASPxGridView ID="GridDCR" ClientInstanceName="GridDCR" runat="server"
                                            AutoGenerateColumns="False" KeyFieldName="id" DataSourceID="SqlDCR" Width="100%" EnableTheming="True">

                                            <Columns>
                                                <dx:GridViewBandColumn Caption="Période Planifiée" Name="ListeDoc" VisibleIndex="6" HeaderStyle-BackColor="Orange">
                                                    <Columns>

                                                        <dx:GridViewDataDateColumn Caption="Emission" FieldName="EmissionPlanifiee" Width="170px" VisibleIndex="9" PropertiesDateEdit-DisplayFormatString="dd-MM-yyyy">
                                                            <PropertiesDateEdit DisplayFormatString="dd-MM-yyyy">
                                                            </PropertiesDateEdit>
                                                            <Settings GroupInterval="Date"></Settings>
                                                            <FooterCellStyle BackColor="#F5F5DC" ForeColor="Maroon" HorizontalAlign="Center" Font-Bold="true" />
                                                        </dx:GridViewDataDateColumn>

                                                        <dx:GridViewDataDateColumn Caption="Approbation" FieldName="ApprobationPanifiee" Width="170px" VisibleIndex="10" PropertiesDateEdit-DisplayFormatString="dd-MM-yyyy">
                                                            <PropertiesDateEdit DisplayFormatString="dd-MM-yyyy">
                                                            </PropertiesDateEdit>
                                                            <Settings GroupInterval="Date"></Settings>
                                                            <FooterCellStyle BackColor="#F5F5DC" ForeColor="Maroon" HorizontalAlign="Center" Font-Bold="true" />
                                                        </dx:GridViewDataDateColumn>


                                                    </Columns>
                                                    <HeaderStyle HorizontalAlign="Center" />

                                                </dx:GridViewBandColumn>
                                                <dx:GridViewBandColumn Caption="Selon client" Name="ListeDoc" VisibleIndex="7" HeaderStyle-BackColor="YellowGreen">
                                                    <Columns>

                                                        <dx:GridViewDataProgressBarColumn FieldName="Poids" Caption="Poids" Width="160px">
                                                            <FooterCellStyle BackColor="#F5F5DC" HorizontalAlign="Right" Font-Bold="true" />
                                                            <EditFormSettings Visible="true"></EditFormSettings>
                                                        </dx:GridViewDataProgressBarColumn>

                                                        <dx:GridViewDataProgressBarColumn FieldName="Ponderation" Caption="Ponderation" Width="200px">
                                                            <FooterCellStyle BackColor="#F5F5DC" HorizontalAlign="Right" Font-Bold="true" />
                                                            <EditFormSettings Visible="true"></EditFormSettings>
                                                        </dx:GridViewDataProgressBarColumn>


                                                    </Columns>
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                </dx:GridViewBandColumn>
                                                <dx:GridViewBandColumn Caption="Budge horaire Consommées" Name="ListeDoc" VisibleIndex="8" HeaderStyle-BackColor="Tomato">
                                                    <Columns>
                                                        <dx:GridViewDataTextColumn FieldName="NBHProjeteur" Caption="Projeteurs" Width="100px">
                                                            <FooterCellStyle BackColor="#F5F5DC" ForeColor="Maroon" HorizontalAlign="Center" Font-Bold="true" />
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn FieldName="NBHIngenieur" Caption="Ingénieurs" Width="100px">
                                                            <FooterCellStyle BackColor="#F5F5DC" ForeColor="Maroon" HorizontalAlign="Center" Font-Bold="true" />
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn FieldName="Total" Caption="Total(h)" Width="80px">

                                                            <CellStyle BackColor="#dedcdc"></CellStyle>
                                                            <HeaderStyle ForeColor="Maroon" />
                                                            <FooterCellStyle BackColor="#F5F5DC" ForeColor="Maroon" HorizontalAlign="Center" Font-Bold="true" />


                                                        </dx:GridViewDataTextColumn>
                                                    </Columns>
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                </dx:GridViewBandColumn>
                                            </Columns>

                                            <Settings
                                                VerticalScrollableHeight="100" VerticalScrollBarMode="Visible"></Settings>

                                        </dx:ASPxGridView>


                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>



                        </Items>
                    </dx:LayoutGroup>
                    <dx:LayoutGroup ShowCaption="False" Width="100%" SettingsItems-HorizontalAlign="Right">
                        <Items>
                            <dx:LayoutItem ShowCaption="False">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer>

                                        <dx:ASPxButton ID="btnConfirmer" ClientInstanceName="btnConfirmer" runat="server"
                                            AutoPostBack="False" Text="Fermer" Width="130px" Theme="Glass">
                                            <ClientSideEvents Click="function(s, e) {
                                                                       parent.window.popupWind.Hide();
                                                                    }
                                                                    
                                                                    " />
                                            <Image Height="18px" Width="18px" Url="~/Image/save.gif">
                                            </Image>
                                        </dx:ASPxButton>

                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>



                        </Items>
                        <SettingsItems HorizontalAlign="Right"></SettingsItems>
                    </dx:LayoutGroup>
                </Items>
            </dx:ASPxFormLayout>
        </div>
    </form>
</body>
</html>
