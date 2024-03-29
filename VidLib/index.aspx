﻿<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="index.aspx.vb" Inherits="VidLib.index" %>

<!-- Header & Navigation  -->

<%Response.WriteFile("header.html") %>

<!-- Navigation ends above -->

<!-- Main content div starts below -->
<div class="container">
    <div class="main">

        <h1>Rentals</h1>
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

                    <asp:RequiredFieldValidator ID="rfvName" 
                        runat="server" 
                        ControlToValidate="txtName" 
                        Display="Dynamic" 
                        ErrorMessage="Error"
                     >
                        A name is required.
                    </asp:RequiredFieldValidator>

                    <!-- enforce correct format (no numbers) -->

                    <asp:RegularExpressionValidator ID="revName" 
                        runat="server" 
                        ControlToValidate="txtName" 
                        Display="Dynamic" 
                        ErrorMessage="Error" 
                        ValidationExpression="^[A-Z a-z]*$"
                     >
                        Name cannot contain numbers.

                    </asp:RegularExpressionValidator>
                </p>

                <!-- Phone -->
                <p>
                    Phone<sup>*</sup>:<br />
                    <asp:TextBox ID="txtPhone" runat="server" Width="135px"></asp:TextBox>

                    <!-- enforce mandatory field entry -->

                    <asp:RequiredFieldValidator ID="rfvPhone" 
                        runat="server" 
                        ControlToValidate="txtPhone" 
                        Display="Dynamic" 
                        ErrorMessage="Error"
                     >
                        A phone number is required.

                    </asp:RequiredFieldValidator>

                    <!-- enforce correct format -->

                    <asp:RegularExpressionValidator ID="revPhone" 
                        runat="server" 
                        ControlToValidate="txtPhone" 
                        Display="Dynamic" 
                        ErrorMessage="Error" 
                        ValidationExpression="^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$"
                    >
                        A valid phone number is required.

                    </asp:RegularExpressionValidator>

                </p>

                <!-- Email -->
                <p>
                    Email<sup>*</sup><br />
                    <asp:TextBox ID="txtEmail" runat="server" Width="135px"></asp:TextBox>

                    <!-- enforce mandatory field entry -->

                    <asp:RequiredFieldValidator ID="rfvEmail" 
                        runat="server" 
                        ControlToValidate="txtEmail" 
                        Display="Dynamic" 
                        ErrorMessage="Error"
                    >
                        An email address is required.

                    </asp:RequiredFieldValidator>

                    <!-- enforce correct email format -->

                    <asp:RegularExpressionValidator ID="revEmail" 
                        runat="server" 
                        ControlToValidate="txtEmail" 
                        Display="Dynamic" 
                        ErrorMessage="Error" 
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                     >
                        A valid email address is required

                    </asp:RegularExpressionValidator>

                </p>

                <!-- Date of rental -->
                <p>
                    Rental Date (dd/mm/yyyy)<sup>*</sup>:<br />
                    <asp:TextBox ID="txtRentalDate" runat="server" Width="135px"></asp:TextBox>

                    <!-- enforce mandatory field entry -->

                    <asp:RequiredFieldValidator ID="rfvRentalDate" 
                        runat="server" 
                        ControlToValidate="txtRentalDate" 
                        Display="Dynamic" 
                        ErrorMessage="Error"
                    >
                        A rental date is required.

                    </asp:RequiredFieldValidator>

                    <!-- enforce correct date format -->

                    <asp:RegularExpressionValidator ID="revRentalDate" 
                        runat="server" 
                        ControlToValidate="txtRentalDate" 
                        Display="Dynamic" 
                        ErrorMessage="RegularExpressionValidator" 
                        ValidationExpression="^(0?[1-9]|[12][0-9]|3[01])[- /.](0?[1-9]|1[012])[- /.](19|20)[0-9][0-9]$"
                     >
                        A valid date is required

                    </asp:RegularExpressionValidator>
                </p>

                <!-- Days of rental period -->
                <p>
                    Rental Days<sup>*</sup>:
                        <asp:DropDownList ID="ddlRentalDays" 
                            runat="server" 
                            Height="25px" 
                            ToolTip="Choose a time" 
                            Width="100px"
                         >
                            <asp:ListItem Value="--Choose--">--Choose--</asp:ListItem>
                            <asp:ListItem>1</asp:ListItem>
                            <asp:ListItem>3</asp:ListItem>
                            <asp:ListItem>7</asp:ListItem>
                            <asp:ListItem>14</asp:ListItem>
                        </asp:DropDownList>

                    
                    <!-- enforce mandatory field entry -->

                    <asp:RequiredFieldValidator ID="rfvRentalDays" 
                        runat="server" 
                        InitialValue="--Choose--" 
                        ControlToValidate="ddlRentalDays" 
                        Display="Dynamic" 
                        ErrorMessage="Error"
                     >
                        A rental period must be specified.

                    </asp:RequiredFieldValidator>
                </p>

                <!-- Video title dropdown -->

                <p>
                    Title:
                        <asp:DropDownList ID="ddlTitle" 
                            runat="server" 
                            AutoPostBack="True" 
                            AppendDataBoundItems="True" 
                            Height="25px" 
                            ToolTip="Choose a title" 
                            Width="500px"
                            OnSelectedIndexChanged="ddlTitle_SelectedIndexChanged"
                         >
                            <asp:ListItem Value="--Choose--">--Choose--</asp:ListItem>
<%--                            <asp:ListItem>Star Wars Episode I: The Phantom Menace</asp:ListItem>
                            <asp:ListItem>Star Wars Episode II: Attack of the Clones</asp:ListItem>
                            <asp:ListItem>Star Wars Episode III: Revenge of the Sith</asp:ListItem>
                            <asp:ListItem>Star Wars Episode IV: A New Hope</asp:ListItem>
                            <asp:ListItem>Star Wars Episode V: The Empire Strikes Back</asp:ListItem>
                            <asp:ListItem>Star Wars Episode VI: Return of the Jedi</asp:ListItem>
                            <asp:ListItem>Star Wars Episode VII: The Forces Awakens</asp:ListItem>
                            <asp:ListItem>Star Wars Episode VIII: The Last Jedi</asp:ListItem>
                            <asp:ListItem>Star Wars Episode IX: The Rise of Skywalker</asp:ListItem>--%>
                        </asp:DropDownList>

                     <!-- enforce mandatory field entry -->

                    <asp:RequiredFieldValidator ID="rfvTitle" 
                        runat="server" 
                        InitialValue="--Choose--" 
                        ControlToValidate="ddlTitle" 
                        Display="Dynamic" 
                        ErrorMessage="Error"
                     >
                        Video title is required.

                    </asp:RequiredFieldValidator>

                </p>

                <!-- Video genre dropdown -->

                <p>
                    Genre:
                        <asp:DropDownList ID="ddlGenre" 
                            runat="server" 
                            Height="25px" 
                            ToolTip="Choose a genre" 
                            Width="200px"
                        >
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

                     <!-- enforce mandatory field entry -->

                    <asp:RequiredFieldValidator ID="rfvGenre" 
                        runat="server" 
                        InitialValue="--Choose--" 
                        ControlToValidate="ddlGenre" 
                        Display="Dynamic" 
                        ErrorMessage="Error"
                    >
                        Video genre is required.

                    </asp:RequiredFieldValidator>

                </p>
                <!-- submit button for fields -->

                <!-- <asp:Button ID="Button1" runat="server" CausesValidation="true" Text="Submit" Width="70px" /> -->
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" Width="70px" />
                <br />
                <br />

                <div class="grid">
                    <h2>Rentals</h2>
                    <asp:GridView ID="gvRentals"
                        runat="server"
                        AutoGenerateColumns="False"
                        DataSourceID="SqlDataSource_Rentals"
                        ForeColor="#333333"
                        GridLines="None"
                        BorderColor="Black"
                        BorderWidth="5px"
                        Width="900px"
                    >
                        <columns>
                            <asp:BoundField DataField="Pad" HeaderText="" SortExpression="" ItemStyle-Width="5" />
                            <asp:BoundField DataField="Ref" HeaderText="Ref" SortExpression="Ref" ItemStyle-Width="10" />
                            <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" ItemStyle-Width="30%" ItemStyle-Wrap="false" />
                            <asp:BoundField DataField="Pad" HeaderText="" SortExpression="" ItemStyle-Width="5" ItemStyle-Wrap="false" />
                            <asp:BoundField DataField="Genre" HeaderText="Genre" SortExpression="Genre" ItemStyle-Width="30" ItemStyle-Wrap="false" />
                            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" ItemStyle-Width="40" ItemStyle-Wrap="false"/>
                            <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" ItemStyle-Width="35" ItemStyle-Wrap="false"/>
                            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" ItemStyle-Width="15%" ItemStyle-Wrap="false" />
                            <asp:BoundField DataField="Rental_Date" HeaderText="Rented" SortExpression="Rental_Date" ItemStyle-Width="10%" ItemStyle-Wrap="false" />
                            <asp:BoundField DataField="Return_Date" HeaderText="Return By" SortExpression="Return_Date" ItemStyle-Width="10%" ItemStyle-Wrap="false" ItemStyle-HorizontalAlign="Center"/>
                        </columns>
                        <headerstyle cssclass="gv-headerStyle" />
                        <rowstyle cssclass="gv-itemStyle" />
                        <alternatingrowstyle cssclass="gv-alternateItemStyle" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource_Rentals" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" SelectCommand="SELECT ' ' As Pad, [Rental_Id] As Ref, [Name], [Phone], [Email], CONVERT(VARCHAR,[Rental_Date],6) AS Rental_Date, CONVERT(VARCHAR,[Return_Date],6) AS Return_Date, [Title], [Genre] FROM [tblRentals]"></asp:SqlDataSource>
                    <br />
                </div>
                <!-- Grid content end  -->
 

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

<%--                        <asp:ListItem>Star Wars Episode I: The Phantom Menace</asp:ListItem>
                            <asp:ListItem>Star Wars Episode II: Attack of the Clones</asp:ListItem>
                            <asp:ListItem>Star Wars Episode III: Revenge of the Sith</asp:ListItem>
                            <asp:ListItem>Star Wars Episode IV: A New Hope</asp:ListItem>
                            <asp:ListItem>Star Wars Episode V: The Empire Strikes Back</asp:ListItem>
                            <asp:ListItem>Star Wars Episode VI: Return of the Jedi</asp:ListItem>
                            <asp:ListItem>Star Wars Episode VII: The Forces Awakens</asp:ListItem>
                            <asp:ListItem>Star Wars Episode VIII: The Last Jedi</asp:ListItem>
                            <asp:ListItem>Star Wars Episode IX: The Rise of Skywalker</asp:ListItem>--%>

<!-- Footer ends above -->


<!-- Link to JavaScipt plugins, needed for things like the dropdown menu to work.  BOTH files are required. -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

<script src="js/bootstrap.min.js"></script>

</body>
</html>