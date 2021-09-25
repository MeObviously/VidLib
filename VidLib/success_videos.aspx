<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="success_videos.aspx.vb" Inherits="VidLib.success_videos" %>

      <%Response.WriteFile("header.html") %>

        <div class="container">
            <div class="main">
                <h1>Congratulations</h1>

                <p>
                    You have added this video to our library.
                </p>

                <asp:PlaceHolder ID="plhVideoDataTable" runat="server"></asp:PlaceHolder>

            </div>
        </div>
    </body>

    <%Response.WriteFile("footer.html") %>

</html>