<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="results.aspx.vb" Inherits="VidLib.results" %>


    <%Response.WriteFile("header.html") %>

        <div class="container">
            <div class="main">
                <h1>Rentals matching your search:</h1>

                <!-- display results from the query -->
                <asp:PlaceHolder ID="plhResults" runat="server">

                </asp:PlaceHolder>

            </div>
        </div>
    </body>

    <%Response.WriteFile("footer.html") %>
</html>