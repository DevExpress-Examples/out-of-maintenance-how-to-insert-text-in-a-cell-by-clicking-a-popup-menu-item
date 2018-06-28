# ASPxSpreadsheet - How to insert text in a cell by clicking a custom popup menu item on a callback

Follow the steps below to accomplish this task.

<p>1. Handle the client-side <strong><a href="https://documentation.devexpress.com/AspNet/DevExpress.Web.ASPxSpreadsheet.SpreadsheetClientSideEvents.PopupMenuShowing.property">PopupMenuShowing</a></strong> event to add a custom item to a cell's popup menu.</p>

```aspx
<ClientSideEvents PopupMenuShowing="onPopupMenuShowing" CustomCommandExecuted="onCustomCommandExecuted" />
```

```js
var insertInCellCommand = { name: "InsertInCell", text: "Insert text in this cell" };
function onPopupMenuShowing(s, e) {
	if (e.menuType === ASPxClientSpreadsheetPopupMenuType.Cell
		&& isSingleCellSelected(spreadsheet.GetSelection())) {
		e.menuItems.Clear();
		addCustomMenuItem(e.menuItems, insertInCellCommand);
	}
}
```

<p>2. Handle the client-side <strong><a href="https://documentation.devexpress.com/AspNet/DevExpress.Web.ASPxSpreadsheet.SpreadsheetClientSideEvents.CustomCommandExecuted.property">CustomCommandExecuted</a></strong> event and implement logic that will invoke <strong><a href="https://documentation.devexpress.com/AspNet/DevExpress.Web.ASPxSpreadsheet.Scripts.ASPxClientSpreadsheet.PerformCallback.method(zXTuZg)">ASPxClientSpreadsheet.PerformCallback()</a></strong> to forward your custom text to the server as a callback parameter.

```aspx
<ClientSideEvents CustomCommandExecuted="onCustomCommandExecuted" />
```

```js
function onCustomCommandExecuted(s, e) {
	if (e.commandName === insertInCellCommand.name) {
		spreadsheet.PerformCallback('text to insert');
	}
}
```

<p>3. On the server side, handle the <strong><a href="https://documentation.devexpress.com/AspNet/DevExpress.Web.ASPxSpreadsheet.ASPxSpreadsheet.Callback.event">ASPxSpreadsheet.Callback</a></strong> event and put the text forwarded to PerformCallback into the active document's selected cell.</p>

```cs
protected void OnSpreadsheetCallback(object sender, DevExpress.Web.CallbackEventArgsBase e)
{
	Worksheet activeWorksheet = spreadsheet.Document.Worksheets.ActiveWorksheet;
	activeWorksheet.SelectedCell.SetValueFromText(e.Parameter);
}
```