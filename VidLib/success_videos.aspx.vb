Imports System.Data.SqlClient
Public Class success_videos
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
        strBuilder.Append("<th class=""results"">Video Title</th>")
        strBuilder.Append("<th class=""results"">Video Genre</th>")
        strBuilder.Append("<th class=""results"">Year</th>")
        strBuilder.Append("<th class=""results"">Director</th>")

        ' Close table header row
        strBuilder.Append("</tr>")

        ' create new sql statement to select row by matching Id with the one saved in the session ID
        Dim strSQL As String = "SELECT * FROM tblVideos WHERE [Video_Id] = " & Session("BID")
        Dim sqlCmd As New SqlCommand()
        sqlCmd.CommandText = strSQL

        ' Add table data row
        Dim ds As DataSet = QueryDB(sqlCmd)

        ' Loop through rows to display
        ' At the moment, this should only display one record, 
        ' but we may choose to display multiple records at a later date.

        For Each row As DataRow In ds.Tables(0).Rows

            ' Add table row
            strBuilder.Append("<tr class=""results"">")

            ' add data elements
            strBuilder.Append("<td class=""results"">" & row(1) & "</td>") ' col 1 - video title
            strBuilder.Append("<td class=""results"">" & row(2) & "</td>") ' col 2 - video genre
            strBuilder.Append("<td class=""results"">" & row(3) & "</td>") ' col 3 - year
            strBuilder.Append("<td class=""results"">" & row(4) & "</td>") ' col 5 - director


            ' close table data row
            strBuilder.Append("</tr>")
        Next

        ' close table and add to placeholder
        strBuilder.Append("</table>")
        plhVideoDataTable.Controls.Add(New LiteralControl(strBuilder.ToString()))

    End Sub

End Class