﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="listing.aspx.cs" Inherits="listing" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

    <head id="Head1" runat="server">

    <meta charset="utf-8">
    <title>Patient's Listing    </title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Charisma, a fully featured, responsive, HTML5, Bootstrap admin template.">
    <meta name="author" content="Muhammad Usman">

    <!-- The styles -->
    <link id="bs_css" href="css/bootstrap-cerulean.css" rel="stylesheet">
    <style type="text/css">
        body {
            padding-bottom: 40px;
        }

        .sidebar-nav {
            padding: 9px 0;
        }
    </style>
    <link href="css/bootstrap-responsive.css" rel="stylesheet">
    <link href="css/charisma-app.css" rel="stylesheet">
    <link href="css/jquery-ui-1.8.21.custom.css" rel="stylesheet">
    <link href='css/fullcalendar.css' rel='stylesheet'>
    <link href='css/fullcalendar.print.css' rel='stylesheet' media='print'>
    <link href='css/chosen.css' rel='stylesheet'>
    <link href='css/uniform.default.css' rel='stylesheet'>
    <link href='css/colorbox.css' rel='stylesheet'>
    <link href='css/jquery.cleditor.css' rel='stylesheet'>
    <link href='css/jquery.noty.css' rel='stylesheet'>
    <link href='css/noty_theme_default.css' rel='stylesheet'>
    <link href='css/elfinder.min.css' rel='stylesheet'>
    <link href='css/elfinder.theme.css' rel='stylesheet'>
    <link href='css/jquery.iphone.toggle.css' rel='stylesheet'>
    <link href='css/opa-icons.css' rel='stylesheet'>
    <link href='css/uploadify.css' rel='stylesheet'>

    <!-- The HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
	  <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->

    <!-- The fav icon -->
    <link rel="shortcut icon" href="img/favicon.ico">
</head>

    <body>
       
    <form id="form2" runat="server">
        
        <!-- topbar starts -->
        <div class="navbar">
            <div class="navbar-inner">
                <div class="container-fluid">
                    <a class="btn btn-navbar" data-toggle="collapse" data-target=".top-nav.nav-collapse,.sidebar-nav.nav-collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </a>
                    <a class="brand" href="index.html">
                        <img alt="Charisma Logo" src="img/logo20.png" />
                        <span>Charisma</span></a>

                    <!-- theme selector starts -->
                    <div class="btn-group pull-right theme-container">
                        <a class="btn dropdown-toggle" data-toggle="dropdown" href="#">
                            <i class="icon-tint"></i><span class="hidden-phone">Change Theme / Skin</span>
                            <span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu" id="themes">
                            <li><a data-value="classic" href="#"><i class="icon-blank"></i>Classic</a></li>
                            <li><a data-value="cerulean" href="#"><i class="icon-blank"></i>Cerulean</a></li>
                            <li><a data-value="cyborg" href="#"><i class="icon-blank"></i>Cyborg</a></li>
                            <li><a data-value="redy" href="#"><i class="icon-blank"></i>Redy</a></li>
                            <li><a data-value="journal" href="#"><i class="icon-blank"></i>Journal</a></li>
                            <li><a data-value="simplex" href="#"><i class="icon-blank"></i>Simplex</a></li>
                            <li><a data-value="slate" href="#"><i class="icon-blank"></i>Slate</a></li>
                            <li><a data-value="spacelab" href="#"><i class="icon-blank"></i>Spacelab</a></li>
                            <li><a data-value="united" href="#"><i class="icon-blank"></i>United</a></li>
                        </ul>
                    </div>
                    <!-- theme selector ends -->

                    <!-- user dropdown starts -->
                    <div class="btn-group pull-right">
                        <a class="btn dropdown-toggle" data-toggle="dropdown" href="#">
                            <i class="icon-user"></i><span class="hidden-phone">admin</span>
                            <span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a href="#">Profile</a></li>
                            <li class="divider"></li>
                            <li><a href="login.html">Logout</a></li>
                        </ul>
                    </div>
                    <!-- user dropdown ends -->

                    <div class="top-nav nav-collapse">
                        <ul class="nav">
                            <li><a href="#">Visit Site</a></li>
                            <li>
                                <div class="navbar-search pull-left">
                                    <input placeholder="Search" class="search-query span2" name="query" type="text">
                                </div>
                            </li>
                        </ul>
                    </div>
                    <!--/.nav-collapse -->
                </div>
            </div>
        </div>

        <!-- topbar ends -->

        <div class="container-fluid">
            <div class="row-fluid">

                <!-- left menu starts -->
                <div class="span2 main-menu-span">
                    <div class="well nav-collapse sidebar-nav">
                        <ul class="nav nav-tabs nav-stacked main-menu">
                            <li class="nav-header hidden-tablet">Main</li>
                             <a class="ajax-link" href="FrmUserType.aspx"><i class="icon-home"></i>
                                    <span class="hidden-tablet">User Type</span></a></li>
                            <li><a class="ajax-link" href="login.aspx"><i class="icon-home"></i>
                                    <span class="hidden-tablet">Login</span></a></li>
                            <li><a class="ajax-link" href="userregform.aspx"><i class="icon-home"></i>
                                    <span class="hidden-tablet">User Registration</span></a></li>
                            <li><a class="ajax-link" href="patientreg.aspx"><i class="icon-home"></i>
                                    <span class="hidden-tablet">Patient Registration</span></a></li>
                            <li><a class="ajax-link" href="doctorscheduling.aspx"><i class="icon-home"></i>
                                    <span class="hidden-tablet">Doctor Scheduling </span></a></li>
                            <li><a class="ajax-link" href="appointmentinfo.aspx"><i class="icon-home"></i>
                                    <span class="hidden-tablet">Appointment Information</span></a></li>
                            <li><a class="ajax-link" href="appointmentfix.aspx"><i class="icon-home"></i>
                                    <span class="hidden-tablet">Appointment Fixing</span></a></li>
                           
                            <li><a class="ajax-link" href="listing.aspx"><i class="icon-home"></i>
                                    <span class="hidden-tablet">Listing</span></a></li>
                            <li><a class="ajax-link" href="login.aspx"><i class="icon-home"></i>
                                    <span class="hidden-tablet">Logout</span></a></li>
                                 <li><a href="login.html"><i class="icon-lock"></i><span class="hidden-tablet">Login Page</span></a></li>
                        </ul>
                        <label id="for-is-ajax" class="hidden-tablet" for="is-ajax">
                            <input id="is-ajax" type="checkbox">
                            Ajax on menu</label>
                    </div>
                    <!--/.well -->
                </div>
                <!--/span-->
                <!-- left menu ends -->
                <noscript>
				&lt;div class="alert alert-block span10"&gt;
					&lt;h4 class="alert-heading"&gt;Warning!&lt;/h4&gt;
					&lt;p&gt;You need to have &lt;a href="http://en.wikipedia.org/wiki/JavaScript" target="_blank"&gt;JavaScript&lt;/a&gt; enabled to use this site.&lt;/p&gt;
				&lt;/div&gt;
			</noscript>

                <div id="content" class="span10">
                    <div>
                        <ul class="breadcrumb">
                            <li>
                                <a href="#">Home</a> <span class="divider">/</span>
                            </li>
                            <li>
                                <a href="#">List Of Patients</a>
                            </li>
                        </ul>
                    </div>
                    <div class="box span12">
					<div class="box-header well">
						<h2><i class="icon-th"></i> Tabs</h2>
						<div class="box-icon">
							<a href="#" class="btn btn-setting btn-round"><i class="icon-cog"></i></a>
							<a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
							<a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
						</div>
					</div>
					<div class="box-content">
						<ul class="nav nav-tabs" id="myTab">
							<li class="active"><a href="#info">Unvisited</a></li>
							<li class=""><a href="#custom" >Visited</a></li>
							
						</ul>
						 
						<div id="myTabContent" class="tab-content">
							<div class="tab-pane active" id="info">
                                <asp:GridView ID="gdunvisited" OnRowCommand="gdunvisited_RowCommand" AutoGenerateColumns="false" runat="server" GridLines="None" CssClass="table table-bordered" ClientIDMode="Inherit">
                                    <Columns>
                                        <asp:BoundField DataField="apptid" HeaderText="Appointment ID" />
                                            <asp:BoundField DataField="fullname" HeaderText="Patient's Name" />
                                                <asp:BoundField DataField="doctorname" HeaderText="Doctor's Name" />
                                        <asp:TemplateField HeaderText="Status" >
                                            <ItemTemplate>
                                          <asp:LinkButton ID="lbtnunvisited" CommandName="updstatus" CommandArgument='<%# Eval("id")+","+Eval("isappid") %>' runat="server"><%# Eval("IsVisited") %> </asp:LinkButton>
       
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        </Columns>
                                     </asp:GridView>
                                
							</div>
							<div class="tab-pane" id="custom">
                                 
                                <asp:GridView ID="gdvisited" OnRowCommand="gdvisited_RowCommand" AutoGenerateColumns="false" runat="server" GridLines="None" CssClass="table table-bordered">
                                    <Columns>
                                        <asp:BoundField DataField="apptid" HeaderText="Appointment ID" />
                                            <asp:BoundField DataField="fullname" HeaderText="Patient's Name" />
                                                <asp:BoundField DataField="doctorname" HeaderText="Doctor's Name" />
                                        <asp:TemplateField HeaderText="Status" >
                                            <ItemTemplate>
                                           <asp:LinkButton ID="lbtnunvisited" Text="Unvisited" CommandName="updstatus" CommandArgument='<%# Eval("id")+","+Eval("isappid") %>' runat="server"><%# Eval("IsVisited") %> </asp:LinkButton>
       
                                            </ItemTemplate>
                                        </asp:TemplateField>



                                    </Columns>
                                </asp:GridView>
								</div>
							
						</div>
					</div>
				</div>

                    
     <!--/.fluid-container-->

        <!-- external javascript
	================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->

        <!-- jQuery -->
        <script src="js/jquery-1.7.2.min.js"></script>
        <!-- jQuery UI -->
        <script src="js/jquery-ui-1.8.21.custom.min.js"></script>
        <!-- transition / effect library -->
        <script src="js/bootstrap-transition.js"></script>
        <!-- alert enhancer library -->
        <script src="js/bootstrap-alert.js"></script>
        <!-- modal / dialog library -->
        <script src="js/bootstrap-modal.js"></script>
        <!-- custom dropdown library -->
        <script src="js/bootstrap-dropdown.js"></script>
        <!-- scrolspy library -->
        <script src="js/bootstrap-scrollspy.js"></script>
        <!-- library for creating tabs -->
        <script src="js/bootstrap-tab.js"></script>
        <!-- library for advanced tooltip -->
        <script src="js/bootstrap-tooltip.js"></script>
        <!-- popover effect library -->
        <script src="js/bootstrap-popover.js"></script>
        <!-- button enhancer library -->
        <script src="js/bootstrap-button.js"></script>
        <!-- accordion library (optional, not used in demo) -->
        <script src="js/bootstrap-collapse.js"></script>
        <!-- carousel slideshow library (optional, not used in demo) -->
        <script src="js/bootstrap-carousel.js"></script>
        <!-- autocomplete library -->
        <script src="js/bootstrap-typeahead.js"></script>
        <!-- tour library -->
        <script src="js/bootstrap-tour.js"></script>
        <!-- library for cookie management -->
        <script src="js/jquery.cookie.js"></script>
        <!-- calander plugin -->
        <script src='js/fullcalendar.min.js'></script>
        <!-- data table plugin -->
        <script src='js/jquery.dataTables.min.js'></script>

        <!-- chart libraries start -->
        <script src="js/excanvas.js"></script>
        <script src="js/jquery.flot.min.js"></script>
        <script src="js/jquery.flot.pie.min.js"></script>
        <script src="js/jquery.flot.stack.js"></script>
        <script src="js/jquery.flot.resize.min.js"></script>
        <!-- chart libraries end -->

        <!-- select or dropdown enhancer -->
        <script src="js/jquery.chosen.min.js"></script>
        <!-- checkbox, radio, and file input styler -->
        <script src="js/jquery.uniform.min.js"></script>
        <!-- plugin for gallery image view -->
        <script src="js/jquery.colorbox.min.js"></script>
        <!-- rich text editor library -->
        <script src="js/jquery.cleditor.min.js"></script>
        <!-- notification plugin -->
        <script src="js/jquery.noty.js"></script>
        <!-- file manager library -->
        <script src="js/jquery.elfinder.min.js"></script>
        <!-- star rating plugin -->
        <script src="js/jquery.raty.min.js"></script>
        <!-- for iOS style toggle switch -->
        <script src="js/jquery.iphone.toggle.js"></script>
        <!-- autogrowing textarea plugin -->
        <script src="js/jquery.autogrow-textarea.js"></script>
        <!-- multiple file upload plugin -->
        <script src="js/jquery.uploadify-3.1.min.js"></script>
        <!-- history.js for cross-browser state change on ajax -->
        <script src="js/jquery.history.js"></script>
        <!-- application script for Charisma demo -->
        <script src="js/charisma.js"></script>
    </form>
</body>

</html>
