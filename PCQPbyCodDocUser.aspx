<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PCQPbyCodDocUser.aspx.cs" Inherits="PCQPbyCodDocUser" %>


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

            <asp:SqlDataSource ID="SqlControleQualiteProj" runat="server"
                ConnectionString="<%$ ConnectionStrings:PointeuseConnectionString %>"
                SelectCommand="GetControleQualiteUserByCodeDocument" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:QueryStringParameter Name="CodeDocument" QueryStringField="CodeDocument" />
                </SelectParameters>
            </asp:SqlDataSource>

            <dx:ASPxFormLayout ID="FormLayoutTypeProjet" ClientInstanceName="FormLayoutTypeProjet" runat="server" ColCount="3" Width="100%">
                <Items>
                    <dx:LayoutGroup Caption="Détails Projets" Width="100%" ColCount="3" ColSpan="3">
                        <Items>
                            <dx:LayoutItem Caption="Type" ShowCaption="False" ColSpan="1" Width="100%">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer>

                                        <dx:ASPxGridView ID="GridControleQualiteProj" ClientInstanceName="GridControleQualiteProj" runat="server"
                                            AutoGenerateColumns="False" KeyFieldName="ID" DataSourceID="SqlControleQualiteProj" Width="100%">
                                            <Columns>
                                              
                                                <dx:GridViewDataTextColumn FieldName="ID" Caption="Item" Width="45px" Visible="true" VisibleIndex="1">
                                                    <FooterCellStyle BackColor="#F5F5DC" HorizontalAlign="Right" Font-Bold="true" />
                                                </dx:GridViewDataTextColumn>

                                                <dx:GridViewDataTextColumn Caption="Discpline" FieldName="Discpline" ShowInCustomizationForm="True" GroupIndex="0" SortIndex="0" SortOrder="Ascending" VisibleIndex="3" Width="60px">
                                                    <EditFormSettings Visible="false" />
                                                    <FooterCellStyle BackColor="#F5F5DC" HorizontalAlign="Right" Font-Bold="true" />
                                                    <HeaderStyle HorizontalAlign="Center" BackColor="DodgerBlue"></HeaderStyle>
                                                    <GroupRowTemplate>
                                                        <table>
                                                            <tr>
                                                                <td style="color: #3300FF; font-style: Arial; font-size: 60px;">
                                                                    <dx:ASPxLabel ID="lblgrp" runat="server" Font-Bold="true" Text='<%# Eval("Discpline")%>'></dx:ASPxLabel>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </GroupRowTemplate>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Designation" Caption="Designation" Width="500px" VisibleIndex="2">
                                                    <HeaderStyle HorizontalAlign="Center" BackColor="DodgerBlue"></HeaderStyle>
                                                    <GroupFooterCellStyle ForeColor="Brown" HorizontalAlign="Right" Font-Bold="true"></GroupFooterCellStyle>
                                                    <FooterCellStyle BackColor="#F5F5DC" HorizontalAlign="Right" Font-Bold="true" />
                                                    <EditFormSettings Visible="true"></EditFormSettings>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Reference" Caption="Affaire" Width="90px" Visible="false" VisibleIndex="3" PropertiesTextEdit-Height="5px">
                                                    <PropertiesTextEdit Height="5px"></PropertiesTextEdit>

                                                    <FooterCellStyle BackColor="#F5F5DC" ForeColor="Maroon" HorizontalAlign="Center" Font-Bold="true" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="CodeDocument" Caption="N° Documents EPPM" Width="200px" VisibleIndex="4">
                                                    <HeaderStyle BackColor="LightSalmon" />
                                                    <FooterCellStyle BackColor="#F5F5DC" ForeColor="Maroon" HorizontalAlign="Center" Font-Bold="true" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="RQEP" Caption="RQEP" Width="60px" VisibleIndex="5">
                                                    <HeaderStyle BackColor="LightSalmon" />
                                                    <FooterCellStyle BackColor="#F5F5DC" ForeColor="Maroon" HorizontalAlign="Center" Font-Bold="true" />
                                                    <GroupFooterCellStyle ForeColor="Black" HorizontalAlign="Right" Font-Bold="true"></GroupFooterCellStyle>
                                                    <EditFormSettings Visible="true"></EditFormSettings>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="DPCPE" VisibleIndex="6" Width="70px" Caption="DP/CPE">
                                                    <HeaderStyle BackColor="LightSalmon" />
                                                    <FooterCellStyle BackColor="#F5F5DC" HorizontalAlign="Right" Font-Bold="true" />
                                                    <EditFormSettings Visible="true"></EditFormSettings>
                                                </dx:GridViewDataTextColumn>
                                              
                                            </Columns>
                                        </dx:ASPxGridView>

                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>



                        </Items>
                    </dx:LayoutGroup>
                    <dx:LayoutGroup Caption="Détails Projets" Width="100%" ColCount="3" ColSpan="3">
                        <Items>
                            <dx:LayoutItem Caption="Type" ShowCaption="False" ColSpan="1" Width="100%">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer>

                                        <dx:ASPxGridView ID="ASPxGridView3" ClientInstanceName="GridControleQualiteProj" runat="server"
                                            AutoGenerateColumns="False" KeyFieldName="ID" DataSourceID="SqlControleQualiteProj" Width="100%">
                                            <Columns>
                                              
                                                
                                                <dx:GridViewDataTextColumn Caption="Design Coord" FieldName="DesignCoord" Width="110px" VisibleIndex="7">
                                                    <HeaderStyle BackColor="LightSalmon" />
                                                    <FooterCellStyle BackColor="#F5F5DC" HorizontalAlign="Right" Font-Bold="true" />
                                                    <EditFormSettings Visible="true"></EditFormSettings>
                                                </dx:GridViewDataTextColumn>
                                                
                                                <dx:GridViewDataTextColumn FieldName="CLIENT" Caption="Client" Width="70px" VisibleIndex="11">
                                                    <HeaderStyle BackColor="Aqua" />
                                                    <FooterCellStyle BackColor="#F5F5DC" HorizontalAlign="Right" Font-Bold="true" />
                                                    <EditFormSettings Visible="true"></EditFormSettings>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Observation" Caption="Observation" Width="400px" VisibleIndex="12">
                                                    <HeaderStyle BackColor="Aqua" />
                                                    <FooterCellStyle BackColor="#F5F5DC" HorizontalAlign="Right" Font-Bold="true" />
                                                    <EditFormSettings Visible="true"></EditFormSettings>
                                                </dx:GridViewDataTextColumn>




                                            </Columns>
                                        </dx:ASPxGridView>

                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>



                        </Items>
                    </dx:LayoutGroup>
                    <dx:LayoutGroup Caption="Ingénieur / Projeteur" Width="33%" ColCount="1" ColSpan="1">
                        <Items>
                            <dx:LayoutItem Caption="Type" ShowCaption="False" ColSpan="1" Width="100%">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer>

                                        <dx:ASPxGridView ID="ASPxGridView1" ClientInstanceName="GridControleQualiteProj" runat="server"
                                            AutoGenerateColumns="False" KeyFieldName="ID" DataSourceID="SqlControleQualiteProj" Width="100%">


                                            <Columns>
                                                
                                                <dx:GridViewBandColumn Caption="Ingénieur / Projeteur" Name="ListeDoc" VisibleIndex="8" HeaderStyle-BackColor="Tomato">
                                                    <Columns>
                                                        <dx:GridViewDataTextColumn Caption="PC" FieldName="PC" Width="60px">

                                                            <FooterCellStyle BackColor="#F5F5DC" ForeColor="Maroon" HorizontalAlign="Center" Font-Bold="true" />
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn FieldName="EL" Caption="EL" Width="60px">
                                                            <FooterCellStyle BackColor="#F5F5DC" HorizontalAlign="Right" Font-Bold="true" />
                                                            <EditFormSettings Visible="true"></EditFormSettings>
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn FieldName="INS" Caption="INS" Width="60px">
                                                            <FooterCellStyle BackColor="#F5F5DC" HorizontalAlign="Right" Font-Bold="true" />
                                                            <EditFormSettings Visible="true"></EditFormSettings>
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn FieldName="MEPP" Caption="ME/PP" Width="60px">
                                                            <FooterCellStyle BackColor="#F5F5DC" HorizontalAlign="Right" Font-Bold="true" />
                                                            <EditFormSettings Visible="true"></EditFormSettings>
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn FieldName="CV" Caption="CV" Width="60px">
                                                            <FooterCellStyle BackColor="#F5F5DC" HorizontalAlign="Right" Font-Bold="true" />
                                                            <EditFormSettings Visible="true"></EditFormSettings>
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn FieldName="SF" Caption="SF" Width="60px">
                                                            <FooterCellStyle BackColor="#F5F5DC" HorizontalAlign="Right" Font-Bold="true" />
                                                            <EditFormSettings Visible="true"></EditFormSettings>
                                                        </dx:GridViewDataTextColumn>
                                                    </Columns>
                                                    <HeaderStyle HorizontalAlign="Center" />

                                                </dx:GridViewBandColumn>
                                                
                                                
                                            </Columns>
                                         
                                        </dx:ASPxGridView>

                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>



                        </Items>
                    </dx:LayoutGroup>
                    <dx:LayoutGroup Caption="Ingénieur Senior / Projeteur Senior" Width="33%" ColCount="1" ColSpan="1">
                        <Items>
                            <dx:LayoutItem Caption="Type" ShowCaption="False" ColSpan="1" Width="100%">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer>

                                        <dx:ASPxGridView ID="ASPxGridView4" ClientInstanceName="GridControleQualiteProj" runat="server"
                                            AutoGenerateColumns="False" KeyFieldName="ID" DataSourceID="SqlControleQualiteProj" Width="100%">


                                            <Columns>
                                                
                                                
                                                <dx:GridViewDataTextColumn Caption=" " Width="20px" Visible="true" VisibleIndex="8">
                                                    <FooterCellStyle BackColor="#F5F5DC" HorizontalAlign="Right" Font-Bold="true" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewBandColumn Caption="Ingénieur Senior / Projeteur Senior" Name="ListeDoc" VisibleIndex="9" HeaderStyle-BackColor="Orange">
                                                    <Columns>
                                                        <dx:GridViewDataTextColumn FieldName="ISPC" Caption="PC" Width="60px">
                                                            <FooterCellStyle BackColor="#F5F5DC" HorizontalAlign="Right" Font-Bold="true" />
                                                            <EditFormSettings Visible="true"></EditFormSettings>
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn FieldName="ISELPRJS" Caption="EL" Width="60px">
                                                            <FooterCellStyle BackColor="#F5F5DC" HorizontalAlign="Right" Font-Bold="true" />
                                                            <EditFormSettings Visible="true"></EditFormSettings>
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn FieldName="ISINSPRJS" Caption="INS" Width="60px">
                                                            <FooterCellStyle BackColor="#F5F5DC" HorizontalAlign="Right" Font-Bold="true" />
                                                            <EditFormSettings Visible="true"></EditFormSettings>
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn FieldName="ISMEPPPRJS" Caption="ME/PP" Width="60px">
                                                            <FooterCellStyle BackColor="#F5F5DC" HorizontalAlign="Right" Font-Bold="true" />
                                                            <EditFormSettings Visible="true"></EditFormSettings>
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn FieldName="ISCVPRJS" Caption="CV" Width="60px">
                                                            <FooterCellStyle BackColor="#F5F5DC" HorizontalAlign="Right" Font-Bold="true" />
                                                            <EditFormSettings Visible="true"></EditFormSettings>
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn FieldName="ISSFPRJS" Caption="SF" Width="60px">
                                                            <FooterCellStyle BackColor="#F5F5DC" HorizontalAlign="Right" Font-Bold="true" />
                                                            <EditFormSettings Visible="true"></EditFormSettings>
                                                        </dx:GridViewDataTextColumn>
                                                    </Columns>
                                                    <HeaderStyle HorizontalAlign="Center" />

                                                </dx:GridViewBandColumn>
                                                <dx:GridViewDataTextColumn Caption=" " Width="20px" Visible="true" VisibleIndex="9">
                                                    <FooterCellStyle BackColor="#F5F5DC" HorizontalAlign="Right" Font-Bold="true" />
                                                </dx:GridViewDataTextColumn>
                                                
                                            </Columns>
                                         
                                        </dx:ASPxGridView>

                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>



                        </Items>
                    </dx:LayoutGroup>
                    <dx:LayoutGroup Caption="Project Specialist leader" Width="33%" ColCount="1" ColSpan="1">
                        <Items>
                            <dx:LayoutItem Caption="Type" ShowCaption="False" ColSpan="1" Width="100%">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer>

                                        <dx:ASPxGridView ID="ASPxGridView2" ClientInstanceName="GridControleQualiteProj" runat="server"
                                            AutoGenerateColumns="False" KeyFieldName="ID" DataSourceID="SqlControleQualiteProj" Width="100%">



                                            <Columns>
                                              
                                            
                                                <dx:GridViewBandColumn Caption="Project Specialist leader" Name="ListeDoc" VisibleIndex="10" HeaderStyle-BackColor="YellowGreen">
                                                    <Columns>
                                                        <dx:GridViewDataTextColumn FieldName="PSLPC" Caption="PC" Width="60px">
                                                            <FooterCellStyle BackColor="#F5F5DC" HorizontalAlign="Right" Font-Bold="true" />
                                                            <EditFormSettings Visible="true"></EditFormSettings>
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn FieldName="PSLEL" Caption="EL" Width="60px">
                                                            <FooterCellStyle BackColor="#F5F5DC" HorizontalAlign="Right" Font-Bold="true" />
                                                            <EditFormSettings Visible="true"></EditFormSettings>
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn FieldName="PSLIN" Caption="INS" Width="60px">
                                                            <FooterCellStyle BackColor="#F5F5DC" HorizontalAlign="Right" Font-Bold="true" />
                                                            <EditFormSettings Visible="true"></EditFormSettings>
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn FieldName="PSLMEPP" Caption="ME/PP" Width="60px">
                                                            <FooterCellStyle BackColor="#F5F5DC" HorizontalAlign="Right" Font-Bold="true" />
                                                            <EditFormSettings Visible="true"></EditFormSettings>
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn FieldName="PSLCV" Caption="CV" Width="60px">
                                                            <FooterCellStyle BackColor="#F5F5DC" HorizontalAlign="Right" Font-Bold="true" />
                                                            <EditFormSettings Visible="true"></EditFormSettings>
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn FieldName="PSLSF" Caption="SF" Width="60px">
                                                            <FooterCellStyle BackColor="#F5F5DC" HorizontalAlign="Right" Font-Bold="true" />
                                                            <EditFormSettings Visible="true"></EditFormSettings>
                                                        </dx:GridViewDataTextColumn>
                                                    </Columns>
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                </dx:GridViewBandColumn>

                                            </Columns>
                                            

                                        </dx:ASPxGridView>

                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>



                        </Items>
                    </dx:LayoutGroup>
<dx:LayoutGroup ShowCaption="False" Width="100%" ColCount="3" ColSpan="3">
                        <Items>
                            <dx:LayoutItem Caption="Type" ShowCaption="False" ColSpan="1" HorizontalAlign="Right">
                                <LayoutItemNestedControlCollection >
                                    <dx:LayoutItemNestedControlContainer >
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
