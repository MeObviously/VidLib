Public Class results
    Inherits System.Web.UI.Page
    ''' <summary>
    '''     On load, this sub retrieves a DataSet from the session object 
    '''     and then calls DisplayTable passing in ds.
    ''' </summary>
    ''' <param name="sender"></param>
    ''' <param name="e"></param>
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        ' retrieve dataset holding query results from session object
        Dim ds As DataSet = Session("results")

        Call DisplayTable(ds)
    End Sub
    ''' <summary>
    '''     Displays results of DataSet created on search page
    ''' </summary>
    ''' <param name="ds"> DataSet object for display </param>
    Private Sub DisplayTable(ds As DataSet)

        ' StringBulder to create table
        Dim strBuilder As StringBuilder = New StringBuilder()

        ' check count of records in ds
        If ds.Tables.Count = 0 Or ds.Tables(0).Rows.Count < 1 Then
            strBuilder.Append("<p>There are no records associated with that search value.</p>")
        Else
            ' assemble HTML for table to insert into placeholder in aspx page

            ' Create table
            strBuilder.Append("<table class=""results"">")

            ' Add table header row
            strBuilder.Append("<tr class=""results"">")
            strBuilder.Append("<th class=""results"">Name</th>")
            strBuilder.Append("<th class=""results"">Time</th>")
            strBuilder.Append("<th class=""results"">Date</th>")
            strBuilder.Append("<th class=""results"">Seats</th>")
            strBuilder.Append("<th class=""results"">Phone</th>")
            strBuilder.Append("<th class=""results"">Email</th>")
            strBuilder.Append("<th class=""results"">Category</th>")

            ' Close table header row
            strBuilder.Append("</tr>")

            ' Loop through rows to display
            ' At the moment, this should only display one record, 
            ' but we may choose to display multiple records at a later date.

            For Each row As DataRow In ds.Tables(0).Rows

                ' these are for formatting times and dates
                Dim strHours As String = row(2).ToString.Substring(0, 2)
                Dim strMins As String = row(2).ToString.Substring(3, 2)
                Dim strDateFormat As String = "ddd MMM d, yyyy"
                Dim dteDate As Date = Date.Parse(row(3).ToString)


                ' Add table row
                strBuilder.Append("<tr class=""results"">")

                ' add data elements

                strBuilder.Append("<td class=""results"">" & row(1) & "</td>") ' col 1 - name
                strBuilder.Append("<td class=""results"">" & strHours & ":" & strMins & "</td>") ' - time
                strBuilder.Append("<td class=""results"">" & dteDate.ToString(strDateFormat) & "</td>") ' - date
                strBuilder.Append("<td class=""results"">" & row(4) & "</td>") ' col 4 - seats
                strBuilder.Append("<td class=""results"">" & row(5) & "</td>") ' col 5 - phone
                strBuilder.Append("<td class=""results"">" & row(6) & "</td>") ' col 6 - email
                strBuilder.Append("<td class=""results"">" & row(7) & "</td>") ' col 7 - category

                ' close table data row
                strBuilder.Append("</tr>")
            Next

            ' close table
            strBuilder.Append("</table>")

        End If

        ' link to return to search
        strBuilder.Append("<br /><a href=""search.aspx"">Return to search</a>")

        ' show table in placeholder
        plhResults.Controls.Add(New LiteralControl(strBuilder.ToString()))

    End Sub
End Class