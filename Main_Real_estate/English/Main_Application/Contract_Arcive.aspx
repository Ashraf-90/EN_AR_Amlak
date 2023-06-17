<%@ Page Title="" Language="C#" MasterPageFile="~/English/Main_Application/English.Master" AutoEventWireup="true" CodeBehind="Contract_Arcive.aspx.cs" Inherits="Main_Real_estate.English.Main_Application.Contract_Arcive" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">

        $(document).ready(function () {

            /*This will hide the icons if there is no URL*/
            /*If there is no files, URL will say "No File"*/
            $('a[href*="No File"]').each(function () {
                $(this).css('display', 'none');
            });


            var table = $('.datatable').DataTable({
                dom: '',
                "pageLength": 10000,
                buttons: [
                    /* 'copyHtml5',*/
                    'excelHtml5',
                    /*'csvHtml5',*/
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
            text-align: center !important;
            font-size: 12px;
             padding: 10px !important;         
        }
th{
            background-color:#52a2da;
            color: #fff;
            text-align:center;
        }
        .UUL {
            list-style-type: none;
            margin: auto;
            padding: 0;
            overflow: hidden;
            background-color: #52a2da;
            border-radius: .375rem .375rem 0 0;
        }

        .UUL li {
            float: right;
        }

       .UUL li a {
                display: block;
                color: white;
                text-align: center;
                padding-left: 50px;
                padding-right: 15px;
                padding-top: 16px;
                padding-bottom: 16px;
                text-decoration: none;
            }
       .UUL li a:hover{
           background-color: #61aadd;
            color: #fff;
       }
    
        table, th, td {
            border: 1px solid black;
            border-collapse: collapse;
            text-align: center
        }

        th {
            background-color: #52a2da;
        }
    </style>

   <div class="container-fluid" id="container-wrapper">

    <div class="row">
            <div class="col-lg-12 mb-4">
                <!-- Simple Tables -->
                <div class="card">
                 
                    <div class="table-responsive" id="Grid" >
    <ul class="UUL">
        <li><a runat="server" id="A_1" onserverclick="A_1_ServerClick"><asp:Label ID="lbl_A_1" runat="server"/></a></li>
        <li><a runat="server" id="A_2" onserverclick="A_2_ServerClick"><asp:Label ID="lbl_A_2" runat="server"/></a></li>
        <li><a runat="server" id="A_3" onserverclick="A_3_ServerClick"><asp:Label ID="lbl_A_3" runat="server"/></a></li>
    </ul>
    <br />
    <div class="container-fluid">

        <h2><asp:Label ID="lbl_titel_Contracts_List" runat="server"  Text=" أرشيف كافة العقود"></asp:Label></h2>
    </div>
    <br />
    <div class="card">

    </div>
    <div class="container-fluid" runat="server" id="OS_Arcive">
        <div class="row">
            <div class="row">
                <div class="col-lg-12 mb-4">
                    <!-- Simple Tables -->
                    <asp:Repeater ID="Ownership_GridView" runat="server" ClientIDMode="Static" OnItemDataBound="Ownership_GridView_ItemDataBound">
                        <HeaderTemplate>
                            <table cellspacing="0" style="width: 100%; font-size: 12px" class="datatable table table-striped table-bordered">
                                <thead>
                                    <th style="text-align: center;">#</th>
                                    <th style="text-align: center;"><asp:Label ID="lbl_User_Name" runat="server"/></th><%--المستخدم--%>
                                    <th style="text-align: center;"><asp:Label ID="lbl_Delete_Name" runat="server"/></th><%--تاريخ الحذف--%>
                                    <th style="text-align: center;"><asp:Label ID="lbl_Property" runat="server"/></th><%--الملكية--%>
                                    <th style="text-align: center"><asp:Label ID="lbl_Property_Code" runat="server"/></th><%--رمز--%>
                                    <th style="text-align: center;"><asp:Label ID="lbl_Building" runat="server"/></th><%--بناء--%>
                                    <th style="text-align: center;"><asp:Label ID="lbl_Unit" runat="server"/></th><%--وحدة--%>
                                    <th style="text-align: center;"><asp:Label ID="lbl_Start" runat="server"/></th><%--بدء--%>
                                    <th style="text-align: center;"><asp:Label ID="lbl_End" runat="server"/></th><%--إنتهاء--%>
                                    <th style="text-align: center;"><asp:Label ID="lbl_Amount" runat="server"/></th><%--قيمة--%>
                                    <th style="text-align: center;"><asp:Label ID="lbl_Resone" runat="server"/></th><%--سبب--%>
                                </thead>
                                <tbody>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                                <td><asp:Label ID="lblRowNumber" Text='<%# Container.ItemIndex + 1 %>' runat="server" /></td>
                                <td>
                                    <asp:Label ID="lbl_Users_Ar_First_Name" runat="server" Text='<%# Eval("Users_Ar_First_Name") %>' />
                                    <asp:Label ID="lbl_Users_Name" runat="server" Text='<%# Eval("Users_Name") %>' />
                                </td>
                                <td><asp:Label ID="lbl_owner_ship_Code" runat="server" Text='<%# Eval("Delete_Date") %>' /></td>
                                <td>
                                    <asp:Label ID="lbl_Owner_Ship_AR_Name" runat="server" Text='<%# Eval("Owner_Ship_AR_Name") %>' />
                                    <asp:Label ID="lbl_Owner_Ship_EN_Name" runat="server" Text='<%# Eval("Owner_Ship_EN_Name") %>' />
                                </td>
                                <td><asp:Label ID="lbl_Owner_Arabic_name" runat="server" Text='<%# Eval("owner_ship_Code") %>' /></td>
                                <td>
                                    <asp:Label ID="lbl_Building_Arabic_Name" runat="server" Text='<%# Eval("Building_Arabic_Name") %>' />
                                    <asp:Label ID="lbl_Building_English_Name" runat="server" Text='<%# Eval("Building_English_Name") %>' />
                                </td>
                                <td><asp:Label ID="lbl_Parcel_Area" runat="server" Text='<%# Eval("Unit_Number") %>' /></td>
                                <td><asp:Label ID="lbl_Bond_NO" runat="server" Text='<%# Eval("Start_Date") %>' /></td>
                                <td><asp:Label ID="Label1" runat="server" Text='<%# Eval("End_Date") %>' /></td>
                                <td><asp:Label ID="Label2" runat="server" Text='<%# Eval("Payment_Amount") %>' /></td>
                                <td><asp:Label ID="lbl_Unit_Type" runat="server" Text='<%# Eval("Reason_Delete") %>' /></td>
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
    <%--*******************************************************************************************--%>
    <div class="container-fluid" runat="server" id="B_Arcive">
        <div class="row">
            <div class="row">
                <div class="col-lg-12 mb-4">
                    <!-- Simple Tables -->

                    <asp:Repeater ID="Building_GridView" runat="server" ClientIDMode="Static" OnItemDataBound="Building_GridView_ItemDataBound">
                        <HeaderTemplate>
                            <table cellspacing="0" style="width: 100%; font-size: 12px" class="datatable table table-striped table-bordered">
                                <thead>
                                    <th style="text-align: center;">#</th>
                                    <th style="text-align: center;"><asp:Label ID="lbl_User_Name" runat="server"/></th><%--المستخدم--%>
                                    <th style="text-align: center;"><asp:Label ID="lbl_Delete_Name" runat="server"/></th><%--تاريخ الحذف--%>
                                    <th style="text-align: center;"><asp:Label ID="lbl_Property" runat="server"/></th><%--الملكية--%>
                                    <th style="text-align: center"><asp:Label ID="lbl_Property_Code" runat="server"/></th><%--رمز--%>
                                    <th style="text-align: center;"><asp:Label ID="lbl_Building" runat="server"/></th><%--بناء--%>
                                    <th style="text-align: center;"><asp:Label ID="lbl_Start" runat="server"/></th><%--بدء--%>
                                    <th style="text-align: center;"><asp:Label ID="lbl_End" runat="server"/></th><%--إنتهاء--%>
                                    <th style="text-align: center;"><asp:Label ID="lbl_Amount" runat="server"/></th><%--قيمة--%>
                                    <th style="text-align: center;"><asp:Label ID="lbl_Resone" runat="server"/></th><%--سبب--%>
                                </thead>
                                <tbody>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                                <td><asp:Label ID="lblRowNumber" Text='<%# Container.ItemIndex + 1 %>' runat="server" /></td>
                                <td>
                                    <asp:Label ID="lbl_Users_Ar_First_Name" runat="server" Text='<%# Eval("Users_Ar_First_Name") %>' />
                                    <asp:Label ID="lbl_Users_Name" runat="server" Text='<%# Eval("Users_Name") %>' />
                                </td>
                                <td><asp:Label ID="lbl_owner_ship_Code" runat="server" Text='<%# Eval("Delete_Date") %>' /></td>
                                <td>
                                    <asp:Label ID="lbl_Owner_Ship_AR_Name" runat="server" Text='<%# Eval("Owner_Ship_AR_Name") %>' />
                                    <asp:Label ID="lbl_Owner_Ship_EN_Name" runat="server" Text='<%# Eval("Owner_Ship_EN_Name") %>' />
                                </td>
                                <td><asp:Label ID="lbl_Owner_Arabic_name" runat="server" Text='<%# Eval("owner_ship_Code") %>' /></td>
                                <td>
                                    <asp:Label ID="lbl_Building_Arabic_Name" runat="server" Text='<%# Eval("Building_Arabic_Name") %>' />
                                    <asp:Label ID="lbl_Building_English_Name" runat="server" Text='<%# Eval("Building_English_Name") %>' />
                                </td>
                                <td><asp:Label ID="lbl_Bond_NO" runat="server" Text='<%# Eval("Start_Date") %>' /></td>
                                <td><asp:Label ID="Label1" runat="server" Text='<%# Eval("End_Date") %>' /></td>
                                <td><asp:Label ID="Label2" runat="server" Text='<%# Eval("Payment_Amount") %>' /></td>
                                <td><asp:Label ID="lbl_Unit_Type" runat="server" Text='<%# Eval("Reason_Delete") %>' /></td>
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
                </div>
        </div>
</div>
</asp:Content>
