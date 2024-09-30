<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ProjetChoisir.aspx.cs" Inherits="ProjetChoisir" %>

<%@ Register Assembly="DevExpress.Web.v20.1, Version=20.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>


<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">

        <script type="text/javascript">

            function Callprojet() {
                GridDCR.PerformCallback();
                GridControleQualiteProj.PerformCallback();
                GridPrioritbyRef.PerformCallback();
                GridTravauxbyRef.PerformCallback();
            }
            function GridMenuDetaiSerItemClick(e) {
                if (e.item == null) return;
                var name = e.item.name;
                if (name == "MenRemarqCodeDoc") window.parent.CallMenRemarqCodeDoc();
                if (name == "MenRemarqClient") window.parent.CallMenRemarqClient();
                if (name == "MenRemarqProj") window.parent.CallMenRemarqProj();
                if (name == "MenPriorite") window.parent.CallMenPriorite();
                if (name == "MenuTravaux") window.parent.CallMenuTravaux();
                if (name == "MenPCQP") window.parent.CallMenPCQP();
                if (name == "MenDetailProj") window.parent.CallMenDetailProjet();
                if (name == "MenDetailCodDoc") window.parent.CallMenDetailCodeDoc();

                if (name == "MenOrgPrioritePla") window.parent.CallMenOrgPrioritePla();
                if (name == "MenOrgTravPlanif") window.parent.CallMenOrgTravPlanif();
                if (name == "MenOrigQualiProj") window.parent.CallMenOrigQualiProj();

                
            }

            
            function GetCodDocument() {
                GridDCR.GetRowValues(GridDCR.GetFocusedRowIndex(), 'CodeDocument;ReferenceOld', SelectItem);
            }

            function SelectItem(value) {
                var Donnes = value.toString();
                var CodDoc = Donnes.split(',')[0];
                var Reference = Donnes.split(',')[1];
                ASPxPopupDetailSErMenu.GetItemByName("MenDetailCodDoc").SetText('Détail DCR:' + CodDoc);
                ASPxPopupDetailSErMenu.GetItemByName("MenOri").SetText('Original Projet:' + Reference);
            }

        </script>

        <dx:ASPxPopupMenu ID="ASPxPopupDetailSErMenu" runat="server" ClientInstanceName="ASPxPopupDetailSErMenu"
            CssFilePath="~/App_Themes/Glass/{0}/styles.css" Opacity="90" CssPostfix="Glass"
            GutterWidth="0px" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css" Theme="Glass">
            <Items>
                <dx:MenuItem Name="MenPCQP" Text="Controle qualite projet">
                    <Image Url="Image/Prototype.png" Width="24px" />
                </dx:MenuItem>
                <dx:MenuItem Name="MenuTravaux" Text="Travaux planifiés">
                    <Image Url="Image/Resource-managemen.jpg" Width="24px" />
                </dx:MenuItem>
                <dx:MenuItem Name="MenPriorite" Text="Priorité planifiés">
                    <Image Url="Image/priority-35.png" Width="24px" />
                </dx:MenuItem>
               
                <dx:MenuItem Name="MenOri" Text="Original Projet">
                    <Image Url="Image/pad-40.png" Width="24px" />
                    <Items>
                        <dx:MenuItem Name="MenDetailProj" Text="Détail projet">
                            <Image Url="Image/projectmanagement.png" Width="24px" />
                        </dx:MenuItem>
                        <dx:MenuItem Name="MenDetailCodDoc" >
                            <Image Url="Image/details-40.png" Width="24px" />
                        </dx:MenuItem>
                        <dx:MenuItem Name="MenOrigQualiProj" Text="Controle qualite projet">
                            <Image Url="Image/Prototype.png" Width="24px" />
                        </dx:MenuItem>
                        <dx:MenuItem Name="MenOrgTravPlanif" Text="Travaux planifiés">
                            <Image Url="Image/Resource-managemen.jpg" Width="24px" />
                        </dx:MenuItem>
                        <dx:MenuItem Name="MenOrgPrioritePla" Text="Priorité planifiés">
                            <Image Url="Image/priority-35.png" Width="24px" />
                        </dx:MenuItem>
                    </Items>
                </dx:MenuItem>
                <dx:MenuItem Name="MenOriREMA" Text="Remarque Original Projet">
                    <Image Url="Image/pad-40.png" Width="24px" />
                    <Items>
                                               
                        <dx:MenuItem Name="MenRemarqProj" Text="Remarque à projet">
                            <Image Url="Image/images.png" Width="24px" />
                        </dx:MenuItem>
                        <dx:MenuItem Name="MenRemarqCodeDoc" Text="Remarque à code document">
                            <Image Url="Image/ListeIntervention.png" Width="24px" />
                        </dx:MenuItem>
                        <dx:MenuItem Name="MenRemarqClient" Text="Remarque de client">
                            <Image Url="Image/info.png" Width="24px" />
                        </dx:MenuItem>
                    </Items>
                </dx:MenuItem>

            </Items>
            <SubMenuStyle GutterWidth="0px" />
            <ClientSideEvents ItemClick="function(s, e) {
               
                             GridMenuDetaiSerItemClick(e);
                           }" />
        </dx:ASPxPopupMenu>

        <div>
            <dx:ASPxFormLayout ID="FormLayoutTypeProjet" ClientInstanceName="FormLayoutTypeProjet" runat="server" ColCount="5" Width="100%">
                <Items>
                    <dx:LayoutGroup Caption="Projet" Width="100%" ColCount="5" ColSpan="5">
                        <Items>
                            <dx:LayoutItem Caption="Type" ShowCaption="False" ColSpan="1" Width="80px">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer>

                                        <dx:ASPxComboBox ID="cmbAffaire" ClientInstanceName="cmbAffaire" Width="200px"
                                            TextField="Reference" ValueField="Reference" runat="server" DataSourceID="SqlAffaire">
                                            <ClientSideEvents TextChanged="Callprojet" />
                                        </dx:ASPxComboBox>
                                        <asp:SqlDataSource ID="SqlAffaire" runat="server"
                                            ConnectionString="<%$ ConnectionStrings:PointeuseConnectionString %>"
                                            SelectCommand="GetAffaire" SelectCommandType="StoredProcedure"></asp:SqlDataSource>

                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>



                        </Items>
                    </dx:LayoutGroup>
                </Items>
            </dx:ASPxFormLayout>
            <dx:ASPxPageControl ID="ASPxPageControl1" ClientInstanceName="pageControl" runat="server"
                Width="100%" ShowTabs="true" ActiveTabIndex="0" EnableHierarchyRecreation="true" Theme="Glass">


                <TabPages>
                    <dx:TabPage Name="TypeProjet" Text="Liste documents">
                        <ContentCollection>
                            <dx:ContentControl runat="server" ID="ContentControl4" Width="100%">

                                <dx:ASPxGridView ID="GridDCR" ClientInstanceName="GridDCR" runat="server"
                                    OnCustomCallback="GridDCR_CustomCallback"
                                    OnLoad="GridDCR_Load"
                                    KeyFieldName="id" DataSourceID="SqlDCR" Width="100%">
                                    <ClientSideEvents Init="function(s, e) {
	                                                    var popup = window.parent;
	                                                    popup.window['GridDCR'] = GridDCR;}"
                                        ContextMenu="function(s, e) {
                                                var x = ASPxClientUtils.GetEventX(e.htmlEvent);
                                                var y = ASPxClientUtils.GetEventY(e.htmlEvent);
   
                                                      if(e.objectType == 'row'){
                                                        GridDCR.SetFocusedRowIndex(e.index);
                                                        ASPxPopupDetailSErMenu.ShowAtPos(x,y); 
                                                         GetCodDocument();
                                                                                      } 
                                            
                                            }" />

                                    <SettingsSearchPanel Visible="True" />

                                    <Columns>

                                        <dx:GridViewCommandColumn SelectAllCheckboxMode="Page" ShowClearFilterButton="True" ShowSelectCheckbox="True" Width="50px" VisibleIndex="0">
                                            <FooterCellStyle BackColor="#F5F5DC" ForeColor="Maroon" HorizontalAlign="Center" Font-Bold="true" />
                                        </dx:GridViewCommandColumn>

                                        <dx:GridViewDataTextColumn FieldName="id" Visible="false" VisibleIndex="1">
                                        </dx:GridViewDataTextColumn>

                                        <dx:GridViewDataTextColumn Caption="Discpline" FieldName="Discpline" ShowInCustomizationForm="True" GroupIndex="0" SortIndex="0" SortOrder="Ascending" VisibleIndex="3" Width="50px">
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
                                        <dx:GridViewDataTextColumn FieldName="TitreDocument" Caption="Titre du document" Width="50%" VisibleIndex="1">
                                            <HeaderStyle HorizontalAlign="Center" BackColor="DodgerBlue"></HeaderStyle>
                                            <GroupFooterCellStyle ForeColor="Brown" HorizontalAlign="Right" Font-Bold="true"></GroupFooterCellStyle>
                                            <FooterCellStyle BackColor="#F5F5DC" HorizontalAlign="Right" Font-Bold="true" />
                                            <EditFormSettings Visible="true"></EditFormSettings>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="Reference" Caption="Affaire" Width="90px" Visible="true" VisibleIndex="2" PropertiesTextEdit-Height="5px">
                                            <FooterCellStyle BackColor="#F5F5DC" ForeColor="Maroon" HorizontalAlign="Center" Font-Bold="true" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="ReferenceOld"  Caption="Affaire" Width="90px" Visible="false" VisibleIndex="2" PropertiesTextEdit-Height="5px">
                                            <FooterCellStyle BackColor="#F5F5DC" ForeColor="Maroon" HorizontalAlign="Center" Font-Bold="true" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="CodeDocument" Caption="Réf EPPM" Width="200px" VisibleIndex="3">
                                            <FooterCellStyle BackColor="#F5F5DC" ForeColor="Maroon" HorizontalAlign="Center" Font-Bold="true" />
                                        </dx:GridViewDataTextColumn>
                                         <dx:GridViewDataTextColumn FieldName="CodeDocumentOld" Visible="false"  VisibleIndex="3">
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


                                        <dx:GridViewDataTextColumn FieldName="Etat" Visible="false" VisibleIndex="9">
                                        </dx:GridViewDataTextColumn>



                                    </Columns>

                                    <SettingsEditing Mode="Batch"></SettingsEditing>


                                    <SettingsPager PageSize="100">
                                        <PageSizeItemSettings Position="Right">
                                        </PageSizeItemSettings>
                                    </SettingsPager>
                                    <SettingsBehavior AutoExpandAllGroups="True" AllowFocusedRow="true" />

                                    <Settings ShowFooter="false" ShowGroupFooter="VisibleIfExpanded"
                                        VerticalScrollableHeight="600" VerticalScrollBarMode="Visible"
                                        HorizontalScrollBarMode="Visible"></Settings>

                                </dx:ASPxGridView>
                                <asp:SqlDataSource ID="SqlDCR" runat="server"
                                    ConnectionString="<%$ ConnectionStrings:PointeuseConnectionString %>"
                                    SelectCommand="GetDocumentEtudeUserByRef" SelectCommandType="StoredProcedure"
                                    UpdateCommand="UpdateDocumentEtudeUserByRef" UpdateCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:Parameter Name="Reference" />
                                    </SelectParameters>

                                    <UpdateParameters>
                                        <asp:Parameter Name="Reference" />
                                        <asp:Parameter Name="CodeDocument" />
                                        <asp:Parameter Name="TitreDocument" />
                                        <asp:Parameter Name="Rev" />
                                        <asp:Parameter Name="Avancement" />
                                        <asp:Parameter Name="EmissionPlanifiee" />
                                        <asp:Parameter Name="ApprobationPanifiee" />
                                        <asp:Parameter Name="Poids" />
                                        <asp:Parameter Name="Ponderation" />
                                        <asp:Parameter Name="NBHIngenieur" />
                                        <asp:Parameter Name="NBHProjeteur" />
                                        <asp:Parameter Name="id" />
                                    </UpdateParameters>

                                </asp:SqlDataSource>

                            </dx:ContentControl>
                        </ContentCollection>
                    </dx:TabPage>
                    <dx:TabPage Name="TypeProjet" Text="Controle qualite projet">
                        <ContentCollection>
                            <dx:ContentControl runat="server" ID="ContentControl6" Width="100%">

                                <dx:ASPxGridView ID="GridControleQualiteProj" ClientInstanceName="GridControleQualiteProj" runat="server"
                                    OnCustomCallback="GridControleQualiteProj_CustomCallback"
                                    OnLoad="GridControleQualiteProj_Load"
                                    AutoGenerateColumns="False" KeyFieldName="ID" DataSourceID="SqlControleQualiteProj" Width="100%">


                                    <SettingsSearchPanel Visible="True" />

                                    <Columns>
                                        <dx:GridViewCommandColumn SelectAllCheckboxMode="Page" ShowClearFilterButton="True" ShowSelectCheckbox="True" Width="60px" VisibleIndex="0">
                                            <FooterCellStyle BackColor="#F5F5DC" ForeColor="Maroon" HorizontalAlign="Center" Font-Bold="true" />
                                        </dx:GridViewCommandColumn>
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
                                        <dx:GridViewDataTextColumn Caption="Design Coord" FieldName="DesignCoord" Width="110px" VisibleIndex="7">
                                            <HeaderStyle BackColor="LightSalmon" />
                                            <FooterCellStyle BackColor="#F5F5DC" HorizontalAlign="Right" Font-Bold="true" />
                                            <EditFormSettings Visible="true"></EditFormSettings>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption=" " Width="20px" Visible="true" VisibleIndex="7">
                                            <FooterCellStyle BackColor="#F5F5DC" HorizontalAlign="Right" Font-Bold="true" />
                                        </dx:GridViewDataTextColumn>
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
                                        <dx:GridViewDataTextColumn Caption=" " Width="20px" Visible="true" VisibleIndex="10">
                                            <FooterCellStyle BackColor="#F5F5DC" HorizontalAlign="Right" Font-Bold="true" />
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
                                    <SettingsEditing Mode="Batch"></SettingsEditing>
                                    <SettingsPager PageSize="100">
                                        <PageSizeItemSettings Position="Right">
                                        </PageSizeItemSettings>
                                    </SettingsPager>
                                    <SettingsBehavior AutoExpandAllGroups="True" AllowFocusedRow="true" />

                                    <Settings ShowFooter="True" ShowGroupFooter="VisibleIfExpanded"
                                        VerticalScrollableHeight="600" VerticalScrollBarMode="Visible"
                                        HorizontalScrollBarMode="Visible"></Settings>

                                </dx:ASPxGridView>
                                <asp:SqlDataSource ID="SqlControleQualiteProj" runat="server"
                                    ConnectionString="<%$ ConnectionStrings:PointeuseConnectionString %>"
                                    SelectCommand="GetControleQualiteUserByRef" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:Parameter Name="Reference" />
                                    </SelectParameters>
                                </asp:SqlDataSource>

                            </dx:ContentControl>
                        </ContentCollection>
                    </dx:TabPage>
                    <dx:TabPage Name="TypeProjet" Text="Travaux planifiés">
                        <ContentCollection>
                            <dx:ContentControl runat="server" ID="ContentControl2" Width="100%">
                                <dx:ASPxGridView ID="GridTravauxbyRef" ClientInstanceName="GridTravauxbyRef" DataSourceID="SqlDataTravaux" OnCustomCallback="GridTravauxbyRef_CustomCallback"
                                    OnLoad="GridTravauxbyRef_Load"
                                    KeyFieldName="id" Width="100%" Theme="Metropolis" runat="server">
                                    <SettingsText Title="Liste documents" />

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
                            </dx:ContentControl>
                        </ContentCollection>
                    </dx:TabPage>
                    <dx:TabPage Name="TypeProjet" Text="Priorité planifiés">
                        <ContentCollection>
                            <dx:ContentControl runat="server" ID="ContentControl1" Width="100%">
                                <dx:ASPxGridView ID="GridPrioritbyRef" ClientInstanceName="GridPrioritbyRef" DataSourceID="SqlDataPriority" OnCustomCallback="GridPriority_CustomCallback"
                                    OnLoad="GridPriority_Load"
                                    KeyFieldName="id" Width="100%" Theme="Metropolis" runat="server">
                                    <SettingsText Title="Liste documents" />

                                    <Columns>
                                        <dx:GridViewDataTextColumn FieldName="id" Visible="false" VisibleIndex="0">
                                        </dx:GridViewDataTextColumn>


                                        <dx:GridViewDataTextColumn FieldName="Description" Caption="" GroupIndex="0" SortIndex="0" VisibleIndex="1">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="CodeDocument" Caption="Code" VisibleIndex="2">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn VisibleIndex="2" Visible="false" Width="30px">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="descp" Caption="Titre du document" Width="100%" VisibleIndex="3">
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
                                <asp:SqlDataSource ID="SqlDataPriority" runat="server" ConnectionString="<%$ ConnectionStrings:PointeuseConnectionString %>"
                                    SelectCommand="GetPriorityByReference" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:Parameter Name="Reference" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </dx:ContentControl>
                        </ContentCollection>
                    </dx:TabPage>
                </TabPages>
            </dx:ASPxPageControl>
        </div>
    </form>
</body>
