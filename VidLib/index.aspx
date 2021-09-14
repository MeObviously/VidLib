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
                         <!-- enforce mandatory field entry -->
                        <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtName" Display="Dynamic" ErrorMessage="Error">A name is required.</asp:RequiredFieldValidator>
                        <!-- enforce correct format (no numbers) -->
                                <asp:RegularExpressionValidator ID="revName" runat="server" ControlToValidate="txtName" Display="Dynamic" ErrorMessage="Error" ValidationExpression="^[A-Z a-z]*$">Name cannot contain numbers.</asp:RegularExpressionValidator>
                    </p>

                    <!-- Phone -->
                    <p>
                        Phone<sup>*</sup>:<br />
                        <asp:TextBox ID="txtPhone" runat="server" Width="135px"></asp:TextBox>
                        <!-- enforce mandatory field entry -->
                        <asp:RequiredFieldValidator ID="rfvPhone" runat="server" ControlToValidate="txtPhone" Display="Dynamic" ErrorMessage="Error">A phone number is required.</asp:RequiredFieldValidator>
                        <!-- enforce correct format -->
                        <asp:RegularExpressionValidator ID="revPhone" runat="server" ControlToValidate="txtPhone" Display="Dynamic" ErrorMessage="Error" ValidationExpression="^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$">A valid phone number is required.</asp:RegularExpressionValidator>

                    </p>

                    <!-- Email -->
                    <p>
                        Email<sup>*</sup><br />
                        <asp:TextBox ID="txtEmail" runat="server" Width="135px"></asp:TextBox>
                         <!-- enforce mandatory field entry -->
                        <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" Display="Dynamic" ErrorMessage="Error">An email address is required.</asp:RequiredFieldValidator>
                         <!-- enforce correct email format -->
                        <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail" Display="Dynamic" ErrorMessage="Error" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">A valid email address is required</asp:RegularExpressionValidator>

                    </p>

                    <!-- Number of guests -->
                    <p>
                        No. Guests<sup>*</sup> :<asp:TextBox ID="txtGuests" runat="server" Width="50px"></asp:TextBox>
                        <!-- enforce mandatory field entry -->
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtGuests" Display="Dynamic" ErrorMessage="Error">The number of guests must be specified.</asp:RequiredFieldValidator>
                        <!-- enforce only 1-50 guests allowed -->
                        <asp:RangeValidator ID="rgvGuest" runat="server" ControlToValidate="txtGuests" ErrorMessage="RangeValidator" MaximumValue="50" MinimumValue="1">Maximum 50 guests allowed.</asp:RangeValidator>
                    </p>

                    <!-- Date of booking -->
                    <p>
                        Date(dd/mm/yyyy)<sup>*</sup>:<br />
                        <asp:TextBox ID="txtDate" runat="server" Width="135px"></asp:TextBox>
                         <!-- enforce mandatory field entry -->
                        <asp:RequiredFieldValidator ID="rfvDate" runat="server" ControlToValidate="txtDate" Display="Dynamic" ErrorMessage="Error">A booking date is required.</asp:RequiredFieldValidator>
                        <!-- enforce correct date format -->
                        <asp:RegularExpressionValidator ID="revDate" runat="server" ControlToValidate="txtDate" Display="Dynamic" ErrorMessage="RegularExpressionValidator" ValidationExpression="^(0?[1-9]|[12][0-9]|3[01])[- /.](0?[1-9]|1[012])[- /.](19|20)[0-9][0-9]$">A valid date is required</asp:RegularExpressionValidator>
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
                         <asp:RequiredFieldValidator ID="rfvTime" runat="server" InitialValue="--Choose--" ControlToValidate="ddlTime" Display="Dynamic" ErrorMessage="Error">A booking time is required.</asp:RequiredFieldValidator>
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
                         <asp:RequiredFieldValidator ID="rfvCategory" runat="server" InitialValue="--Choose--" ControlToValidate="ddlCategory" Display="Dynamic" ErrorMessage="Error">Client category is required.</asp:RequiredFieldValidator>
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
