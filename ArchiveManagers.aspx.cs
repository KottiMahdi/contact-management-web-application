using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;

public partial class ArchiveManagers : System.Web.UI.Page
{
    private Dictionary<string, string> extensionsDisplayName_Renamed;




    protected void fileManager_CustomThumbnail(object source, DevExpress.Web.FileManagerThumbnailCreateEventArgs e)
    {
        //switch (((FileManagerFile)e.File).Extension)
        //{
        //    case ".doc":
        //        {
        //            e.ThumbnailImage.Url = "~/Image/doc.png";
        //            break;
        //        }

        //    case ".txt":
        //        {
        //            e.ThumbnailImage.Url = "~/Image/txt.png";
        //            break;
        //        }

        //    case ".pdf":
        //        {
        //            e.ThumbnailImage.Url = "~/Image/pdf.png";
        //            break;
        //        }

        //    case ".xlsx":
        //        {
        //            e.ThumbnailImage.Url = "~/Image/excel-icon.jpg";
        //            break;
        //        }
        //}
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        FileManager.SettingsFileList.View = CurrentView;
        bool isDetailsView = CurrentView.Equals(FileListView.Details);
        SetFileManagerToolbarItemCheckedState("ChangeView-Thumbnails", isDetailsView);
        SetFileManagerToolbarItemCheckedState("ChangeView-Details", isDetailsView);
    }



    private FileListView CurrentView
    {
        get
        {
            var view = Session["View"];
            return view == null ? FileListView.Thumbnails : (FileListView)Session["View"];
        }
        set
        {
            FileManager.SettingsFileList.View = value;
            Session["View"] = value;
        }
    }


    protected void ASPxFileManager_CustomCallback(object source, CallbackEventArgsBase e)
    {
        CurrentView = (FileListView)System.Enum.Parse(typeof(FileListView), e.Parameter.ToString());
    }


    private void SetFileManagerToolbarItemCheckedState(string commandName, bool checkedState)
    {
        //var item = FileManager.SettingsToolbar.Items.FindByCommandName(commandName);
        //item as FileManagerToolbarCustomButton= checkedState;
    }


    protected void FileManager_CustomCallback(object source, CallbackEventArgsBase e)
    {
        CurrentView = (FileListView)System.Enum.Parse(typeof(FileListView), e.Parameter.ToString());
    }
}