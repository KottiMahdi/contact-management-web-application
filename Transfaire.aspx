<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Transfaire.aspx.cs" Inherits="Transfaire" %>

<%@ Register Assembly="DevExpress.XtraReports.v20.1.Web.WebForms, Version=20.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraReports.Web" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxTreeList.v20.1, Version=20.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxTreeList" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v20.1, Version=20.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <script type="text/javascript">

           

            function OnMoreInfoClick(element, key1, key2) {
                window.parent.showPCQP(key1);
            }

            function OnMoreTravaClick(element, key1, key2) {
                window.parent.showPriorite(key1);
            }
            function CallInformation() {
                PopupInformation.Show();
            }


            function endCallbackDCR(s, e) {
                var errPoin = s.cp_Insert;

                if (errPoin == "ajouter") {

                    lblErr.SetText('Ajouté avec succes');
                    PopupAlert.Show();

                    GridDCRUser.PerformCallback();
                    GridControleQualiteProj.PerformCallback();
                }

                if (errPoin == "Session") {

                    lblErr.SetText('Votre session est déconnecté');
                    PopupAlert.Show();

                }

            }


            function ClikConfirmation() {


                var isFormValid = ASPxClientEdit.ValidateGroup("eppm1");

                if (isFormValid) {
                    CallbackError.PerformCallback();
                }


            }


            function SelectionChanged(s, e) {
                s.GetSelectedFieldValues("CodeDocument", GetSelectedFieldValuesCallback);
            }
            function GetSelectedFieldValuesCallback(values) {
                txtcodeDoc.SetText(values);
            }

            // Previou
            function PreviousClick(s, e) {

                var index = pageControl.GetActiveTabIndex();
                pageControl.SetActiveTab(pageControl.GetTab(index - 1));

            }

            //Next

            function ContinuClick(s, e) {


                var chois = txtcodeDoc.GetText();
                alert(chois);

                if (chois != "") {

                    var index = pageControl.GetActiveTabIndex();
                    var tab = pageControl.GetActiveTab();
                    pageControl.SetActiveTab(pageControl.GetTab(index + 1));
                }

                else {

                    lblErr.SetText('Svp choisir Document');
                    PopupAlert.Show();
                }

            }


            function InitTab(e) {
                var tab = pageControl.GetActiveTab();

                if (tab.name == "ProjetDCR") {
                    btnConfirmer.SetVisible(false);
                    btnNext.SetVisible(true);
                    btnPrevious.SetVisible(false);
                    txtcodeDoc.SetText('');
                }
            }



            // Active Tab
            function ActiveTabChanged(e) {


                var tab = pageControl.GetActiveTab();


                if (tab.name == "ProjetDCR") {
                    btnConfirmer.SetVisible(false);
                    btnNext.SetVisible(true);
                    btnPrevious.SetVisible(false);

                }
                else if (tab.name == "RemplaceProjet") {
                    btnConfirmer.SetVisible(true);
                    btnNext.SetVisible(false);
                    btnPrevious.SetVisible(true);
                }

                else if (tab.name == "ResultProjet") {
                    btnConfirmer.SetVisible(false);
                    btnNext.SetVisible(true);
                    btnPrevious.SetVisible(false);
                }
                else if (tab.name == "Rapport") {
                    btnConfirmer.SetVisible(false);
                    btnNext.SetVisible(false);
                    btnPrevious.SetVisible(false);
                }
            }


            function callbackAffaire() {
                 GridProjet.PerformCallback();
            }
        </script>

        <script type="text/javascript">
        function grid_SelectionChanged(s,e) {
            s.GetSelectedFieldValues("reference", GetSelectedFieldValuesCallbacks);
        }
        function GetSelectedFieldValuesCallbacks(values) {
            
            selList.SetText(values);
            //selList.BeginUpdate();
            //try {
            //    selList.ClearItems();
            //    for(var i=0;i<values.length;i++) {
            //        selList.AddItem(values[i]);
            //    }
            //} finally {
            //    selList.EndUpdate();
            //}
        }
    </script>

    <div>    
     <dx:ASPxPageControl ID="pageControl" ClientInstanceName="pageControl" runat="server" Width="100%" ShowTabs="false" ActiveTabIndex="0" EnableHierarchyRecreation="true" Theme="Glass" >

            <ClientSideEvents 
              
                Init="function(s, e) { InitTab(e);  }" 
                ActiveTabChanged="function(s, e) { ActiveTabChanged(e); }"
                TabClick="function(s, e) {  }">
              
              </ClientSideEvents>

            <TabPages>

                <dx:TabPage Name="ProjetDCR">
                    <ContentCollection>
                        <dx:ContentControl runat="server" ID="ContentControl1" Width="100%">
                    
            
            <dx:ASPxFormLayout ID="ASPxFormLayout1" ClientInstanceName="FormLayoutTypeProjet" runat="server" ColCount="1" Width="100%">
                <Items>
                    <dx:LayoutGroup Caption="Filter" Width="100%" >
                        <Items>
                            <dx:LayoutItem ShowCaption="False"  >
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer>

                                       <dx:ASPxButton ID="btnInformation"  runat="server" Text="Multiple recherche" AutoPostBack="false">
                                           <ClientSideEvents Click="CallInformation" />
                                        </dx:ASPxButton>

                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>



                        </Items>
                    </dx:LayoutGroup>
                    <dx:LayoutGroup Caption="DCR" Width="100%"  >
                        <Items>
                            <dx:LayoutItem ShowCaption="False"    >
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer>

                                       <dx:ASPxGridView ID="GridDCR" ClientInstanceName="GridDCR" runat="server"  OnCustomCallback="GridDCR_CustomCallback"
                                    AutoGenerateColumns="False" KeyFieldName="id" DataSourceID="SqlDCR" Width="100%" EnableTheming="True">
                                   <ClientSideEvents Init="function(s, e) {
	                                                    var popup = window.parent;
	                                                    popup.window['GridDCR'] = GridDCR;}
" />
            <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
            <SettingsSearchPanel Visible="True" />
<ClientSideEvents SelectionChanged="SelectionChanged" />
        <Columns>
            
            <dx:GridViewCommandColumn   SelectAllCheckboxMode="AllPages" ShowClearFilterButton="True" ShowSelectCheckbox="True"  Width="50px" VisibleIndex="0">
                  <FooterCellStyle BackColor="#F5F5DC" ForeColor="Maroon" HorizontalAlign="Center" Font-Bold="true" />
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn VisibleIndex="0" Width="50px">
            <DataItemTemplate>
                <a href="javascript:void(0);" onclick="OnMoreInfoClick(this, '<%# Eval("CodeDocument") %>'  , '<%# Eval("Reference") %>' ) ">PCQP?</a>
            </DataItemTemplate>
            <CellStyle HorizontalAlign="Left">
            </CellStyle>
        </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn VisibleIndex="0" Width="55px">
            <DataItemTemplate>
                <a href="javascript:void(0);" onclick="OnMoreTravaClick(this, '<%# Eval("CodeDocument") %>'  , '<%# Eval("Reference") %>' ) ">Priorité?</a>
            </DataItemTemplate>
            <CellStyle HorizontalAlign="Left">
            </CellStyle>
        </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="id" Visible="false" VisibleIndex="1">
            </dx:GridViewDataTextColumn>
            
            <dx:GridViewDataTextColumn Caption="Discpline" FieldName="Discpline" ShowInCustomizationForm="True" GroupIndex="0" SortIndex="0" SortOrder="Ascending"  VisibleIndex="3" Width="50px">
                <EditFormSettings Visible="false" />
                <FooterCellStyle BackColor="#F5F5DC" HorizontalAlign="Right" Font-Bold="true" />
                <HeaderStyle HorizontalAlign="Center" BackColor="DodgerBlue"></HeaderStyle>
                <GroupRowTemplate>
                    <table>
                        <tr>
                            <td style="color: #3300FF; font-style: Arial; font-size: 15px;">
                                <dx:ASPxLabel ID="lblgrp" runat="server" Font-Bold="true" Text='<%# Eval("Discpline")%>'></dx:ASPxLabel>
                            </td>
                        </tr>
                    </table>
                </GroupRowTemplate>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="TitreDocument" Caption="Titre du document"  Width="50%" VisibleIndex="1">
                <HeaderStyle HorizontalAlign="Center" BackColor="DodgerBlue"></HeaderStyle>
                <GroupFooterCellStyle ForeColor="Brown" HorizontalAlign="Right" Font-Bold="true"></GroupFooterCellStyle>
                <FooterCellStyle BackColor="#F5F5DC" HorizontalAlign="Right" Font-Bold="true" />
                <EditFormSettings Visible="true"></EditFormSettings>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Reference"  Caption="Affaire"  Width="90px" Visible="true" VisibleIndex="2" PropertiesTextEdit-Height="5px">
                  <FooterCellStyle BackColor="#F5F5DC" ForeColor="Maroon" HorizontalAlign="Center" Font-Bold="true" />
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
            
              
            
             <dx:GridViewBandColumn Caption="Période Planifiée" Name="ListeDoc" VisibleIndex="6" HeaderStyle-BackColor="Orange">
                <Columns>

                     <dx:GridViewDataDateColumn Caption="Emission" FieldName="EmissionPlanifiee" Width="170px" VisibleIndex="9" PropertiesDateEdit-DisplayFormatString="dd-MM-yyyy">
                <PropertiesDateEdit DisplayFormatString="dd-MM-yyyy">
                </PropertiesDateEdit>
                <Settings GroupInterval="Date"></Settings>
                  <FooterCellStyle BackColor="#F5F5DC" ForeColor="Maroon" HorizontalAlign="Center" Font-Bold="true" />
            </dx:GridViewDataDateColumn>
            
               <dx:GridViewDataDateColumn Caption="Approbation" FieldName="ApprobationPanifiee" Width="170px" VisibleIndex="10"  PropertiesDateEdit-DisplayFormatString="dd-MM-yyyy">
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

                     <dx:GridViewDataProgressBarColumn FieldName="Poids"  Caption="Poids" Width="160px" >
                <FooterCellStyle BackColor="#F5F5DC" HorizontalAlign="Right" Font-Bold="true" />
                <EditFormSettings Visible="true"></EditFormSettings>
            </dx:GridViewDataProgressBarColumn>

             <dx:GridViewDataProgressBarColumn FieldName="Ponderation"  Caption="Ponderation" Width="200px">
                <FooterCellStyle BackColor="#F5F5DC" HorizontalAlign="Right" Font-Bold="true" />
                <EditFormSettings Visible="true"></EditFormSettings>
            </dx:GridViewDataProgressBarColumn>
                    

                </Columns>
                <HeaderStyle HorizontalAlign="Center" />
            </dx:GridViewBandColumn>

             
            
          
            <dx:GridViewBandColumn Caption="Budge horaire Consommées" Name="ListeDoc" VisibleIndex="8"  HeaderStyle-BackColor="Tomato">
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
        <SettingsPager PageSize="100" EnableAdaptivity="true">
            <PageSizeItemSettings Visible="true" Position="Right" ShowAllItem="true">
            </PageSizeItemSettings>
        </SettingsPager>
        <SettingsBehavior AutoExpandAllGroups="True" AllowFocusedRow="true"  />
        <Settings ShowFooter="True" ShowGroupFooter="VisibleIfExpanded" 
            VerticalScrollableHeight="300" VerticalScrollBarMode="Visible"
            HorizontalScrollBarMode="Visible" ShowFilterRow="True"></Settings>
          
    </dx:ASPxGridView>
                                       <asp:SqlDataSource ID="SqlDCR" runat="server"
        ConnectionString="<%$ ConnectionStrings:PointeuseConnectionString %>"
        SelectCommand="GetDocumentEtudeByProjets" SelectCommandType="StoredProcedure">
                                           <SelectParameters>
                                               <asp:Parameter Name="Reference" />

                                           </SelectParameters>
                                       </asp:SqlDataSource>

                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>



                        </Items>
                    </dx:LayoutGroup>
                </Items>
            </dx:ASPxFormLayout>


                              <dx:aspxtextbox ID="txtcodeDoc" ForeColor="Transparent" Border-BorderColor="Transparent"  BackColor="Transparent" ClientInstanceName="txtcodeDoc" runat="server" ></dx:aspxtextbox>
                        </dx:ContentControl>
                    </ContentCollection>
                </dx:TabPage>

                <dx:TabPage Name="RemplaceProjet">
                    <ContentCollection>
                        <dx:ContentControl runat="server" ID="ContentControl5" Width="100%">

                             <dx:ASPxFormLayout ID="FormLayoutTypeProjet" ClientInstanceName="FormLayoutTypeProjet" runat="server" ColumnCount="3" ColSpan="1"    Width="100%">
                                <Items>
                                    <dx:LayoutGroup Caption="Remplacer reference" ColumnSpan="1" Width="30%" >
                                        <Items>
                                            <dx:LayoutItem ShowCaption="false"  Width="80px" HorizontalAlign="Center">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer>

                                                        <table width="100%">
                                                            <tr>
                                                                <td  >
                                                                    <asp:TextBox ID="TextBox1"  style="text-align:center ; font-size:large ;"  Enabled="false" Text="AR xx/xx"  Height="30px" runat="server"></asp:TextBox>
                                                                </td>
                                                                <td>
                                                                    <dx:ASPxImage runat="server" ID="imag" Width="50px" ImageUrl="~/image/right.png"></dx:ASPxImage>
                                                                </td> 
                                                                <td>
                                                                   <dx:aspxTextBox ID="TxtNewRef" Height="40px" style="text-align:center ; font-size:large ;" runat="server">
                                                                        <ValidationSettings Display="Dynamic" ValidationGroup="eppm1" ErrorTextPosition="Bottom"
                                                                SetFocusOnError="True">
                                                                <RequiredField ErrorText="Le champ Réference est obligatoire" IsRequired="True" />
                                                            </ValidationSettings>
                                                                   </dx:aspxTextBox>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                             </Items>
                                    </dx:LayoutGroup>
                                     <dx:LayoutGroup Caption="Remplacer Code Document" Width="40%"  >
                                        <Items>

                                            <dx:LayoutItem  ShowCaption="false" ColSpan="1" Width="80px" HorizontalAlign="Center">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer>

                                                        <table width="100%">
                                                            <tr>
                                                                <td>
                                                                   <dx:ASPxImage runat="server" ID="ASPxImage3" Height="45px" ImageUrl="~/image/code.png"></dx:ASPxImage>
                                                                    
                                                                </td>
                                                                <td>
                                                                    <dx:ASPxImage runat="server" ID="ASPxImage1" Width="50px" ImageUrl="~/image/right.png"></dx:ASPxImage>
                                                                </td>
                                                                <td>
                                                                     <dx:aspxTextBox ID="TxtPrimerecode" Height="40px" style="text-align:center ; font-size:large ; " runat="server">
                                                                         <ValidationSettings Display="Dynamic" ValidationGroup="eppm1" ErrorTextPosition="Bottom"
                                                                SetFocusOnError="True">
                                                                <RequiredField ErrorText="Le champ Ref est obligatoire" IsRequired="True" />
                                                            </ValidationSettings>
                                                                     </dx:aspxTextBox>
                                                                </td>
                                                            </tr>
                                                        </table>

                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>

                                             </Items>
                                    </dx:LayoutGroup>
                                    <dx:LayoutGroup Caption="workov Code Document" Width="30%"   >
                                        <Items>
                                            <dx:LayoutItem  ShowCaption="false" ColSpan="1" Width="80px" HorizontalAlign="Center">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer>
                                                        <table width="100%">
                                                            <tr>
                                                                <td>
                                                                  <dx:ASPxImage runat="server" ID="ASPxImage4" Height="45px" ImageUrl="~/image/codework.png"></dx:ASPxImage>
                                                                </td>
                                                                <td>
                                                                    <dx:ASPxImage runat="server" ID="ASPxImage2" Width="50px" ImageUrl="~/image/right.png"></dx:ASPxImage>
                                                                </td>
                                                                <td>
                                                                    <dx:aspxTextBox ID="TxtDeuxCode" Height="40px" style="text-align:center ; font-size:large ; " runat="server">
                                                                        <ValidationSettings Display="Dynamic" ValidationGroup="eppm1" ErrorTextPosition="Bottom"
                                                                SetFocusOnError="True">
                                                                <RequiredField ErrorText="Le champ Workovre est obligatoire" IsRequired="True" />
                                                            </ValidationSettings>
                                                                    </dx:aspxTextBox>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
            
                                                

                                             </Items>
                                    </dx:LayoutGroup>
                                </Items>
                            </dx:ASPxFormLayout>

                         </dx:ContentControl>
                    </ContentCollection>
                </dx:TabPage>

                <dx:TabPage Name="ResultProjet">
                    <ContentCollection>
                        <dx:ContentControl runat="server" ID="ContentControl2" Width="100%">
                            <div style="overflow-x: hidden; overflow-y: scroll; word-wrap: break-word; height: 680px;">
                                <dx:ASPxPageControl ID="ASPxPageControl1" ClientInstanceName="pageControl" runat="server"
        Width="100%" ShowTabs="true" ActiveTabIndex="0" EnableHierarchyRecreation="true" Theme="Glass">


        <TabPages>
            <dx:TabPage Name="TypeProjet" Text="Liste documents">
                <ContentCollection>
                    <dx:ContentControl runat="server" ID="ContentControl4" Width="100%">
                           <dx:ASPxGridView ID="GridDCRUser" ClientInstanceName="GridDCRUser" runat="server"  OnCustomCallback="GridDCRUser_CustomCallback"
                                  OnLoad="GridDCRUser_Load"
         KeyFieldName="id" DataSourceID="SqlDataDCRUser" Width="100%" >
            <ClientSideEvents Init="function(s, e) {
	                                                    var popup = window.parent;
	                                                    popup.window['GridDCR'] = GridDCR;}
" />
            <SettingsSearchPanel Visible="True" />
        <Columns>
            
            <dx:GridViewCommandColumn SelectAllCheckboxMode="Page" ShowClearFilterButton="True" ShowSelectCheckbox="True" Width="50px" VisibleIndex="0">
                  <FooterCellStyle BackColor="#F5F5DC" ForeColor="Maroon" HorizontalAlign="Center" Font-Bold="true" />
            </dx:GridViewCommandColumn>
            
            <dx:GridViewDataTextColumn FieldName="id" Visible="false" VisibleIndex="1">
            </dx:GridViewDataTextColumn>
            
            <dx:GridViewDataTextColumn Caption="Discpline" FieldName="Discpline" ShowInCustomizationForm="True" GroupIndex="0" SortIndex="0" SortOrder="Ascending"  VisibleIndex="3" Width="50px">
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
            <dx:GridViewDataTextColumn FieldName="TitreDocument" Caption="Titre du document"  Width="50%" VisibleIndex="1">
                <HeaderStyle HorizontalAlign="Center" BackColor="DodgerBlue"></HeaderStyle>
                <GroupFooterCellStyle ForeColor="Brown" HorizontalAlign="Right" Font-Bold="true"></GroupFooterCellStyle>
                <FooterCellStyle BackColor="#F5F5DC" HorizontalAlign="Right" Font-Bold="true" />
                <EditFormSettings Visible="true"></EditFormSettings>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Reference"  Caption="Affaire"  Width="90px" Visible="true" VisibleIndex="2" PropertiesTextEdit-Height="5px">
                  <FooterCellStyle BackColor="#F5F5DC" ForeColor="Maroon" HorizontalAlign="Center" Font-Bold="true" />
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
            
              
            
             <dx:GridViewBandColumn Caption="Période Planifiée" Name="ListeDoc" VisibleIndex="6" HeaderStyle-BackColor="Orange">
                <Columns>

                     <dx:GridViewDataDateColumn Caption="Emission" FieldName="EmissionPlanifiee" Width="170px" VisibleIndex="9" PropertiesDateEdit-DisplayFormatString="dd-MM-yyyy">
                <PropertiesDateEdit DisplayFormatString="dd-MM-yyyy">
                </PropertiesDateEdit>
                <Settings GroupInterval="Date"></Settings>
                  <FooterCellStyle BackColor="#F5F5DC" ForeColor="Maroon" HorizontalAlign="Center" Font-Bold="true" />
            </dx:GridViewDataDateColumn>
            
               <dx:GridViewDataDateColumn Caption="Approbation" FieldName="ApprobationPanifiee" Width="170px" VisibleIndex="10"  PropertiesDateEdit-DisplayFormatString="dd-MM-yyyy">
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

                     <dx:GridViewDataProgressBarColumn FieldName="Poids"  Caption="Poids" Width="160px" >
                <FooterCellStyle BackColor="#F5F5DC" HorizontalAlign="Right" Font-Bold="true" />
                <EditFormSettings Visible="true"></EditFormSettings>
            </dx:GridViewDataProgressBarColumn>

             <dx:GridViewDataProgressBarColumn FieldName="Ponderation"  Caption="Ponderation" Width="200px">
                <FooterCellStyle BackColor="#F5F5DC" HorizontalAlign="Right" Font-Bold="true" />
                <EditFormSettings Visible="true"></EditFormSettings>
            </dx:GridViewDataProgressBarColumn>
                    

                </Columns>
                <HeaderStyle HorizontalAlign="Center" />
            </dx:GridViewBandColumn>

             
            
          
            <dx:GridViewBandColumn Caption="Budge horaire Consommées" Name="ListeDoc" VisibleIndex="8"  HeaderStyle-BackColor="Tomato">
                <Columns>
                    <dx:GridViewDataTextColumn FieldName="NBHProjeteur" Caption="Projeteurs" Width="100px">
                          <FooterCellStyle BackColor="#F5F5DC" ForeColor="Maroon" HorizontalAlign="Center" Font-Bold="true" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="NBHIngenieur" Caption="Ingénieurs" Width="100px">
                          <FooterCellStyle BackColor="#F5F5DC" ForeColor="Maroon" HorizontalAlign="Center" Font-Bold="true" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Total" Caption="Total(h)" Width="80px">
                        <EditFormSettings Visible="false" />
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
        <SettingsPager PageSize="100" EnableAdaptivity="true">
            <PageSizeItemSettings Visible="true" Position="Right" ShowAllItem="true">
            </PageSizeItemSettings>
        </SettingsPager>
        <SettingsBehavior AutoExpandAllGroups="True" AllowFocusedRow="true"  />
        <Settings ShowFooter="True" ShowGroupFooter="VisibleIfExpanded" 
            VerticalScrollableHeight="450" VerticalScrollBarMode="Visible"
            HorizontalScrollBarMode="Visible" ShowFilterRow="True"></Settings>
    </dx:ASPxGridView>
                           <asp:SqlDataSource ID="SqlDataDCRUser" runat="server"
                                  ConnectionString="<%$ ConnectionStrings:PointeuseConnectionString %>"
                                   SelectCommand="GetDocumentEtudeUserByRef" SelectCommandType="StoredProcedure"
                                    UpdateCommand="UpdateDocumentEtudeUserByRef" UpdateCommandType="StoredProcedure">
                                
                                <SelectParameters>
                                    <asp:Parameter Name="Reference" />
                                </SelectParameters>

                                <UpdateParameters>
                                    <asp:Parameter  Name="Reference" />
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
                                        VerticalScrollableHeight="450" VerticalScrollBarMode="Visible"
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
             </TabPages>
    </dx:ASPxPageControl>
                            </div>
                        </dx:ContentControl>
                    </ContentCollection>
                </dx:TabPage>

                <dx:TabPage Name="Rapport">
                    <ContentCollection>
                        <dx:ContentControl runat="server" ID="ContentControl3" Width="100%">
                                 <dx:ASPxCallbackPanel ID="CallbackdocumentViewer" ClientInstanceName="CallbackdocumentViewer" runat="server" Width="100%"   OnCallback="CallbackdocumentViewer_Callback">
                                                            <PanelCollection>
                                                                <dx:PanelContent>

                                                                 

                                                               
                                                                            <dx:ASPxDocumentViewer runat="server" ID="documentViewer" ClientInstanceName="documentViewer" Theme="Glass"  DocumentViewerInternal="" Width="1500px"
                                                                                
                                                                                 OnLoad="documentViewer_Load"
                                                                                >
                                                                               
                                                                        
                                                                                <SettingsParametersPanelCaption RequiredMark="*"  />
                                                                                <SettingsReportViewer EnableRequestParameters="true"    />
                                                                                <SettingsLoadingPanel Delay="1" Enabled="true" Text="loading ...."   />
                                                                                <SettingsSplitter SidePanePosition="Right"  DocumentMapAutoHeight="true"  SidePaneVisible="true"     />
                                                                                <ToolbarItems >
                                                                                    <dx:ReportToolbarButton ItemKind="Search"   /><dx:ReportToolbarSeparator />
                                                                                    <dx:ReportToolbarButton ItemKind="PrintReport" Enabled="true"/>
                                                                                    <dx:ReportToolbarButton ItemKind="PrintPage" Enabled="true"  />
                                                                                    <dx:ReportToolbarSeparator />
                                                                                    <dx:ReportToolbarButton Enabled="true" ItemKind="FirstPage" />
                                                                                    <dx:ReportToolbarButton Enabled="true" ItemKind="PreviousPage" />
                                                                                    <dx:ReportToolbarLabel ItemKind="PageLabel" />
                                                                                    <dx:ReportToolbarComboBox ItemKind="PageNumber" Width="65px">
                                                                                    </dx:ReportToolbarComboBox>
                                                                                    <dx:ReportToolbarLabel ItemKind="OfLabel" />
                                                                                    <dx:ReportToolbarTextBox IsReadOnly="True" ItemKind="PageCount" />
                                                                                    <dx:ReportToolbarButton ItemKind="NextPage" />
                                                                                    <dx:ReportToolbarButton ItemKind="LastPage" />
                                                                                    <dx:ReportToolbarSeparator />
                                                                                    <dx:ReportToolbarButton ItemKind="SaveToDisk"  Enabled="true"/>
                                                                                    <dx:ReportToolbarButton ItemKind="SaveToWindow" Enabled="true" />
                                                                                    <dx:ReportToolbarComboBox ItemKind="SaveFormat"   Width="70px">
                                                                                        <Elements>
                                                                                            <dx:ListElement Value="pdf" />
                                                                                            <dx:ListElement Value="xls" />
                                                                                            <dx:ListElement Value="xlsx" />
                                                                                            <dx:ListElement Value="rtf" />
                                                                                            <dx:ListElement Value="mht" />
                                                                                            <dx:ListElement Value="html" />
                                                                                            <dx:ListElement Value="txt" />
                                                                                            <dx:ListElement Value="csv" />
                                                                                            <dx:ListElement Value="png" />
                                                                                        </Elements>
                                                                                    </dx:ReportToolbarComboBox>
                                                                                </ToolbarItems>
                                                                              </dx:ASPxDocumentViewer>
                                                                  
 </dx:PanelContent>
                                                            </PanelCollection>
                                                        </dx:ASPxCallbackPanel>
                        </dx:ContentControl>
                    </ContentCollection>
                </dx:TabPage> 

            </TabPages>
        </dx:ASPxPageControl>

        <table border="0" style="width:100%;font-size:small";>
    <tr style="width: 100%">
    <td>
          <dx:ASPxCallbackPanel ID="CallbackError" ClientInstanceName="CallbackError" runat="server"
            Width="100%">
        
            <PanelCollection>
                <dx:PanelContent>
                    <div runat="server" id="lblMessage" style="font-size: 14px; color: Red;">
                    </div>
               </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxCallbackPanel>

     </td>
        <td class="auto-style1" align="right" style="padding-right: 2px">
            <table>
                <tr>
                    <td height="20px"></td>
                </tr>
                <tr>
                    <td>
                        <dx:ASPxButton ID="btnPrevious" ClientInstanceName="btnPrevious" runat="server" Text="Previous"
                            Theme="Glass" Width="130px" AutoPostBack="false" ClientVisible="false"  ValidationGroup="eppm1">
                            <ClientSideEvents Click="PreviousClick" />
                            <Image Height="20px" Width="20px" Url="~/Image/page-prev.gif">
                            </Image>
                        </dx:ASPxButton>
                    </td>
                    <td >
                        <dx:ASPxButton ID="btnNext" ClientInstanceName="btnNext" runat="server" Text="Next" AutoPostBack="false" ClientVisible="false"
                            Width="130px" Theme="Glass" ValidationGroup="eppm1">
                            <ClientSideEvents Click="ContinuClick" />
                            <Image Height="20px" Width="20px" Url="~/Image/page-next.gif">
                            </Image>
                        </dx:ASPxButton>
                    </td>
                     
                    <td>
                        <dx:ASPxButton ID="btnConfirmer" ClientInstanceName="btnConfirmer" runat="server"
                            AutoPostBack="False" Text="Confirmer" Width="130px" Theme="Glass">
                            <ClientSideEvents Click="function(s, e) {

                                btnNext.SetVisible(true);
                                btnPrevious.SetVisible(false);
                                btnConfirmer.SetVisible(false);
                               
                                ClikConfirmation();	
                                
}" />
                            <Image Height="18px" Width="18px" Url="~/Image/save.gif">
                            </Image>
                        </dx:ASPxButton>
                    </td>
                    
                </tr>
            </table>
        </td>
    </tr>
</table>

        <dx:ASPxCallbackPanel ID="ASPxCallbackPanel1" ClientInstanceName="CallbackError" runat="server" OnCallback="ASPxCallbackPanel1_Callback" Width="100%">
        <ClientSideEvents EndCallback="endCallbackDCR" />
        </dx:ASPxCallbackPanel>

        <dx:ASPxPopupControl ID="PopupAlert" ClientInstanceName="PopupAlert"  AutoUpdatePosition="false"
            runat="server" Theme="Glass" Width="400px" HeaderText="Information"
            Modal="True"
            PopupHorizontalAlign="WindowCenter" 
            PopupVerticalAlign="WindowCenter">
            <HeaderImage Url="~/Image/Session.jpg" Width="25">
            </HeaderImage>
           
            <ContentCollection>
             <dx:PopupControlContentControl ID="PopupControlContentControl2" runat="server">

             


              <table width="100%">
                                    <tr align="center">
                                    
                                    <td>
                                    <dx:ASPxLabel ID="lblErr" runat="server" ClientInstanceName="lblErr" ForeColor="Red" ></dx:ASPxLabel>
                                    </td>
                                    
                                    </tr>
                                    
                                    <tr>
                                        <td align="right">
                                            <dx:ASPxButton ID="ASPxButton14" runat="server" Text="Fermer" Width="100%" AutoPostBack="False"
                                                Theme="Glass">
                                                <ClientSideEvents Click="function(s, e) {
                                                     PopupAlert.Hide();  	
                                                   }"></ClientSideEvents>
                                            </dx:ASPxButton>
                                        </td>
                                    </tr>
                                </table>
             </dx:PopupControlContentControl>

            </ContentCollection>
        </dx:ASPxPopupControl>
        <dx:ASPxPopupControl ID="PopupInformation" ClientInstanceName="PopupInformation" runat="server" Theme="Glass" Modal="true" ShowShadow="true" 
    PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="TopSides" AllowDragging="True" Width="900px" Height="600px">
            
    <HeaderStyle>
        <Paddings PaddingLeft="10px" PaddingRight="6px" PaddingTop="1px" />
    </HeaderStyle>
    <ContentCollection>
        <dx:PopupControlContentControl ID="PopupControlContentControl3" runat="server">
            <div>
               
                      <dx:ASPxFormLayout ID="ASPxFormLayout2" ClientInstanceName="FormLayoutTypeProjet" runat="server" ColumnCount="4"  Width="100%">
                                                <Items>
                                                    <dx:LayoutGroup Caption="Détails projet" Width="100%" ColCount="4" ColSpan="4">
                                                        <Items>
                                                            
                                                            <dx:LayoutItem Caption="Phase du projet" ColSpan="1">
                                                                <LayoutItemNestedControlCollection>
                                                                    <dx:LayoutItemNestedControlContainer>
                                                                        <dx:ASPxComboBox ID="TxttypePhase" OnDataBound="TxttypePhase_DataBound" TextField="description" ValueField="id" Height="25px" Theme="Office365" DataSourceID="SqlDataPhase" runat="server" Width="100%">
                                                                       <ClientSideEvents TextChanged="callbackAffaire" />
                                                                             </dx:ASPxComboBox>

                                                                        <asp:SqlDataSource ID="SqlDataPhase" runat="server" ConnectionString="<%$ ConnectionStrings:PointeuseConnectionString %>"
                                                                            SelectCommand="GetPhase" SelectCommandType="StoredProcedure"></asp:SqlDataSource>



                                                                    </dx:LayoutItemNestedControlContainer>
                                                                </LayoutItemNestedControlCollection>
                                                            </dx:LayoutItem>
                                                            <dx:LayoutItem Caption="Type du projet" ColSpan="3">
                                                                <LayoutItemNestedControlCollection>
                                                                    <dx:LayoutItemNestedControlContainer>

                                                                        <dx:ASPxDropDownEdit ID="DropDownTypeProjet"  ClientInstanceName="DropDownTypeProjet" runat="server" Theme="Office365" Height="25px" Width="230px">
                                                                            <ClientSideEvents TextChanged="callbackAffaire" />
                                                                             <DropDownWindowTemplate>
                                                                                <dx:ASPxTreeList ID="treeListType" ClientInstanceName="treeListType" OnCustomJSProperties="DropDownTypeProjet_CustomJSProperties"
                                                                                    runat="server" Theme="Office365" AutoGenerateColumns="False" DataSourceID="SqlDataTypeProjet" KeyFieldName="id" 
                                                                                    ParentFieldName="id_Parent" Height="140px" Width="100%" OnDataBound="treeListType_DataBound">
                                                                                    <Columns>
                                                                                        <dx:TreeListTextColumn FieldName="id" Visible="false" VisibleIndex="0" />
                                                                                        <dx:TreeListTextColumn FieldName="Type" VisibleIndex="1" />

                                                                                    </Columns>
                                                                                    <SettingsBehavior AllowFocusedNode="true" AutoExpandAllNodes="true" />
                                                                                    <Settings ShowColumnHeaders="false" />
                                                                                    <ClientSideEvents FocusedNodeChanged="callbackAffaire" NodeClick="function(s, e) 
                                  {
                                    if (e.nodeKey != null) 
                                     {
                                         DropDownTypeProjet.SetKeyValue(e.nodeKey);
                                         DropDownTypeProjet.SetText(treeListType.cpDepName[e.nodeKey]);
                                         DropDownTypeProjet.HideDropDown();
                                         
                                     }
                               }" />
                                                                                </dx:ASPxTreeList>

                                                                            </DropDownWindowTemplate>
                                                                        </dx:ASPxDropDownEdit>
                                                                        <asp:SqlDataSource ID="SqlDataTypeProjet" runat="server" ConnectionString="<%$ ConnectionStrings:PointeuseConnectionString %>"
                                                                            SelectCommand="TypeProjetAll" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                                                                    </dx:LayoutItemNestedControlContainer>
                                                                </LayoutItemNestedControlCollection>
                                                            </dx:LayoutItem>
                                                            <dx:LayoutItem Caption="Client" ColSpan="1">
                                                                <LayoutItemNestedControlCollection>
                                                                    <dx:LayoutItemNestedControlContainer>

                                                                        <dx:ASPxComboBox ID="cmbClient" OnDataBound="cmbClient_DataBound" runat="server" ValueField="id" TextField="Client" Theme="Office365" Height="25px" DataSourceID="SqlDataClient" Width="100%">
                                                                        </dx:ASPxComboBox>
                                                                        <asp:SqlDataSource ID="SqlDataClient" runat="server" ConnectionString="<%$ ConnectionStrings:PointeuseConnectionString %>"
                                                                            SelectCommand="GetClient" SelectCommandType="StoredProcedure"></asp:SqlDataSource>

                                                                    </dx:LayoutItemNestedControlContainer>
                                                                </LayoutItemNestedControlCollection>
                                                            </dx:LayoutItem>
                                                            <dx:LayoutItem Caption="Task force" ColSpan="3">
                                                                <LayoutItemNestedControlCollection>
                                                                    <dx:LayoutItemNestedControlContainer>

                                                                        <dx:ASPxComboBox ID="cmbTackForce" runat="server" Theme="Office365" Height="25px" Width="230px">
                                                                             <ClientSideEvents TextChanged="callbackAffaire" />
                                                                            <Items>
                                                                                <dx:ListEditItem Value="-1" Text="Tous" Selected="true" />
                                                                                <dx:ListEditItem Value="0" Text="Oui" />
                                                                                <dx:ListEditItem Value="1" Text="Non" />
                                                                            </Items>
                                                                        </dx:ASPxComboBox>
                                                                    </dx:LayoutItemNestedControlContainer>
                                                                </LayoutItemNestedControlCollection>
                                                            </dx:LayoutItem>
                                                            <dx:LayoutItem Caption="Classe du projet" ColSpan="1">
                                                                <LayoutItemNestedControlCollection>
                                                                    <dx:LayoutItemNestedControlContainer>
                                                                        <dx:ASPxComboBox ID="cmbClasse" OnDataBound="cmbClasse_DataBound" Height="25px" runat="server" Theme="Office365" Width="230px" ValueField="id" TextField="Classe" DataSourceID="SqlDataClasse">
                                                                       <ClientSideEvents TextChanged="callbackAffaire" />
                                                                              </dx:ASPxComboBox>

                                                                        <asp:SqlDataSource ID="SqlDataClasse" runat="server" ConnectionString="<%$ ConnectionStrings:PointeuseConnectionString %>"
                                                                            SelectCommand="GetClasse" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                                                                    </dx:LayoutItemNestedControlContainer>
                                                                </LayoutItemNestedControlCollection>
                                                            </dx:LayoutItem>
                                                            <dx:LayoutItem Caption="Type révision" ColSpan="3">
                                                                <LayoutItemNestedControlCollection>
                                                                    <dx:LayoutItemNestedControlContainer>

                                                                        
                                                                        <dx:ASPxComboBox ID="GridLookup"  Height="25px" runat="server" OnDataBound="GridLookup_DataBound" TextFormatString="{0}"   Theme="Office365" Width="230px"  ShowShadow="false"
                                                                             ValueField="TypeClasse"  DataSourceID="SqlDataTypeClasse">
                                                                      <ClientSideEvents TextChanged="callbackAffaire" />
                                                                              <Columns>
                                                                           <dx:ListBoxColumn FieldName="TypeClasse" Caption=" " Width="50px"  >
                                                                               
                                                                           </dx:ListBoxColumn>
                                                                           <dx:ListBoxColumn FieldName="Description" Caption=" " Width="300px" ></dx:ListBoxColumn>
                                                                       </Columns>
                                                                            <CaptionSettings ShowColon="false"   />
                                                                             </dx:ASPxComboBox>
                                                                        <asp:SqlDataSource ID="SqlDataTypeClasse" runat="server" ConnectionString="<%$ ConnectionStrings:PointeuseConnectionString %>"
                                                                            SelectCommand="GetTypeClasseALL" SelectCommandType="StoredProcedure"></asp:SqlDataSource>


                                                                    </dx:LayoutItemNestedControlContainer>
                                                                </LayoutItemNestedControlCollection>
                                                            </dx:LayoutItem>
                                                        </Items>
                                                    </dx:LayoutGroup>
                                                    <dx:LayoutGroup Caption="Période projet" Width="100%" ColCount="4" ColSpan="4">
                                                        <Items>
                                                            <dx:LayoutItem Caption="Date début" ColSpan="1">
                                                                <LayoutItemNestedControlCollection>
                                                                    <dx:LayoutItemNestedControlContainer>

                                                                        <dx:ASPxDateEdit ID="txtDateDebut" ClientInstanceName="txtDateDebut" Height="25px" runat="server" Width="100%" Theme="Office365">


                                                                            <ValidationSettings Display="Dynamic" SetFocusOnError="True">
                                                                                <ErrorFrameStyle ImageSpacing="4px">
                                                                                    <ErrorTextPaddings PaddingLeft="4px"></ErrorTextPaddings>
                                                                                </ErrorFrameStyle>
                                                                            </ValidationSettings>

                                                                        </dx:ASPxDateEdit>
                                                                    </dx:LayoutItemNestedControlContainer>
                                                                </LayoutItemNestedControlCollection>
                                                            </dx:LayoutItem>
                                                            <dx:LayoutItem Caption="Date Fin" ColSpan="1">
                                                                <LayoutItemNestedControlCollection>
                                                                    <dx:LayoutItemNestedControlContainer>

                                                                        <dx:ASPxDateEdit ID="TxtDateFin" ClientInstanceName="TxtDateFin" Height="25px" runat="server" Width="100%" Theme="Office365">
                                                                            <ValidationSettings Display="Dynamic" SetFocusOnError="True">
                                                                                <ErrorFrameStyle ImageSpacing="4px">
                                                                                    <ErrorTextPaddings PaddingLeft="4px"></ErrorTextPaddings>
                                                                                </ErrorFrameStyle>
                                                                            </ValidationSettings>

                                                                        </dx:ASPxDateEdit>
                                                                    </dx:LayoutItemNestedControlContainer>
                                                                </LayoutItemNestedControlCollection>
                                                            </dx:LayoutItem>
                                                        </Items>
                                                    </dx:LayoutGroup>
                                                    <dx:LayoutGroup Caption="Résultat" Width="100%" ColCount="4" ColSpan="4">
                                                        <Items>
                                                            <dx:LayoutItem ShowCaption="False" ColSpan="4">
                                                                <LayoutItemNestedControlCollection>
                                                                    <dx:LayoutItemNestedControlContainer Width="100%">

                                                                        <dx:ASPxGridView ID="GridProjet" ClientInstanceName="GridProjet" OnLoad="GridProjet_Load"   
                                                                            OnCustomCallback="GridProjet_CustomCallback" runat="server" Width="100%" Theme="Office365" 
                                                                            KeyFieldName="reference"
                                                                            DataSourceID="SqlDataProjet" AutoGenerateColumns="False">
                                                                            <Columns>

                                                                                 <dx:GridViewCommandColumn Width="50px" ShowSelectCheckbox="true" />
                                                                                
                                                                                 <dx:GridViewDataTextColumn FieldName="reference" Width="100px" VisibleIndex="1"></dx:GridViewDataTextColumn>
                                                                                 <dx:GridViewDataTextColumn FieldName="Description"  VisibleIndex="1"></dx:GridViewDataTextColumn>

                                                                            </Columns>
                                                                            <ClientSideEvents  SelectionChanged="grid_SelectionChanged" />
                                                                            <SettingsPager PageSize="10"  >
                                                                                <PageSizeItemSettings Visible="true" Position="Right" >
                                                                                    
                                                                                </PageSizeItemSettings>
                                                                                
                                                                            </SettingsPager>
                                                                            <SettingsBehavior AllowFocusedRow="true" />
                                                                            <Settings ShowColumnHeaders="false" ShowFooter="true" VerticalScrollBarMode="Visible" VerticalScrollableHeight="250"></Settings>

                                                                        </dx:ASPxGridView>
                                                                        <asp:SqlDataSource ID="SqlDataProjet" runat="server" ConnectionString="<%$ ConnectionStrings:PointeuseConnectionString %>"
                                                                            SelectCommand="GetAffaires" SelectCommandType="StoredProcedure">
                                                                            <SelectParameters >
                                                                                <asp:Parameter Name="idclient" />
                                                                                 <asp:Parameter Name="idphace" />
                                                                                 <asp:Parameter Name="idTypeProjet" />
                                                                                 <asp:Parameter Name="taskforce" />
                                                                                 <asp:Parameter Name="idclasseProjet" />
                                                                                 <asp:Parameter Name="Revision" />
                                                                            </SelectParameters>
                                                                        </asp:SqlDataSource>


                                                                    </dx:LayoutItemNestedControlContainer>
                                                                </LayoutItemNestedControlCollection>
                                                            </dx:LayoutItem>
                                                        </Items>
                                                    </dx:LayoutGroup>

                                                    <dx:LayoutGroup Caption="Filter"  Width="100%" ColCount="4" ColSpan="4" >
                                                        <Items>
                                                            <dx:LayoutItem ShowCaption="False" ColSpan="4">
                                                                <LayoutItemNestedControlCollection>
                                                                    <dx:LayoutItemNestedControlContainer>
                                                                        <table width="100%">
                                                                            <tr>
                                                                                <td width="90%">
                                                                                   
                                                                                    <dx:ASPxTextBox ID="selList" ClientInstanceName="selList" runat="server"  Width="100%" ></dx:ASPxTextBox>
                                                                                </td>
                                                                                <td>
                                                                                    <dx:ASPxButton ID="btnValider" ClientInstanceName="btnValider" runat="server"
                                                                            AutoPostBack="False" Text="Confirmer" Width="130px" Theme="Glass">
                                                                            <ClientSideEvents Click="function(s, e) {
                                                                                var chois=selList.GetText();
                                                                                GridDCR.PerformCallback(chois);
                                                                                PopupInformation.Hide();
                                                                    }
                                                                    
                                                                    " />
                                                                            <Image Height="18px" Width="18px" Url="~/Image/save.gif">
                                                                            </Image>
                                                                        </dx:ASPxButton>
                                                                                </td>
                                                                            </tr>

                                                                        </table>
                                                                
                                                                        

                                                                    </dx:LayoutItemNestedControlContainer>
                                                                </LayoutItemNestedControlCollection>
                                                            </dx:LayoutItem>
                                                        </Items>

                                                    </dx:LayoutGroup>
                                                </Items>
                                            </dx:ASPxFormLayout>

               
            </div>
        </dx:PopupControlContentControl>
    </ContentCollection>
</dx:ASPxPopupControl>

    </div>
    </form>
</body>
</html>
