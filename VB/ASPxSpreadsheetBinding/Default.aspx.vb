Imports System
Imports System.Data
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports DevExpress.Spreadsheet
Imports DevExpress.Web.Office

Namespace ASPxSpreadsheetSample
    Partial Public Class [Default]
        Inherits System.Web.UI.Page

        Protected Sub OnSpreadsheetCallback(ByVal sender As Object, ByVal e As DevExpress.Web.CallbackEventArgsBase)
            Dim activeWorksheet As Worksheet = spreadsheet.Document.Worksheets.ActiveWorksheet
            activeWorksheet.SelectedCell.SetValueFromText(e.Parameter)
        End Sub
    End Class
End Namespace