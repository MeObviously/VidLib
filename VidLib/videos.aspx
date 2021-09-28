<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="videos.aspx.vb" Inherits="VidLib.videos" %>

<!-- Header & Navigation  -->

    <%Response.WriteFile("header.html") %>

    <!-- Navigation ends above -->

    <!-- Main content div starts below -->
    <div class="container">
        <div class="main">

            <h1>Videos</h1>
            <!-- Instructons -->
            <p>Fields marked with an <sup>*</sup> are required</p>
            <!-- Booking form start -->

            <form id="frmMain" runat="server">
                <asp:Panel ID="pnlBookingForm" runat="server" BackColor="#E0E8F9">
                  
                     <!-- Video title dropdown -->

                    <%--<p>
                        Title<sup>*</sup>:<br />
                        <asp:DropDownList ID="txtVideoTitle" runat="server" Height="25px" ToolTip="Choose a title" Width="500px">
                            <asp:ListItem Value="--Choose--">--Choose--</asp:ListItem>
                            <asp:ListItem>Star Wars Episode I: The Phantom Menace</asp:ListItem>
                             <asp:ListItem>Star Wars Episode II: Attack of the Clones</asp:ListItem>
                             <asp:ListItem>Star Wars Episode III: Revenge of the Sith</asp:ListItem>
                             <asp:ListItem>Star Wars Episode IV: A New Hope</asp:ListItem>
                             <asp:ListItem>Star Wars Episode V: The Empire Strikes Back</asp:ListItem>
                             <asp:ListItem>Star Wars Episode VI: Return of the Jedi</asp:ListItem>
                             <asp:ListItem>Star Wars Episode VII: The Forces Awakens</asp:ListItem>
                             <asp:ListItem>Star Wars Episode VIII: The Last Jedi</asp:ListItem>
                             <asp:ListItem>Star Wars Episode IX: The Rise of Skywalker</asp:ListItem>
                        </asp:DropDownList>
                         <asp:RequiredFieldValidator ID="rfvVideoTitle" runat="server" InitialValue="--Choose--" ControlToValidate="txtVideoTitle" Display="Dynamic" ErrorMessage="Error">Video title is required.</asp:RequiredFieldValidator>
                    </p>--%>

                    
                      <!-- Name -->
                    <p>
                        Title<sup>*</sup>:<br />
                        <asp:TextBox ID="txtVideoTitle" runat="server" Width="400px"></asp:TextBox>
                         <!-- enforce mandatory field entry -->
                        <asp:RequiredFieldValidator ID="rfvVideoTitle" runat="server" ControlToValidate="txtVideoTitle" Display="Dynamic" ErrorMessage="Error">A title is required.</asp:RequiredFieldValidator>
                        <!-- enforce correct format (no numbers) -->
                                <asp:RegularExpressionValidator ID="revVideoTitle" runat="server" ControlToValidate="txtVideoTitle" Display="Dynamic" ErrorMessage="Error" ValidationExpression="^[A-Z a-z]*$">Video title cannot contain numbers.</asp:RegularExpressionValidator>
                    </p>
                   
                    <!-- Video genre dropdown -->

                    <p>
                        Genre<sup>*</sup>:<br />
                        <asp:DropDownList ID="ddlVideoGenre" runat="server" Height="25px" ToolTip="Choose a genre" Width="200px">
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
                         <asp:RequiredFieldValidator ID="rfvVideoGenre" runat="server" InitialValue="--Choose--" ControlToValidate="ddlVideoGenre" Display="Dynamic" ErrorMessage="Error">Video genre is required.</asp:RequiredFieldValidator>
                    </p>

                      <!-- Year -->
                    <p>
                        Year<sup>*</sup>:<br />
                        <asp:TextBox ID="intYear" runat="server" Width="135px"></asp:TextBox>
                         <!-- enforce mandatory field entry -->
                        <asp:RequiredFieldValidator ID="rfvYear" runat="server" ControlToValidate="intYear" Display="Dynamic" ErrorMessage="Error">A year is required.</asp:RequiredFieldValidator>
                        <!-- enforce correct format (no numbers) -->
                                <asp:RegularExpressionValidator ID="revYear" runat="server" ControlToValidate="intYear" Display="Dynamic" ErrorMessage="Error" ValidationExpression="^[0-9]*$">Year cannot contain letters.</asp:RegularExpressionValidator>
                    </p>

                      <!-- Director -->
                    <p>
                        Director<sup>*</sup>:<br />
                        <asp:TextBox ID="txtDirector" runat="server" Width="135px"></asp:TextBox>
                         <!-- enforce mandatory field entry -->
                        <asp:RequiredFieldValidator ID="rfvDirector" runat="server" ControlToValidate="txtDirector" Display="Dynamic" ErrorMessage="Error">A director is required.</asp:RequiredFieldValidator>
                        <!-- enforce correct format (no numbers) -->
                                <asp:RegularExpressionValidator ID="revDirector" runat="server" ControlToValidate="txtDirector" Display="Dynamic" ErrorMessage="Error" ValidationExpression="^[A-Z a-z]*$">Director name cannot contain numbers.</asp:RegularExpressionValidator>
                    </p>

                    <!-- <asp:Button ID="Button1" runat="server" CausesValidation="true" Text="Submit" Width="70px" /> -->
                    <asp:Button ID="btnAddVideo" runat="server" Text="Add Video" Width="100px" />
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

