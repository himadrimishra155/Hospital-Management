<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="UserType.aspx.cs" Inherits="UserType" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="Server">
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
                    <a href="#">User Type</a>
                </li>
            </ul>
        </div>

        <div class="row-fluid sortable ui-sortable">
            <div class="box span4" style="">
                <div class="box-header well">
                    <h2>Enter User Type </h2>

                </div>
                <div class="box-content">
                    <div class="form-horizontal">
                        <fieldset>
                            
                            <div class="control-group">
                                <label>User Type </label>
                                <div class="span12">
                                    <asp:TextBox ID="txtustype" class="span6 typeahead" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="control-group">
                                <asp:Button ID="btnsubmit" CssClass="btn btn-primary" runat="server" Text="Submit" OnClick="btnsubmit_Click" />

                            </div>
                        </fieldset>

                    </div>

                </div>
            </div>
            <!--/span-->

            <div class="box span8">
                <div class="box-header well" data-original-title="">
                    <h2><i class="icon-user"></i>User Type List</h2>

                </div>
                <div class="box-content">
                    <asp:GridView ID="gddisplay" OnRowCommand="gddisplay_RowCommand" CssClass="table-bordered" AutoGenerateColumns="false" runat="server" GridLines="None" Visible="True">
                                <Columns>
                                    <asp:BoundField DataField="id" HeaderText="ID" />
                                    <asp:BoundField DataField="usertype" HeaderText="UserType" />
                                    <asp:BoundField DataField="status" HeaderText="Status" />
                                    <asp:TemplateField HeaderText="Action">
                                        <ItemTemplate>
                                            <asp:Button ID="btnedit" runat="server" CommandName="edit" CommandArgument='<%#Eval("Id") %>' Text="Edit" />
                                            <asp:LinkButton ID="lbtnstatus" CommandName="updstatus" CommandArgument='<%#Eval("Id")+","+Eval("StatusId") %>' runat="server"><%#Eval("status") %>></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                </Columns>
                            </asp:GridView>

                </div>

            </div>
            <!--/span-->


        </div>
        <asp:Panel runat="server" class="row-fluid sortable ui-sortable" Visible="False">
            <div class="box span4" style="">
                <div class="box-header well">
                    <h2><i class="icon-th"></i>Update User Type</h2>

                </div>
                <div class="box-content">
                    <div class="form-horizontal">
                        <fieldset>
                            <div class="control-group">
                                <label>User Type </label>
                                <div class="span12">
                                    <asp:TextBox ID="txtupdtype" class="span6 typeahead" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="control-group">
                                <asp:Button ID="btnupdate" CssClass="btn btn-warning" runat="server" Text="Update" />

                            </div>
                        </fieldset>

                    </div>

                </div>
            </div>
            <!--/span-->


        </asp:Panel>
    </div>

</asp:Content>

