<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.v20.1, Version=20.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>


<%@ Register Assembly="OfficeWebUI, Version=2.4.4086.15482" Namespace="OfficeWebUI" TagPrefix="OfficeWebUI" %>
<%@ Register Assembly="OfficeWebUI, Version=2.4.4086.15482" Namespace="OfficeWebUI.Ribbon" TagPrefix="OfficeWebUI" %>
<%@ Register Assembly="OfficeWebUI" Namespace="OfficeWebUI.Ribbon" TagPrefix="cc1" %>

<asp:Content ID="ContentPlaceHolder1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .w3-badge, .w3-tag {
            background-color: #000;
            color: #fff;
            display: inline-block;
            padding-left: 8px;
            padding-right: 8px;
            text-align: center;
        }

        .w3-badge {
            border-radius: 100%;
        }

        .w3-red, .w3-hover-red:hover {
            color: #fff !important;
            background-color: #f44336 !important;
        }

        .w3-tiny {
            font-size: 10px !important;
        }

        .w3-small {
            font-size: 12px !important;
        }

        .w3-medium {
            font-size: 15px !important;
        }

        .w3-large {
            font-size: 18px !important;
        }

        .w3-xlarge {
            font-size: 24px !important;
        }

        .w3-xxlarge {
            font-size: 36px !important;
        }

        .w3-xxxlarge {
            font-size: 48px !important;
        }

        .w3-jumbo {
            font-size: 64px !important;
        }

        .w3-left-align {
            text-align: left !important;
        }

        .w3-right-align {
            text-align: right !important;
        }

        .w3-justify {
            text-align: justify !important;
        }

        .w3-center {
            text-align: center !important;
        }
    </style>

    <link href="Theme/Theme.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
      function popup(url, height, width, title) {
          popupWind.SetSize(height, width);
          popupWind.SetHeaderText(title);
          popupWind.SetContentUrl(url);
          popupWind.Show();
      }

      function endCallMotsPass(s,e) {

          var errPoin = s.cp_Ress;
          lblErr.SetText(errPoin);
          //PopupAlert.Show();
      }

      function ChangePasswrd() {
//          txtMotsPass.SetText('');
//          txtConfirMotsPass.SetText('');
//          Modifier votre mot de passe
//          PopupMotPass.Show();
          popup("ChangMotsPass.aspx", 580, 700, "Modifier votre mot de passe");
      }


      function AffectationRessourceProj() {
          popup("AffectePermission.aspx", 800, 400, "AFFECTATIONS");

      }

    
   
   
   function CallMenOrgTravPlanif() {
       GridDCR.GetRowValues(GridDCR.GetFocusedRowIndex(), 'CodeDocumentOld', SelectOrigPlani);
   }

   function SelectOrigPlani(value) {

       popup("TravauxByCodDocOriginal.aspx?CodeDocument=" + value, 1000, 550, "Travaux");
   }

   function CallMenOrigQualiProj() {
       GridDCR.GetRowValues(GridDCR.GetFocusedRowIndex(), 'CodeDocumentOld', SelectOrigPCQP);
   }


   function SelectOrigPCQP(value) {

       popup("PCQPbyCodDoc.aspx?CodeDocument=" + value, 1000, 500, "PCQP");
   }

   function CallMenOrgPrioritePla() {
       GridDCR.GetRowValues(GridDCR.GetFocusedRowIndex(), 'CodeDocumentOld', SelectOrigPriorite);
   }

   function SelectOrigPriorite(value) {
       popup("Priority.aspx?CodeDocument=" + value, 800, 500, "Priority");
   }

      //  ---------------------------   
   function CallMenPCQP() {
       GridDCR.GetRowValues(GridDCR.GetFocusedRowIndex(), 'CodeDocument', SelectPCQP);
   }

   function SelectPCQP(valusindec) {
       popup("PCQPbyCodDocUser.aspx?CodDoc=" + valusindec, 900, 600, "Controle qualite projet");
   }
   function CallMenuTravaux() {
       GridDCR.GetRowValues(GridDCR.GetFocusedRowIndex(), 'CodeDocument', SelectTravaux);
   }

   function SelectTravaux(valusindec) {
       popup("TravauxUser.aspx?CodDoc=" + valusindec, 900, 600, "Travaux planifié");
   }

   function CallMenPriorite() {
       GridDCR.GetRowValues(GridDCR.GetFocusedRowIndex(), 'CodeDocument', SelectPriorite);
   }

   function SelectPriorite(valusindec) {
       popup("PriorityUser.aspx?CodDoc=" + valusindec, 800, 500, "Priorité");
   }


   function CallMenRemarqProj() {
       GridDCR.GetRowValues(GridDCR.GetFocusedRowIndex(), 'ReferenceOld', SelectRemarqProj);
   }

   function SelectRemarqProj(valusindec) {
       popup("RemarqProjetUser.aspx?References=" + valusindec, 800, 550, "Remarque à projet");
   }

   function CallMenRemarqCodeDoc() {
       GridDCR.GetRowValues(GridDCR.GetFocusedRowIndex(), 'CodeDocument', SelectRemarqCodeDoc);
   }

   function SelectRemarqCodeDoc(valusindec) {
       popup("RemarqCodeDocUser.aspx?CodDoc=" + valusindec, 800, 550, "Remarque à code document");
   }


   function CallMenRemarqClient() {
       GridDCR.GetRowValues(GridDCR.GetFocusedRowIndex(), 'ReferenceOld', SelectRemarqClientc);
   }

   function SelectRemarqClientc(valusindec) {
       popup("RemarqClient.aspx?References=" + valusindec, 800, 550, "Remarque de client");
   }



   
   function CallMenDetailProjet() {
       GridDCR.GetRowValues(GridDCR.GetFocusedRowIndex(), 'ReferenceOld', SelectDetailProj);
   }

   function SelectDetailProj(valusindec) {
       popup("DetailProjetbyReference.aspx?References=" + valusindec, 1000, 680, "Remarque de client");
   }

   
   function CallMenDetailCodeDoc() {
       GridDCR.GetRowValues(GridDCR.GetFocusedRowIndex(), 'CodeDocumentOld', SelectDetaicodd);
   }

   function SelectDetaicodd(valusindec) {
       popup("DetailCodeDocument.aspx?CodDoc=" + valusindec, 1100, 550, "Détail code document");
   }

      function Ajouter() {
      ASPxPopupAddPermision.Show();
    }
   
   
    function AjouterIntroduction() {
        PopupControl.Show();
        popup("OrganisationProjet.aspx", 1500, 900, "");
    }

    function GetAddRessouAff() {
        popup("AddRessourceOrgan.aspx", 1500, 900, "");
        
    
    }
    function GetListnonJus() {
        popup("ListepointgageNonJustifier.aspx", 1500, 900, "");


    }

    function DetailEntreprise(value) {

    

        popup("DetailEntreprise.aspx?ID_Entreprise=" + value, 800, 400, "Détail Entreprise");


      

    }

    function AjoutEntreprise(values) {

        popup("AjoutEntreprise.aspx?ID_Entreprise=" + values, 800, 400, "Ajouter Entreprise");
    }



    
    function ModifierEntreprise(value) {
       


        popup("ModifierEntreprise.aspx?ID_Entreprise=" + value, 800, 400, "Modifier Entreprise");




    }
        function AddEntreprise() {
            popup("AjoutEntreprise.aspx", 800, 400, "Ajouter Entreprise");
        }

 

    function Ajouterhome() {
        popup("Pagehome.aspx", 1000, 500, "");
    }


    function SupprimerEntreprise(value) {
        


        popup("SupprimerEntreprise.aspx?ID_Entreprise=" + value, 800, 400, "Supprimer Entreprise");



    }
     

    function AddContact(values) {

        popup("AddContact.aspx?ID_Entreprise=" + values, 800,380, "Ajouter Contact");
    }


    function Ajouter_Evenement(values) {

        popup("Ajouter_Evenement.aspx?ID_Contact=" + values, 800, 500, "Ajouter Evenement");
    }

    function ModifierIntroduction() {
        popup("PopupAvancemant.aspx", 800, 500, "");
    }

    function ProblematiqueRemarque() {
        var proj = CmbProject.GetText();
        popup("ProblematiqueRemarque.aspx?proj=" + proj, 1300, 800, "");
    }
         
    function ShudowPopupAnalyse() {
        var proj = CmbProject.GetText();
        popup("DetailAnalyse.aspx?proj=" + proj, 1300, 800, "");
    }


    function ShudowPopupFaitMar() {
        var proj = CmbProject.GetText();
        popup("DetailFaiMarq.aspx?proj=" + proj, 1300, 800, "");
    }




    function ShudowPopupApprise() {
        var proj = CmbProject.GetText();
        popup("DetailLeconapprise.aspx?proj=" + proj, 1300, 800, "");
    }


    function ShudowPopupAction() {
        var proj = CmbProject.GetText();
        popup("DetailAction.aspx?proj=" + proj, 1300, 800, "");
    }


    function showPCQP(value) {

        popup("PCQPbyCodDoc.aspx?CodeDocument=" + value, 1000, 500, "PCQP");
    }
    function showPriorite(value) {
        popup("Priority.aspx?CodeDocument=" + value, 800, 500, "Priority");
    }
 
     
        function ImportNouvDCR() {
            PupImportPDoc.Show()
        }

        function ImportControlQualite() {
            PupImportQualite.Show()
        }

        function ImportTravaux() {
            PupImportTravaux.Show()
        }
        
        function ImportPriorite() {
            PupImportPriority.Show()
        }
        


        function GetInfocercuit() {
            popup("Infosecrcuits.aspx", 1000, 650, "Informations");
        }

        function PermissionRessourceAllProj(){
            popup("Permission.aspx", 600, 500, "Permission administrateur");

        }
           
    </script>


    <table width="100%">
        <tr>
            <td>
                <OfficeWebUI:Manager ID="rbManager" runat="server" UITheme="Office2010Silver" />
                <table width="100%">
                    <tr>
                        <td align="center">
                            <div class="navbar navbar-inverse navbar-fixed-top">
                                <div class="container">
                                    <div class="navbar-collapse collapse">


                                        <table style="width: 100%; font-size: 1px;">
                                            <tr>
                                                <td height="15px"></td>
                                            </tr>
                                            <tr>

                                                <td></td>
                                                <td align="right" width="180px">
                                                    <a href="javascript: ChangePasswrd();">
                                                        <div runat="server" id="lblNomSession" style="font-size: 12px; color: Black; text-transform: uppercase; font-weight: bold;">
                                                        </div>
                                                    </a>
                                                </td>
                                                <td align="right" width="80px">
                                        <dx:ASPxComboBox ID="LanguageComboBox" runat="server" AutoPostBack="True" meta:resourcekey="ASPxComboBoxResource1" Theme="Glass" Width="70px" ClientVisible="true">
                                            <Items>
                                                <dx:ListEditItem Text="Francais" Value="FR" meta:resourcekey="users_Francais" Selected="true"/>
                                                <dx:ListEditItem Text="English" Value="en" meta:resourcekey="users_English"  />
                                                <dx:ListEditItem Text="Arabic" Value="AR" meta:resourcekey="users_Arabic" />
                                                

                                            </Items>
                                        </dx:ASPxComboBox>
                                    </td>
                                            </tr>
                                        </table>
                                        
                                    </div>
                                </div>
                            </div>



                            <tableyle="width: 100%; font-size: 1px;">
                                <tr>
                                    <td valign="top" align="left" colspan="2">
                                        <OfficeWebUI:OfficeRibbon ID="MainMenuRibbon"  runat="server" ShowHelpButton="true" ExtraText="SOFTIC" HelpButtonClientClick="return false;" ShowToggleButton="false"
                                             ApplicationMenuColor="#267c29" ApplicationMenuText="POINTEUSE SOFTIC" ApplicationMenuType="Default">
                                            <ApplicationMenu>
                                                <MenuItems>
                                                    <cc1:AppMenuItem Text="ee" />
                                                </MenuItems>
                                            </ApplicationMenu>
                                            <Contexts>
                                                <OfficeWebUI:RibbonContext ID="RibbonContextDocument" runat="server" ContextColor="#fff">
                                                    <Tabs>
                                                        <OfficeWebUI:RibbonTab ID="RibbonAccueil" Visible="false" runat="server" Text="Accueil" ClientClick="SetSplitterPane('Pagehomes.aspx');return false;">
                                                        </OfficeWebUI:RibbonTab>
                                                        <OfficeWebUI:RibbonTab ID="RibbonDCR" Visible="true" runat="server" Text="Informations générales" ClientClick="SetSplitterPane('Vide.aspx');return false;">
                                                            <Groups>

                                                                <OfficeWebUI:RibbonGroup ID="RibbonGroup2" runat="server" Text="Liste" ShowExpander="true">
                                                                    <Zones>
                                                                        <OfficeWebUI:GroupZone ID="GroupZone2" runat="server">
                                                                            <OfficeWebUI:LargeItem ID="LargeItem1" runat="server" Visible="true" Text="Gestion des Contacts" ImageUrl="Image/Resource-managemen.jpg" Tooltip="Ressources" ClientClick="SetSplitterPane('DefaultRessources.aspx');return false;" />
                                                                        </OfficeWebUI:GroupZone>
                                                                         <OfficeWebUI:GroupZone ID="GroupZone13" runat="server">
                                                                            <Content>
                                                                                  <OfficeWebUI:MediumItem ID="MediumItem5" runat="server" Text="Ajouter" Visible="false" ImageUrl="~/image/add_large.png" ClientClick="ImportTravaux();return false;" />
                                                                               <OfficeWebUI:MediumItem ID="MediumItem3" runat="server" Text="Modifier" Visible="false"   ImageUrl="~/image/edit.gif" Tooltip="Des donnes" ClientClick="SetSplitterPane('ArchiveManagers.aspx');return false;" />

                                                                            </Content>
                                                                        </OfficeWebUI:GroupZone>                                                                      
                                                                    </Zones>
                                                                    
                                                                    
                                                                </OfficeWebUI:RibbonGroup>
                                                                 <OfficeWebUI:RibbonGroup   ID="RibbonGroup4" runat="server" Text="Pointeuse" ShowExpander="true">
                                                                    <Zones>
                                                                        <OfficeWebUI:GroupZone ID="GroupZone8" runat="server">
                                                                            <OfficeWebUI:LargeItem ID="LargeItem6" runat="server" Visible="false" Text="Liste Evenement" ImageUrl="Image/Calendrier2.png" Tooltip="Liste Travaux planifiés" ClientClick="SetSplitterPane('CalenderContact.aspx');return false;" />
                                                                        </OfficeWebUI:GroupZone>
                                                                    
                                                                        
                                                                    </Zones>
                                                                </OfficeWebUI:RibbonGroup>
                                                                <OfficeWebUI:RibbonGroup ID="RibbonGroupf1" Visible="false" runat="server" Text=" " ShowExpander="true">
                                                                    <Zones>
                                                              <OfficeWebUI:GroupZone ID="GroupZone1" runat="server">
                                                                            
                                                                            <OfficeWebUI:LargeItem ID="LargeItem34" runat="server" Visible="true" Text="Mes projets" ImageUrl="Image/icons8-work-light-40.png"  Tooltip="Déplacer vers" ClientClick="SetSplitterPane('ProjetChoisir.aspx');return false;" />
                                                                            
                                                                </OfficeWebUI:GroupZone>
                                                                  </Zones>
                                                                </OfficeWebUI:RibbonGroup>
                                                            </Groups>
                                                        </OfficeWebUI:RibbonTab>

                                                        <OfficeWebUI:RibbonTab ID="RibbonParametrage" Visible="false" runat="server" Text="Paramétrage" ClientClick="SetSplitterPane('Vide.aspx');return false;">
                                                            <Groups>
                                                                <OfficeWebUI:RibbonGroup ID="RibbonGroup21" runat="server" Text="Liste" ShowExpander="true">
                                                                    <Zones>
                                                                        <OfficeWebUI:GroupZone ID="GroupZone32" runat="server">
                                                                            <OfficeWebUI:LargeItem ID="LargeItem10" runat="server" Visible="true" Text="Nomeclature IP" ImageUrl="~/image/folder.png" Tooltip="Liste Documents DCR" ClientClick="SetSplitterPane('ParametrageNomenclatureIP.aspx');return false;" />
                                                                        </OfficeWebUI:GroupZone>
                                                                         
                                                                    </Zones>
                                                                </OfficeWebUI:RibbonGroup>
                                                                
                                                               
                                                                 <OfficeWebUI:RibbonGroup ID="RibbonGroup1" runat="server" Text="Paramétrage" ShowExpander="true">
                                                                    <Zones>
                                                                        <OfficeWebUI:GroupZone ID="GroupZone3" runat="server">
                                                                            <OfficeWebUI:LargeItem ID="LargeItem5" runat="server" Text="Synchronisation User" ImageUrl="~/image/ParamDCR.png" Tooltip="Roles" ClientClick="SetSplitterPane('Parametrage.aspx');return false;" />
                                                                        </OfficeWebUI:GroupZone>

                                                                    </Zones>
                                                                </OfficeWebUI:RibbonGroup>
                                                                <OfficeWebUI:RibbonGroup ID="RibbonGroup10" runat="server" Text="Paramétrage" ShowExpander="true">
                                                                    <Zones>
                                                                        <OfficeWebUI:GroupZone ID="GroupZone6" runat="server">
                                                                            <OfficeWebUI:LargeItem ID="LargeItem3" runat="server" Text="Paramétrage" ImageUrl="~/image/ParamDCR.png" Tooltip="Roles" ClientClick="SetSplitterPane('Parametrage.aspx');return false;" />
                                                                        </OfficeWebUI:GroupZone>

                                                                    </Zones>
                                                                </OfficeWebUI:RibbonGroup>
                                                                <OfficeWebUI:RibbonGroup ID="RibbonGroup3" runat="server" Text="Paramétrage" ShowExpander="true">
                                                                    <Zones>
                                                                        <OfficeWebUI:GroupZone ID="GroupZone9" runat="server">
                                                                            <OfficeWebUI:LargeItem ID="LargeItem7" runat="server" Text="Import" ImageUrl="~/image/ParamDCR.png" Tooltip="Roles" ClientClick="SetSplitterPane('Parametrage.aspx');return false;" />
                                                                        </OfficeWebUI:GroupZone>

                                                                    </Zones>
                                                                </OfficeWebUI:RibbonGroup>


                                                            </Groups>
                                                        </OfficeWebUI:RibbonTab>

                                                        <OfficeWebUI:RibbonTab ID="tabAdmin" Visible="false" runat="server" Text="Administration"
                                                            ClientClick="SetSplitterPane('Vide.aspx');return false;">
                                                            <Groups>

                                                                <OfficeWebUI:RibbonGroup ID="RibbonGroupGestionacces" Visible="true" runat="server" ShowExpander="true" Text="Sécurité">
                                                                    <Zones>
                                                                        
                                                                        <OfficeWebUI:GroupZone ID="GroupZone15" runat="server">
                                                                            <OfficeWebUI:LargeItem ID="LargeItem2" runat="server" Visible="true" Text="Gestion des accès" ImageUrl="~/image/permission_settings.png" Tooltip="Permissions/Projets" ClientClick="SetSplitterPane('PermissionProjet.aspx');return false;" />
                                                                        </OfficeWebUI:GroupZone>
                                                                        
                                                                        <OfficeWebUI:GroupZone ID="GroupZone16" runat="server">
                                                                            <OfficeWebUI:MediumItem ID="MediumItem23" runat="server" Visible="true" Text="Affectation administrateur" ImageUrl="~/image/Affectation2.png" Tooltip="Permission" ClientClick="PermissionRessourceAllProj();return false;" />
                                                                        </OfficeWebUI:GroupZone>

                                                                    </Zones>

                                                                </OfficeWebUI:RibbonGroup>

                                                                

                                                                <OfficeWebUI:RibbonGroup ID="RibbonGroup5" runat="server">
                                                                    <Zones>
                                                                        <OfficeWebUI:GroupZone ID="GroupZone17" runat="server">
                                                                            <OfficeWebUI:LargeItem ID="ConUtilisateur" runat="server" Visible="true" Text="Sessions"
                                                                                ImageUrl="~/image/Session.jpg" ClientClick="SetSplitterPane('AffichageSession.aspx');return false;" />
                                                                        </OfficeWebUI:GroupZone>
                                                                        <OfficeWebUI:GroupZone ID="GroupZone18" runat="server">
                                                                            <Content>
                                                                                <OfficeWebUI:MediumItem ID="Changemotspasse" runat="server" Text="Changer mots de passé" Visible="true" ImageUrl="~/image/add_large.png" ClientClick="Ajouter();return false;" />
                                                                            </Content>
                                                                        </OfficeWebUI:GroupZone>
                                                                    </Zones>
                                                                </OfficeWebUI:RibbonGroup>
                                                            </Groups>
                                                        </OfficeWebUI:RibbonTab>

                                                    </Tabs>
                                                </OfficeWebUI:RibbonContext>
                                            </Contexts>
                                        </OfficeWebUI:OfficeRibbon>
                                    </td>
                                </tr>
                            </table>
                                
                        </td>
                    </tr>

                </table>
                <div style="padding-right: 2px;">
                    <iframe name="ifrDetails" src="Pagehomes.aspx" style="border-right: 1px solid #C0C0C0; border-left: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; background-color: Transparent;" width="100%" height="950px" frameborder="1" scrolling="no" id="Iframe1"></iframe>
                </div>
            </td>
        </tr>
    </table>

    <dx:ASPxPopupControl ID="PopupMotPass" ClientInstanceName="PopupMotPass" AutoUpdatePosition="false" runat="server" Theme="Glass" Width="400px"
        HeaderText="Modifier votre mot de passe"
        Modal="True"
        PopupHorizontalAlign="WindowCenter"
        PopupVerticalAlign="WindowCenter">


        <HeaderImage Url="~/Image/Session.jpg" Width="25">
        </HeaderImage>

        <ContentCollection>
            <dx:PopupControlContentControl ID="PopupControlContentControl1" runat="server">

                <dx:ASPxCallbackPanel ID="cpPopup" runat="server" ClientInstanceName="cpPopup" Theme="Office2010Blue">
                    <ClientSideEvents EndCallback="endCallMotsPass" />
                    <PanelCollection>

                        <dx:PanelContent ID="PanelContent2" runat="server">
                            <table widht="100%">
                                <tr>
                                    <td>
                                        <dx:ASPxLabel ID="LblMot" runat="server" Text="Nouveau Mot de passe">
                                        </dx:ASPxLabel>
                                    </td>
                                    <td>
                                        <dx:ASPxTextBox ID="txtMotsPass" ClientInstanceName="txtMotsPass" Password="true" Theme="Glass" runat="server" Width="170px"></dx:ASPxTextBox>
                                    </td>
                                </tr>

                                <tr>
                                    <td>
                                        <dx:ASPxLabel ID="LblCon" runat="server" Text="Confirmez le mot de passe"></dx:ASPxLabel>
                                    </td>
                                    <td>
                                        <dx:ASPxTextBox ID="txtConfirMotsPass" ClientInstanceName="txtConfirMotsPass" Password="true" Theme="Glass" runat="server" Width="170px"></dx:ASPxTextBox>
                                    </td>
                                </tr>
                            </table>
                            <table border="0" width="100%">
                                <tr>
                                    <td align="right" width="80%">
                                        <dx:ASPxButton ID="buttonOk" runat="server" Text="Ok" Width="100px" Theme="Glass"
                                            AutoPostBack="false">
                                            <ClientSideEvents Click="function(s, e) {

                                                       cpPopup.PerformCallback();
                                                     //  PopupMotPass.Hide();

                                  }"></ClientSideEvents>
                                        </dx:ASPxButton>
                                    </td>
                                    <td>
                                        <dx:ASPxButton ID="ButtonAnnuler" runat="server" Text="Annuler" Width="100px" Theme="Glass"
                                            AutoPostBack="false">
                                            <ClientSideEvents Click="function(s, e) {PopupMotPass.Hide();}" />
                                        </dx:ASPxButton>
                                    </td>
                                </tr>
                            </table>
                        </dx:PanelContent>
                    </PanelCollection>
                </dx:ASPxCallbackPanel>
            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>


    <dx:ASPxPopupControl ID="PopupAlert" ClientInstanceName="PopupAlert" AutoUpdatePosition="false"
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
                            <dx:ASPxLabel ID="lblErr" runat="server" ClientInstanceName="lblErr" ForeColor="Red"></dx:ASPxLabel>
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



</asp:Content>
