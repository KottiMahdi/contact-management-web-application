<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AffichageSession.aspx.cs" Inherits="AffichageSession" %>
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

       function CallabckGrid() {
           GridReunionProjt.PerformCallback();
       }
   
   </script>
   
    <style type="text/css">
            .label_td4
            {
                background-color: #D3E9F0;
                border: 1px solid #4986A2;
                padding-left: 2px;
                width: 80px;
                font-family: Tahoma;
                font-size: 12px;
            }
            
            
            .label_td
            {
                background-color: #D3E9F0;
                border: 1px solid #4986A2;
                padding-left: 2px;
                width: 200px;
                font-family: Tahoma;
                font-size: 12px;
            }
            .label_td2
            {
                background-color: #D3E9F0;
                border: 1px solid #4986A2;
                padding-left: 2px;
                width: 100px;
                font-family: Tahoma;
                font-size: 12px;
            }
            
            .label_td3
            {
                background-color: #D3E9F0;
                border: 1px solid #4986A2;
                padding-left: 2px;
                width: 400px;
                font-family: Tahoma;
                font-size: 12px;
            }
            
            .labelDon_td2
            {
                background-color: #BCF6AA;
                border: 1px solid #005700;
                padding-right: 2px;
                font-family: Tahoma;
                font-size: 12px;
            }
            
            .labelDon_td
            {
                background-color: #BCF6AA;
                border: 1px solid #005700;
                padding-left: 2px;
                width: 300px;
                font-family: Tahoma;
                font-size: 12px;
            }
            </style>
    <div>
    
        
       
                            
                          
                            <dx:ASPxGridView ID="GridReunionProjt"  ClientInstanceName="GridReunionProjt" 
                                Width="100%" Theme="Glass" runat="server" AutoGenerateColumns="False"  KeyFieldName="ID"
            DataSourceID="SqlDataReunionProjet">
            <Columns>
            <dx:GridViewDataTextColumn FieldName="login" VisibleIndex="0">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="ID"  Visible="false"
                    VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="NomPrenom" Caption="Nom et Prénom"
                    VisibleIndex="2">
                </dx:GridViewDataTextColumn>
               
                

                
            </Columns>
              <SettingsPager PageSize="100">
                <PageSizeItemSettings Visible="true" Position="Right" ShowAllItem="true">
                </PageSizeItemSettings>
            </SettingsPager>
            <SettingsCommandButton>
                <EditButton>
                    <Image Url="~/image/edit.gif" />
                </EditButton>
                <DeleteButton>
                    <Image Url="~/image/delete.gif" />
                </DeleteButton>
                <CancelButton>
                    <Image Url="~/image/cancel.gif" />
                </CancelButton>
                <UpdateButton>
                    <Image Url="~/image/save.gif" />
                </UpdateButton>
            </SettingsCommandButton>
            <SettingsBehavior AllowFocusedRow="True" AutoExpandAllGroups="True" AllowFixedGroups="true">
            </SettingsBehavior>
            <Settings ShowFooter="True" ShowGroupFooter="VisibleIfExpanded" VerticalScrollableHeight="400" VerticalScrollBarMode="Visible">
            </Settings>
        </dx:ASPxGridView>
                            <asp:SqlDataSource ID="SqlDataReunionProjet" runat="server" 
            ConnectionString="<%$ ConnectionStrings:PointeuseConnectionString %>" 
            SelectCommand="SELECT [NomPrenom], [login], [Password], [ID] FROM [SessionUser]" 
            DeleteCommand="DELETE FROM [SessionUser] WHERE [ID] = @ID" 
             
                                UpdateCommand="UPDATE [SessionUser] SET [NomPrenom] = @NomPrenom,  [login] = @login, [Password] = @Password WHERE [ID] = @ID" 
                                InsertCommand="INSERT INTO [SessionUser] ([NomPrenom],  [login], [Password]) VALUES (@NomPrenom, @login, @Password)">
            <DeleteParameters>
                <asp:Parameter Name="ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="NomPrenom" Type="String" />
                
                <asp:Parameter Name="login" Type="String" />
                <asp:Parameter Name="Password" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="NomPrenom" Type="String" />
                <asp:Parameter Name="login" Type="String" />
                <asp:Parameter Name="Password" Type="String" />
                <asp:Parameter Name="ID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>


                  

    </div>

    <dx:ASPxPopupControl ID="PupAlert" ClientInstanceName="PupAlert" runat="server" 
        Theme="Glass" Modal="true" ShowShadow="true" PopupHorizontalAlign="WindowCenter"
        PopupVerticalAlign="WindowCenter" AllowDragging="True" Width="400px">
        <HeaderStyle>
            <Paddings PaddingLeft="10px" PaddingRight="6px" PaddingTop="1px" />
        </HeaderStyle>
        <ContentCollection>
            <dx:PopupControlContentControl ID="PopupControlContentControl1" runat="server">
                <div>
                    
                    <table style="width: 100%; text-align:center">
                        <tr>
                            <td>
                                <div runat="server" id="lblMessage" style="font-size: 14px; color: Red;">
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>

    </div>
    </form>
</body>
</html>
