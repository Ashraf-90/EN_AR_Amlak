<%@ Page Title="" Language="C#" MasterPageFile="~/English/Main_Application/English.Master" AutoEventWireup="true" CodeBehind="complaint_report_request_Details.aspx.cs" Inherits="Main_Real_estate.English.Main_Application.complaint_report_request_Details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            var table = $('.datatable').DataTable({
                dom: 'Bfrtip',
                /*lengthChange: false,*/
                "pageLength": 10000,
                buttons: [
                    'excelHtml5',
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
            font-size: 13px;
             padding: 5px !important;         
        }

        table{
             table-layout: fixed !important;
             width: 100% !important;
             
        }
       
        th{
            background-color:#52a2da;
            color: #fff;
            text-align:center;
        }
        .Indicator_buttons{
            border-radius:50px;
            border-style: solid; 
            border-radius: 50px; 
            width: 20px; 
            margin-right: 20px; 
            margin-top: 20px; 
            height: 20px; 
        }
    </style>
    <%--**********************************************************************************************************--%>
    <div class="container-login" style="padding-top: 70px">
        <div class="row justify-content-center" style="margin-top: -129px;">
            <div class="col-xl-12 col-lg-12 col-md-9">
                <div class="card shadow-sm my-5">
                    <div class="card-body p-0">
                        <div class="row" style="top: -14px;">
                            <div class="col-lg-12">
                                <div class="login-form">
                                    <div class="row">
                                        <div class="col-lg-6" style="border-style: solid; text-align: center; padding-top: 10px; font-size: 25px; font-weight: bold">
                                            <div class="form-group">
                                                <asp:Label ID="lbl_Titel_Customer_Affairs_Department" runat="server" />
                                            </div>
                                        </div>
                                        <div class="col-lg-6" style="border-style: solid; text-align: center; padding-top: 10px; font-size: 25px; font-weight: bold">
                                            <div class="form-group">
                                                <asp:Label ID="lbl_Titel_Company_Name" runat="server" />
                                            </div>
                                        </div>
                                    </div>
                                    <%--**********************************************************************************************************--%>
                                    <div class="row">
                                        <div class="col-lg-12" style="border-style: solid; text-align: center; padding-top: 10px; font-size: 25px; font-weight: bold">
                                            <div class="form-group">
                                                <span style="color: #fc544b"><asp:Label ID="lbl_Red_Titel" runat="server" /></span>
                                            </div>
                                        </div>
                                    </div>
                                    <%--**********************************************************************************************************--%>
                                    <div class="row" style="border: solid">
                                        <div class="col-lg-4" style="font-size: 20px; padding-top: 10px;">
                                            <div class="form-group">
                                                <spa style="font-weight: bold"> <asp:Label ID="lbl_Titel_source" runat="server" /> </spa>
                                                &nbsp;&nbsp;<asp:Label ID="lbl_source" runat="server"></asp:Label>
                                            </div>
                                        </div>
                                        <div class="col-lg-4" style="font-size: 20px; padding-top: 10px;">
                                            <div class="form-group">
                                                <span style="font-weight: bold"><asp:Label ID="lbl_Titel_Adress" runat="server" /></span> 
                                                &nbsp;&nbsp;<asp:Label ID="lbl_Building_Name" runat="server"></asp:Label>
                                                &nbsp;&nbsp;<asp:Label ID="lbl_Unit_Number" runat="server"></asp:Label>
                                            </div>
                                        </div>
                                        <div class="col-lg-4" style="font-size: 20px; padding-top: 10px;">
                                            <div class="form-group">
                                                <span style="font-weight: bold"><asp:Label ID="lbl_Titel_Date" runat="server" /></span>
                                                &nbsp;&nbsp;<asp:Label ID="lbl_Date" runat="server"></asp:Label>
                                            </div>
                                        </div>
                                    </div>
                                    <%--**********************************************************************************************************--%>
                                    <div class="row" style="border: solid">
                                        <div class="col-lg-4" style="font-size: 20px; padding-top: 10px;">
                                            <div class="form-group">
                                                <span style="font-weight: bold"><asp:Label ID="lbl_titel_Classification" runat="server" /> </span>
                                                &nbsp;&nbsp;<asp:Label ID="lbl_Order_Classification" runat="server"></asp:Label>
                                            </div>
                                        </div>
                                        <div class="col-lg-4" style="font-size: 20px; padding-top: 10px;">
                                            <div class="form-group">
                                                <span style="font-weight: bold"><asp:Label ID="lbl_titel_Type" runat="server" /></span>
                                                &nbsp;&nbsp;<asp:Label ID="lbl_Report_Type" runat="server"></asp:Label>
                                            </div>
                                        </div>
                                        <div class="col-lg-4" style="font-size: 20px; padding-top: 10px;">
                                            <div class="form-group">
                                                <span style="font-weight: bold"><asp:Label ID="lbl_titel_Direction" runat="server" /></span>
                                                &nbsp;&nbsp;<asp:Label ID="lbl_Report_Direction" runat="server"></asp:Label>
                                            </div>
                                        </div>
                                        <br />
                                        <br />
                                        <div class="col-lg-12" style="font-size: 20px; padding-top: 10px;">
                                            <div class="form-group">
                                                <span style="font-weight: bold"><asp:Label ID="lbl_titel_Text" runat="server" /></span><br />
                                                <asp:Label ID="lbl_Report_Text" runat="server"></asp:Label>
                                            </div>
                                        </div>
                                    </div>
                                    <%--**********************************************************************************************************--%>
                                    <div class="row" style="border: solid">
                                        <div class="col-lg-4" style="font-size: 20px; padding-top: 10px;">
                                            <div class="form-group">
                                                <span style="font-weight: bold"><asp:Label ID="lbl_Titel_Priority" runat="server" /></span>
                                                &nbsp;&nbsp;<asp:Label ID="lbl_Priority" runat="server"></asp:Label>
                                            </div>
                                        </div>
                                        <div class="col-lg-4" style="font-size: 20px; padding-top: 10px;">
                                            <div class="form-group">
                                                <span style="font-weight: bold"><asp:Label ID="lbl_Titel_Danger" runat="server" /></span>
                                                &nbsp;&nbsp;<asp:Label ID="lbl_Danger" runat="server"></asp:Label>
                                            </div>
                                        </div>
                                        <div class="col-lg-4" style="font-size: 20px; padding-top: 10px;">
                                            <div class="form-group">
                                                <span style="font-weight: bold"><asp:Label ID="lbl_Titel_Priority_Resut" runat="server" />
                                                    &nbsp;&nbsp;</span><asp:Label ID="lbl_Priority_Resut" runat="server"></asp:Label>
                                            </div>
                                        </div>
                                    </div>
                                    <%--**********************************************************************************************************--%>
                                    <div class="row" style="border: solid">
                                        <div class="col-lg-12" style="font-size: 20px; padding-top: 10px;">
                                            <div class="form-group">
                                                <span style="font-weight: bold"><asp:Label ID="lbl_Titel_Description" runat="server" /></span><br />
                                                <asp:Label ID="lbl_Report_Description" runat="server"></asp:Label>
                                            </div>
                                        </div>
                                    </div>
                                    <%--**********************************************************************************************************--%>
                                    <div class="row" style="border: solid">
                                        <div class="col-lg-12" style="font-size: 20px; padding-top: 10px;">
                                            <div class="form-group">
                                                <span style="font-weight: bold"><asp:Label ID="lbl_Titel_precaution" runat="server" /></span><br />
                                                <asp:Label ID="lbl_precaution" runat="server"></asp:Label>
                                            </div>
                                        </div>
                                    </div>
                                    <%--**********************************************************************************************************--%>
                                    <div class="row" style="border: solid">
                                        <div class="col-lg-12" style="font-size: 20px; padding-top: 10px;">
                                            <div class="form-group">
                                                <span style="font-weight: bold"><asp:Label ID="lbl_Titel_Activ" runat="server" /></span>
                                                &nbsp;&nbsp;<asp:Label ID="lbl_Activ" runat="server"></asp:Label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row" style="border: solid">
                                        <div class="col-lg-6" style="font-size: 20px; padding-top: 10px;">
                                            <span style="font-weight: bold"><asp:Label ID="lbl_Titel_Image_Befor" runat="server" /> </span><br />
                                            <asp:ImageButton ID="Image_Befor" runat="server" Width="80px" Height="80px" OnClientClick="target ='_blank';" OnClick="Image_Befor_Click" />
                                        </div>
                                        <div class="col-lg-6" style="font-size: 20px; padding-top: 10px;">
                                            <span style="font-weight: bold"><asp:Label ID="lbl_Titel_Image_After" runat="server" /> </span><br />
                                            <asp:ImageButton ID="Image_After" runat="server" Width="80px" Height="80px" OnClientClick="target ='_blank';" OnClick="Image_After_Click" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="container-login" style="padding-top: 70px" id="Maintenance_div" runat="server">
        <div class="row">
            <div class="col-lg-6">
                <h1 class="h3 mb-0 text-gray-800">
                    <asp:Label ID="lbl_titel_Maintenance_List" runat="server" Text="قائمة طلبات الصيانة"></asp:Label>
                </h1>
            </div>
        </div>

        <div class="row">
            <div class="col-lg-12 mb-4">
                <!-- Simple Tables -->
                <div class="card">
                    <div class="table-responsive" id="Grid">
                        <asp:Repeater ID="Maintenance_Request_Liist" runat="server" ClientIDMode="Static" OnItemDataBound="Maintenance_Request_Liist_ItemDataBound">
                            <HeaderTemplate>
                                <table cellspacing="0" style="width: 100%; font-size: 11px" class="datatable table table-striped table-bordered">
                                    <thead>

                                        <th style="text-align: center;"><asp:Label ID="lbl_Type" runat="server"/></th><%--نوع--%>
                                        <th style="text-align: center;"><asp:Label ID="lbl_Strat" runat="server"/></th><%--بدء--%>
                                        <th style="text-align: center;"><asp:Label ID="lbl_End" runat="server"/></th><%--أنتهاء--%>
                                        <th style="text-align: center;"><asp:Label ID="lbl_Activ" runat="server"/></th><%--حالة--%>
                                        <th style="text-align: center;"><asp:Label ID="lbl_Cost" runat="server"/></th><%--تكلفة--%>
                                        <th style="width: 150px"></th>
                                    </thead>
                                    <tbody>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td>
                                        <asp:Label ID="lbl_Categoty_AR" runat="server" Text='<%# Eval("Categoty_AR") %>' />
                                        <asp:Label ID="lbl_Categoty_EN" runat="server" Text='<%# Eval("Categoty_EN") %>' />
                                    </td>
                                    <td><asp:Label ID="lbl_Start_Date" runat="server" Text='<%# Eval("Start_Date") %>' /></td>
                                    <td><asp:Label ID="lbl_End_Date" runat="server" Text='<%# Eval("End_Date") %>' /></td>
                                    <td><asp:Label ID="lbl_Activ" runat="server" Text='<%# Eval("Activ") %>' /></td>
                                    <td><asp:Label ID="lbl_Cost" runat="server" Text='<%# Eval("Cost") %>' /></td>

                                    <td>
                                        <asp:LinkButton CssClass="btn btn-danger" runat="server" CommandArgument='<%# Eval("Maintenance_Request_ID") %>' OnClientClick="return confirm('هل أنت متأكد أنك تريد حذف؟');" OnClick="Delete_Maintenance_Request"><i class="fa fa-trash" style="font-size:18px;"></i></asp:LinkButton>
                                        &nbsp;&nbsp;
                                        <asp:LinkButton CssClass="btn btn-primary" runat="server" CommandArgument='<%# Eval("Maintenance_Request_ID") %>' OnClick="Details_Maintenance_Request"> <i class="fa fa-list" style="font-size:18px;"></i> </asp:LinkButton>
                                    </td>
                                </tr>
                            </ItemTemplate>
                            <FooterTemplate>
                                </tbody>
                                </table>
                            </FooterTemplate>
                        </asp:Repeater>
                        <div id="maintenance_request_Details_Div" runat="server" style="border-style: solid;" visible="false">
                            <div class="row">
                                <div class="col-lg-6" style="border-style: solid; text-align: center; padding-top: 10px; font-size: 25px; font-weight: bold">
                                    <div class="form-group">
                                        <asp:Label ID="lbl_Titel_Asset_Manegement" runat="server"/>  
                                    </div>
                                </div>
                                <div class="col-lg-6" style="border-style: solid; text-align: center; padding-top: 10px; font-size: 25px; font-weight: bold">
                                    <div class="form-group">
                                        <asp:Label ID="lbl_Titel_Compant_Name" runat="server"/> 
                                    </div>
                                </div>
                            </div>
                            <%--**********************************************************************************************************--%>
                            <div class="row">
                                <div class="col-lg-12" style="border-style: solid; text-align: center; padding-top: 10px; font-size: 25px; font-weight: bold">
                                    <div class="form-group">
                                        <span style="color: red"><asp:Label ID="lbl_Titel_Maintenence_Request" runat="server"/></span>
                                    </div>
                                </div>
                            </div>
                            <%--**********************************************************************************************************--%>
                            <div class="row" style="border: solid">
                                <div class="col-lg-3" style="font-size: 20px; padding-top: 10px;">
                                    <div class="form-group">
                                        <span style="font-weight: bold"><asp:Label ID="lbl_Titel_Waranty" runat="server"/></span> 
                                        &nbsp;&nbsp;<asp:Label ID="lbl_Waranty" runat="server"></asp:Label>
                                    </div>
                                </div>
                                <div class="col-lg-3" style="font-size: 20px; padding-top: 10px;">
                                    <div class="form-group">
                                        <span style="font-weight: bold"><asp:Label ID="lbl_Titel_Waranty_Direction" runat="server"/></span>
                                        &nbsp;&nbsp;<asp:Label ID="lbl_Waranty_Direction" runat="server"></asp:Label>
                                    </div>
                                </div>
                                <div class="col-lg-3" style="font-size: 20px; padding-top: 10px;">
                                    <div class="form-group">
                                        <span style="font-weight: bold"><asp:Label ID="lbl_Titel_Cost_Direction" runat="server"/></span>
                                        &nbsp;&nbsp;<asp:Label ID="lbl_Cost_Direction" runat="server"></asp:Label>
                                    </div>
                                </div>
                                <div class="col-lg-3" style="font-size: 20px; padding-top: 10px;">
                                    <div class="form-group">
                                        <span style="font-weight: bold"><asp:Label ID="lbl_Titel_Executing_Agency" runat="server"/></span>
                                        &nbsp;&nbsp;<asp:Label ID="lbl_Executing_Agency" runat="server"></asp:Label>
                                    </div>
                                </div>
                            </div>
                            <%--**********************************************************************************************************--%>
                            <div class="row" style="border: solid">
                                <div class="col-lg-3" style="font-size: 20px; padding-top: 10px;">
                                    <div class="form-group">
                                        <span style="font-weight: bold"><asp:Label ID="lbl_Titel_Technical" runat="server"/></span> 
                                        &nbsp;&nbsp;<asp:Label ID="lbl_Technical" runat="server"></asp:Label>
                                    </div>
                                </div>
                                <div class="col-lg-3" style="font-size: 20px; padding-top: 10px;">
                                    <div class="form-group">
                                        <span style="font-weight: bold"><asp:Label ID="lbl_Titel_Watcher" runat="server" /></span>
                                        &nbsp;&nbsp;<asp:Label ID="lbl_Watcher" runat="server"></asp:Label>
                                    </div>
                                </div>
                                <div class="col-lg-6" style="font-size: 20px; padding-top: 10px;">
                                    <div class="form-group">
                                        <span style="font-weight: bold"><asp:Label ID="lbl_Titel_Asset" runat="server" /></span>
                                        &nbsp;&nbsp;<asp:Label ID="lbl_Asset" runat="server"></asp:Label>
                                    </div>
                                </div>

                            </div>
                            <%--**********************************************************************************************************--%>
                            <asp:Button ID="btn_Close_Maintenance_Details" CssClass="btn btn-danger" runat="server" Text="إغلاق" OnClick="btn_Close_Maintenance_Details_Click" Height="43px" Width="263px" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <asp:Button ID="btn_Back_To_complaint_report_request_List" runat="server" Text="العودة لقائمة الطلبات" CssClass="btn btn-light mb-1" OnClick="btn_Back_To_complaint_report_request_List_Click" />
            </div>
        </div>
    </div>
</asp:Content>
