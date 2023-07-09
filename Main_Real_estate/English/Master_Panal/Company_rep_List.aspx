<%@ Page Title="" Language="C#" MasterPageFile="~/English/Master_Panal/Admin_Panel.Master" AutoEventWireup="true" CodeBehind="Company_rep_List.aspx.cs" Inherits="Main_Real_estate.English.Master_Panal.Company_rep_List" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.js"></script>
    <script src="../JS/DataTableScript.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <link href="../CSS/DataTableCss.css" rel="stylesheet" />
    <%--***********************************************************************************************--%>
    <!-- Container Fluid-->
    <div class="container-fluid" id="container-wrapper">
        <div class="row">
            <div class="col-lg-3">
                <h1 class="h3 mb-0 text-gray-800">
                    <asp:Label ID="lbl_titel" runat="server" Text="قائمة ممثلو الشركات"></asp:Label>
                </h1>
            </div>
            <div class="col-lg-4">
                <asp:LinkButton ID="ADD" CssClass="btn btn-primary" runat="server" PostBackUrl="~/English/Master_Panal/Add_company_rep.aspx" >
                    <i class="fa fa-plus" style="font-size:25px;"></i> &nbsp; إضافة </asp:LinkButton>

            </div>
        </div>
        <br /><br />

        <div class="row">
        <div class="col-lg-12 mb-4">
            <!-- Simple Tables -->
            <div class="card">
                <div class="table-responsive" id="Grid" >
                  
                    <asp:Repeater ID="eeeee" runat="server" ClientIDMode="Static" OnItemDataBound="eeeee_ItemDataBound">
                        <HeaderTemplate>
                            <table  cellspacing="0" style="width: 100%; font-size:11px" id="Table" class="datatable table table-striped table-bordered">
                                <thead>

                                    <th><asp:Label ID="lbl_1" runat="server"/></th>
                                    <th><asp:Label ID="lbl_2" runat="server"/></th>
                                    <th><asp:Label ID="lbl_3" runat="server"/></th>
                                    <th><asp:Label ID="lbl_4" runat="server"/></th>
                                    <th><asp:Label ID="lbl_5" runat="server"/></th>
                                    <th style="width:200px"></th>
                                </thead>
                            <tbody>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                                <td>
                                    <asp:Label ID="lbl_Com_rep_AR_Name" runat="server" Text='<%# Eval("Com_rep_En_Name") %>' />
                                    <asp:Label ID="lbl_Com_rep_En_Name" runat="server" Text='<%# Eval("Com_rep_AR_Name") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="lbl_Arabic_nationality" runat="server" Text='<%# Eval("Arabic_nationality") %>' />
                                    <asp:Label ID="lbl_English_nationality" runat="server" Text='<%# Eval("English_nationality") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="lbl_Com_rep_Mobile" runat="server" Text='<%# Eval("Com_rep_Mobile") %>' /></td>
                                <td>
                                    <asp:Label ID="lbl_Com_rep_Email" runat="server" Text='<%# Eval("Com_rep_Email") %>' /></td>
                                <td>
                                    <asp:Label ID="lbl_Com_rep_QID_NO" runat="server" Text='<%# Eval("Com_rep_QID_NO") %>' /></td>
                                
                                
                                
                                <td>
                                    <asp:LinkButton  runat="server" CommandArgument='<%# Eval("Company_representative_Id") %>' OnClientClick="return confirm('هل أنت متأكد أنك تريد حذف؟');" OnClick="Delete_Unit" ><i class="fa fa-trash" style="font-size:18px;"></i></asp:LinkButton>
                                    &nbsp;&nbsp;
                                    <asp:LinkButton  runat="server" CommandArgument='<%# Eval("Company_representative_Id") %>' OnClick="Edit_Unit" > <i class="fa fa-pencil" style="font-size:18px;"></i> </asp:LinkButton>
                                    &nbsp;&nbsp;
                                    <asp:LinkButton  runat="server" CommandArgument='<%# Eval("Company_representative_Id") %>' OnClick="Details_Unit" > <i class="fa fa-list" style="font-size:18px;"></i> </asp:LinkButton>
                                </td>
                            </tr>
                        </ItemTemplate>
                        <FooterTemplate>
                            </tbody>
                            </table>
                        </FooterTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </div>
    </div>
</div>
    <!---Container Fluid-->
</asp:Content>
