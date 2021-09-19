Imports System.Data.SqlClient
Imports System.Configuration
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
    Private Sub InsertRecord()

        ' Collect data
        Dim strName As String = txtName.Text
        Dim strPhone As String = txtPhone.Text
        Dim strEmail As String = txtEmail.Text
        Dim intGuests As Integer = txtGuests.Text
        Dim strCategory As String = ddlCategory.Text
        Dim strTime As String = ddlTime.Text

        ' date need special handling to get into a format that can be inserted into the database
        ' setup to parse user input into a date that the database will accept
        Dim provider As System.Globalization.CultureInfo = System.Globalization.CultureInfo.InvariantCulture
        Dim dteNewDate As New Date()

        dteNewDate = Date.ParseExact(txtDate.Text, "dd/MM/yyyy", provider)

        ' Insert new record

        ' only put partial SQL statement to avoid SQL Injection (security hack risk)
        Dim strSQL As String = "INSERT INTO tblBookings "
        strSQL &= "([Name], [Time], [Date], [Seats], [Phone], [Email], [Category])"
        strSQL &= " VALUES "
        strSQL &= "(@name, @time, @date, @seats, @phone, @email, @category)"
        Dim sqlCmd As SqlCommand
        Dim sqlConn As New SqlConnection(strConn)

        Try

            ' Open connection
            sqlConn.Open()
            sqlCmd = New SqlCommand(strSQL, sqlConn)

            ' complete INSERT query with current form values

            With sqlCmd.Parameters
                .AddWithValue("@name", strName)
                .AddWithValue("@time", strTime)
                .AddWithValue("@date", dteNewDate)
                .AddWithValue("@seats", intGuests)
                .AddWithValue("@phone", strPhone)
                .AddWithValue("@email", strEmail)
                .AddWithValue("@category", strCategory)
            End With

            ' execute query
            sqlCmd.ExecuteNonQuery()

            ' success message for user
            ' MsgBox("Your booking has been accepted. See you soon.",, "St. Georges")
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

        ' record ID of newly inserted row so that can use to display in feedback page
        Call SetSessionID(strName, strTime, dteNewDate, intGuests, strPhone, strEmail, strCategory)

        ' redirect user to feedback page
        Response.Redirect("success.aspx")

    End Sub

    ''' <summary>
    '''     Resets the booking form by clearing all relevant form objects.
    ''' </summary>
    Private Sub ClearForm()

        ' Clear relevant form objects
        txtName.Text = ""
        txtPhone.Text = ""
        txtEmail.Text = ""
        txtGuests.Text = ""
        txtDate.Text = ""
        ' to reset for validation purposes
        ddlCategory.Text = "--Choose--"
        ddlTime.Text = "--Choose--"

    End Sub

    Private Sub SetSessionID(strName As String, strTime As String, dteNewDate As Date, intGuests As Integer, strPhone As String, strEmail As String, strCategory As String)

        ' create new sql statement to select Id by matching the other field attributes
        ' note - no uniqueness checking in database so may match more than one row
        ' will return first found

        Dim strSQL As String = "SELECT Id FROM tblBookings "
        strSQL &= "WHERE [Name] = @name "
        strSQL &= "And [Time] = @time "
        strSQL &= "And [Date] = @date "
        strSQL &= "And [Seats] = @seats "
        strSQL &= "And [Phone] = @phone "
        strSQL &= "And [Email] = @email "
        strSQL &= "And [Category] = @category"

        ' Objects for communication with db
        Dim sqlCmd As New SqlCommand()

        ' complete INSERT query with current form values

        With sqlCmd.Parameters
            .AddWithValue("@name", strName)
            .AddWithValue("@time", strTime)
            .AddWithValue("@date", dteNewDate)
            .AddWithValue("@seats", intGuests)
            .AddWithValue("@phone", strPhone)
            .AddWithValue("@email", strEmail)
            .AddWithValue("@category", strCategory)
        End With

        ' needs to happen after parameter expansion
        sqlCmd.CommandText = strSQL

        ' execute SQL to return required dataset with ID of matching row
        Dim ds As DataSet = QueryDB(sqlCmd)

        ' check if a row has been returned.
        If ds.Tables(0).Rows.Count > 0 Then
            Dim intID As Integer = ds.Tables(0).Rows(0).Item(0)

            ' set Session object
            Session("BID") = intID
        End If

    End Sub

End Class