<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Priority.aspx.cs" Inherits="Priority" %>

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
        <dx:ASPxGridView ID="GridPriority" ClientInstanceName="GridPriority"   DataSourceID="SqlDataPriority"
            
             SettingsText-Title="Liste documents"
             KeyFieldName="id" Width="100%" Theme="Metropolis" runat="server">
            <SettingsText Title="Liste documents" />
            <Columns>
                       
            <dx:GridViewDataTextColumn FieldName="id" Visible="false" VisibleIndex="1">
            </dx:GridViewDataTextColumn>
            
            <dx:GridViewDataTextColumn FieldName="Description"  HeaderStyle-ForeColor="Transparent" Caption=""  GroupIndex="0" SortIndex="0"  VisibleIndex="1">
<HeaderStyle ForeColor="Transparent"></HeaderStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn  VisibleIndex="2" Visible="false" Width="30px">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="descp"  Caption="Titre du document" Width="100%"  VisibleIndex="3">
            </dx:GridViewDataTextColumn>
        </Columns>
            <SettingsPager PageSize="10" EnableAdaptivity="true">
            <PageSizeItemSettings Visible="true" Position="Right" ShowAllItem="true">
            </PageSizeItemSettings>
        </SettingsPager>
        <SettingsBehavior AutoExpandAllGroups="True" AllowFocusedRow="true"  />
        <Settings ShowFooter="false" ShowGroupFooter="VisibleIfExpanded" ShowGroupedColumns="false"   ShowColumnHeaders="false" ShowTitlePanel="true"
            VerticalScrollableHeight="300" VerticalScrollBarMode="Visible" 
            ></Settings>
        </dx:ASPxGridView>
        <asp:SqlDataSource ID="SqlDataPriority" runat="server" ConnectionString="<%$ ConnectionStrings:PointeuseConnectionString %>" 
            SelectCommand="GetPriorityBycodDoc" SelectCommandType="StoredProcedure">
           <SelectParameters>
                    <asp:QueryStringParameter Name="CodeDocument" QueryStringField="CodeDocument" />
                </SelectParameters>
        </asp:SqlDataSource>
    </div>
    </form>
</body>
</html>
