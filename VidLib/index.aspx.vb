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
        Dim strConn As String = "Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename='|DataDirectory|\dbVideoLibrary.mdf';Integrated Security=True"
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
            MsgBox("Your booking has been accepted. See you soon.",, "St. Georges")
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
End Class