<%@ Page Language="vb" AutoEventWireup="true" CodeBehind="Default.aspx.vb" Inherits="ASPxSpreadsheetSample.Default" %>

<%@ Register Assembly="DevExpress.Web.v17.1, Version=17.1.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxSpreadsheet.v17.1, Version=17.1.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxSpreadsheet" TagPrefix="dx" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script>
        var textToInsert = "Sample Text";
        var insertInCellCommand = { name: "InsertInCell", text: "Insert text in this cell" };
        function isSingleCellSelected(selection) {
            return selection.leftColumnIndex === selection.rightColumnIndex
                && selection.topRowIndex === selection.bottomRowIndex;
        }
        function addCustomMenuItem(menuItems, command) {
            var item = new ASPxClientSpreadsheetPopupMenuItem(command.name, command.text, null, null);
            menuItems.Add(item);
        }
        function onPopupMenuShowing(s, e) {
            if (e.menuType === ASPxClientSpreadsheetPopupMenuType.Cell
                && isSingleCellSelected(spreadsheet.GetSelection())) {
                e.menuItems.Clear();
                addCustomMenuItem(e.menuItems, insertInCellCommand);
            }
        }
        function onCustomCommandExecuted(s, e) {
            if (e.commandName === insertInCellCommand.name) {
                spreadsheet.PerformCallback(textToInsert);
            }
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <dx:ASPxSpreadsheet ID="spreadsheet" runat="server" Width="100%" 
            Settings-Behavior-CreateNew="Disabled" Settings-Behavior-Open="Disabled" 
            Settings-Behavior-SaveAs="Disabled" Settings-Behavior-Save="Disabled"
            ClientInstanceName="spreadsheet" OnCallback="OnSpreadsheetCallback">
            <ClientSideEvents PopupMenuShowing="onPopupMenuShowing"
                CustomCommandExecuted="onCustomCommandExecuted" />
        </dx:ASPxSpreadsheet>
    </form>
</body>
</html>