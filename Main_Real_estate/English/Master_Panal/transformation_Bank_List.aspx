<%@ Page Title="" Language="C#" MasterPageFile="~/English/Master_Panal/Admin_Panel.Master" AutoEventWireup="true" CodeBehind="transformation_Bank_List.aspx.cs" Inherits="Main_Real_estate.English.Master_Panal.transformation_Bank_List" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.js"></script>
    <script src="../JS/DataTableScript.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="../CSS/DataTableCss.css" rel="stylesheet" />
     <!-- Container Fluid-->
    <div class="container-fluid" id="container-wrapper">
        <div class="col-lg-4">
                <h1 class="h3 mb-0 text-gray-800">
                    <asp:Label ID="lbl_titel" runat="server" Text="قائمة حالات الأوصل"></asp:Label>
                </h1>
            </div>
            <div class="col-lg-4">
                <asp:LinkButton ID="ADD" CssClass="btn btn-primary" runat="server" OnClick="Unnamed_ServerClick"></asp:LinkButton>
            </div>

        <div class="row">
            <div class="col-lg-12 mb-4">
                <!-- Simple Tables -->
                <div class="card">
                    <div class="table-responsive" style="border-radius: 10px;" id="Grid">
                        <asp:Repeater ID="The_Table" runat="server" ClientIDMode="Static" OnItemDataBound="The_Table_ItemDataBound">
                        <HeaderTemplate>
                            <table  cellspacing="0" style="width: 100%; font-size:11px" id="Table" class="datatable table table-striped table-bordered">
                                <thead>
                                    <th><asp:Label ID="lbl_1" runat="server"/></th>
                                    <th><asp:Label ID="lbl_2" runat="server"/></th>
                                    <th><asp:Label ID="lbl_3" runat="server"/></th>
                                    <th><asp:Label ID="lbl_4" runat="server"/></th>
                                    <th><asp:Label ID="lbl_5" runat="server"/></th>
                                    <th><asp:Label ID="lbl_6" runat="server"/></th>
                                    <th><asp:Label ID="lbl_7" runat="server"/></th>
                                    <th></th>
                                </thead>
                            <tbody>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                                <td> <asp:Label ID="lbl_Bank_No" runat="server" Text='<%# Eval("Bank_No") %>' /></td>
                                <td> 
                                    <asp:Label ID="lbl_AR_Bank_Name" runat="server" Text='<%# Eval("Bank_Name") %>' />
                                    <asp:Label ID="lbl_EN_Bank_Name" runat="server" Text='<%# Eval("Bank_Name_En") %>' />

                                </td>
                                <td> <asp:Label ID="lbl_Account_No" runat="server" Text='<%# Eval("Account_No") %>' /></td>
                                <td> <asp:Label ID="lbl_Soaft_Code_No" runat="server" Text='<%# Eval("Soaft_Code_No") %>' /></td>
                                <td> 
                                    <asp:Label ID="lbl_AR_Bank_Adress" runat="server" Text='<%# Eval("Bank_Adress") %>' />
                                    <asp:Label ID="lbl_EN_Bank_Adress" runat="server" Text='<%# Eval("Bank_Adress_En") %>' />
                                </td>
                                <td> 
                                    <asp:Label ID="lbl_AR_currency_type" runat="server" Text='<%# Eval("currency_type") %>' />
                                    <asp:Label ID="lbl_EN_currency_type" runat="server" Text='<%# Eval("currency_type_En") %>' />
                                </td>
                                <td> 
                                    <asp:Label ID="lbl_AR_Beneficiary_Name" runat="server" Text='<%# Eval("Beneficiary_Name") %>' />
                                    <asp:Label ID="lbl_EN_Beneficiary_Name" runat="server" Text='<%# Eval("Beneficiary_Name_En") %>' />
                                </td>
                                <td>
                                    <asp:LinkButton  runat="server" CommandArgument='<%# Eval("transformation_Bank_ID") %>' OnClientClick="return confirm('هل أنت متأكد أنك تريد حذف؟');" OnClick="btn_Bank_Delete_Click" ><i class="fa fa-trash" style="font-size:18px;"></i></asp:LinkButton>
                                    <asp:LinkButton  runat="server" CommandArgument='<%# Eval("transformation_Bank_ID") %>' OnClick="Edit"> <i class="fa fa-pencil" style="font-size:18px;"></i> </asp:LinkButton>
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
