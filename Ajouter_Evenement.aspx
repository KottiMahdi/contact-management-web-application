﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Ajouter_Evenement.aspx.cs" Inherits="Ajouter_Evenement" %>

<%@ Register Assembly="DevExpress.Web.v20.1, Version=20.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
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

                callbacAjouter.PerformCallback('Enregister');
            }
            function CliEnvoyer() {

                callbacAjouter.PerformCallback('Envoyer');
            }

        </script>
        <div>



            <dx:ASPxFormLayout runat="server" Width="100%" ID="formLayout" Theme="Glass" DataSourceID="SqlDataSource1">
                <Items>
                    <dx:LayoutGroup Caption="Détais Evenement" ColCount="2">

                        <Items>
                            <dx:LayoutItem ColSpan="1" Caption="Type Evenement">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer>
                                        <dx:ASPxComboBox ID="TxtType" runat="server"  DataSourceID="SqlType" TextField="TypeEv" ValueField="ID_Type" Width="100%" BackColor="lightyellow">
                                        </dx:ASPxComboBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem ColSpan="2" Caption="Objet">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer>
                                        <dx:ASPxTextBox ID="TxtObjet" runat="server" BackColor="lightyellow" Width="100%">
                                        </dx:ASPxTextBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem ColSpan="1" Caption="Date Début">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer>
                                        <dx:ASPxDateEdit ID="DtDateDebut" runat="server" BackColor="lightyellow" Width="100%">
                                        </dx:ASPxDateEdit>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem ColSpan="1" Caption="Heure Début">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer>
                                        <dx:ASPxTimeEdit ID="HDebut" runat="server" ClientInstanceName="HDebut" BackColor="lightyellow" Width="100%">
                                            <ClearButton DisplayMode="OnHover"></ClearButton>
                                            <ValidationSettings ErrorDisplayMode="None" />
                                        </dx:ASPxTimeEdit>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem ColSpan="1" Caption="Date Fin">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer>
                                        <dx:ASPxDateEdit ID="DtDateFin" runat="server" BackColor="lightyellow" Width="100%">
                                        </dx:ASPxDateEdit>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem ColSpan="1" Caption="Heure Fin">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer>

                                        <dx:ASPxTimeEdit ID="HFin" runat="server" ClientInstanceName="HFin" BackColor="lightyellow" Width="100%">
                                            <ClearButton DisplayMode="OnHover"></ClearButton>
                                            <ValidationSettings ErrorDisplayMode="None" />
                                        </dx:ASPxTimeEdit>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem ColSpan="1" Caption="Lieu">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer>
                                        <dx:ASPxTextBox ID="TxtLieu" runat="server"  BackColor="lightyellow" Width="100%">
                                        </dx:ASPxTextBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                           
                             <dx:LayoutItem ColSpan="2" Caption="Attribu" Visible="false">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                       

                                                 <dx:ASPxGridLookup ID="GrdValidateur" ClientInstanceName="GrdValidateur" BackColor="lightyellow" runat="server"  
                                                        Width="100%" AutoPostBack="false"  MultiTextSeparator=", " SelectionMode="Multiple"
                                                        DataSourceID="SqlListeEmployeValidateur" KeyFieldName="Matricule" TextFormatString="{0}">

                                                        <ValidationSettings Display="Dynamic" ErrorDisplayMode="ImageWithTooltip" ValidationGroup="GroupValidation">
                                                            <RequiredField IsRequired="true" ErrorText="*" />
                                                        </ValidationSettings>

                                                        <Columns>
                                                            <dx:GridViewDataTextColumn FieldName="users" Caption="Nom et Prénom" Width="270px" VisibleIndex="1"
                                                                Settings-AutoFilterCondition="Contains">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn FieldName="Matricule" Visible="false"></dx:GridViewDataTextColumn>
                                                        </Columns>

                                                        <GridViewProperties Settings-ShowTitlePanel="false">

                                                            <Settings ShowFilterRow="True" ShowStatusBar="Visible" />
                                                            <SettingsPager PageSize="7" EnableAdaptivity="true" />

                                                        </GridViewProperties>
                                                      

                                                    </dx:ASPxGridLookup>
                                                    <asp:SqlDataSource ID="SqlListeEmployeValidateur" runat="server" ConnectionString="<%$ ConnectionStrings:RessourceConnectionString %>"
                                                        SelectCommand="SelectEmployer" SelectCommandType="StoredProcedure"></asp:SqlDataSource>



                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>

                             <dx:LayoutItem ColSpan="2" Caption="Description">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxMemo ID="TxtDescriptionEv" runat="server" BackColor="lightyellow" Width="100%" Height="100px">
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
                                                    <tr><td   >
                                                           
                                                            </td>
                                                         <td  style="text-align:right ;width:120px" >
                                                            <%--<dx:ASPxButton ID="ASPxButton2" ClientVisible="true" Width="100px" AutoPostBack="false" runat="server" Text="Envoyer">
                                                                  <Image Url="~/image/Email.png" Width="20px"></Image>
                                                                <ClientSideEvents Click="CliEnvoyer" />
                                                            </dx:ASPxButton>--%>
                                                            </td>
                                                        <td  style="text-align:right;width:120px" >
                                                            <dx:ASPxButton ID="ASPxButton1" ClientVisible="true" Width="100px" AutoPostBack="false" runat="server" Text="Enregistrer">
                                                                  <Image Url="~/image/GMAO/Termi.png" Width="20px"></Image>
                                                                <ClientSideEvents Click="CliAjoutEven" />
                                                            </dx:ASPxButton>
                                                            </td>
                                                       
                                                        <td style="width:120px" >
                                                            <dx:ASPxButton ID="ASPxButton" Width="100px" runat="server" AutoPostBack="false" Text="Fermer">
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

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:RessourceConnectionString %>" SelectCommand="GetNomenclature_Evenement" SelectCommandType="StoredProcedure"></asp:SqlDataSource>





            
        </div>

        <dx:ASPxCallback ID="callbacAjouter" ClientInstanceName="callbacAjouter" OnCallback="callbacAjouter_Callback" runat="server">
            <ClientSideEvents EndCallback="function(s, e) {
                                                                              EndCallBAjout(s,e); 
                                                                    }
                                                                    
                                                                    " />
        </dx:ASPxCallback>
        
<%--        <dx:ASPxCallbackPanel ID="callbacAjouterEvenement" runat="server" Width="100%" ClientInstanceName="callbacAjouterEvenement"
    OnCallback="callbacAjouter_Callback" Theme="Aqua">

    <ClientSideEvents EndCallback="function(s, e) {EndCallBAjout(s,e);}" />

    <PanelCollection>
        <dx:PanelContent ID="PanelContent6" runat="server">
            <dx:ASPxHiddenField runat="server" ID="TxtIDLengOrder" ClientInstanceName="TxtIDLengOrder"></dx:ASPxHiddenField>
        </dx:PanelContent>
    </PanelCollection>
</dx:ASPxCallbackPanel>--%>
        
        
        
        
        
        <dx:ASPxPopupControl ID="PopupAlerts" ClientInstanceName="PopupAlerts" AutoUpdatePosition="false"
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
                                <dx:ASPxLabel ID="txterror" runat="server" ClientInstanceName="txterror" ForeColor="Red"></dx:ASPxLabel>
                            </td>

                        </tr>

                        <tr>
                            <td align="right">
                                <dx:ASPxButton ID="ASPxButton14" runat="server" Text="Fermer" Width="100%" AutoPostBack="False"
                                    Theme="Glass">
                                    <ClientSideEvents Click="function(s, e) {
                                                  window.parent.gridEven.PerformCallback();
                                                   PopupAlerts.Hide();  	
                                                   }"></ClientSideEvents>
                                </dx:ASPxButton>
                            </td>
                        </tr>
                    </table>
                </dx:PopupControlContentControl>

            </ContentCollection>
        </dx:ASPxPopupControl>










        <br />

        <asp:SqlDataSource ID="SqlType" runat="server" ConnectionString="<%$ ConnectionStrings:RessourceConnectionString %>"
             SelectCommand="GetType" SelectCommandType="StoredProcedure"  ></asp:SqlDataSource>

        <br />

        <asp:SqlDataSource ID="SqluTILISATEUR" runat="server" ConnectionString="<%$ ConnectionStrings:RessourceConnectionString %>" 
            SelectCommand="GetUtilisateur" SelectCommandType="StoredProcedure" ></asp:SqlDataSource>

    </form>
</body>
</html>
