<%@ Page Title="" Language="C#" MasterPageFile="~/English/Main_Application/English.Master" AutoEventWireup="true" CodeBehind="Units_List.aspx.cs" Inherits="Main_Real_estate.English.Main_Application.Units_List1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script type="text/javascript">
        $(document).ready(function () {
            var table = $('.datatable').DataTable({
                dom: 'Bfrtip',
                /*lengthChange: false,*/
                "pageLength": 10000,
                buttons: [
                    'excelHtml5',
                    /*'pdfHtml5'*/
                ],
                language: {
                    url: 'https://cdn.datatables.net/plug-ins/1.12.1/i18n/en.json'
                }
            });

            table.buttons().container()
                .appendTo('#DataTables_Table_0_wrapper .col-md-6:eq(0)');
        });
     </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <style>
        .table-condensed tr th {
            border: 0px solid #fff;
            color: black;
            background-color: #cacff1;
        }

        .table-condensed, .table-condensed tr td {
            border: 0px solid #fff;
        }

        tr:nth-child(even) {
            background: #d7d7d7;
        }

        tr:nth-child(odd) {
            background: #e3e3e3;
        }
    </style>
    <%--***********************************************************************************************--%>
    <!-- Container Fluid-->
   <div class="container-fluid" id="container-wrapper">
        <div class="row">
            <div class="col-lg-2 mb-3">
                <h1 class="h3 mb-0 text-gray-800">
                    <asp:Label ID="lbl_titel_Unit_List" runat="server" Text="قائمة الوحدات"></asp:Label>
                </h1>
            </div>
            <div class="col-lg-3 mb-3">
                <asp:LinkButton ID="Add" CssClass="btn btn-primary" runat="server" PostBackUrl="~/English/Main_Application/Add_Unit.aspx" >
                    <i class="fa fa-plus" style="font-size:25px;"></i> &nbsp; إضافة وحدة جديدة</asp:LinkButton>

            </div>
        </div>

        <div class="row">
        <div class="col-lg-12 mb-4">
            <!-- Simple Tables -->
            <div class="card">
                <div class="table-responsive" id="Grid" >
                    <asp:Repeater ID="eeeee" runat="server" ClientIDMode="Static" OnItemDataBound="eeeee_ItemDataBound">
                        <HeaderTemplate>
                            <table  cellspacing="0" style="width: 100%; font-size:11px" class="datatable table table-striped table-bordered">
                                <thead>
                                    <th style="vertical-align: middle;">#</th>
                                    <th style="vertical-align: middle;"><asp:Label ID="lbl_owner_ship_Code" runat="server" /></th>
                                    <th style="vertical-align: middle;"><asp:Label ID="lbl_Owner_Ship_Name" runat="server" /></th>
                                    <th style="vertical-align: middle;"><asp:Label ID="lbl_Building_Name" runat="server" /></th>
                                    <th style="vertical-align: middle;"><asp:Label ID="lbl_Titel_Unit_Number" runat="server" /></th>
                                    <th style="vertical-align: middle;"><asp:Label ID="lbl_Titel_Unit_Space" runat="server" /></th>
                                    <th style="vertical-align: middle;"><asp:Label ID="lbl_Titel_Floor_Number" runat="server" /></th>
                                    <th style="vertical-align: middle;"><asp:Label ID="lbl_Titel_current_situation" runat="server" /></th>
                                    <th style="vertical-align: middle;"><asp:Label ID="lbl_Unit_Type" runat="server" /></th>
                                    <th style="vertical-align: middle;"><asp:Label ID="lbl_Unit_Condition" runat="server" /></th>
                                    <th style="vertical-align: middle;"><asp:Label ID="lbl_Titel_virtual_Value" runat="server" /></th>
                                    <th style="vertical-align: middle;"><asp:Label ID="lbl_Unit_Detail" runat="server" /></th>
                                    <th style="width:50px"></th>
                                </thead>
                            <tbody>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                                <td><asp:Label ID="lblRowNumber" Text='<%# Container.ItemIndex + 1 %>' runat="server" /></td>
                                 <td><asp:Label ID="lbl_owner_ship_Code" runat="server" Text='<%# Eval("owner_ship_Code") %>' /></td>
                                <td>
                                    <asp:Label ID="lbl_Owner_Ship_AR_Name" runat="server" Text='<%# Eval("Owner_Ship_AR_Name") %>' />
                                    <asp:Label ID="lbl_Owner_Ship_EN_Name" runat="server" Text='<%# Eval("Owner_Ship_EN_Name") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="lbl_Building_Arabic_Name" runat="server" Text='<%# Eval("Building_Arabic_Name") %>' />
                                    <asp:Label ID="lbl_Building_English_Name" runat="server" Text='<%# Eval("Building_English_Name") %>' />
                                </td>

                                <td><asp:Label ID="lbl_Unit_number" runat="server" Text='<%# Eval("Unit_Number") %>' /></td>
                                <td><asp:Label ID="lbl_Unit_Space" runat="server" Text='<%# Eval("Unit_Space") %>' /></td>
                                <td><asp:Label ID="lbl_Floor_Number" runat="server" Text='<%# Eval("Floor_Number") %>' /></td>
                                <td><asp:Label ID="lbl_current_situation" runat="server" Text='<%# Eval("current_situation") %>' /></td>
                                <td>
                                    <asp:Label ID="lbl_Unit_Arabic_Type" runat="server" Text='<%# Eval("Unit_Arabic_Type") %>' />
                                    <asp:Label ID="lbl_Unit_English_Type" runat="server" Text='<%# Eval("Unit_English_Type") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="lbl_Unit_Arabic_Condition" runat="server" Text='<%# Eval("Unit_Arabic_Condition") %>' />
                                    <asp:Label ID="lbl_Unit_English_Condition" runat="server" Text='<%# Eval("Unit_English_Condition") %>' />
                                </td>
                                <td><asp:Label ID="lbl_virtual_Value" runat="server" Text='<%# Eval("virtual_Value") %>' /></td>
                                <td>
                                    <asp:Label ID="lbl_Unit_Arabic_Detail" runat="server" Text='<%# Eval("Unit_Arabic_Detail") %>' />
                                    <asp:Label ID="lbl_Unit_English_Detail" runat="server" Text='<%# Eval("Unit_English_Detail") %>' />
                                </td>
                                
                                <td>
                                    <asp:LinkButton ID="Edit" ForeColor="#0779c9" runat="server" CommandArgument='<%# Eval("Unit_Id") %>' OnClick="Edit_Unit" > <i class="fa fa-pencil" style="font-size:18px;"></i> </asp:LinkButton>
                                    &nbsp;&nbsp;
                                    <asp:LinkButton ForeColor="#0779c9" runat="server" CommandArgument='<%# Eval("Unit_Id") %>' OnClick="Details_Unit" > <i class="fa fa-list" style="font-size:18px;"></i> </asp:LinkButton>
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
