<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RemarqClient.aspx.cs" Inherits="RemarqClient" %>

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
         <dx:ASPxFormLayout ID="FormLayoutTypeProjet" ClientInstanceName="FormLayoutTypeProjet" runat="server" ColCount="2" Width="100%">
                <Items>
                    <dx:LayoutGroup Caption="Original Projet" Width="100%" ColCount="2" ColSpan="2">
                        <Items>
                            <dx:LayoutItem Caption="Type" ShowCaption="False" ColumnSpan="1" ColSpan="1" Width="100px" >
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer  Width="90px">
                                        <dx:ASPxTextBox runat="server" ID="TxtRef" ForeColor="Maroon" Height="20px" Font-Bold="true" Width="100%"></dx:ASPxTextBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>

                            <dx:LayoutItem Caption="Type" ShowCaption="False" Width="90%" ColumnSpan="1" ColSpan="1" >
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer Width="100%">

                                             <dx:ASPxTextBox runat="server" ID="TxtDescription" ForeColor="Maroon" Font-Bold="true" Height="20px" Width="100%" ></dx:ASPxTextBox>

                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>

                        </Items>
                    </dx:LayoutGroup>
                    <dx:LayoutGroup Caption="Remarques" Width="100%" ColCount="2" ColSpan="2">
                        <Items>
                            <dx:LayoutItem Caption="Type" ShowCaption="False" ColumnSpan="2" ColSpan="2" >
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer>

                                            <dx:ASPxMemo ID="MemoClient" runat="server"  Height="270px" Width="100%"></dx:ASPxMemo>

                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>

                            

                        </Items>
                    </dx:LayoutGroup>
                    <dx:LayoutGroup ShowCaption="False" Width="100%"  ColCount="2" ColSpan="2">
                        <Items>
                            <dx:LayoutItem Caption="Type" ShowCaption="False" ColumnSpan="2"   ColSpan="2" HorizontalAlign="Right">
                                <LayoutItemNestedControlCollection >
                                    <dx:LayoutItemNestedControlContainer >
                                        <dx:ASPxButton ID="btnValider" ClientInstanceName="btnValider" runat="server"
                                                                            AutoPostBack="False" Text="Fermer" Width="130px" Theme="Glass">
                                                                            <ClientSideEvents Click="function(s, e) {
                                                                               parent.window.popupWind.Hide(); 
                                                                    }
                                                                    
                                                                    " />
                                            </dx:ASPxButton>

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
