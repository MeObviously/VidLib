<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="index.aspx.vb" Inherits="VidLib.index" %>

<!-- Header & Navigation  -->

    <%Response.WriteFile("header.html") %>

    <!-- Navigation ends above -->

    <!-- Main content div starts below -->
    <div class="container">
        <div class="main">

            <h1>Booking Form</h1>
            <!-- Instructons -->
            <p>Fields marked with an <sup>*</sup> are required</p>
            <!-- Booking form start -->

            <form id="frmMain" runat="server">
                <asp:Panel ID="pnlBookingForm" runat="server" BackColor="#E0E8F9">

                    <!-- Name -->
                    <p>
                        Name<sup>*</sup>:<br />
                        <asp:TextBox ID="txtName" runat="server" Width="135px"></asp:TextBox>
                    </p>

                    <!-- Phone -->
                    <p>
                        Phone<sup>*</sup>:<br />
                        <asp:TextBox ID="txtPhone" runat="server" Width="135px"></asp:TextBox>
                    </p>

                    <!-- Email -->
                    <p>
                        Email<sup>*</sup><br />
                        <asp:TextBox ID="txtEmail" runat="server" Width="135px"></asp:TextBox>
                    </p>

                    <!-- Number of guests -->
                    <p>
                        No. Guests<sup>*</sup> :<asp:TextBox ID="txtGuests" runat="server" Width="50px"></asp:TextBox>
                    </p>

                    <!-- Date of booking -->
                    <p>
                        Date(dd/mm/yyyy)<sup>*</sup>:<br />
                        <asp:TextBox ID="txtDate" runat="server" Width="135px"></asp:TextBox>
                    </p>

                    <!-- Time dropdown -->
                    <p>
                        Time<sup>*</sup>:
                        <asp:DropDownList ID="ddlTime" runat="server" Height="25px" ToolTip="Choose a time" Width="92px">
                            <asp:ListItem Value="--Choose--">--Choose--</asp:ListItem>
                            <asp:ListItem>17:00</asp:ListItem>
                            <asp:ListItem>17:30</asp:ListItem>
                            <asp:ListItem>18:00</asp:ListItem>
                            <asp:ListItem>18:30</asp:ListItem>
                            <asp:ListItem>19:00</asp:ListItem>
                            <asp:ListItem>19:30</asp:ListItem>
                            <asp:ListItem>20:00</asp:ListItem>
                            <asp:ListItem>20:30</asp:ListItem>
                            <asp:ListItem>21:00</asp:ListItem>
                            <asp:ListItem>21:30</asp:ListItem>
                            <asp:ListItem>22:00</asp:ListItem>
                        </asp:DropDownList>
                    </p>

                    <!-- Type of customer dropdown -->

                    <p>
                        Type:
                        <asp:DropDownList ID="ddlCategory" runat="server" Height="25px" ToolTip="Choose a customer type" Width="95px">
                            <asp:ListItem Value="--Choose--">--Choose--</asp:ListItem>
                            <asp:ListItem>VIP</asp:ListItem>
                            <asp:ListItem>Regular</asp:ListItem>
                            <asp:ListItem>Casual</asp:ListItem>
                        </asp:DropDownList>

                    </p>

                    <!-- <asp:Button ID="Button1" runat="server" CausesValidation="true" Text="Submit" Width="70px" /> -->
                    <asp:Button ID="btnSubmit" runat="server" Text="Submit" Width="70px" />
                    <br />
                    <br />
                </asp:Panel>

            </form>
            <!-- End booking form -->

        </div>
        <!-- Main content end  -->

    </div>
    <!-- container (around main div) end-->

    <!-- Footer starts below -->

    <%Response.WriteFile("footer.html") %>

    <!-- Footer ends above -->


    <!-- Link to JavaScipt plugins, needed for things like the dropdown menu to work.  BOTH files are required. -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

    <script src="js/bootstrap.min.js"></script>

</body>
</html>
