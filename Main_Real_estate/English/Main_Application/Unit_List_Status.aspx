<%@ Page Title="" Language="C#" MasterPageFile="~/English/Main_Application/English.Master" AutoEventWireup="true" CodeBehind="Unit_List_Status.aspx.cs" Inherits="Main_Real_estate.English.Main_Application.Unit_List_Status" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script type="text/javascript">
        $(document).ready(function () {
            var table = $('.datatable').DataTable({
                dom: 'Bfrtip',
                /*lengthChange: false,*/
                "pageLength": 10000,
                buttons: [
                    'copyHtml5',
                    'excelHtml5',
                    'csvHtml5',
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
        table, th, td {
            border: 1px solid black;
            border-collapse: collapse;
            text-align: center
        }
        th{
            background-color:#cacff1;
        }
    </style>
    <%------------------------------------------------------------------------------------------------------------------------------------------%>
        <!-- Container Fluid-->
   <div class="container-fluid" id="container-wrapper">
        <div class="row">
            <div class="col-lg-3 mb-3">
                <asp:LinkButton CssClass="btn btn-light mb-1" runat="server" PostBackUrl="~/English/Main_Application/DashBoard.aspx" >Back To Dashboard</asp:LinkButton>

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

                                    <th><asp:Label ID="lbl_Titel_Unit_NO" runat="server"/></th><%--رقم الوحدة--%>
                                    <th><asp:Label ID="lbl_Titel_Unit_Space" runat="server"/></th><%--مساحة الوحدة--%>
                                    <th><asp:Label ID="lbl_Titel_Floor_Number" runat="server"/></th><%--رقم الطابق--%>
                                    <th><asp:Label ID="lbl_Titel_current_situation" runat="server"/></th><%--الوضع الحالي--%>
                                    <th><asp:Label ID="lbl_Titel_Unit_Type" runat="server"/></th><%--نوع الوحدة--%>
                                    <th><asp:Label ID="lbl_Titel_Unit_Condition" runat="server"/></th><%--الحالة الإيجارية--%>
                                    <th><asp:Label ID="lbl_Titel_virtual_Value" runat="server"/></th><%--القيمة الإفتراضية--%>
                                    <th style=" text-align: center;"><asp:Label ID="lbl_Titel_Unit_Detail" runat="server"/></th><%--تفاصيل الوحدة--%>
                                    <th><asp:Label ID="lbl_Titel_Owner_Ship" runat="server"/></th><%--اسم الملكية--%>
                                    <th><asp:Label ID="lbl_Titel_Building" runat="server"/></th><%--اسم البناء--%>
                                </thead>
                            <tbody>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                                <td>
                                    <asp:Label ID="lbl_Unit_number" runat="server" Text='<%# Eval("Unit_Number") %>' /></td>
                                <td>
                                    <asp:Label ID="lbl_Unit_Space" runat="server"  Text='<%# Eval("Unit_Space") %>'/></td>
                                <td>
                                    <asp:Label ID="lbl_Floor_Number" runat="server" Text='<%# Eval("Floor_Number") %>' /></td>
                                <td>
                                    <asp:Label ID="lbl_current_situation" runat="server" Text='<%# Eval("current_situation") %>' /></td>
                                <td>
                                    <asp:Label ID="lbl_Unit_Arabic_Type" runat="server" Text='<%# Eval("Unit_Arabic_Type") %>' />
                                    <asp:Label ID="lbl_Unit_English_Type" runat="server" Text='<%# Eval("Unit_English_Type") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="lbl_Unit_Arabic_Condition" runat="server" Text='<%# Eval("Unit_Arabic_Condition") %>' />
                                    <asp:Label ID="lbl_Unit_English_Condition" runat="server" Text='<%# Eval("Unit_English_Condition") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="lbl_virtual_Value" runat="server" Text='<%# Eval("virtual_Value") %>' /></td>
                                <td>
                                    <asp:Label ID="lbl_Unit_Arabic_Detail" runat="server" Text='<%# Eval("Unit_Arabic_Detail") %>' />
                                    <asp:Label ID="lbl_Unit_English_Detail" runat="server" Text='<%# Eval("Unit_English_Detail") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="lbl_Owner_Ship_AR_Name" runat="server" Text='<%# Eval("Owner_Ship_AR_Name") %>' />
                                    <asp:Label ID="lbl_Owner_Ship_EN_Name" runat="server" Text='<%# Eval("Owner_Ship_EN_Name") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="lbl_Building_Arabic_Name" runat="server" Text='<%# Eval("Building_Arabic_Name") %>' />
                                    <asp:Label ID="lbl_Building_English_Name" runat="server" Text='<%# Eval("Building_English_Name") %>' />
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
