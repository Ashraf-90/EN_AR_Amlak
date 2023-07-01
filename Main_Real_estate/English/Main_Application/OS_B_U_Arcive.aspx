<%@ Page Title="" Language="C#" MasterPageFile="~/English/Main_Application/English.Master" AutoEventWireup="true" CodeBehind="OS_B_U_Arcive.aspx.cs" Inherits="Main_Real_estate.English.Main_Application.OS_B_U_Arcive" %>

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
        .UUL {
            list-style-type: none;
            margin: auto;
            padding: 0;
            overflow: hidden;
            background-color: #52a2da;
            display: flex;
        }

        li {
            float: right;
        }

            li a {
                display: block;
                color: #fff;
                text-align: center;
                padding-left: 50px;
                padding-right: 15px;
                padding-top: 16px;
                padding-bottom: 16px;
                text-decoration: none;
            }

            li a:hover{
                color: #fff;
            }
    </style>

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










    <ul class="UUL">
        <li><a runat="server" id="A_1" onserverclick="A_1_ServerClick"><asp:Label ID="lbl_Property" runat="server"/></a></li>
        <li><a runat="server" id="A_2" onserverclick="A_2_ServerClick"><asp:Label ID="lbl_Building" runat="server"/></a></li>
        <li><a runat="server" id="A_3" onserverclick="A_3_ServerClick"><asp:Label ID="lbl_Unit" runat="server"/></a></li>
        <li><a runat="server" id="A_4" onserverclick="A_4_ServerClick"><asp:Label ID="lbl_All" runat="server"/></a></li>
    </ul>
    <br />
    <div class="container-fluid" runat="server" id="OS_Arcive">
        <div class="row">
            <div class="col-lg-12 mb-3">
                <h1 class="h3 mb-0 text-gray-800">
                    <asp:Label ID="lbl_titel_Property" ForeColor="#52a2da" runat="server" Text=" أرشيف الملكيات"></asp:Label>
                </h1>
            </div>
            <br />


            <div class="row">
        <div class="col-lg-12 mb-4">
            <!-- Simple Tables -->
            <div class="card">
                <div class="table-responsive" id="Grid" >
                   <asp:Repeater ID="Ownership_GridView" runat="server" ClientIDMode="Static" OnItemDataBound="Ownership_GridView_ItemDataBound">
                                <HeaderTemplate>
                                    <table cellspacing="0" style="width: 100%; font-size: 15px" class="datatable table table-striped table-bordered">
                                        <thead>
                                            <th style="vertical-align: middle;">#</th>
                                            <th style="vertical-align: middle;"><asp:Label ID="lbl_Users_Ar_First_Name" runat="server" /></th>
                                            <th style="vertical-align: middle;"><asp:Label ID="lbl_Delete_Date" runat="server" /></th>
                                            <th style="vertical-align: middle;"><asp:Label ID="lbl_Owner_Ship_AR_Name" runat="server" /></th>
                                            <th style="vertical-align: middle;"><asp:Label ID="lbl_owner_ship_Code" runat="server" /></th>
                                            <th style="vertical-align: middle;"><asp:Label ID="lbl_Reason_Delete" runat="server" /></th>
                                        </thead>
                                        <tbody>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <tr>
                                        <td><asp:Label ID="lblRowNumber" Text='<%# Container.ItemIndex + 1 %>' runat="server" /></td>
                                        <td>
                                            <asp:Label ID="lbl_Users_Ar_First_Name" runat="server" Text='<%# Eval("Users_Ar_First_Name") %>' />
                                            <asp:Label ID="lbl_Users_EN_First_Name" runat="server" Text='<%# Eval("Users_Name") %>' />
                                        </td>
                                        <td><asp:Label ID="lbl_Delete_Date" runat="server" Text='<%# Eval("Delete_Date") %>' /></td>
                                        <td>
                                            <asp:Label ID="lbl_Owner_Ship_AR_Name" runat="server" Text='<%# Eval("Owner_Ship_AR_Name") %>' />
                                            <asp:Label ID="lbl_Owner_Ship_EN_Name" runat="server" Text='<%# Eval("Owner_Ship_EN_Name") %>' />
                                        </td>
                                        <td>
                                            <asp:Label ID="lbl_owner_ship_Code" runat="server" Text='<%# Eval("owner_ship_Code") %>' /></td>
                                        <td>
                                            <asp:Label ID="lbl_Reason_Delete" runat="server" Text='<%# Eval("Reason_Delete") %>' /></td>
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
        <hr />
    </div>
    <%--*******************************************************************************************--%>
    <div class="container-fluid" runat="server" id="B_Arcive">
        <div class="row">
            <div class="col-lg-6 mb-3">
                <h1 class="h3 mb-0 text-gray-800">
                    <asp:Label ID="lbl_titel_Builidng" ForeColor="#52a2da" runat="server" Text=" أرشيف الأبنية"></asp:Label>
                </h1>
            </div>


            <div class="row">
                <div class="col-lg-12 mb-4">
                    <!-- Simple Tables -->
                    <div class="card">
                        <div class="table-responsive">
                             <asp:Repeater ID="Building_Table" runat="server" ClientIDMode="Static" OnItemDataBound="Building_GridView_ItemDataBound">
                                <HeaderTemplate>
                                    <table cellspacing="0" style="width: 100%; font-size: 15px" class="datatable table table-striped table-bordered">
                                        <thead>
                                            <th style="vertical-align: middle;">#</th>
                                            <th style="vertical-align: middle;"><asp:Label ID="lbl_Users_Ar_First_Name" runat="server" /></th>
                                            <th style="vertical-align: middle;"><asp:Label ID="lbl_Delete_Date" runat="server" /></th>
                                            <th style="vertical-align: middle;"><asp:Label ID="lbl_Owner_Ship_AR_Name" runat="server" /></th>
                                            <th style="vertical-align: middle;"><asp:Label ID="lbl_owner_ship_Code" runat="server" /></th>
                                            <th style="vertical-align: middle;"><asp:Label ID="lbl_Building_Name" runat="server" /></th>
                                            <th style="vertical-align: middle;"><asp:Label ID="lbl_Building_NO" runat="server" /></th>
                                            <th style="vertical-align: middle;"><asp:Label ID="lbl_Reason_Delete" runat="server" /></th>
                                        </thead>
                                        <tbody>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <tr>
                                        <td><asp:Label ID="lblRowNumber" Text='<%# Container.ItemIndex + 1 %>' runat="server" /></td>
                                        <td>
                                            <asp:Label ID="lbl_Users_Ar_First_Name" runat="server" Text='<%# Eval("Users_Ar_First_Name") %>' />
                                            <asp:Label ID="lbl_Users_EN_First_Name" runat="server" Text='<%# Eval("Users_Name") %>' />
                                        </td>
                                        <td><asp:Label ID="lbl_Delete_Date" runat="server" Text='<%# Eval("Delete_Date") %>' /></td>
                                        <td>
                                            <asp:Label ID="lbl_Owner_Ship_AR_Name" runat="server" Text='<%# Eval("Owner_Ship_AR_Name") %>' />
                                            <asp:Label ID="lbl_Owner_Ship_EN_Name" runat="server" Text='<%# Eval("Owner_Ship_EN_Name") %>' />
                                        </td>
                                        <td><asp:Label ID="lbl_owner_ship_Code" runat="server" Text='<%# Eval("owner_ship_Code") %>' /></td>


                                        <td>
                                            <asp:Label ID="lbl_Building_Arabic_Name" runat="server" Text='<%# Eval("Building_Arabic_Name") %>' />
                                            <asp:Label ID="lbl_Building_English_Name" runat="server" Text='<%# Eval("Building_English_Name") %>' />
                                        </td>
                                        <td><asp:Label ID="lbl_Building_NO" runat="server" Text='<%# Eval("Building_NO") %>' /></td>

                                        <td><asp:Label ID="lbl_Reason_Delete" runat="server" Text='<%# Eval("Reason_Delete") %>' /></td>
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
        <hr />
    </div>
    <%--*******************************************************************************************--%>
    <div class="container-fluid" runat="server" id="U_Arcive">
        <div class="row">
            <div class="col-lg-6 mb-3">
                <h1 class="h3 mb-0 text-gray-800">
                    <asp:Label ID="lbl_titel_unit" ForeColor="#52a2da" runat="server" Text=" أرشيف الوحدات"></asp:Label>
                </h1>
            </div>


            <div class="row">
                <div class="col-lg-12 mb-4">
                    <!-- Simple Tables -->
                    <div class="card">
                        <div class="table-responsive">



                            <asp:Repeater ID="Unit_Table" runat="server" ClientIDMode="Static" OnItemDataBound="Unit_Table_ItemDataBound">
                                <HeaderTemplate>
                                    <table cellspacing="0" style="width: 100%; font-size: 15px" class="datatable table table-striped table-bordered">
                                        <thead>
                                            <th style="vertical-align: middle;">#</th>
                                            <th style="vertical-align: middle;"><asp:Label ID="lbl_Users_Ar_First_Name" runat="server" /></th>
                                            <th style="vertical-align: middle;"><asp:Label ID="lbl_Delete_Date" runat="server" /></th>
                                            <th style="vertical-align: middle;"><asp:Label ID="lbl_Owner_Ship_AR_Name" runat="server" /></th>
                                            <th style="vertical-align: middle;"><asp:Label ID="lbl_owner_ship_Code" runat="server" /></th>
                                            <th style="vertical-align: middle;"><asp:Label ID="lbl_Building_Name" runat="server" /></th>
                                            <th style="vertical-align: middle;"><asp:Label ID="lbl_Building_NO" runat="server" /></th>
                                            <th style="vertical-align: middle;"><asp:Label ID="lbl_Unit_Number" runat="server" /></th>
                                            <th style="vertical-align: middle;"><asp:Label ID="lbl_Reason_Delete" runat="server" /></th>
                                        </thead>
                                        <tbody>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <tr>
                                        <td><asp:Label ID="lblRowNumber" Text='<%# Container.ItemIndex + 1 %>' runat="server" /></td>
                                        <td>
                                            <asp:Label ID="lbl_Users_Ar_First_Name" runat="server" Text='<%# Eval("Users_Ar_First_Name") %>' />
                                            <asp:Label ID="lbl_Users_EN_First_Name" runat="server" Text='<%# Eval("Users_Name") %>' />
                                        </td>
                                        <td><asp:Label ID="lbl_Delete_Date" runat="server" Text='<%# Eval("Delete_Date") %>' /></td>
                                        <td>
                                            <asp:Label ID="lbl_Owner_Ship_AR_Name" runat="server" Text='<%# Eval("Owner_Ship_AR_Name") %>' />
                                            <asp:Label ID="lbl_Owner_Ship_EN_Name" runat="server" Text='<%# Eval("Owner_Ship_EN_Name") %>' />
                                        </td>
                                        <td><asp:Label ID="lbl_owner_ship_Code" runat="server" Text='<%# Eval("owner_ship_Code") %>' /></td>


                                        <td>
                                            <asp:Label ID="lbl_Building_Arabic_Name" runat="server" Text='<%# Eval("Building_Arabic_Name") %>' />
                                            <asp:Label ID="lbl_Building_English_Name" runat="server" Text='<%# Eval("Building_English_Name") %>' />
                                        </td>
                                        <td><asp:Label ID="lbl_Building_NO" runat="server" Text='<%# Eval("Building_NO") %>' /></td>
                                        <td><asp:Label ID="Label4" runat="server" Text='<%# Eval("Unit_Number") %>' /></td>
                                        <td><asp:Label ID="lbl_Reason_Delete" runat="server" Text='<%# Eval("Reason_Delete") %>' /></td>
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
    </div>
</asp:Content>
