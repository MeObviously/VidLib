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

                        <!-- Genre Search -->
                        <div class="two">

                              <p>
                                &ensp;Genre<sup>*</sup>:&emsp;&emsp;
                                <asp:DropDownList ID="ddlGenre" runat="server" Height="25px" ToolTip="Choose a genre" Width="95px" ValidationGroup="Val3">
                                    <asp:ListItem Value="--Choose--">--Choose--</asp:ListItem>
                                    <asp:ListItem>Action</asp:ListItem>
                                    <asp:ListItem>Adventure</asp:ListItem>
                                    <asp:ListItem>Animation</asp:ListItem>
                                    <asp:ListItem>Comedy</asp:ListItem>
                                    <asp:ListItem>Drama</asp:ListItem>
                                    <asp:ListItem>Family</asp:ListItem>
                                    <asp:ListItem>Horror</asp:ListItem>
                                    <asp:ListItem>Musical</asp:ListItem>
                                    <asp:ListItem>Romance</asp:ListItem>
                                    <asp:ListItem>Sci-Fi</asp:ListItem>
                                    <asp:ListItem>War</asp:ListItem>
                                </asp:DropDownList>
                                &nbsp;&nbsp;
                                <asp:Button ID="btnGenreSearch" ValidationGroup="Val3" OnClick="btnGenreSearch_Click" runat="server" Text="Search Genre" Width="125px" />
                                <asp:RequiredFieldValidator ID="rfvGenre" ValidationGroup="Val3" runat="server" InitialValue="--Choose--" ControlToValidate="ddlGenre" Display="Dynamic" ErrorMessage="Error">A genre is required.</asp:RequiredFieldValidator>

                            </p>

                        </div> <!-- end Genre Search -->

                        <br />

                        <!-- Rental Date Search -->
                        <div class="one">
                            <p>
                                    &nbsp;Rental Date<sup>*</sup>:

                                    <asp:TextBox ID="txtRentalDate" runat="server" Width="135px" Text="dd/MM/yyyy" ValidationGroup="Val4"></asp:TextBox>
                                    <asp:Button ID="btnRentalDateSearch" ValidationGroup="Val4" OnClick="btnRentalDateSearch_Click" runat="server" Text="Search Rental Date" Width="150px" />
                                    <!-- enforce mandatory field entry -->
                                    <asp:RequiredFieldValidator ID="rfvRentalDateSearch" ValidationGroup="Val4" runat="server" ControlToValidate="txtRentalDate" Display="Dynamic" ErrorMessage="Error">A rental date is required.</asp:RequiredFieldValidator>
                                    <!-- enforce correct date format -->
                                    <asp:RegularExpressionValidator ID="revRentalDate" ValidationGroup="Val4" runat="server" ControlToValidate="txtRentalDate" Display="Dynamic" ErrorMessage="Error" ValidationExpression="^(0?[1-9]|[12][0-9]|3[01])[- /.](0?[1-9]|1[012])[- /.](19|20)[0-9][0-9]$">A valid date is required</asp:RegularExpressionValidator>

                            </p>
                        </div>
                        <!-- end Rental Date Search -->

                        <br />

                         <!-- Return Date Search -->
                        <div class="two">
                            <p>
                                    &nbsp;Return Date<sup>*</sup>:

                                    <asp:TextBox ID="txtReturnDate" runat="server" Width="135px" Text="dd/MM/yyyy" ValidationGroup="Val5"></asp:TextBox>
                                    <asp:Button ID="btnReturnDateSearch" ValidationGroup="Val5" OnClick="btnReturnDateSearch_Click" runat="server" Text="Search Return Date" Width="150px" />
                                    <!-- enforce mandatory field entry -->
                                    <asp:RequiredFieldValidator ID="rfvReturnDateSearch" ValidationGroup="Val5" runat="server" ControlToValidate="txtReturnDate" Display="Dynamic" ErrorMessage="Error">A return date is required.</asp:RequiredFieldValidator>
                                    <!-- enforce correct date format -->
                                    <asp:RegularExpressionValidator ID="revReturnDateSearch" ValidationGroup="Val5" runat="server" ControlToValidate="txtReturnDate" Display="Dynamic" ErrorMessage="Error" ValidationExpression="^(0?[1-9]|[12][0-9]|3[01])[- /.](0?[1-9]|1[012])[- /.](19|20)[0-9][0-9]$">A valid date is required</asp:RegularExpressionValidator>
                                    <!-- Find Overdues button -->
                                    <asp:Button ID="btnFindOverdues" ValidationGroup="Va6" OnClick="btnFindOverdues_Click" runat="server" Text="Find Overdues" Width="150px" />

                            </p>
                        </div>

                        <!-- end Return Date Search -->

                        <br />
                        <!-- Table Search -->
                        <div class="one">
                            <p>
                                &nbsp;&nbsp;
                                <asp:Button ID="btnTableSearch" OnClick="btnTableSearch_Click" runat="server" Text="Find Customers with More than 3 Videos Rented Out..."/>
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

