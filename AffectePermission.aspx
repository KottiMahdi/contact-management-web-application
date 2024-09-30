<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AffectePermission.aspx.cs" Inherits="AffectePermission" %>
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

    function sunchro() {

         var isFormValid = ASPxClientEdit.ValidateGroup("eppm");

        if (isFormValid) {
        var Matricule = GridLookupRessource.GetValue();
        var Projet = GridLookupProjet.GetText();
        window.parent.GridProjet.PerformCallback("Ajoute" + "@" + Matricule + "@" + Projet);
        }

    }

    function CloseGridLookup() {
        GridLookupRessource.ConfirmCurrentSelection();
        GridLookupRessource.HideDropDown();
        GridLookupRessource.Focus();

    }
    function CloseGridproj() {
        GridLookupProjet.ConfirmCurrentSelection();
        GridLookupProjet.HideDropDown();
        GridLookupProjet.Focus();

    }

   

</script>

<dx:ASPxFormLayout ID="ASPxFormLayout3" ClientInstanceName="FormLayoutDEtailStatusProg" runat="server" Width="100%" ColCount="1">
    <Items>
        <dx:LayoutGroup Caption="Choisir Multiple Projets" ColSpan="1" Width="100%">
            <Items>
                <dx:LayoutItem ShowCaption="False" Width="100%">
                    <LayoutItemNestedControlCollection>
                        <dx:LayoutItemNestedControlContainer>

                            <dx:ASPxGridLookup ID="GridLookupProjet" runat="server" ClientInstanceName="GridLookupProjet"
                                SelectionMode="Multiple" Width="100%" TextFormatString="{1}" MultiTextSeparator=";"
                                KeyFieldName="Reference"  Theme="Glass"
                                DataSourceID="SqlProjet">
                                 <ValidationSettings Display="Dynamic" ValidationGroup="eppm" ErrorTextPosition="Bottom">
                                        <RequiredField ErrorText="Le champ Projets est obligatoire" IsRequired="True" />
                                    </ValidationSettings>
                                <Columns>
                                    <dx:GridViewDataTextColumn FieldName="Reference" ShowInCustomizationForm="True" VisibleIndex="0" Visible="false">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewCommandColumn ShowSelectCheckbox="True" Width="50px" VisibleIndex="1" />
                                    <dx:GridViewDataTextColumn FieldName="Reference" ShowInCustomizationForm="True" Width="200px" VisibleIndex="2" Caption="Projet">
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                               
                                 <GridViewProperties>
                                    <Templates>
                                        <StatusBar>
                                            <table class="OptionsTable" style="float: right">
                                                <tr>
                                                    <td>
                                                        <dx:ASPxButton ID="Close" runat="server" AutoPostBack="false" Text="Close" ClientSideEvents-Click="CloseGridproj" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </StatusBar>
                                    </Templates>
                                     <Settings ShowFilterRow="true" ShowStatusBar="Visible"    VerticalScrollableHeight="180"  VerticalScrollBarMode="Visible"></Settings>
                                    <SettingsPager PageSize="1000" EnableAdaptivity="true" />
                                </GridViewProperties>

                            </dx:ASPxGridLookup>
                            <asp:SqlDataSource ID="SqlProjet" runat="server"  ConnectionString="<%$ ConnectionStrings:PointeuseConnectionString %>"
                                SelectCommand="GetAffaire" SelectCommandType="StoredProcedure">
                            </asp:SqlDataSource>

                        </dx:LayoutItemNestedControlContainer>
                    </LayoutItemNestedControlCollection>
                </dx:LayoutItem>

            </Items>
        </dx:LayoutGroup>
        <dx:LayoutGroup Caption="Choisir Multiple Ressources" ColSpan="1" Width="100%">
            <Items>
                <dx:LayoutItem ShowCaption="False" Width="100%">
                    <LayoutItemNestedControlCollection>
                        <dx:LayoutItemNestedControlContainer>

                            <dx:ASPxGridLookup ID="GridLookupRessource" runat="server" ClientInstanceName="GridLookupRessource"
                                SelectionMode="Multiple" Width="100%" TextFormatString="{1}" MultiTextSeparator=";"
                                KeyFieldName="Matricule"  Theme="Glass" DataSourceID="SqlDataRessouActi">
                                <ValidationSettings Display="Dynamic" ValidationGroup="eppm" ErrorTextPosition="Bottom">
                                        <RequiredField ErrorText="Le champ Ressources est obligatoire" IsRequired="True" />
                                    </ValidationSettings>
                                <Columns>
                                    <dx:GridViewDataTextColumn FieldName="Matricule" ShowInCustomizationForm="True" VisibleIndex="0" Visible="false">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewCommandColumn ShowSelectCheckbox="True" Width="50px" VisibleIndex="1" />
                                    <dx:GridViewDataTextColumn FieldName="NomPrenom" ShowInCustomizationForm="True" Width="200px" VisibleIndex="2" Caption="Nom">
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                               
                                <GridViewProperties>
                                    <Templates>
                                        <StatusBar>
                                            <table class="OptionsTable" style="float: right">
                                                <tr>
                                                    <td>
                                                        <dx:ASPxButton ID="Close" runat="server" AutoPostBack="false" Text="Close" ClientSideEvents-Click="CloseGridLookup" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </StatusBar>
                                    </Templates>
                                    <Settings ShowFilterRow="true" ShowStatusBar="Visible"    VerticalScrollableHeight="120"  VerticalScrollBarMode="Visible"></Settings>
                                    
                                    <SettingsPager PageSize="1000"  Visible="false"/>
                                </GridViewProperties>

                            </dx:ASPxGridLookup>

                            <asp:SqlDataSource ID="SqlDataRessouActi" runat="server"  ConnectionString="<%$ ConnectionStrings:PointeuseConnectionString %>"
                                SelectCommand="GetEmployee" SelectCommandType="StoredProcedure">
                            </asp:SqlDataSource>

                        </dx:LayoutItemNestedControlContainer>
                    </LayoutItemNestedControlCollection>
                </dx:LayoutItem>

            </Items>
        </dx:LayoutGroup>
    </Items>
</dx:ASPxFormLayout>


<table width="100%">

    <tr>
        <td height="150px"></td>

    </tr>
    <tr>
         
        <td width="50%">

            <dx:ASPxButton ID="ASPxButton1" runat="server" Text="Valider" Width="100%" AutoPostBack="False"
                Theme="Glass">
                <ClientSideEvents Click="function(s, e) {
                    sunchro();
                       parent.window.popupWind.Hide(); 
                     
                                                   }"></ClientSideEvents>
            </dx:ASPxButton>
        </td>
        <td width="50%">
            <dx:ASPxButton ID="ASPxButton2" runat="server" Text="Fermer" Width="100%" AutoPostBack="False"
                Theme="Glass">
                <ClientSideEvents Click="function(s, e) {
                                                   parent.window.popupWind.Hide();  		
                                                   }"></ClientSideEvents>
            </dx:ASPxButton>
        </td>
    </tr>
</table>
    </div>
    </form>
</body>
</html>
