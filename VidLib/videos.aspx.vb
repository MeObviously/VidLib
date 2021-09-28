Imports System.Data.SqlClient
Public Class videos
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    ''' <summary>
    '''     runs when user clicks submit button
    ''' </summary>
    ''' <param name="sender"></param>
    ''' <param name="e"></param>
    ''' <see> InsertRecord subroutine </see>

    Protected Sub btnAddVideo_Click(sender As Object, e As EventArgs) Handles btnAddVideo.Click
        Call InsertVideo()
    End Sub
    ''' <summary>
    '''     Once submitted, it is assumed that the data has been validated
    '''     This subroutine collects user input and inserts a new booking into the local database file
    '''     It then calls ClearForm to reset the form
    ''' </summary>
    ''' <see>ClearForm subroutine</see>
    ''' 
    Private Sub InsertVideo()

        ' Collect data
        Dim strVideoTitle As String = txtVideoTitle.Text
        Dim strVideoGenre As String = ddlVideoGenre.Text
        Dim strYear As String = intYear.Text
        Dim strDirector As String = txtDirector.Text

        ' insert new record

        ' only put partial SQL statement to avoid SQL Injection (security hack risk)
        Dim strSQL As String = "INSERT INTO tblVideos ([Video_Title], [Video_Genre], [Year], [Director]) VALUES ("
        strSQL &= "@video_title, @video_genre, @year, @director)"
        Dim sqlCmd As SqlCommand
        Dim sqlConn As New SqlConnection(strConn)

        Try
            ' Open connection
            sqlConn.Open()
            sqlCmd = New SqlCommand(strSQL, sqlConn)

            ' complete INSERT query with current form values

            With sqlCmd.Parameters
                .AddWithValue("@video_title", strVideoTitle)
                .AddWithValue("@video_genre", strVideoGenre)
                .AddWithValue("@year", strYear)
                .AddWithValue("@director", strDirector)
            End With

            ' execute query
            sqlCmd.ExecuteNonQuery()

            ' success message for user
            'MsgBox("Your video has been added. See you soon.",, "Bob The Video Guy")

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
        Call SetSessionID(strVideoTitle, strVideoGenre, strYear, strDirector)

        ' redirect user to feedback page
        Response.Redirect("success_videos.aspx")

    End Sub

    '''' <summary>
    ''''     Resets the booking form by clearing all relevant form objects.
    '''' </summary>
    Private Sub ClearForm()

        ' Clear relevant form objects
        txtVideoTitle.Text = "--Choose--"
        ddlVideoGenre.Text = "--Choose--"
        intYear.Text = ""
        txtDirector.Text = ""

    End Sub
    '''' <summary>
    ''''     Uses user input to retrieve the ID of the latest record saved to the db. It then
    ''''     adds the ID to the session object for use on the success page.
    '''' </summary>
    '''' <param name="= 'strName"> Name from the form </param>
    '''' <param name="= 'strPhone"> phone number from the form </param>
    '''' <param name="= 'strEmail"> e-mail from the form </param>
    '''' <param name="= 'dteRentalDate"> Rental date from the form </param>
    '''' <param name="= 'intRentalDays"> Rental days from the form </param>
    '''' <param name="= 'strTitle"> title from the form </param>
    '''' <param name="= 'strGenre"> genre from the form </param>
    '''' 
    Private Sub SetSessionID(strVideoTitle As String, strVideoGenre As String, strYear As String, strDirector As String)

        ' create new sql statement to select Id by matching the other field attributes
        ' note - no uniqueness checking in database so may match more than one row
        ' will return first found

        Dim strSQL As String = "SELECT Video_Id FROM tblVideos "
        strSQL &= "WHERE [Video_Title] = @video_title "
        strSQL &= "And [Video_Genre] = @video_genre "
        strSQL &= "And [Year] = @year "
        strSQL &= "And [Director] = @director "

        ' Objects for communication with db
        Dim sqlCmd As New SqlCommand()

        ' complete SELECT query with current form values
        With sqlCmd.Parameters
            .AddWithValue("@video_title", strVideoTitle)
            .AddWithValue("@video_genre", strVideoGenre)
            .AddWithValue("@year", strYear)
            .AddWithValue("@director", strDirector)
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