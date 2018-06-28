using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Spreadsheet;
using DevExpress.Web.Office;

namespace ASPxSpreadsheetSample {
    public partial class Default : System.Web.UI.Page
    {
        protected void OnSpreadsheetCallback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            Worksheet activeWorksheet = spreadsheet.Document.Worksheets.ActiveWorksheet;
            activeWorksheet.SelectedCell.SetValueFromText(e.Parameter);
        }
    }
}