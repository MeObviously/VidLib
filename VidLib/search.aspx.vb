﻿Imports System.Data.SqlClient
Public Class search
    Inherits System.Web.UI.Page

    ''' <summary>
    '''     This sub creates an sql SELECT statement based on user input. It urns the query and adds the results to the
    '''     session obj. The user is redirected to a results page to view the data as an html table.
    ''' </summary>
    ''' <param name="sender"></param>
    ''' <param name="e"></param>
    Protected Sub btnTitleSearch_Click(sender As Object, e As EventArgs) Handles btnTitleSearch.Click

        ' set up query
        Dim strSQL As String = "SELECT * FROM tblBookings WHERE [name] LIKE CONCAT('%',@name,'%')"
        Dim sqlCmd As New SqlCommand()
        sqlCmd.CommandText = strSQL

        ' complete SELECT query with current form values
        sqlCmd.Parameters.AddWithValue("@title", txtTitle.Text)

        ' run query & save resulting dataset in session variable
        Call SetSession(sqlCmd)

    End Sub

    ''' <summary>
    '''     This sub creates an sql SELECT statement based on user input. It urns the query and adds the results to the
    '''     session obj. The user is redirected to a results page to view the data as an html table.
    ''' </summary>
    ''' <param name="sender"></param>
    ''' <param name="e"></param>

    Protected Sub btnGenreSearch_Click(sender As Object, e As EventArgs) Handles btnGenreSearch.Click
        ' set up query
        Dim strSQL As String = "SELECT * FROM tblBookings WHERE [genre] = @genre;"
        Dim sqlCmd As New SqlCommand()
        sqlCmd.CommandText = strSQL

        ' complete SELECT query with current form values
        sqlCmd.Parameters.AddWithValue("@genre", ddlGenre.Text)

        ' run query & save resulting dataset in session variable
        Call SetSession(sqlCmd)
    End Sub

    Protected Sub btnRentalDateSearch_Click(sender As Object, e As EventArgs) Handles btnRentalDateSearch.Click

        ' setup to parse user input into a date that the database will accept
        Dim provider As System.Globalization.CultureInfo = System.Globalization.CultureInfo.InvariantCulture
        Dim dteNewDate As New Date

        'Dim strDate As String = "2020-11-08"
        Dim strDate As String = txtRentalDate.Text

        Dim dteTmp As New Date
        Try
            dteTmp = Date.ParseExact(strDate, "yyyy-MM-dd", provider)

        Catch ex As Exception
            MsgBox("Unable to parse " & strDate)
        End Try

        dteNewDate = Date.ParseExact(txtRentalDate.Text, "yyyy-MM-dd", provider)

        ' set up query completing using parsed date input
        Dim strSQL As String = "SELECT * FROM tblBookings WHERE [Rental_Date] = @rental_date"
        Dim sqlCmd As New SqlCommand(strSQL)

        ' complete SELECT query with current form values
        sqlCmd.Parameters.AddWithValue("@rental_date", txtRentalDate.Text)

        ' run query & save resulting dataset in session variable
        Call SetSession(sqlCmd)

    End Sub

    Protected Sub btnReturnDateSearch_Click(sender As Object, e As EventArgs) Handles btnReturnDateSearch.Click

        ' setup to parse user input into a date that the database will accept
        Dim provider As System.Globalization.CultureInfo = System.Globalization.CultureInfo.InvariantCulture
        Dim dteNewDate As New Date

        'Dim strDate As String = "2020-11-08"
        Dim strDate As String = txtReturnDate.Text

        Dim dteTmp As New Date
        Try
            dteTmp = Date.ParseExact(strDate, "yyyy-MM-dd", provider)

        Catch ex As Exception
            MsgBox("Unable to parse " & strDate)
        End Try

        dteNewDate = Date.ParseExact(txtReturnDate.Text, "yyyy-MM-dd", provider)

        ' set up query completing using parsed date input
        Dim strSQL As String = "SELECT * FROM tblBookings WHERE [Return_Date] = @return_date"
        Dim sqlCmd As New SqlCommand(strSQL)

        ' complete SELECT query with current form values
        sqlCmd.Parameters.AddWithValue("@return_date", txtReturnDate.Text)

        ' run query & save resulting dataset in session variable
        Call SetSession(sqlCmd)

    End Sub

    Protected Sub btnFindOverdues_Click(sender As Object, e As EventArgs) Handles btnFindOverdues.Click
        ' redirect user to feedback page
        Response.Redirect("success.aspx")
    End Sub

    ''' <summary>
    '''     This sub creates an sql SELECT statement based on user input. It urns the query and adds the results to the
    '''     session obj. The user is redirected to a results page to view the data as an html table.
    ''' </summary>
    ''' <param name="sender"></param>
    ''' <param name="e"></param>
    Protected Sub btnTableSearch_Click(sender As Object, e As EventArgs) Handles btnTableSearch.Click
        ' set up query
        Dim strSQL As String = "SELECT * FROM tblBookings WHERE [seats] >= @seats;"
        Dim sqlCmd As New SqlCommand(strSQL)

        ' complete SELECT query with current form values
        sqlCmd.Parameters.AddWithValue("@seats", "4")

        ' run query & save resulting dataset in session variable
        Call SetSession(sqlCmd)
    End Sub
    Private Sub SetSession(sqlCmd As SqlCommand)
        ' run query
        Dim ds As DataSet = QueryDB(sqlCmd)

        ' set session object and redirect to display results
        Session("results") = ds
        Response.Redirect("results.aspx")
    End Sub
End Class