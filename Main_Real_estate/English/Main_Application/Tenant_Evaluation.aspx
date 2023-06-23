<%@ Page Title="" Language="C#" MasterPageFile="~/English/Main_Application/English.Master" AutoEventWireup="true" CodeBehind="Tenant_Evaluation.aspx.cs" Inherits="Main_Real_estate.English.Main_Application.Tenant_Evaluation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            var table = $('.datatable').DataTable({
                dom: 'Bfrtip',
               // lengthChange: false,
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
            border: 1px solid #dddddd;
            border-collapse: collapse;
            text-align: center !important;
            padding: 7px !important;
        }

        th {
            background-color: #52a2da;
            color: #fff;
            text-align: center;
        }

        tr:nth-child(even) {
            background-color: #dddddd;
        }
    </style>




    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <div class="container-fluid">
        <ul style="background-color: #efefef; min-height: 0px; width: 100%" class="navbar-nav sidebar sidebar-light accordion" id="accordionSidebar">
            <li class="nav-item" style="padding-bottom: 10px;" runat="server" id="Ownership_Div">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#M_Ownership" aria-expanded="true"
                    aria-controls="M_Ownership" style="width: 270px;">
                    <i class="fa fa-plus" style="font-size: 25px; font-weight: bold"></i>
                    <span style="font-size: 18px;"><asp:Label ID="lbl_Titel" runat="server"/></span>
                </a>
                <div id="M_Ownership" class="collapse" aria-labelledby="headingForm" data-parent="#accordionSidebar">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="card mb-12">
                                <div class="card-body">


                                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <div class="row">
                                                <div class="col-lg-4">
                                                    <div class="form-group">
                                                        <asp:Label ID="lbl_Tenant_Name" runat="server" Text="اسم العميل"></asp:Label>
                                                        <asp:DropDownList ID="Tenant_Name_DropDownList" runat="server" CssClass="form-control">
                                                        </asp:DropDownList>
                                                        <asp:RequiredFieldValidator ID="Tenant_Name_Req_Field_Val" ControlToValidate="Tenant_Name_DropDownList" ValidationGroup="Evaluation"
                                                            InitialValue="..............." runat="server" ErrorMessage="* حقل مطلوب !!!" ForeColor="Red"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>

                                                <div class="col-lg-4">
                                                    <div class="form-group">
                                                        <asp:Label ID="lbl_Main_Type" runat="server" Text="النوع الرئيسي للتقييم"></asp:Label>
                                                        <asp:DropDownList ID="Main_Type_DropDownList" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="Main_Type_DropDownList_SelectedIndexChanged">
                                                        </asp:DropDownList>
                                                        <asp:RequiredFieldValidator ID="Main_Type_Req_Field_Val" ControlToValidate="Main_Type_DropDownList" ValidationGroup="Evaluation"
                                                            InitialValue="..............." runat="server" ErrorMessage="* حقل مطلوب !!!" ForeColor="Red"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>

                                                <div class="col-lg-4">
                                                    <div class="form-group">
                                                        <asp:Label ID="lbl_Sub_Type" runat="server" Text="النوع الفرعي للتقييم"></asp:Label>
                                                        <asp:Label ID="Label3" runat="server"></asp:Label>
                                                        <asp:DropDownList ID="Sub_Type_DropDownList" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="Sub_Type_DropDownList_SelectedIndexChanged">
                                                        </asp:DropDownList>
                                                        <asp:RequiredFieldValidator ID="Sub_Type_Req_Field_Val" ControlToValidate="Sub_Type_DropDownList" ValidationGroup="Evaluation"
                                                            InitialValue="..............." runat="server" ErrorMessage="* حقل مطلوب !!!" ForeColor="Red"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                            </div>
                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="Main_Type_DropDownList" EventName="SelectedIndexChanged" />
                                        </Triggers>
                                    </asp:UpdatePanel>
                                    <%--------------------------------------------------------------------------------------------------------------------------------------------------------------%>
                                    <div class="row">
                                        <div class="col-lg-4">
                                            <div class="form-group" style="margin-top: -60px;">
                                                <br />
                                                <%--<asp:Button ID="btn_Add_T_E" runat="server" Text="إضافة" CssClass="btn btn" BackColor="#52a2da" ValidationGroup="Evaluation" ForeColor="White" Width="248px" OnClick="btn_Add_T_E_Click" />--%>
                                                <asp:LinkButton ID="Add" CssClass="btn btn" runat="server" BackColor="#52a2da" ValidationGroup="Evaluation" ForeColor="White" Width="248px" OnClick="btn_Add_T_E_Click">إضافة</asp:LinkButton>
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
    <br />

    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12 mb-4">
                <div class="card">
                    <div class="row" style="padding: 20px">
                        <div class="col-lg-4">

                            <div class="form-group">
                                <asp:Label ID="lbl_Tenant" runat="server" Text="اسم العميل"></asp:Label>
                                <asp:DropDownList ID="Tenant_DropDownList" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="Tenant_DropDownList_SelectedIndexChanged">
                                </asp:DropDownList>
                            </div>

                        </div>

                        <div class="col-lg-2" style="display:none">
                            <div class="form-group">
                                <asp:Label ID="lbl_Level" runat="server" Text="فئة التصنيف "></asp:Label>
                                <asp:DropDownList ID="Level_DropDownList" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="Level_DropDownList_SelectedIndexChanged">
                                    <asp:ListItem Value="1" Text="A"></asp:ListItem>
                                    <asp:ListItem Value="2" Text="B"></asp:ListItem>
                                    <asp:ListItem Value="3" Text="C"></asp:ListItem>
                                    <asp:ListItem Value="4" Text="D"></asp:ListItem>
                                    <asp:ListItem Value="5" Text="E"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                    </div>
                    <%--**********************************************************************************************************************************************************************--%>
                    <div class="row" style="padding: 20px">
                        <div class="col-lg-12 mb-4">
                            <!-- Simple Tables -->
                            <div class="card">
                                <div class="table-responsive" id="Grid">
                                    <asp:Repeater ID="tenant_List" runat="server" ClientIDMode="Static" OnItemDataBound="tenant_List_ItemDataBound">
                                        <HeaderTemplate>
                                            <table cellspacing="0" style="width: 100%; font-size: 11px" class="datatable table table-striped table-bordered">
                                                <thead>
                                                    <th></th>
                                                    <th style="text-align: center; vertical-align: middle;">#</th>
                                                    <th style="text-align: center; vertical-align: middle;"><asp:Label ID="lbl_Titel_1_Name" runat="server" /></th> <%--اسم--%>
                                                    <th style="text-align: center; vertical-align: middle;"><asp:Label ID="lbl_Titel_1_Mobile" runat="server" /></th> <%--جوال--%>
                                                    <th style="text-align: center; vertical-align: middle;"><asp:Label ID="lbl_Titel_1_Tell" runat="server" /></th> <%--هاتف--%>
                                                    <th style="text-align: center; vertical-align: middle;"><asp:Label ID="lbl_Titel_1_Email" runat="server" /></th> <%--ايميل--%>
                                                    <th style="text-align: center; vertical-align: middle;"><asp:Label ID="lbl_Titel_1_EV" runat="server" /></th> <%--تقيم--%>
                                                    <th style="text-align: center; vertical-align: middle;"><asp:Label ID="lbl_Titel_1_EVV" runat="server" /></th> <%--تقيم--%>
                                                </thead>
                                                <tbody>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <tr >
                                                <td data-toggle="collapse" data-target="#collapse<%# Container.ItemIndex%>name" class="accordion-toggle"> <i class="fa fa-eye" aria-hidden="true"></i> </td>
                                                <td><asp:Label ID="lblRowNumber" Text='<%# Container.ItemIndex + 1 %>' runat="server" /></td>
                                                <td>
                                                    <asp:Label ID="lbl_Tenants_Arabic_Name" runat="server" Text='<%# Eval("Tenants_Arabic_Name") %>' />
                                                    <asp:Label ID="lbl_Tenants_English_Name" runat="server" Text='<%# Eval("Tenants_English_Name") %>' />
                                                    <asp:Label ID="Tenant_Id" runat="server" Visible="false" Text='<%# Eval("Tenant_Id") %>' />

                                                </td>
                                                <td>
                                                    <asp:Label ID="lbl_Arabic_nationality" runat="server" Text='<%# Eval("Arabic_nationality") %>' />
                                                    <asp:Label ID="lbl_English_nationality" runat="server" Text='<%# Eval("English_nationality") %>' />
                                                </td>
                                                <td><asp:Label ID="lbl_Tenants_Mobile" runat="server" Text='<%# Eval("Tenants_Mobile") %>' /></td>
                                                <td><asp:Label ID="lbl_Tenants_Tell" runat="server" Text='<%# Eval("Tenants_Tell") %>' /></td>
                                                <td><asp:Label ID="lbl_Persenteg" runat="server" Text='<%# Eval("Persenteg") %>' /></td>
                                                <td><asp:Label ID="Label5" runat="server" /></td>
                                            </tr>
                                            <tr>
                                                <td colspan="8"><div id="collapse<%# Container.ItemIndex%>name" class="accordian-body collapse">
                                                    <asp:Repeater ID="Cases_Repeater" runat="server" ClientIDMode="Static" OnItemDataBound="Cases_Repeater_ItemDataBound">
                                                        <HeaderTemplate>
                                                            <table cellspacing="0" style="width: 100%; font-size: 11px" class="datatable table table-striped table-bordered">
                                                                <thead style="background-color:#d670ac">
                                                                    <th style="text-align: center; vertical-align: middle; background-color:#d670ac">#</th>
                                                                    <th style="text-align: center; vertical-align: middle;background-color:#d670ac"><asp:Label ID="lbl_Titel_2_Satus" runat="server" /></th> <%--حالة--%>
                                                                    <th style="text-align: center; vertical-align: middle;background-color:#d670ac"><asp:Label ID="lbl_Titel_2_Date" runat="server" /></th> <%--تاريخ--%>
                                                                    <th style="background-color:#d670ac"></th>
                                                                </thead>
                                                                <tbody>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <tr>
                                                                <td>
                                                                <asp:Label ID="lblRowNumber" Text='<%# Container.ItemIndex + 1 %>' runat="server" /></td>
                                                                <td>
                                                                    <asp:Label ID="lbl_E_Ar_Name" runat="server" Text='<%# Eval("Ar_Name") %>' />
                                                                    <asp:Label ID="lbl_E_En_Name" runat="server" Text='<%# Eval("En_Name") %>' />
                                                                </td>
                                                                <td><asp:Label ID="lbl_E_Date" runat="server" Text='<%# Eval("Date") %>' /></td>
                                                                <td><asp:LinkButton  runat="server" CommandArgument='<%# Eval("Tenant_Evaluation_Id") %>' OnClientClick="return confirm('Are you sure you want to delete?');" OnClick="Delete" ><i class="fa fa-trash" style="font-size:18px;"></i></asp:LinkButton></td>
                                                            </tr>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            </tbody>
                                                            </table>
                                                        </FooterTemplate>
                                                    </asp:Repeater>
                                                </div></td>
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
                    <%--**********************************************************************************************************************************************************************--%>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
