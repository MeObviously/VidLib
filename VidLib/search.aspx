<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="search.aspx.vb" Inherits="VidLib.search" %>

    <%Response.WriteFile("header.html") %>

        <div class="container">
            <div class="main">
                <h1>Search</h1>
                <p>
                    Please choose an option below...
                </p>
                <!-- search form start -->
                <form id="frmSearch" runat="server">
                    <asp:Panel ID="pnlSearch" runat="server" BackColor="#E0E8F9">
                        <br />
                        <!-- Title Search -->
                        <div class="one">
                            <p>
                                &nbsp;Title<sup>*</sup>:&emsp;&emsp;
                                <asp:TextBox ID="txtTitle" runat="server" Width="135px" ValidationGroup="Val1"></asp:TextBox>
                                &nbsp;&nbsp;
                                <asp:Button ID="btnTitleSearch" ValidationGroup="Val1" OnClick="btnTitleSearch_Click" runat="server" Text="Search Title" Width="125px" />
                                <!-- enforce mandatory field entry -->
                                <asp:RequiredFieldValidator ID="rfvTitle" ValidationGroup="Val1" runat="server" ControlToValidate="txtTitle" Display="Dynamic" ErrorMessage="Error">A title is required.</asp:RequiredFieldValidator>
                                <!-- enforce correct format (no numbers) -->
                                <!-- <asp:RegularExpressionValidator ValidationGroup="Val1" ID="revTitle" runat="server" ControlToValidate="txtTitle" Display="Dynamic" ErrorMessage="Error" ValidationExpression="^[A-Za-z]*$">Title cannot contain numbers.</asp:RegularExpressionValidator> -->

                            </p>
                        </div> <!-- end Title Search -->

                        <br />

                        <!-- Email Search -->
                        <div class="two">
                            <p>
                                &ensp;Genre<sup>*</sup>:&emsp;&emsp;
                                <asp:TextBox ID="txtEmail" runat="server" Width="135px" ValidationGroup="Val2"></asp:TextBox>
                                &nbsp;&nbsp;
                                <asp:Button ID="btnEmailSearch" ValidationGroup="Val2" OnClick="btnEmailSearch_Click" runat="server" Text="Search Email" Width="125px" />
                                <!-- enforce mandatory field entry -->
                                <asp:RequiredFieldValidator ID="rfvEmail" ValidationGroup="Val2" runat="server" ControlToValidate="txtEmail" Display="Dynamic" ErrorMessage="Error">An e-mail is required.</asp:RequiredFieldValidator>
                             
                            </p>
                        </div> <!-- end Email Search -->

                        <br />

                        <!-- Category Search -->
                        <div class="one">
                            <p>
                                &ensp;Category<sup>*</sup>:&emsp;&emsp;
                                <asp:DropDownList ID="ddlCategory" runat="server" Height="25px" ToolTip="Choose a customer type" Width="95px" ValidationGroup="Val3">
                                    <asp:ListItem Value="--Choose--">--Choose--</asp:ListItem>
                                    <asp:ListItem>VIP</asp:ListItem>
                                    <asp:ListItem>Regular</asp:ListItem>
                                    <asp:ListItem>Casual</asp:ListItem>
                                </asp:DropDownList>
                                &nbsp;&nbsp;
                                <asp:Button ID="btnCategorySearch" ValidationGroup="Val3" OnClick="btnCategorySearch_Click" runat="server" Text="Search Category" Width="125px" />
                                <asp:RequiredFieldValidator ID="rfvCategory" ValidationGroup="Val3" runat="server" InitialValue="--Choose--" ControlToValidate="ddlCategory" Display="Dynamic" ErrorMessage="Error">Client category is required.</asp:RequiredFieldValidator>

                            </p>
                        </div>
                        <!-- end Category Search -->

                        <br />

                         <!-- Date Search -->
                        <div class="two">
                            <div class="row">
                                <div class="col-md-3">
                                    &emsp;<asp:Button ID="btnTodaySearch" OnClick="btnTodaySearch_Click" runat="server" Text="Find Today's Bookings" Width="160px" />
                                </div>

                                <div class="col-md-9">
                                    &nbsp;Or by date<sup>*</sup>:

                                    <asp:TextBox ID="txtDate" runat="server" Width="135px" Text="dd/MM/yyyy" ValidationGroup="Val4"></asp:TextBox>
                                    <asp:Button ID="btnDateSearch" ValidationGroup="Val4" OnClick="btnDateSearch_Click" runat="server" Text="Search Date" Width="120px" />
                                    <!-- enforce mandatory field entry -->
                                    <asp:RequiredFieldValidator ID="rfvDate" ValidationGroup="Val4" runat="server" ControlToValidate="txtDate" Display="Dynamic" ErrorMessage="Error">A booking date is required.</asp:RequiredFieldValidator>
                                    <!-- enforce correct date format -->
                                    <asp:RegularExpressionValidator ID="revDate" ValidationGroup="Val4" runat="server" ControlToValidate="txtDate" Display="Dynamic" ErrorMessage="RegularExpressionValidator" ValidationExpression="^(0?[1-9]|[12][0-9]|3[01])[- /.](0?[1-9]|1[012])[- /.](19|20)[0-9][0-9]$">A valid date is required</asp:RegularExpressionValidator>
                                </div>
                            </div>
                            <br />
                        </div> <!-- end Date Search -->

                        <br />
                        <!-- Table Search -->
                        <div class="one">
                            <p>
                                &nbsp;&nbsp;
                                <asp:Button ID="btnTableSearch" OnClick="btnTableSearch_Click" runat="server" Text="Today's Bookings with More than 4 diners..."/>
                                <br />
                            </p>
                        </div>
                        <!-- end Table Search -->
                        <br />

                    </asp:Panel>

                </form>
            </div>
        </div>
    </body>

    <%Response.WriteFile("footer.html") %>
</html>

