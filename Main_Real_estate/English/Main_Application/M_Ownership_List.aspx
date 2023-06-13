<%@ Page Title="" Language="C#" MasterPageFile="~/English/Main_Application/English.Master" AutoEventWireup="true" CodeBehind="M_Ownership_List.aspx.cs" Inherits="Main_Real_estate.English.Main_Application.M_Ownership_List" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">

        $(document).ready(function () {

            /*This will hide the icons if there is no URL*/
            /*If there is no files, URL will say "No File"*/
            $('a[href*="No File"]').each(function () {
                $(this).css('display', 'none');
            });


            var table = $('.datatable').DataTable({
                dom: 'Bfrtip',
                "pageLength": 10000,
                buttons: [
                    /* 'copyHtml5',*/
                    'excelHtml5',
                    /*'csvHtml5',*/
                    /*'pdfHtml5'*/
                ],
                language: {
                    url: 'https://cdn.datatables.net/plug-ins/1.12.1/i18n/ar.json'
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
            font-size: 12px;
            text-align: center !important;
            
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
           padding: 2px;
           text-align: center

        }
        .vetiacl{
            vertical-align: middle;
        }
    </style>




    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/chosen/1.8.7/chosen.jquery.min.js"></script>
    <link href="../CSS/DDL.css" rel="stylesheet" />

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <div class="container-fluid" id="Top">
        <ul style="background-color: #efefef; min-height: 0px; width: 100%" class="navbar-nav sidebar sidebar-light accordion" id="accordionSidebar">
            <li class="nav-item" style="padding-bottom: 10px;" runat="server" id="Ownership_Div">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#M_Ownership" aria-expanded="true"
                    aria-controls="M_Ownership" style="width: 270px;">
                    <i class="fa fa-plus" style="font-size: 25px; font-weight: bold"></i>
                    <span style="font-size: 18px;"><asp:Label ID="lbl_Titel_Add_M_Ownership" runat="server" Font-Size="18px" ClientIDMode="Static"/></span>
                </a>
                <div id="M_Ownership" class="collapse" aria-labelledby="headingForm" data-parent="#accordionSidebar">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="card mb-12">
                                <div class="card-body">
                                    <div class="row">
                                        
                                        <div class="col-lg-4">
                                            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                                <ContentTemplate>
                                                    <div class="form-group">
                                                        <asp:Label ID="lbl_ownership_Name" runat="server" Text="اسم الملكية"></asp:Label>
                                                        <asp:DropDownList ID="ownership_Name_DropDownList" runat="server" CssClass="form-control">
                                                        </asp:DropDownList>
                                                        <asp:RequiredFieldValidator ID="ownership_Name_Req_Field_Val" ControlToValidate="ownership_Name_DropDownList" ValidationGroup="Mortgage_GV"
                                                            InitialValue="..............." runat="server" ErrorMessage="* حقل مطلوب !!!" ForeColor="#fc544b"></asp:RequiredFieldValidator>
                                                    </div>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                        </div>

                                        <div class="col-lg-4">
                                            <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                                <ContentTemplate>
                                                    <div class="form-group">
                                                        <asp:Label ID="lbl_Bank_Name" runat="server" Text="جهة الرهن"></asp:Label>
                                                        <asp:DropDownList ID="Bank_Name_DropDownList" runat="server" CssClass="form-control">
                                                        </asp:DropDownList>
                                                        <asp:RequiredFieldValidator ID="Bank_Name_Req_Field_Val" ControlToValidate="Bank_Name_DropDownList" ValidationGroup="Mortgage_GV"
                                                            InitialValue="..............." runat="server" ErrorMessage="* حقل مطلوب !!!" ForeColor="#fc544b"></asp:RequiredFieldValidator>
                                                    </div>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                        </div>



                                        <div class="col-lg-4">
                                            <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                                                <ContentTemplate>
                                                    <div class="form-group">
                                                        <asp:Label ID="lbl_Mortgage_Value" runat="server" Text="قيمة الرهن"></asp:Label>
                                                        &nbsp;<asp:RegularExpressionValidator ID="Mortgage_Value_Reg_Exp_Vali" runat="server" ControlToValidate="txt_Mortgage_Value"
                                                            EnableClientScript="True" ErrorMessage="!!! يُسمح فقط بالأرقام" ForeColor="#fc544b"
                                                            ValidationExpression="[0-9]+"></asp:RegularExpressionValidator>
                                                        <asp:TextBox ID="txt_Mortgage_Value" runat="server" CssClass="form-control"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="Mortgage_Value_Req_Field_Val" ValidationGroup="Mortgage_GV" ControlToValidate="txt_Mortgage_Value"
                                                            runat="server" ErrorMessage="* حقل مطلوب !!!" ForeColor="#fc544b"></asp:RequiredFieldValidator>
                                                    </div>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                        </div>
                                    </div>
                                    <%--------------------------------------------------------------------------------------------------------------------------------------------------------------%>
                                    <div class="row">
                                        <div class="col-lg-3">
                                            <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                                                <ContentTemplate>
                                                    <div class="form-group">
                                                        <asp:Label ID="lbl_Paymen_Type" runat="server" Text="دورة السداد"></asp:Label>
                                                        <asp:DropDownList ID="Paymen_Type_DropDownList" runat="server" CssClass="form-control">
                                                            <asp:ListItem Value="1" Text="شهري"></asp:ListItem>
                                                            <asp:ListItem Value="2" Text="ربع سنوي"></asp:ListItem>
                                                        </asp:DropDownList>
                                                        <asp:RequiredFieldValidator ID="Paymen_Type_Req_Field_Val" ControlToValidate="ownership_Name_DropDownList" ValidationGroup="Mortgage_GV"
                                                            InitialValue="..............." runat="server" ErrorMessage="* حقل مطلوب !!!" ForeColor="#fc544b"></asp:RequiredFieldValidator>
                                                    </div>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                        </div>
                                        
                                        <div class="col-lg-3">
                                            <asp:UpdatePanel ID="UpdatePanel6" runat="server">
                                                <ContentTemplate>
                                                    <div class="form-group">
                                                        <asp:Label ID="lbl_Installment_Value" runat="server" Text="قيمة القسط"></asp:Label>
                                                        &nbsp;<asp:RegularExpressionValidator ID="Installment_Value_Reg_Exp_Vali" runat="server" ControlToValidate="txt_Installment_Value"
                                                            EnableClientScript="True" ErrorMessage="!!! يُسمح فقط بالأرقام" ForeColor="#fc544b"
                                                            ValidationExpression="[0-9]+"></asp:RegularExpressionValidator>
                                                        <asp:TextBox ID="txt_Installment_Value" runat="server" CssClass="form-control"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="Installment_Value_Req_Field_Val" ValidationGroup="Mortgage_GV" ControlToValidate="txt_Installment_Value"
                                                            runat="server" ErrorMessage="* حقل مطلوب !!!" ForeColor="#fc544b"></asp:RequiredFieldValidator>
                                                    </div>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                        </div>
                                            

                                        <div class="col-lg-3">
                                            <asp:UpdatePanel ID="Start_Date_UpdatePanel" runat="server">
                                                <ContentTemplate>
                                                    <asp:Label ID="lbl_Start_Date" runat="server" Text="تاريخ البدء"></asp:Label>&nbsp;
                                                     <asp:TextBox ID="txt_Start_Date" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox>
                                                    <asp:Button ID="Start_Date_Chosee" runat="server" Text="إختر التاريخ" OnClick="Start_Date_Chosee_Click" />
                                                    <asp:ImageButton ID="ImageButton2" ImageUrl="Main_Image/Calander_Close.png" Width="10px" Height="10px" Visible="false" OnClick="ImageButton2_Click" runat="server" />
                                                    <asp:RequiredFieldValidator ID="Start_Date_Req_Field_Val" ValidationGroup="Mortgage_GV" ControlToValidate="txt_Start_Date"
                                                        runat="server" ErrorMessage="* حقل مطلوب !!!" ForeColor="#fc544b"></asp:RequiredFieldValidator>
                                                    <div id="Start_Date_Div" runat="server" visible="false" style="position: page;">
                                                        <asp:Calendar ID="Start_Date_Calendar" runat="server" Height="200px" Width="220px" BackColor="#f0f0f3" BorderColor="#ccc" BorderWidth="1px" CellPadding="1" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="10pt" ForeColor="#5a5c69" OnSelectionChanged="Start_Date_Calendar_SelectionChanged2">
                                                            <DayHeaderStyle BackColor="#52a2da" ForeColor="#ffffff" Height="1px" />
                                                            <NextPrevStyle Font-Size="8pt" ForeColor="#ffffff" />
                                                            <OtherMonthDayStyle ForeColor="#5a5c69" />
                                                            <SelectedDayStyle BackColor="#ff8d4f" Font-Bold="True" ForeColor="#ffffff" />
                                                            <SelectorStyle BackColor="#5a5c69" ForeColor="#ffffff" />
                                                            <TitleStyle CssClass="calendarMonthStyle" Height="25px" />
                                                            <TodayDayStyle BackColor="#37bc9b" ForeColor="#ffffff" />
                                                            <WeekendDayStyle BackColor="#dfeef8" />
                                                        </asp:Calendar>
                                                    </div>
                                                </ContentTemplate>
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="Start_Date_Calendar" EventName="SelectionChanged" />
                                                    <asp:AsyncPostBackTrigger ControlID="Start_Date_Chosee" EventName="Click" />
                                                    <asp:AsyncPostBackTrigger ControlID="ImageButton2" EventName="Click" />
                                                </Triggers>
                                            </asp:UpdatePanel>
                                        </div>
                                        <div class="col-lg-3">
                                            <asp:UpdatePanel ID="End_Date_UpdatePanel" runat="server">
                                                <ContentTemplate>
                                                    <asp:Label ID="lbl_End_Date" runat="server" Text="تاريخ التحرير"></asp:Label>&nbsp;
                                        <asp:TextBox ID="txt_End_Date" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox>
                                                    <asp:Button ID="End_Date_Chosee" runat="server" Text="إختر التاريخ" OnClick="End_Date_Chosee_Click" />
                                                    <asp:ImageButton ID="ImageButton3" ImageUrl="Main_Image/Calander_Close.png" Width="10px" Height="10px" Visible="false" OnClick="ImageButton3_Click" runat="server" />
                                                    <asp:RequiredFieldValidator ID="End_Date_Req_Field_Val" ValidationGroup="Mortgage_GV" ControlToValidate="txt_End_Date"
                                                        runat="server" ErrorMessage="* حقل مطلوب !!!" ForeColor="#fc544b"></asp:RequiredFieldValidator>
                                                    <div id="End_Date_Div" runat="server" visible="false" style="position: page;">
                                                        <asp:Calendar ID="End_Date_Calendar" runat="server" Height="200px" Width="220px" BackColor="#f0f0f3" BorderColor="#ccc" BorderWidth="1px" CellPadding="1" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="10pt" ForeColor="#5a5c69" OnSelectionChanged="End_Date_Calendar_SelectionChanged1">
                                                            <DayHeaderStyle BackColor="#52a2da" ForeColor="#ffffff" Height="1px" />
                                                            <NextPrevStyle Font-Size="8pt" ForeColor="#ffffff" />
                                                            <OtherMonthDayStyle ForeColor="#5a5c69" />
                                                            <SelectedDayStyle BackColor="#ff8d4f" Font-Bold="True" ForeColor="#ffffff" />
                                                            <SelectorStyle BackColor="#5a5c69" ForeColor="#ffffff" />
                                                            <TitleStyle CssClass="calendarMonthStyle" Height="25px" />
                                                            <TodayDayStyle BackColor="#37bc9b" ForeColor="#ffffff" />
                                                            <WeekendDayStyle BackColor="#dfeef8" />
                                                        </asp:Calendar>
                                                    </div>
                                                </ContentTemplate>
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="End_Date_Calendar" EventName="SelectionChanged" />
                                                    <asp:AsyncPostBackTrigger ControlID="End_Date_Chosee" EventName="Click" />
                                                    <asp:AsyncPostBackTrigger ControlID="ImageButton3" EventName="Click" />
                                                </Triggers>
                                            </asp:UpdatePanel>
                                        </div>
                                    </div>
                                    <%--------------------------------------------------------------------------------------------------------------------------------------------------------------%>
                                    <div class="row">
                                        <div class="col-lg-4">
                                            <div class="form-group">
                                                <br />
                                                <asp:LinkButton ID="Add" runat="server" CssClass="btn btn" BackColor="#52a2da" ValidationGroup="Mortgage_GV" ForeColor="White" Width="248px" OnClick="btn_Add_M_OwnerShip_Click"></asp:LinkButton>
                                                 <asp:LinkButton ID="Edit" runat="server" CssClass="btn btn" BackColor="#52a2da" ValidationGroup="Mortgage_GV" style="display:none" ForeColor="White" Width="248px" OnClick="btn_Edit_M_OwnerShip_Click"></asp:LinkButton>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </li>
        </ul>
    </div>
    <br />
        <hr /> 
    <div class="container-fluid" id="container-wrapper" >
        <!----------------------------------------------------------------------------------------------------------->
        <div class="row">
            <div class="col-lg-12">
                <div class="card mb-12">
                    <div class="card-body">
        
        <!----------------------------------------------------------------------------------------------------------->
        <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800">
                <asp:Label ID="Label1" runat="server" Text=" الملكيات المرهونة "></asp:Label></h1>

            
        </div>
        <!----------------------------------------------------------------------------------------------------------->
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                <asp:Label ID="Label2" runat="server"></asp:Label>
                                <asp:Repeater ID="M_Ownership_Repeater" runat="server" ClientIDMode="Static" OnItemCreated="M_Ownership_Repeater_ItemCreated" OnItemDataBound="M_Ownership_Repeater_ItemDataBound">
                                    <HeaderTemplate>
                                        <table cellspacing="0" style="width: 100%; font-size: 11px" class="datatable table table-striped table-bordered">
                                            <thead>
                                                <th style="vertical-align: middle;">#</th>
                                                <th style="vertical-align: middle;"><asp:Label ID="lbl_OwnerShip_Name" runat="server" /></th>
                                                <th style="vertical-align: middle;"><asp:Label ID="lbl_Titel_Bank_Name" runat="server" /></th>
                                                <th style="vertical-align: middle;"><asp:Label ID="lbl_Titel_Mortgage_Value" runat="server" /></th>
                                                <th style="vertical-align: middle;"><asp:Label ID="lbl_Titel_Installment_Value" runat="server" /></th>
                                                <th style="vertical-align: middle;"><asp:Label ID="lbl_Titel_Payment_Type" runat="server" /></th>
                                                <th style="vertical-align: middle;"><asp:Label ID="lbl_Titel_Amount_Paid" runat="server" /></th>
                                                <th style="vertical-align: middle;"><asp:Label ID="lbl_Titel_Remaining_Amount" runat="server" /></th>
                                                <th style="vertical-align: middle;"><asp:Label ID="lbl_Titel_Remaining_Installments" runat="server" /></th>
                                                <th style="vertical-align: middle;"><asp:Label ID="lbl_Titel_Start_Date" runat="server" /></th>
                                                <th style="vertical-align: middle;"> <asp:Label ID="lbl_Titel_End_Date" runat="server" /></th>
                                                <th></th>
                                            </thead>
                                            <tbody>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <tr>
                                            <td><asp:Label ID="lblRowNumber" Text='<%# Container.ItemIndex + 1 %>' runat="server" /></td>
                                            <td>
                                                <asp:Label ID="lbl_Owner_Ship_AR_Name" runat="server" Text='<%# Eval("Owner_Ship_AR_Name") %>' />
                                                <asp:Label ID="lbl_Owner_Ship_EN_Name" runat="server" Text='<%# Eval("Owner_Ship_EN_Name") %>' />
                                            </td>
                                            <td>
                                                <asp:Label ID="lbl_Bank_Arabic_Name" runat="server" Text='<%# Eval("Bank_Arabic_Name") %>' />
                                                <asp:Label ID="lbl_Bank_English_Name" runat="server" Text='<%# Eval("Bank_English_Name") %>' />
                                            </td>
                                            <td><asp:Label ID="lbl_Mortgage_Value" runat="server" Text='<%# Eval("Mortgage_Value") %>' /></td>
                                            <td><asp:Label ID="lbl_Installment_Value" runat="server" Text='<%# String.Format("{0:###,###,####}",Convert.ToInt64(DataBinder.Eval(Container.DataItem, "Installment_Value")))%>' /></td>
                                            <td><asp:Label ID="lbl_Paymen_Type" runat="server" Text='<%# Eval("Paymen_Type") %>' /></td>
                                            <td><asp:Label ID="lbl_Amount_Paid" runat="server" Text='<%# String.Format("{0:###,###,####}",Convert.ToInt64(DataBinder.Eval(Container.DataItem, "Amount_Paid")))%>' /></td>
                                            <td><asp:Label ID="lbl_Remaining_Amount" runat="server" Text='<%# String.Format("{0:###,###,####}",Convert.ToInt64(DataBinder.Eval(Container.DataItem, "Remaining_Amount")))%>' /></td>
                                            <td><asp:Label ID="lbl_Remaining_Installments" runat="server" Text='<%# Eval("Remaining_Installments") %>' /></td>
                                            <td><asp:Label ID="lbl_Start_Date" runat="server" Text='<%# Eval("Start_Date") %>' /></td>
                                            <td><asp:Label ID="lbl_End_Date" runat="server" Text='<%# Eval("End_Date") %>' /></td>
                                            <td>
                                                <asp:LinkButton ID="Edit" ForeColor="#0779c9" runat="server" OnClick="Edit_Click" OnClientClick="Open()" CommandArgument='<%# Eval("Mortgaged_Wonership_Id") %>'> <i class="fa fa-pencil" style="font-size:18px;"></i> </asp:LinkButton>
                                                &nbsp;&nbsp;
                                                <asp:LinkButton ID="Delete"  runat="server" CommandArgument='<%# Eval("Mortgaged_Wonership_Id") %>' OnClientClick="return confirm('Are you sure you want to delete?');" OnClick="Delete" ><i class="fa fa-trash" style="font-size:18px;"></i></asp:LinkButton>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        </tbody>
                                        </table>
                                    </FooterTemplate>
                                </asp:Repeater>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                        
                    </div>
                </div>
            </div>
        </div>

        <br />
        <br />
    </div>

    <script type="text/javascript">
        $(document).ready(function () {

            $('html, body').animate({
                scrollTop: $('#container-wrapper').offset().top
            }, 'slow');//w  w w.j a v a 2s.com

        });

        function Open() {

            $(document).ready(function () {

                $('html, body').animate({
                    scrollTop: $('#Top').offset().top
                }, 'slow');//w  w w.j a v a 2s.com 
            });
            /*---------------------------------------------------------------*/

            document.getElementById("M_Ownership").className = "collapse show";

            /*---------------------------------------------------------------*/
            var lbl = document.getElementById('<%=lbl_Titel_Add_M_Ownership.ClientID%>');
            if (document.dir == "ltr") {
                lbl.innerText = "Edit Mortgaged Property";
            }
            else {
                lbl.innerText = "تعديل الملكية المرهونة";
            }
            /*---------------------------------------------------------------*/
            var lbl = document.getElementById('<%=Add.ClientID%>').style.display = "none";
            var lbl = document.getElementById('<%=Edit.ClientID%>').style.display = "block";
        };
    </script>
</asp:Content>
