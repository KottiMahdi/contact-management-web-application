<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ArchiveManagers.aspx.cs" Inherits="ArchiveManagers" %>
<%@ Register Assembly="DevExpress.Web.v20.1, Version=20.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <script>
        function OnCustomCommand(s, e) {
            switch (e.commandName) {
                case "ChangeView-Thumbnails":
                    FileManager.PerformCallback("Thumbnails");
                    break;
                case "ChangeView-Details":
                    FileManager.PerformCallback("Details");
                    break;

            }
        }
         
         
    </script>
    
    <div style="float: right; width: 100%; height: 650px">
       
        <dx:ASPxFileManager ID="FileManager" ClientInstanceName="FileManager" Height="100%"  OnCustomThumbnail="fileManager_CustomThumbnail"
            runat="server" Theme="Glass">
            <Settings RootFolder="~/Files" ThumbnailFolder="~/Content/FileManager/Thumbnails" AllowedFileExtensions=".Xlsx" />
            <ClientSideEvents CustomCommand="OnCustomCommand" />
            <SettingsEditing AllowDownload="True"></SettingsEditing>
            <SettingsUpload Enabled="false">
            </SettingsUpload>
            <SettingsToolbar>
                <Items>
                    <dx:FileManagerToolbarDownloadButton BeginGroup="false">
                    </dx:FileManagerToolbarDownloadButton>
                    <dx:FileManagerToolbarRefreshButton BeginGroup="false" />

                    <dx:FileManagerToolbarCustomButton Text="Thumbnails View" CommandName="ChangeView-Thumbnails" GroupName="ViewMode">
                        <Image IconID="excel-icon.jpg" />
                    </dx:FileManagerToolbarCustomButton>
                   
                </Items>
            </SettingsToolbar>
            <SettingsContextMenu Enabled="true">
                <Items>
                    <dx:FileManagerToolbarRefreshButton BeginGroup="false">
                    </dx:FileManagerToolbarRefreshButton>
              
                </Items>
            </SettingsContextMenu>
            <Images>
                <File IconID="export_exporttoxls_16x16">
                </File>
            </Images>
        </dx:ASPxFileManager>


    </div>
    </form>
</body>
</html>
