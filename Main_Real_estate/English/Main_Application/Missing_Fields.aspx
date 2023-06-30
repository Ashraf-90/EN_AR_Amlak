<%@ Page Title="" Language="C#" MasterPageFile="~/English/Main_Application/English.Master" AutoEventWireup="true" CodeBehind="Missing_Fields.aspx.cs" Inherits="Main_Real_estate.English.Main_Application.Missing_Fields" %>

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

            .right-spaced{
               
             }
            table{
                width: 100%;
                table-layout: fixed;
                overflow: scroll;
            }

          table, th, td {
           border: 1px solid #ddd;
            font-size: 13px;
            text-align: center !important;
            padding: 10px !important;
            
        }

       
        th{
            background-color:#52a2da;
            color: #fff;
            text-align:center;
        }
        .table-condensed tr th {
            border: 0px solid #fff;
            color: #fff;
            background-color: #52a2da;
        }

        .table-condensed, .table-condensed tr td {
            border: 0px solid #fff;
        }

        tr:nth-child(even) {
            background:  #f0f0f3;
        }

        tr:nth-child(odd) {
            background: #fff;
        }

        .calendarMonthStyle, .calendarMonthStyle tr:nth-child(odd), .calendarMonthStyle tr:nth-child(even){
            background-color: #37bc9b; 
            border: solid 1px #37bc9b;
            font-weight: bold;
            font-size: 14px;
            color: #ffffff;
           padding: 0px;
           text-align: center

        }

    </style>
    <%-----------------------------------------------------------------------------------------------------------%>
<div class="container-fluid" id="container-wrapper">
      <div class="row">
            <div class="col-lg-12 mb-3">
                <h1 class="h3 mb-0 text-gray-800">
                    <asp:Label ID="lbl_titel_Missing_Fields_List" runat="server" Text="كشف نواقص"></asp:Label>
                </h1>
            </div>
        </div>
          <div class="row">
            <div class="col-lg-12 mb-4">
                <!-- Simple Tables -->
                <div class="card">
                 
                    <div  id="Grid" >
                        <ul class="UUL">
                            <li><a runat="server" id="A_1" onserverclick="A_1_ServerClick"><asp:Label ID="lbl_Properties" runat="server"/></a></li>
                            <li><a runat="server" id="A_2" onserverclick="A_2_ServerClick"><asp:Label ID="lbl_Buildings" runat="server"/></a></li>
                            <li><a runat="server" id="A_3" onserverclick="A_3_ServerClick"><asp:Label ID="lbl_units" runat="server"/></a></li>
                            <li><a runat="server" id="A_4" onserverclick="A_4_ServerClick"><asp:Label ID="lbl_All" runat="server"/></a></li>
                            <li style="margin-right: 200px">
                                
                            </li>
                        </ul>

                        <br />

                        <div class="row" style="padding: 20px">
                             <div class="col-lg-12">
                                  <div class="form-group"> 
                                    <asp:Label ID="Label3" runat="server" Text="فرز حسب معلومات / مرفقات / الكل"></asp:Label><br />
                                    <asp:DropDownList ID="Filter_DropDownList" runat="server" Width="300px" AutoPostBack="true" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                                    <asp:ListItem Value="1" Text="الكل"></asp:ListItem>
                                    <asp:ListItem Value="2" Text="معلومات"></asp:ListItem>
                                    <asp:ListItem Value="3" Text="مرفقات"></asp:ListItem>
                                </asp:DropDownList>

                                  </div>
                            </div>
                            
                        </div>
                        <div class="container-fluid" runat="server" id="OS_Arcive">
        <div class="row">
            <div class="col-lg-12 mb-3">
                <h1 class="h3 mb-0 text-gray-800">
                    <asp:Label ID="lbl_titel_Proreties_Missing_Fields" runat="server" ForeColor="#52a2da" Text="كشف نواقص الملكيات"></asp:Label>
                </h1>
            </div>
        </div>
        <br />
        <div class="row">
            <div class="col-lg-12" runat="server" id="Ownership_Info_Div" visible="false">
                <h5><asp:Label ID="lbl_Info" runat="server"/></h5>
                <!-- Simple Tables -->
                <asp:Repeater ID="Ownership_Info_List" runat="server" ClientIDMode="Static" OnItemDataBound="Ownership_Info_List_ItemDataBound">
                    <HeaderTemplate>
                        <table cellspacing="0"  style="font-size: 15px"  class="datatable table table-striped table-bordered">
                            <thead>
                                <th style="width:5px">#</th>
                                <th><asp:Label ID="lbl_titel_Property_Name" runat="server"/></th><%--اسم الملكية--%>
                                <th><asp:Label ID="lbl_titel_Property_Code" runat="server"/></th><%--رمز الملكية--%>
                                <th style="text-align:center"><asp:Label ID="lbl_titel_BIN" runat="server"/></th><%--رقم مساحي--%>
                                <th style="text-align:center"><asp:Label ID="lbl_titel_Area" runat="server"/></th><%--مسااحة--%>
                                <th style="text-align:center"><asp:Label ID="lbl_titel_Street_Name" runat="server"/></th><%--اسم الشارع--%>
                                <th style="text-align:center"><asp:Label ID="lbl_titel_Street_NO" runat="server"/></th><%--رقم الشارع--%>
                                <th style="text-align:center"><asp:Label ID="lbl_titel_Bond_Date" runat="server"/></th><%--تاريخ السند--%>
                                
                            </thead>
                            <tbody>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr id="row" runat="server">
                            <td> <asp:Label ID="lblRowNumber" Text='<%# Container.ItemIndex + 1 %>' runat="server" /></td>
                            <td>
                                <asp:LinkButton ID="LinK_Owner_Ship_Arabic_Name" runat="server" CommandArgument='<%# Eval("Owner_Ship_Id") %>' OnClick="LinK_Owner_Ship_Arabic_Name_Click"
                                    Text='<%# Eval("Owner_Ship_AR_Name") %>'></asp:LinkButton>

                                <asp:LinkButton ID="LinK_Owner_Ship_English_Name" runat="server" CommandArgument='<%# Eval("Owner_Ship_Id") %>' OnClick="LinK_Owner_Ship_Arabic_Name_Click"
                                    Text='<%# Eval("Owner_Ship_EN_Name") %>'></asp:LinkButton>

                            </td>
                            <td>
                                <asp:Label ID="lbl_owner_ship_Code" ForeColor="#52a2da" runat="server" Text='<%# Eval("owner_ship_Code") %>' /></td>
                            <td>
                                <asp:Label ID="lbl_Bond_NO" runat="server" Text='<%# Eval("R_Bond_NO") %>' /></td>
                            <td>
                                <asp:Label ID="lbl_Parcel_Area" runat="server" Text='<%# Eval("R_Parcel_Area") %>' /></td>
                            <td>
                                <asp:Label ID="lbl_Street_Name" runat="server" Text='<%# Eval("R_Street_Name") %>' /></td>
                            <td>
                                <asp:Label ID="lbl_Street_NO" runat="server" Text='<%# Eval("R_Street_NO") %>' /></td>
                            <td>
                                <asp:Label ID="lbl_Bond_Date" runat="server" Text='<%# Eval("R_Bond_Date") %>' /></td>
                        </tr>
                    </ItemTemplate>
                    <FooterTemplate>
                        </tbody>
                            </table>
                    </FooterTemplate>
                </asp:Repeater>
            </div>



            <div class="col-lg-12" runat="server" id="Ownership_Att_Div" visible="false">
                 <h5><asp:Label ID="lbl_Att" runat="server"/></h5>
                <!-- Simple Tables -->
                <asp:Repeater ID="Ownership_Att_List" runat="server" ClientIDMode="Static" OnItemDataBound="Ownership_Att_List_ItemDataBound">
                    <HeaderTemplate>
                        <table cellspacing="0" cellpadding="0"  style="font-size: 15px" class="datatable table table-striped table-bordered">
                            <thead>
                                <th style="width:5px">#</th>
                                <th><asp:Label ID="lbl_titel_Property_Name" runat="server"/></th><%--اسم الملكية--%>
                                <th><asp:Label ID="lbl_titel_Property_Code" runat="server"/></th><%--رمز الملكية--%>
                                <th style="text-align:center"><asp:Label ID="lbl_titel_Property_Bond" runat="server"/></th><%--سند الملكية--%>
                                <th style="text-align:center"><asp:Label ID="lbl_titel_Property_Scheme" runat="server"/></th><%--مخطط الملكية--%>
                            </thead>
                            <tbody>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr id="row" runat="server">
                            <td> <asp:Label ID="lblRowNumber" Text='<%# Container.ItemIndex + 1 %>' runat="server" /></td>
                            <td>
                                <asp:LinkButton ID="LinK_Owner_Ship_Arabic_Name" runat="server" CommandArgument='<%# Eval("Owner_Ship_Id") %>' OnClick="LinK_Owner_Ship_Arabic_Name_Click"
                                    Text='<%# Eval("Owner_Ship_AR_Name") %>'></asp:LinkButton>

                                <asp:LinkButton ID="LinK_Owner_Ship_Englsih_Name" runat="server" CommandArgument='<%# Eval("Owner_Ship_Id") %>' OnClick="LinK_Owner_Ship_Arabic_Name_Click"
                                    Text='<%# Eval("Owner_Ship_EN_Name") %>'></asp:LinkButton>
                            </td>
                            <td>
                                <asp:Label ID="lbl_owner_ship_Code" ForeColor="#52a2da" runat="server" Text='<%# Eval("owner_ship_Code") %>' /></td>
                            <td>
                                <asp:Label ID="lbl_Certificate" runat="server" Text='<%# Eval("R_owner_ship_Certificate_Image") %>' /></td>
                            <td>
                                <asp:Label ID="lbl_Scheme" runat="server" Text='<%# Eval("R_Property_Scheme_Image") %>' /></td>
                        </tr>
                    </ItemTemplate>
                    <FooterTemplate>
                        </tbody>
                            </table>
                    </FooterTemplate>
                </asp:Repeater>
            </div>


            <div class="col-lg-12" runat="server" id="Ownership_ALL_Div">
                <h5><asp:Label ID="lbl_Alll" runat="server"/></h5>
                <!-- Simple Tables -->
                <asp:Repeater ID="Ownership_ALL" runat="server" ClientIDMode="Static" OnItemDataBound="Ownership_ALL_ItemDataBound">
                    <HeaderTemplate>
                        <table cellspacing="0" cellpadding="0"  style="font-size: 15px" class="datatable table table-striped table-bordered">
                            <thead>
                                <th style="width:5px">#</th>
                                <th><asp:Label ID="lbl_titel_Property_Name" runat="server"/></th><%--اسم الملكية--%>
                                <th><asp:Label ID="lbl_titel_Property_Code" runat="server"/></th><%--رمز الملكية--%>
                                <th style="text-align:center"><asp:Label ID="lbl_titel_BIN" runat="server"/></th><%--رقم مساحي--%>
                                <th style="text-align:center"><asp:Label ID="lbl_titel_Area" runat="server"/></th><%--مسااحة--%>
                                <th style="text-align:center"><asp:Label ID="lbl_titel_Street_Name" runat="server"/></th><%--اسم الشارع--%>
                                <th style="text-align:center"><asp:Label ID="lbl_titel_Street_NO" runat="server"/></th><%--رقم الشارع--%>
                                <th style="text-align:center"><asp:Label ID="lbl_titel_Bond_Date" runat="server"/></th><%--تاريخ السند--%>
                                <th style="text-align:center"><asp:Label ID="lbl_titel_Property_Bond" runat="server"/></th><%--سند الملكية--%>
                                <th style="text-align:center"><asp:Label ID="lbl_titel_Property_Scheme" runat="server"/></th><%--مخطط الملكية--%>
                            </thead>
                            <tbody>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr id="row" runat="server">
                            <td> <asp:Label ID="lblRowNumber" Text='<%# Container.ItemIndex + 1 %>' runat="server" /></td>
                            <td>
                                <asp:LinkButton ID="LinK_Owner_Ship_Arabic_Name" runat="server" CommandArgument='<%# Eval("Owner_Ship_Id") %>' OnClick="LinK_Owner_Ship_Arabic_Name_Click"
                                    Text='<%# Eval("Owner_Ship_AR_Name") %>'></asp:LinkButton>

                                <asp:LinkButton ID="LinK_Owner_Ship_Englsih_Name" runat="server" CommandArgument='<%# Eval("Owner_Ship_Id") %>' OnClick="LinK_Owner_Ship_Arabic_Name_Click"
                                    Text='<%# Eval("Owner_Ship_EN_Name") %>'></asp:LinkButton>
                            </td>
                            <td>
                                <asp:Label ID="lbl_owner_ship_Code" ForeColor="#52a2da" runat="server" Text='<%# Eval("owner_ship_Code") %>' /></td>
                            <td >
                                <asp:Label ID="lbl_Bond_NO" runat="server" Text='<%# Eval("R_Bond_NO") %>' /></td>
                            <td >
                                <asp:Label ID="lbl_Parcel_Area" runat="server" Text='<%# Eval("R_Parcel_Area") %>' /></td>
                            <td >
                                <asp:Label ID="lbl_Street_Name" runat="server" Text='<%# Eval("R_Street_Name") %>' /></td>
                            <td >
                                <asp:Label ID="lbl_Street_NO" runat="server" Text='<%# Eval("R_Street_NO") %>' /></td>
                            <td >
                                <asp:Label ID="lbl_R_Bond_Date" runat="server" Text='<%# Eval("R_Bond_Date") %>' /></td>
                            <td>
                                <asp:Label ID="lbl_Certificate" runat="server" Text='<%# Eval("R_owner_ship_Certificate_Image") %>' /></td>
                            <td>
                                <asp:Label ID="lbl_Scheme" runat="server" Text='<%# Eval("R_Property_Scheme_Image") %>' /></td>
                        </tr>
                    </ItemTemplate>
                    <FooterTemplate>
                        </tbody>
                            </table>
                    </FooterTemplate>
                </asp:Repeater>
            </div>
        </div>
        <hr />
    </div>
<%--********************************************************************************* نواقص الأبنية *****************************************************************************************--%>
      <div class="container-fluid" runat="server" id="B_Arcive">
        <div class="row">
            <div class="col-lg-12 mb-3">
                <h1 class="h3 mb-0 text-gray-800">
                    <asp:Label ID="lbl_Building_Missing_Feild" runat="server" ForeColor="#52a2da" Text="كشف نواقص الأبنية"></asp:Label>
                </h1>
            </div>
            <br />

       <div class="row">
           <div class="col-lg-12" runat="server" id="Building_Info_Div" visible="false">
                        <h5><asp:Label ID="lbl_Missing_Information" runat="server"/></h5>
                        <!-- Simple Tables -->
                        <asp:Repeater ID="Building_Info_List" runat="server" ClientIDMode="Static" OnItemDataBound="Building_Info_List_ItemDataBound">
                            <HeaderTemplate>
                                <table cellspacing="0" cellpadding="0"  style="font-size: 15px" class="datatable table table-striped table-bordered">
                                    <thead>
                                        <th>#</th>
                                        <th ><asp:Label ID="lbl_Titel_Building_Name" runat="server"/></th><%--اسم البناء--%>
                                        <th ><asp:Label ID="lbl_Titel_Building_NO" runat="server"/></th><%--رقم البناء--%>
                                        <th><asp:Label ID="lbl_Titel_Building_Area" runat="server"/></th><%--مساحة البناء--%>
                                        <th><asp:Label ID="lbl_Titel_Maintenance" runat="server"/></th><%--وضع الصيانة--%>
                                        <th><asp:Label ID="lbl_Titel_Electricity" runat="server"/></th><%--عداد الكهرباء--%>
                                        <th><asp:Label ID="lbl_Titel_Water" runat="server"/></th><%--عداد الماء--%>
                                        <th><asp:Label ID="lbl_Titel_Completion_Date" runat="server"/></th><%--تاريخ الإتمام--%>
                                    </thead>
                                    <tbody>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr id="row" runat="server">
                                    <td> <asp:Label ID="lblRowNumber" Text='<%# Container.ItemIndex + 1 %>' runat="server" /></td>
                                    <td>
                                        <asp:LinkButton ID="LinK_Building_Arabic_Name" runat="server" CommandArgument='<%# Eval("Building_Id") %>' OnClick="LinK_Building_Arabic_Name_Click" 
                                        Text='<%# Eval("Building_Arabic_Name") %>'></asp:LinkButton>

                                         <asp:LinkButton ID="LinK_Building_English_Name" runat="server" CommandArgument='<%# Eval("Building_Id") %>' OnClick="LinK_Building_Arabic_Name_Click" 
                                        Text='<%# Eval("Building_English_Name") %>'></asp:LinkButton>

                                    </td>
                                    <td>
                                        <asp:Label ID="lbl_Building_NO" ForeColor="#52a2da" runat="server" Text='<%# Eval("Building_NO") %>' /></td>
                                    <td>
                                        <asp:Label ID="lbl_Construction_Area" runat="server" Text='<%# Eval("Construction_Area") %>' /></td>
                                    <td>
                                        <asp:Label ID="lbl_Maintenance_status" runat="server" Text='<%# Eval("Maintenance_status") %>' /></td>
                                    <td>
                                        <asp:Label ID="lbl_electricity_meter" runat="server" Text='<%# Eval("electricity_meter") %>' /></td>
                                    <td>
                                        <asp:Label ID="lbl_Water_meter" runat="server" Text='<%# Eval("Water_meter") %>' /></td>
                                    <td>
                                        <asp:Label ID="lbl_Construction_Completion_Date" runat="server" Text='<%# Eval("Construction_Completion_Date") %>' /></td>

                                </tr>
                            </ItemTemplate>
                            <FooterTemplate>
                                </tbody>
                            </table>
                            </FooterTemplate>
                        </asp:Repeater>
                    </div>



                    <div class="col-lg-12" runat="server" id="Building_Att_Div" visible="false">
                        <h5><asp:Label ID="lbl_Att_2" runat="server"/></h5>
                        <!-- Simple Tables -->
                        <asp:Repeater ID="Building_Att_List" runat="server" ClientIDMode="Static" OnItemDataBound="Building_Att_List_ItemDataBound">
                            <HeaderTemplate>
                                <table cellspacing="0" cellpadding="0"  style="font-size: 15px" class="datatable table table-striped table-bordered">
                                    <thead>
                                        <th>#</th>
                                        <th ><asp:Label ID="lbl_Titel_Building_Name" runat="server"/></th><%--اسم البناء--%>
                                        <th ><asp:Label ID="lbl_Titel_Building_NO" runat="server"/></th><%--رقم البناء--%>
                                       
                                        <th ><asp:Label ID="lbl_Titel_Building_Photo" runat="server"/></th><%--صورة البناء--%>
                                        <th ><asp:Label ID="lbl_Titel_Entrance_Photo" runat="server"/></th><%--صورة المدخل--%>
                                        <th ><asp:Label ID="lbl_Titel_Building_Permit" runat="server"/></th><%--رخصة البناء--%>
                                        <th ><asp:Label ID="lbl_Titel_certificate_of_completion" runat="server"/></th><%--شهادة إتمام--%>
                                        <th ><asp:Label ID="lbl_Titel_Map" runat="server"/></th><%-- خرائط--%>
                                        <th ><asp:Label ID="lbl_Titel_Plan" runat="server"/></th><%--مسقط أفقي--%>
                                    </thead>
                                    <tbody>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr id="row" runat="server">
                                    <td> <asp:Label ID="lblRowNumber" Text='<%# Container.ItemIndex + 1 %>' runat="server" /></td>
                                    <td>
                                        <asp:LinkButton ID="LinK_Building_Arabic_Name" runat="server" CommandArgument='<%# Eval("Building_Id") %>' OnClick="LinK_Building_Arabic_Name_Click" 
                                        Text='<%# Eval("Building_Arabic_Name") %>'></asp:LinkButton>

                                        <asp:LinkButton ID="LinK_Building_English_Name" runat="server" CommandArgument='<%# Eval("Building_Id") %>' OnClick="LinK_Building_Arabic_Name_Click" 
                                        Text='<%# Eval("Building_English_Name") %>'></asp:LinkButton>
                                    </td>
                                    <td>
                                        <asp:Label ID="lbl_Building_NO" ForeColor="#52a2da" runat="server" Text='<%# Eval("Building_NO") %>' /></td>

                                    <td >
                                        <asp:Label ID="lbl_Building_Photo" runat="server" Text='<%# Eval("Building_Photo") %>' /></td>
                                    <td >
                                        <asp:Label ID="lbl_Entrance_Photo" runat="server" Text='<%# Eval("Entrance_Photo") %>' /></td>
                                    <td >
                                        <asp:Label ID="lbl_Building_Permit" runat="server" Text='<%# Eval("Building_Permit") %>' /></td>
                                    <td >
                                        <asp:Label ID="lbl_certificate_of_completion" runat="server" Text='<%# Eval("certificate_of_completion") %>' /></td>
                                    <td >
                                        <asp:Label ID="lbl_Map" runat="server" Text='<%# Eval("Map") %>' /></td>
                                    <td >
                                        <asp:Label ID="lbl_Plan" runat="server" Text='<%# Eval("Plan") %>' /></td>
                                </tr>
                            </ItemTemplate>
                            <FooterTemplate>
                                </tbody>
                            </table>
                            </FooterTemplate>
                        </asp:Repeater>
                    </div>


                    <div class="col-lg-12" runat="server" id="Building_All_Div">
                        <h5><asp:Label ID="lbl_All_2" runat="server"/></h5>
                        <!-- Simple Tables -->
                        <asp:Repeater ID="Building_All_List" runat="server" ClientIDMode="Static" OnItemDataBound="Building_All_List_ItemDataBound">
                            <HeaderTemplate>
                                <table cellspacing="0"  cellpadding="0" style="font-size: 15px" class="datatable table table-striped table-bordered">
                                    <thead>
                                        <th>#</th>
                                        <th ><asp:Label ID="lbl_Titel_Building_Name" runat="server"/></th><%--اسم البناء--%>
                                        <th ><asp:Label ID="lbl_Titel_Building_NO" runat="server"/></th><%--رقم البناء--%>
                                        <th><asp:Label ID="lbl_Titel_Building_Area" runat="server"/></th><%--مساحة البناء--%>
                                        <th><asp:Label ID="lbl_Titel_Maintenance" runat="server"/></th><%--وضع الصيانة--%>
                                        <th><asp:Label ID="lbl_Titel_Electricity" runat="server"/></th><%--عداد الكهرباء--%>
                                        <th><asp:Label ID="lbl_Titel_Water" runat="server"/></th><%--عداد الماء--%>
                                        <th><asp:Label ID="lbl_Titel_Completion_Date" runat="server"/></th><%--تاريخ الإتمام--%>
                                        <th ><asp:Label ID="lbl_Titel_Building_Photo" runat="server"/></th><%--صورة البناء--%>
                                        <th ><asp:Label ID="lbl_Titel_Entrance_Photo" runat="server"/></th><%--صورة المدخل--%>
                                        <th ><asp:Label ID="lbl_Titel_Building_Permit" runat="server"/></th><%--رخصة البناء--%>
                                        <th ><asp:Label ID="lbl_Titel_certificate_of_completion" runat="server"/></th><%--شهادة إتمام--%>
                                        <th ><asp:Label ID="lbl_Titel_Map" runat="server"/></th><%-- خرائط--%>
                                        <th ><asp:Label ID="lbl_Titel_Plan" runat="server"/></th><%--مسقط أفقي--%>

                                    </thead>
                                    <tbody>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr id="row" runat="server">
                                    <td> <asp:Label ID="lblRowNumber" Text='<%# Container.ItemIndex + 1 %>' runat="server" /></td>
                                    <td>
                                        <asp:LinkButton ID="LinK_Building_Arabic_Name" runat="server" CommandArgument='<%# Eval("Building_Id") %>' OnClick="LinK_Building_Arabic_Name_Click" 
                                        Text='<%# Eval("Building_Arabic_Name") %>'></asp:LinkButton>

                                        <asp:LinkButton ID="LinK_Building_English_Name" runat="server" CommandArgument='<%# Eval("Building_Id") %>' OnClick="LinK_Building_Arabic_Name_Click" 
                                        Text='<%# Eval("Building_English_Name") %>'></asp:LinkButton>
                                    </td>
                                    <td>
                                        <asp:Label ID="lbl_Building_NO" ForeColor="#52a2da" runat="server" Text='<%# Eval("Building_NO") %>' /></td>
                                    <td>
                                        <asp:Label ID="lbl_Construction_Area" runat="server" Text='<%# Eval("Construction_Area") %>' /></td>
                                    <td>
                                        <asp:Label ID="lbl_Maintenance_status" runat="server" Text='<%# Eval("Maintenance_status") %>' /></td>
                                    <td>
                                        <asp:Label ID="lbl_electricity_meter" runat="server" Text='<%# Eval("electricity_meter") %>' /></td>
                                    <td>
                                        <asp:Label ID="lbl_Water_meter" runat="server" Text='<%# Eval("Water_meter") %>' /></td>
                                    <td>
                                        <asp:Label ID="lbl_Construction_Completion_Date" runat="server" Text='<%# Eval("Construction_Completion_Date") %>' /></td>

                                    <td >
                                        <asp:Label ID="lbl_Building_Photo" runat="server" Text='<%# Eval("Building_Photo") %>' /></td>
                                    <td >
                                        <asp:Label ID="lbl_Entrance_Photo" runat="server" Text='<%# Eval("Entrance_Photo") %>' /></td>
                                    <td >
                                        <asp:Label ID="lbl_Building_Permit" runat="server" Text='<%# Eval("Building_Permit") %>' /></td>
                                    <td >
                                        <asp:Label ID="lbl_certificate_of_completion" runat="server" Text='<%# Eval("certificate_of_completion") %>' /></td>
                                    <td >
                                        <asp:Label ID="lbl_Map" runat="server" Text='<%# Eval("Map") %>' /></td>
                                    <td >
                                        <asp:Label ID="lbl_Plan" runat="server" Text='<%# Eval("Plan") %>' /></td>
                                </tr>
                            </ItemTemplate>
                            <FooterTemplate>
                                </tbody>
                            </table>
                            </FooterTemplate>
                        </asp:Repeater>
                    </div>
                </div>
            <hr />
        </div>
        </div>


                        <div class="container-fluid" runat="server" id="U_Arcive">
            <div class="row">
                <div class="col-lg-12 mb-3">
                    <h1 class="h3 mb-0 text-gray-800">
                        <asp:Label ID="lbl_Unit_Missining_field" runat="server" ForeColor="#52a2da" Text="كشف نواقص الوحدات"></asp:Label>
                    </h1>
                </div>
                <br />

                <div class="row">
                    <div class="col-lg-12 mb-4">
                        <!-- Simple Tables -->
                        <asp:Repeater ID="Unit_List" runat="server" ClientIDMode="Static" OnItemDataBound="Unit_List_ItemDataBound">
                            <HeaderTemplate>
                                <table cellspacing="0" cellpadding="0"  style="font-size: 15px" class="datatable table table-striped table-bordered">
                                    <thead>
                                        <th>#</th>
                                        <th ><asp:Label ID="lbl_Titel_Unit_Number" runat="server"/></th><%--رقم الوحدة--%>
                                        <th ><asp:Label ID="lbl_Titel_current_situation" runat="server"/></th><%--الوضع الحالي--%>
                                        <th ><asp:Label ID="lbl_Titel_Oreedo_Number" runat="server"/></th><%--رقم أوريدو--%>
                                        <th ><asp:Label ID="lbl_Titel_Electricityt_Number" runat="server"/></th><%--رقم الكهرباء--%>
                                        <th ><asp:Label ID="lbl_Titel_Water_Number" runat="server"/></th><%--رقم الماء--%>
                                        <th ><asp:Label ID="lbl_Titel_virtual_Value" runat="server"/></th><%--القيمة الإفتراضية--%>
                                    </thead>
                                    <tbody>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr id="row" runat="server">
                                    <td> <asp:Label ID="lblRowNumber" Text='<%# Container.ItemIndex + 1 %>' runat="server" /></td>
                                    <td>
                                        <asp:LinkButton ID="LinK_Unit_Arabic_Name" runat="server" CommandArgument='<%# Eval("Unit_ID") %>' OnClick="LinK_Unit_Arabic_Name_Click" 
                                        Text='<%# Eval("Unit_Number") %>'></asp:LinkButton></td>
                                    <td >
                                        <asp:Label ID="lbl_current_situation" runat="server" Text='<%# Eval("current_situation") %>' /></td>
                                    <td >
                                        <asp:Label ID="lbl_Oreedo_Number" runat="server" Text='<%# Eval("Oreedo_Number") %>' /></td>
                                    <td >
                                        <asp:Label ID="lbl_Electricityt_Number" runat="server" Text='<%# Eval("Electricityt_Number") %>' /></td>
                                    <td >
                                        <asp:Label ID="lbl_Water_Number" runat="server" Text='<%# Eval("Water_Number") %>' /></td>
                                    <td >
                                        <asp:Label ID="lbl_virtual_Value" runat="server" Text='<%# Eval("virtual_Value") %>' /></td>
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
            <hr />
        </div>

                    </div>
                </div>
            </div>
        </div>

</div>
</asp:Content>
