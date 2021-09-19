Imports System.Data.SqlClient
Module Globals
    Public strConn As String = "Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename='|DataDirectory|\dbRestaurantBookings.mdf';Integrated Security=True"

    ''' <summary>
    '''     Queries the database for data related to recent booking made by the user.
    ''' </summary>
    ''' <returns> A dataset containing booking data </returns>
    Public Function QueryDB(sqlCmd As SqlCommand) As DataSet
        ' sqlCommand must be created in calling function
        'as it is the one using the dataset 

        ' Objects for communication with db

        Dim sqlConn As New SqlConnection(strConn)
        sqlCmd.Connection = sqlConn
        Dim sqlDA As New SqlDataAdapter
        Dim ds As New DataSet

        Try
            ' Open connection
            sqlConn.Open()

            ' run query and fill dataset
            sqlDA.SelectCommand = sqlCmd
            sqlDA.Fill(ds)

        Catch ex As Exception
            ' Failure message for user
            MsgBox("An error occurred while processing your request.",, "Processing Error")

        Finally

            ' Tidy up resources
            sqlDA.Dispose()
            ds.Dispose()

            ' check connection status and close if required
            If sqlConn.State = ConnectionState.Open Then
                sqlConn.Close()
            End If

        End Try

        ' return retrieved data row in a dataset
        Return ds

    End Function

End Module

