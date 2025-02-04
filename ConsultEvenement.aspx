﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ConsultEvenement.aspx.cs" Inherits="ConsultEvenement" %>
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
        <script type="text/javascript">
            function Ajouter_Evenement() {

                callbacAjouter.PerformCallback();
            }




            function EndCallBAjout(s, e) {


                var Choix = s.cp_Insert;

                if (Choix == "Ajouter") {
                    txterror.SetText('Ajouter avec succès');
                    PopupAlerts.Show();
                }

                else {
                    txterror.SetText('Errore');
                    PopupAlerts.Show();
                }

            }


            function CliAjoutEven() {

                callbacAjouter.PerformCallback();
            }
            function CliEnvoyer() {

                callbacAjouter.PerformCallback();
            }

        </script>
        <div>



            <dx:ASPxFormLayout runat="server" Width="100%" ID="formLayout" Theme="Glass"  >
                <Items>
                    <dx:LayoutGroup Caption="Détais Evenement" ColCount="2">

                        <Items>
                            <dx:LayoutItem ColSpan="1" Caption="Type Evenement">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer>
                                        <dx:ASPxComboBox ID="TxtType" runat="server" DataSourceID="SqlType" TextField="TypeEv" ValueField="ID_Type" Width="100%">
                                        </dx:ASPxComboBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem ColSpan="2" Caption="Objet">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer>
                                        <dx:ASPxTextBox ID="TxtObjet" runat="server" Width="100%">
                                        </dx:ASPxTextBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem ColSpan="1" Caption="Date Début">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer>
                                        <dx:ASPxDateEdit ID="DtDateDebut" runat="server" Width="100%">
                                        </dx:ASPxDateEdit>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem ColSpan="1" Caption="Heure Début">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer>
                                        <dx:ASPxTimeEdit ID="HDebut" runat="server" ClientInstanceName="HDebut" Width="100%">
                                            <ClearButton DisplayMode="OnHover"></ClearButton>
                                            <ValidationSettings ErrorDisplayMode="None" />
                                        </dx:ASPxTimeEdit>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem ColSpan="1" Caption="Date Fin">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer>
                                        <dx:ASPxDateEdit ID="DtDateFin" runat="server" Width="100%">
                                        </dx:ASPxDateEdit>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem ColSpan="1" Caption="Heure Fin">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer>

                                        <dx:ASPxTimeEdit ID="HFin" runat="server" ClientInstanceName="HFin" Width="100%">
                                            <ClearButton DisplayMode="OnHover"></ClearButton>
                                            <ValidationSettings ErrorDisplayMode="None" />
                                        </dx:ASPxTimeEdit>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem ColSpan="1" Caption="Lieu">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer>
                                        <dx:ASPxTextBox ID="TxtLieu" runat="server"  Width="100%">
                                        </dx:ASPxTextBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                           
                             <dx:LayoutItem ColSpan="2" Caption="Attribu">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxComboBox ID="TxtAttribue_a" runat="server" Width="100%" DataSourceID="SqluTILISATEUR" TextField="users" ValueField="id">
                                        </dx:ASPxComboBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>

                             <dx:LayoutItem ColSpan="2" Caption="Description">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxMemo ID="TxtDescriptionEv" runat="server" Width="100%" Height="100px">
                                        </dx:ASPxMemo>


                                    

                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                        </Items>
                    </dx:LayoutGroup>

                    <dx:LayoutGroup  ShowCaption="False"  ColumnSpan="1" >
                              
                                <Items>
                                    <dx:LayoutItem ShowCaption="False">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer>
                                                <table style="width:100% ;text-align:right" >
                                                    <tr>
                                                        <td style="width:100px" >
                                                            <dx:ASPxButton ID="ASPxButton" Width="90px" runat="server" AutoPostBack="false" Text="Fermer">
                                                                 <ClientSideEvents Click="function(s, e) {
                                                                               parent.window.popupWind.Hide(); 
                                                                    }
                                                                    
                                                                    " />
                                                               
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

      
         

        <br />

        <asp:SqlDataSource ID="SqlType" runat="server" ConnectionString="<%$ ConnectionStrings:RessourceConnectionString %>"
             SelectCommand="GetType" SelectCommandType="StoredProcedure"  ></asp:SqlDataSource>

        <br />

        <asp:SqlDataSource ID="SqluTILISATEUR" runat="server" ConnectionString="<%$ ConnectionStrings:RessourceConnectionString %>" 
            SelectCommand="GetUtilisateur" SelectCommandType="StoredProcedure" ></asp:SqlDataSource>
    </div>
    </form>
</body>
</html>
