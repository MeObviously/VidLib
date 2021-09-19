Imports System.Data.SqlClient
Public Class success
    Inherits System.Web.UI.Page

    ''' <summary>
    '''     Queries database for recently inserted record from indiex page based on Session("BID")
    '''     It then creates a table using a StringBuilder obj to display the data in a placeholder obk
    '''     on the success.aspx page.
    ''' </summary>
    ''' <param name="sender"></param>
    ''' <param name="e"></param>
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        ' StringBulder to create table
        Dim strBuilder As StringBuilder = New StringBuilder()

        ' Create table
        strBuilder.Append("<table class=""results"">")

        ' Add table header row
        strBuilder.Append("<tr class=""results"">")
        strBuilder.Append("<th class=""results"">Name</th>")
        strBuilder.Append("<th class=""results"">Phone</th>")
        strBuilder.Append("<th class=""results"">Email</th>")
        strBuilder.Append("<th class=""results"">Rental Date</th>")
        strBuilder.Append("<th class=""results"">Days</th>")
        strBuilder.Append("<th class=""results"">Return Date</th>")
        strBuilder.Append("<th class=""results"">Title</th>")
        strBuilder.Append("<th class=""results"">Genre</th>")

        ' Close table header row
        strBuilder.Append("</tr>")

        ' create new sql statement to select row by matching Id with the one saved in the session ID
        Dim strSQL As String = "SELECT * FROM tblRentals WHERE [Rental_Id] = " & Session("BID")
        Dim sqlCmd As New SqlCommand()
        sqlCmd.CommandText = strSQL

        ' Add table data row
        Dim ds As DataSet = QueryDB(sqlCmd)

        ' Loop through rows to display
        ' At the moment, this should only display one record, 
        ' but we may choose to display multiple records at a later date.

        For Each row As DataRow In ds.Tables(0).Rows

            ' these are for formatting times and dates
            Dim strDateFormat As String = "ddd MMM d, yyyy"
            Dim dteRentalDate As Date = Date.Parse(row(4).ToString)
            Dim dteReturnDate As Date = Date.Parse(row(6).ToString)

            ' Add table row
            strBuilder.Append("<tr class=""results"">")

            ' add data elements
            strBuilder.Append("<td class=""results"">" & row(1) & "</td>") ' col 1 - name
            strBuilder.Append("<td class=""results"">" & row(2) & "</td>") ' col 2 - phone
            strBuilder.Append("<td class=""results"">" & row(3) & "</td>") ' col 3 - email
            strBuilder.Append("<td class=""results"">" & dteRentalDate.ToString(strDateFormat) & "</td>") ' - rental date
            strBuilder.Append("<td class=""results"">" & row(5) & "</td>") ' col 5 - rental days
            strBuilder.Append("<td class=""results"">" & dteReturnDate.ToString(strDateFormat) & "</td>") ' - return date
            strBuilder.Append("<td class=""results"">" & row(7) & "</td>") ' col 7 - title
            strBuilder.Append("<td class=""results"">" & row(8) & "</td>") ' col 8 - genre

            ' close table data row
            strBuilder.Append("</tr>")
        Next

        ' close table and add to placeholder
        strBuilder.Append("</table>")
        plhDataTable.Controls.Add(New LiteralControl(strBuilder.ToString()))

    End Sub

End Class