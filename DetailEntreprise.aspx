﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DetailEntreprise.aspx.cs" Inherits="DetailEntreprise" %>
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

           <dx:ASPxFormLayout runat="server" Width="100%" ID="formLayout" ColumnCount="1" Theme="Glass">
                        <Items>
                            <dx:LayoutGroup Caption="Détails Général" ColCount="2" >
                              
                                <Items>
                                    <dx:LayoutItem Caption="Entreprise">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer>
                                                <dx:ASPxTextBox runat="server" ID="TxtEntreprise"  Width="100%" BackColor="lightyellow">
                                                  
                                                </dx:ASPxTextBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                
                                     
                                    <dx:LayoutItem Caption="Ville">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer>
                                                <dx:ASPxTextBox runat="server" ID="tbCountry" Width="100%" BackColor="lightyellow">
                                                  
                                                </dx:ASPxTextBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem Caption="Téléphone">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer>
                                                <dx:ASPxTextBox runat="server" ID="TxtTel" ClientInstanceName="TxtTel" Width="100%" BackColor="lightyellow" >
                                                </dx:ASPxTextBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem Caption="Pays">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer>
                                                <dx:ASPxTextBox runat="server" ID="TxtPays" ClientInstanceName="TxtPays" Width="100%" BackColor="lightyellow" >
                                                </dx:ASPxTextBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                   
                                    <dx:LayoutItem Caption="Fax">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer>
                                                <dx:ASPxTextBox runat="server" ID="TxtFax" ClientInstanceName="TxtFax" Width="100%" BackColor="lightyellow" >
                                                     
                                                </dx:ASPxTextBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem Caption="Site internet">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer>
                                                <dx:ASPxTextBox runat="server" ID="TxtSite_internet" Width="100%" BackColor="lightyellow">
                                                    
                                                </dx:ASPxTextBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    
                                    <dx:LayoutItem Caption="Groupe">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer>
                                                <dx:ASPxTextBox runat="server" ID="TxtGroupe" Width="100%" BackColor="lightyellow">
                                                   
                                                </dx:ASPxTextBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    
                                    <dx:LayoutItem Caption="Etat">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer>
                                                <dx:ASPxTextBox runat="server" ID="TxtEtat" Width="100%" BackColor="lightyellow" >
                                                </dx:ASPxTextBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                   <dx:LayoutItem Caption="Adresse"  ColumnSpan="2">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer>
                                                <dx:ASPxTextBox runat="server" ID="TxtAdresse" Width="100%" BackColor="lightyellow">
                                                   
                                                </dx:ASPxTextBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem Caption="Adresse 2" ColumnSpan="2">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer>
                                                <dx:ASPxTextBox runat="server" ID="TxtAdresse2" Width="100%" BackColor="lightyellow" >
                                                </dx:ASPxTextBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                        <dx:LayoutItem Caption="Code_postal" ColumnSpan="2">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer>
                                                <dx:ASPxTextBox runat="server" ID="tbLastName" Width="100%" BackColor="lightyellow">
                                                    
                                                </dx:ASPxTextBox>
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
                                                        <td  style="text-align:right" >
                                                            <dx:ASPxButton ID="ASPxButton1" ClientVisible="false" Width="90px" runat="server" Text="Valider"></dx:ASPxButton>
                                                            </td>
                                                        <td style="width:100px" >
                                                            <dx:ASPxButton ID="ASPxButton" Width="90px" runat="server" Text="Fermer">
                                                                 <Image Url="~/image/GMAO/close.png" Width="20px"></Image>
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
    </form>
</body>
</html>
