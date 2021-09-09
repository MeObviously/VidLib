<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="index.aspx.vb" Inherits="VidLib.index" %>

<!doctype html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <meta name="keywords" content="" />	<!-- add keywords -->
    <meta name="description" content="" />	<!-- add description content -->
    <meta name="author" content="" />		<!-- Add your name to 'author' -->
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <title>St. Georges Restaurant</title>

    <!-- Links for css, bootstrap -->
    <link href="css/st_george_custom.css" rel="stylesheet" type="text/css" />	<!-- edit the file name -->
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />	<!-- edit the file name -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>

<body>
    <!-- Navigation starts below -->
    <div class="navbar navbar-default" role="navigation">
	    <div class="navbar-header">
	
		    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
			    <span class="icon-bar"></span>
			    <span class="icon-bar"></span>
			    <span class="icon-bar"></span>
		    </button>
				
		    <!-- Logo goes here -->
			
		    <h1>St George's Restaurant</h1>
	    </div> <!-- End of navbar-header -->
	
	    <div class="container">  <!-- Top links start here -->
		    <div class="navbar-collapse collapse">
			    <ul class="nav navbar-nav navbar-right">
				    <li class="active"><a href="index.aspx">Bookings</a></li>
				    <li><a href="#"></a>Search</li>
				    <li><a href="#"></a>Contact</li>	
			    </ul>
		    </div> <!-- End of navbar collapse -->
	    </div> <!-- End of navigation container class -->
    </div>
    <!-- Navigation ends above -->

<!-- Main content div starts below -->
    <div class="container">
	    <div class="main">

	        <h1>Booking Form</h1>
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
                    <p>Time<sup>*</sup>:
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
                    <br /><br />
                </asp:Panel>

                 </form>
             <!-- End booking form -->
	
	    </div> <!-- Main content end  -->
	   
    </div> <!-- container (around main div) end-->

     <!-- Footer starts below -->
	 <footer class="navbar navbar-inverse navbar-fixed-bottom" role="navigation">
        <div class="container">
            <div class="navbar-text pull-right">
                &copy; Your name &amp; date  <!-- edit this -->
            </div>
        </div>
    </footer>
    <!-- Footer ends above -->
 

<!-- Link to JavaScipt plugins, needed for things like the dropdown menu to work.  BOTH files are required. -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    
    <script src="js/bootstrap.min.js"></script>
   
</body>
</html>
