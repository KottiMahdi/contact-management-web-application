<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DefaultFonction.aspx.cs" Inherits="DefaultFonction" %>

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
            <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Theme='iOS' width='100%' KeyFieldName="id_fonct">
                <SettingsSearchPanel Visible="True" />
                <Columns>
                    <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" ShowNewButtonInHeader="True" VisibleIndex="0">
                    </dx:GridViewCommandColumn>
                    <dx:GridViewDataTextColumn FieldName="id_fonct" Visible="false"  ReadOnly="True" VisibleIndex="1">
                        <EditFormSettings Visible="False" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="nom_fonct" VisibleIndex="2" Caption="Nom_Fonction">
                    </dx:GridViewDataTextColumn>
                </Columns>
            </dx:ASPxGridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:RessourceConnectionString %>" SelectCommand="GetFonctions" SelectCommandType="StoredProcedure" DeleteCommand="deleteFonctions" DeleteCommandType="StoredProcedure" InsertCommand="insertFonctions" InsertCommandType="StoredProcedure" UpdateCommand="UpdateFonctions" UpdateCommandType="StoredProcedure">
                <DeleteParameters>
                    <asp:Parameter Name="id_fonct" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="nom_fonct" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="id_fonct" Type="Int32" />
                    <asp:Parameter Name="nom_fonct" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
