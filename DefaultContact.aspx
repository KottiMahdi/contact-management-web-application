<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DefaultContact.aspx.cs" Inherits="DefaultContact" %>

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

            <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" 
                  KeyFieldName="ID_Contact" Theme="iOS">
                <SettingsSearchPanel Visible="True" />
                <Columns>
                    <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" ShowNewButtonInHeader="True" VisibleIndex="0">
                    </dx:GridViewCommandColumn>
                    <dx:GridViewDataTextColumn FieldName="ID_Contact" ReadOnly="True" VisibleIndex="1" Visible="False">
                        <EditFormSettings Visible="False" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Nom" VisibleIndex="3">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Prenom" VisibleIndex="4">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Téléphone" VisibleIndex="5">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Mobile" VisibleIndex="6">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="E_mail" VisibleIndex="7">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Suivi_par" VisibleIndex="10">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataComboBoxColumn Caption="Civ" FieldName="ID_Civ" VisibleIndex="2" ShowInCustomizationForm="True">
                        <PropertiesComboBox DataSourceID="Civilite" TextField="Civilite" ValueField="ID_Civ">
                        </PropertiesComboBox>
                    </dx:GridViewDataComboBoxColumn>
                    <dx:GridViewDataComboBoxColumn Caption="Fonction" FieldName="ID_Fonction" VisibleIndex="8" ShowInCustomizationForm="True">
                        <PropertiesComboBox DataSourceID="Fonction" TextField="Fonction" ValueField="ID_Fonction">
                        </PropertiesComboBox>
                    </dx:GridViewDataComboBoxColumn>
                    <dx:GridViewDataComboBoxColumn FieldName="ID_Entreprise" VisibleIndex="9" ShowInCustomizationForm="True">
                        <PropertiesComboBox DataSourceID="SqlEntreprise"  ValueField="ID_Entreprise" TextField="Nom">
                        </PropertiesComboBox>
                    </dx:GridViewDataComboBoxColumn>
                </Columns>
             <SettingsBehavior AllowFocusedRow="true" />
            </dx:ASPxGridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:RessourceConnectionString %>" 
                SelectCommand="GetContact" SelectCommandType="StoredProcedure" 
                DeleteCommand="DeleteContact" DeleteCommandType="StoredProcedure" 
                InsertCommand="InsertContact" InsertCommandType="StoredProcedure" 
                UpdateCommand="UpdateContact" UpdateCommandType="StoredProcedure">
                <DeleteParameters>
                    <asp:Parameter Name="ID_Contact" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="ID_Civ" Type="Int32" />
                    <asp:Parameter Name="Nom" Type="String" />
                    <asp:Parameter Name="Prenom" Type="String" />
                    <asp:Parameter Name="Téléphone" Type="Int32" />
                    <asp:Parameter Name="Mobile" Type="Int32" />
                    <asp:Parameter Name="E_mail" Type="String" />
                    <asp:Parameter Name="ID_Fonction" Type="Int32" />
                    <asp:Parameter Name="ID_Entreprise" Type="Int32" />
                    <asp:Parameter Name="Suivi_par" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="ID_Contact" Type="Int32" />
                    <asp:Parameter Name="ID_Civ" Type="Int32" />
                    <asp:Parameter Name="Nom" Type="String" />
                    <asp:Parameter Name="Prenom" Type="String" />
                    <asp:Parameter Name="Téléphone" Type="Int32" />
                    <asp:Parameter Name="Mobile" Type="Int32" />
                    <asp:Parameter Name="E_mail" Type="String" />
                    <asp:Parameter Name="ID_Fonction" Type="Int32" />
                    <asp:Parameter Name="ID_Entreprise" Type="Int32" />
                    <asp:Parameter Name="Suivi_par" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
           
            <asp:SqlDataSource ID="Civilite" runat="server" ConnectionString="<%$ ConnectionStrings:RessourceConnectionString %>" SelectCommand="GetCiv" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
            <asp:SqlDataSource ID="Fonction" runat="server" ConnectionString="<%$ ConnectionStrings:RessourceConnectionString %>" SelectCommand="GetFonction" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlEntreprise" runat="server" ConnectionString="<%$ ConnectionStrings:RessourceConnectionString %>" 
                SelectCommand="GetEntreprise" SelectCommandType="StoredProcedure">

            </asp:SqlDataSource>

        </div>
    </form>
</body>

</html>
