<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Permission.aspx.cs" Inherits="Permission" %>
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
 

<dx:ASPxGridView ID="gridTypeRef" ClientInstanceName="gridTypeRef"
    Theme="Glass" Width="100%" runat="server" AutoGenerateColumns="False"
    DataSourceID="SqlDataTypeRef" KeyFieldName="Matricule">
    <columns>
            <dx:GridViewCommandColumn ButtonType="Image" Caption=" " Width="25px" VisibleIndex="0"
                ShowNewButton="true">
            </dx:GridViewCommandColumn>
            <dx:GridViewCommandColumn ButtonType="Image" Caption=" " Width="25px" VisibleIndex="1"
                ShowSelectCheckbox="false"
                ShowDeleteButton="true"
                ShowCancelButton="true"
                ShowUpdateButton="true">
            </dx:GridViewCommandColumn>
            
                
              
            <dx:GridViewDataComboBoxColumn Caption="Nom et Prénom" Width="100%" FieldName="Matricule" VisibleIndex="3">
                                            <PropertiesComboBox DataSourceID="SqlEmployer" TextField="NomPrenom" ValueField="Matricule">
                                            </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>

                
            </columns>
    <settings verticalscrollableheight="300" verticalscrollbarmode="Visible" />
    <settingsediting newitemrowposition="Bottom">
                                    </settingsediting>
    <settingsbehavior allowfocusedrow="True"></settingsbehavior>
    <settingscommandbutton>
            <NewButton>
                <Image Url="~/Image/add_large.png" Width="15px" Height="15px" />
            </NewButton>
            <DeleteButton>
                <Image Url="~/Image/delete.gif" Width="15px" Height="15px" />
            </DeleteButton>
            <CancelButton>
                <Image Url="~/Image/cancel.gif" />
            </CancelButton>
            <UpdateButton>
                <Image Url="~/Image/save.gif" />
            </UpdateButton>
        </settingscommandbutton>
</dx:ASPxGridView>
<asp:SqlDataSource ID="SqlEmployer" runat="server" ConnectionString="<%$ ConnectionStrings:PointeuseConnectionString %>"
    SelectCommand="GetEmployee" SelectCommandType="StoredProcedure">
</asp:SqlDataSource>

<asp:SqlDataSource ID="SqlDataTypeRef" runat="server" ConnectionString="<%$ ConnectionStrings:PointeuseConnectionString %>"
    SelectCommand="GetRessourcePermission" SelectCommandType="StoredProcedure"
    InsertCommand="InsertRessourcePermission" InsertCommandType="StoredProcedure"
    DeleteCommand="DELETE FROM Permission_Administrateur WHERE (Matricule = @Matricule)" >
    <InsertParameters>
        <asp:Parameter Name="Matricule" />
    </InsertParameters>
    <DeleteParameters>
        <asp:Parameter Name="Matricule" />
    </DeleteParameters>

</asp:SqlDataSource>
<table width="100%">
    <tr>
        <td height="5px"></td>
    </tr>
    <tr>

        <td>

            <dx:ASPxButton ID="ButtClose" runat="server" Text="Fermer" Width="100%" Height="30px" AutoPostBack="False" Theme="Glass">
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
