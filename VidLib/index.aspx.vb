Imports System.Data.SqlClient
Public Class index
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    ''' <summary>
    '''     runs when user clicks submit button
    ''' </summary>
    ''' <param name="sender"></param>
    ''' <param name="e"></param>
    ''' <see> InsertRecord subroutine </see>
    Protected Sub btnSubmit_Click(sender As Object, e As EventArgs) Handles btnSubmit.Click
        Call InsertRecord()
    End Sub

    ''' <summary>
    '''     Once submitted, it is assumed that the data has been validated
    '''     This subroutine collects user input and inserts a new booking into the local database file
    '''     It then calls ClearForm to reset the form
    ''' </summary>
    ''' <see>ClearForm subroutine</see>
    ''' 
    Private Sub InsertRecord()

        ' Collect data
        Dim strName As String = txtName.Text
        Dim strPhone As String = txtPhone.Text
        Dim strEmail As String = txtEmail.Text
        Dim intRentalDays As Integer = ddlRentalDays.Text
        Dim strTitle As String = ddlTitle.Text
        Dim strGenre As String = ddlGenre.Text

        ' date need special handling to get into a format that can be inserted into the database
        ' setup to parse user input into a date that the database will accept
        Dim provider As System.Globalization.CultureInfo = System.Globalization.CultureInfo.InvariantCulture
        Dim dteNewRentalDate As New Date()

        dteNewRentalDate = Date.ParseExact(txtRentalDate.Text, "dd/MM/yyyy", provider)

        ' insert new record

        ' only put partial SQL statement to avoid SQL Injection (security hack risk)
        Dim strSQL As String = "INSERT INTO tblRentals ([Name], [Phone], [Email], [Rental_Date], [Rental_Days], [Return_Date], [Title], [Genre]) VALUES ("
        strSQL &= "@name, @phone, @email, @rental_date, @rental_days, DATEADD(day, @rental_days, @rental_date), @title, @genre)"
        Dim sqlCmd As SqlCommand
        Dim sqlConn As New SqlConnection(strConn)

        Try
            ' Open connection
            sqlConn.Open()
            sqlCmd = New SqlCommand(strSQL, sqlConn)

            ' complete INSERT query with current form values

            With sqlCmd.Parameters
                .AddWithValue("@name", strName)
                .AddWithValue("@phone", strPhone)
                .AddWithValue("@email", strEmail)
                .AddWithValue("@rental_date", dteNewRentalDate)
                .AddWithValue("@rental_days", intRentalDays)
                .AddWithValue("@title", strTitle)
                .AddWithValue("@genre", strGenre)
            End With

            ' execute query
            sqlCmd.ExecuteNonQuery()

            ' success message for user
            MsgBox("Your video has been booked. See you soon.",, "Bob The Video Guy")

            ' additional visual cue to user that things have worked successfully
            Call ClearForm()


        Catch ex As Exception

            ' Failure message for user
            MsgBox("An error occurred while processing your request.",, "Processing Error")

        Finally
            ' always close any open connections (regardless of whether exception or not)
            If sqlConn.State = ConnectionState.Open Then
                sqlConn.Close()
            End If

        End Try
        Call SetSessionID(strName, strPhone, strEmail, dteNewRentalDate, intRentalDays, strTitle, strGenre)

        ' redirect user to feedback page
        'Response.Redirect("success.aspx")

    End Sub

    ''' <summary>
    '''     Resets the booking form by clearing all relevant form objects.
    ''' </summary>
    Private Sub ClearForm()

        ' Clear relevant form objects
        txtName.Text = ""
        txtPhone.Text = ""
        txtEmail.Text = ""
        txtRentalDate.Text = ""
        ' to reset for validation purposes
        ddlRentalDays.Text = "--Choose--"
        ddlTitle.Text = "--Choose--"
        ddlGenre.Text = "--Choose--"

    End Sub
    ''' <summary>
    '''     Uses user input to retrieve the ID of the latest record saved to the db. It then
    '''     adds the ID to the session object for use on the success page.
    ''' </summary>
    ''' <param name="= 'strName"> Name from the form </param>
    ''' <param name="= 'strPhone"> phone number from the form </param>
    ''' <param name="= 'strEmail"> e-mail from the form </param>
    ''' <param name="= 'dteRentalDate"> Rental date from the form </param>
    ''' <param name="= 'intRentalDays"> Rental days from the form </param>
    ''' <param name="= 'strTitle"> title from the form </param>
    ''' <param name="= 'strGenre"> genre from the form </param>
    ''' 
    Private Sub SetSessionID(strName As String, strPhone As String, strEmail As String, dteRentalDate As Date, intRentalDays As Integer, strTitle As String, strGenre As String)

        ' create new sql statement to select Id by matching the other field attributes
        ' note - no uniqueness checking in database so may match more than one row
        ' will return first found

        Dim strSQL As String = "SELECT Rental_Id FROM tblRentals "
        strSQL &= "WHERE [Name] = @name "
        strSQL &= "And [Phone] = @phone "
        strSQL &= "And [Email] = @email "
        strSQL &= "And [Rental_Date] = @rental_date "
        strSQL &= "And [Rental_Days] = @rental_days "
        strSQL &= "And [Title] = @title "
        strSQL &= "And [Genre] = @genre"

        ' Objects for communication with db
        Dim sqlCmd As New SqlCommand()

        ' complete SELECT query with current form values
        With sqlCmd.Parameters
            .AddWithValue("@name", strName)
            .AddWithValue("@phone", strPhone)
            .AddWithValue("@email", strEmail)
            .AddWithValue("@rental_date", dteRentalDate)
            .AddWithValue("@rental_days", intRentalDays)
            .AddWithValue("@title", strTitle)
            .AddWithValue("@genre", strGenre)
        End With

        ' needs to happen after parameter expansion
        sqlCmd.CommandText = strSQL

        ' execute SQL to return required dataset with ID of matching row
        Dim ds As DataSet = QueryDB(sqlCmd)

        ' check if a row has been returned
        If ds.Tables(0).Rows.Count > 0 Then
            Dim intID As Integer = ds.Tables(0).Rows(0).Item(0)

            ' Set session object
            Session("BID") = intID
        End If

    End Sub
End Class