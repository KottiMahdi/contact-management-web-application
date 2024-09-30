<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Pagehomes.aspx.cs" Inherits="Pagehomes" %>

<%@ Register Assembly="DevExpress.Dashboard.v20.1.Web.WebForms, Version=20.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.DashboardWeb" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>

    <form id="form1" runat="server">
    <div>
       <dx:ASPxDashboard ID="Dashboard" Width="100%"  Height="700px"  WorkingMode="ViewerOnly"   runat="server" ></dx:ASPxDashboard>
    </div>
    </form>
</body>
</html>
