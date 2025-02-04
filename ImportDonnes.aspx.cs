﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.OleDb;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ImportDonnes : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    public static DataTable GetDataTableFromExcel(string SourceFilePath)
    {
        string ConnectionString = "Provider=Microsoft.Jet.OLEDB.4.0;" + "Data Source=" + SourceFilePath + ";" + "Extended Properties=Excel 8.0;";

        using (OleDbConnection cn = new OleDbConnection(ConnectionString))
        {
            cn.Open();

            DataTable dbSchema = cn.GetOleDbSchemaTable(OleDbSchemaGuid.Tables, null);
            if (dbSchema == null || dbSchema.Rows.Count < 1)
            {
                throw new Exception("Error: Could not determine the name of the first worksheet.");
            }

            string WorkSheetName = dbSchema.Rows[0]["TABLE_NAME"].ToString();

            OleDbDataAdapter da = new OleDbDataAdapter("SELECT * FROM [" + WorkSheetName + "]", cn);
            DataTable dt = new DataTable(WorkSheetName);

            da.Fill(dt);

            return dt;
        }
    }

}