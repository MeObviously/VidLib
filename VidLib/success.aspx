<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="success.aspx.vb" Inherits="VidLib.success" %>

      <%Response.WriteFile("header.html") %>

        <div class="container">
            <div class="main">
                <h1>Congratulations</h1>

                <p>
                    You have made a booking. We look forward to seeing you soon.
                </p>

                <asp:PlaceHolder ID="plhDataTable" runat="server"></asp:PlaceHolder>

            </div>
        </div>
    </body>

    <%Response.WriteFile("footer.html") %>

</html>