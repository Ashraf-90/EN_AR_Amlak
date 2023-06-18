<%@ Page Title="" Language="C#" MasterPageFile="~/English/Main_Application/English.Master" AutoEventWireup="true" CodeBehind="Edit_complaint_report_request.aspx.cs" Inherits="Main_Real_estate.English.Main_Application.Edit_complaint_report_request" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        table {
            width: 100%;
        }

        th {
            border: 1px solid #dddddd;
            text-align: center;
            padding: 8px;
        }

        td {
            border: 1px solid #dddddd;
            padding: 8px;
        }

        .hiddencol {
            display: none;
        }
    </style>
    <%--------------------------------------------------------------------------------------------------------%>
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/chosen/1.8.7/chosen.jquery.min.js"></script>
    <link href="../CSS/DDL.css" rel="stylesheet" />
    <%--------------------------------------------------------------------------------------------------------%>
    <div class="container-fluid" id="container-wrapper">
        <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800">
                <asp:Label ID="lbl_titel_Add_New_Maintenance" runat="server" Text="تعديل طلب (بلاغ أو شكوى)"></asp:Label>&nbsp;
                <asp:Label ID="lbl_Success_Add_New_complaint_repor_Request" runat="server"></asp:Label>
                <asp:Label ID="lbl_Success_Add_New_Maintenance" runat="server" ForeColor="Green"></asp:Label>
            </h1>
        </div>
        <%--------------------------------------------------------------------------------------------------------%>
        <div class="row">
            <div class="col-lg-12">
                <div class="card mb-12">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-lg-3" >
                                <div class="form-group">
                                    <asp:Label ID="lbl_Complainte_Source" runat="server" Text="مصدر الطلب"></asp:Label>
                                    <asp:DropDownList ID="Complainte_Source_DropDownList" runat="server" CssClass="form-control" AutoPostBack="true"
                                        OnSelectedIndexChanged="Complainte_Source_DropDownList_SelectedIndexChanged">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="Complainte_Source_RequiredFieldValidator" ValidationGroup="Maintenance_RequiredField"
                                        ControlToValidate="Complainte_Source_DropDownList" InitialValue="..............." runat="server"
                                        ErrorMessage="* حقل مطلوب !!!" ForeColor="Red"> </asp:RequiredFieldValidator>
                                </div>
                            </div>

                            <div class="col-lg-3" runat="server" id="Employee_Tenant_Div">
                                <div class="form-group">
                                    <asp:Label ID="lbl_Employee_Tenant" runat="server" Text="اسم المستأجر"></asp:Label>
                                    <asp:DropDownList ID="Employee_Tenant_DropDownList" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="Employee_Tenant_DropDownList_SelectedIndexChanged">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="Employee_Tenant_RequiredFieldValidator" ValidationGroup="Maintenance_RequiredField"
                                        ControlToValidate="Employee_Tenant_DropDownList" runat="server" InitialValue="..............." ErrorMessage="* حقل مطلوب !!!" ForeColor="Red"> </asp:RequiredFieldValidator>
                                </div>
                            </div>

                              <div class="col-lg-3" runat="server" id="Other_Div" visible="false">
                                <div class="form-group">
                                    <asp:Label ID="lbl_Souorce_Name" runat="server" Text="اسم المصدر"></asp:Label>
                                    <asp:TextBox ID="txt_Souorce_Name" runat="server" CssClass="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="Souorce_Name_ReqFieldVali" ValidationGroup="Maintenance_RequiredField"
                                        ControlToValidate="txt_Souorce_Name" runat="server" InitialValue="..............." ErrorMessage="* حقل مطلوب !!!" ForeColor="Red"> </asp:RequiredFieldValidator>
                                </div>
                            </div>

                            <div class="col-lg-3">
                                <div class="form-group">
                                    <asp:Label ID="lbl_Building_Or_unit" runat="server" Text="نوع الموقع"></asp:Label>
                                    <asp:DropDownList ID="Building_Or_unit_DropDownList" runat="server" CssClass="form-control" AutoPostBack="true" 
                                        OnSelectedIndexChanged="Building_Or_unit_DropDownList_SelectedIndexChanged">
                                        <asp:ListItem Value="1" Text="بناء"></asp:ListItem>
                                        <asp:ListItem Value="2" Text="وحدة"></asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="Building_Or_unit_RequiredFieldValidator" ControlToValidate="Building_Or_unit_DropDownList"
                                        InitialValue="..............." runat="server" ValidationGroup="Maintenance_RequiredField" ErrorMessage="* حقل مطلوب !!!" ForeColor="Red">
                                    </asp:RequiredFieldValidator>
                                </div>
                            </div>

                            <div class="col-lg-3">
                                <div class="form-group">
                                    <asp:Label ID="lbl_Request_Classification" runat="server" Text="تصنيف الطلب"></asp:Label>
                                    <asp:DropDownList ID="Request_Classification_DropDownList" runat="server" CssClass="form-control"> </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="Request_Classification_RequiredFieldValidator" ControlToValidate="Request_Classification_DropDownList"
                                        InitialValue="..............." runat="server" ValidationGroup="Maintenance_RequiredField" ErrorMessage="* حقل مطلوب !!!" ForeColor="Red">
                                    </asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>
                        <%--------------------------------------------------------------------------------------------------------%>
                        <div class="row">
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <asp:Label ID="lbl_Building_Name" runat="server" Text="اسم البناء"></asp:Label>
                                    <asp:DropDownList ID="Building_Name_DropDownList" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="Building_Name_DropDownList_SelectedIndexChanged">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="Building_Name_RequiredFieldValidator" ControlToValidate="Building_Name_DropDownList"
                                        InitialValue="..............." runat="server" ValidationGroup="Maintenance_RequiredField" ErrorMessage="* حقل مطلوب !!!" ForeColor="Red">
                                    </asp:RequiredFieldValidator>
                                </div>
                            </div>

                            <div class="col-lg-3" id="Unit_Div" runat="server" visible="false">
                                <div class="form-group">
                                    <asp:Label ID="lbl_Units" runat="server" Text="الوحدة"></asp:Label>
                                    <asp:DropDownList ID="Units_DropDownList" runat="server" CssClass="form-control"> </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="Units_DropDownList_RequiredFieldValidator" ControlToValidate="Units_DropDownList"
                                        InitialValue="..............." runat="server" ValidationGroup="Maintenance_RequiredField" ErrorMessage="* حقل مطلوب !!!" ForeColor="Red">
                                    </asp:RequiredFieldValidator>
                                </div>
                            </div>



                            <div class="col-lg-3">
                                <div class="form-group">
                                    <asp:Label ID="lbl_Request_Type" runat="server" Text="النوع"></asp:Label>
                                    <asp:DropDownList ID="Request_Type_DropDownList" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="Request_Type_DropDownList_SelectedIndexChanged">
                                        
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="Request_Type_RequiredFieldValidator" ControlToValidate="Request_Type_DropDownList"
                                        InitialValue="..............." runat="server" ValidationGroup="Maintenance_RequiredField" ErrorMessage="* حقل مطلوب !!!" ForeColor="Red">
                                    </asp:RequiredFieldValidator>
                                </div>
                            </div>

                            <div class="col-lg-3">
                                <div class="form-group">
                                    <asp:Label ID="lbl_Order_Direction" runat="server" Text="توجيه الطلب"></asp:Label>
                                    <asp:DropDownList ID="Order_Direction_DropDownList" runat="server" CssClass="form-control"> </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="Order_Direction_RequiredFieldValidator" ControlToValidate="Order_Direction_DropDownList"
                                        InitialValue="..............." runat="server" ValidationGroup="Maintenance_RequiredField" ErrorMessage="* حقل مطلوب !!!" ForeColor="Red">
                                    </asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>
                        <%--------------------------------------------------------------------------------------------------------%>
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <asp:Label ID="lbl_Rreport_Text" runat="server" Text=" نص الطلب"></asp:Label>&nbsp;
                                    <asp:TextBox ID="txt_Rreport_Text" TextMode="MultiLine" Height="40px" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-lg-6">
                                <div class="form-group">
                                    <asp:Label ID="lbl_Inspection_Report_Description" runat="server" Text=" وصف تقرير الفحص"></asp:Label>&nbsp;
                                    <asp:TextBox ID="txt_Inspection_Report_Description" Height="40px" TextMode="MultiLine" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                        </div><br />
                        <%--------------------------------------------------------------------------------------------------------%>
                        <div class="row">
                            <div class="col-lg-5" style="border-style:solid; border-radius:10px; height: 140px;"">
                                <h4><asp:Label ID="lbl_priority" runat="server"/></h4>
                                <div class="row">
                                    <div class="col-lg-6">
                                <div class="form-group">
                                    <asp:Label ID="lbl_Order_priority" runat="server" Text="مدى العاجلية "></asp:Label>
                                    <asp:DropDownList ID="Order_priority_DropDownList" runat="server" CssClass="form-control"></asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="Order_priority_RequiredFieldValidator" ControlToValidate="Order_priority_DropDownList"
                                        InitialValue="..............." runat="server" ValidationGroup="Maintenance_RequiredField" ErrorMessage="* حقل مطلوب !!!" ForeColor="Red">
                                    </asp:RequiredFieldValidator>
                                </div>
                            </div>

                            <div class="col-lg-6">
                                <div class="form-group">
                                    <asp:Label ID="lbl_Danger_Magnitude" runat="server" Text="درجة الخطورة "></asp:Label>
                                    <asp:DropDownList ID="Danger_Magnitude_DropDownList" runat="server" CssClass="form-control"> </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="Danger_Magnitude_RequiredFieldValidator" ControlToValidate="Danger_Magnitude_DropDownList"
                                        InitialValue="..............." runat="server" ValidationGroup="Maintenance_RequiredField" ErrorMessage="* حقل مطلوب !!!" ForeColor="Red">
                                    </asp:RequiredFieldValidator>
                                </div>
                            </div>
                                </div>
                            </div>
                            

                            <div class="col-lg-3">
                                <div class="form-group">
                                    <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                                        <ContentTemplate>
                                            <asp:Label ID="lbl_Report_Date" runat="server" Text="تاريخ تقديم الطلب"></asp:Label>&nbsp;

                                            <asp:RegularExpressionValidator  runat="server" ControlToValidate="txt_Report_Date" ValidationExpression="(((0|1)[0-9]|2[0-9]|3[0-1])\/(0[1-9]|1[0-2])\/((19|20)\d\d))$"
                                            ErrorMessage="dd/MM/yyyy" ValidationGroup="Maintenance_RequiredField"  ForeColor="Red"/>

                                            <asp:TextBox ID="txt_Report_Date" runat="server" CssClass="form-control"></asp:TextBox>
                                            <asp:Button ID="Report_Date_Chosee" runat="server" Text="إختر التاريخ" OnClick="Date_Chosee_Click" />
                                            <asp:ImageButton ID="ImageButton1" ImageUrl="Main_Image/Calander_Close.png" Width="10px" Height="10px" Visible="false" OnClick="ImageButton1_Click" runat="server" />
                                            <div id="Report_Date_divCalendar" runat="server" style="position: page;" visible="false">

                                                <asp:Calendar ID="Report_Date_Calendar" runat="server" Height="200px" Width="220px" BackColor="White" BorderColor="#3366CC" BorderWidth="1px" CellPadding="1" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#003399" OnSelectionChanged="Report_Date_Calendar_SelectionChanged1">
                                                    <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" />
                                                    <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
                                                    <OtherMonthDayStyle ForeColor="#999999" />
                                                    <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                                                    <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
                                                    <TitleStyle BackColor="#003399" BorderColor="#3366CC" BorderWidth="1px" Font-Bold="True" Font-Size="10pt" ForeColor="#CCCCFF" Height="25px" />
                                                    <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
                                                    <WeekendDayStyle BackColor="#CCCCFF" />
                                                </asp:Calendar>
                                            </div>
                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="Report_Date_Chosee" EventName="Click" />
                                            <asp:AsyncPostBackTrigger ControlID="Report_Date_Calendar" EventName="SelectionChanged" />
                                            <asp:AsyncPostBackTrigger ControlID="ImageButton1" EventName="Click" />
                                        </Triggers>
                                    </asp:UpdatePanel>
                                </div>
                            </div>

                            <div class="col-lg-2">
                                <div class="form-group">
                                    <asp:Label ID="lbl_Image_One" runat="server" Text="تحميل صورة أولى"></asp:Label>
                                    <asp:FileUpload ID="Image_Befor_FileUpload" runat="server" CssClass="form-control" />
                                    <asp:Label ID="Image_Befor" runat="server" Text="Label" Visible="false"></asp:Label>
                                    <asp:Label ID="Image_Befor_Pathe" runat="server" Text="Label" Visible="false"></asp:Label>


                                    <div runat="server" id="Image_Befor_Div">
                                        <a runat="server" id="Link_Image_Befor" style="font-size: 15px;">
                                            <i class="fa fa-paperclip" style="font-size: 20px;"></i>
                                            <asp:Label ID="lbl_Link_Image_Befor" runat="server" Text=""></asp:Label>
                                        </a>
                                        <asp:ImageButton ID="Btn_Remove_Link_Image_Befor" OnClick="Btn_Remove_Link_Image_Befor_Click" runat="server" Width="15px" Height="15px" ImageUrl="Main_Image/Delete.png" />
                                    </div>

                                </div>
                            </div>
                            <div class="col-lg-2">
                                <div class="form-group">
                                    <asp:Label ID="lbl_Image_Two" runat="server" Text="تحميل صورة ثانية "></asp:Label>
                                    <asp:FileUpload ID="Image_After_FileUpload" runat="server" CssClass="form-control" />
                                    <asp:Label ID="Image_After" runat="server" Text="Label" Visible="false"></asp:Label>
                                    <asp:Label ID="Image_After_Pathe" runat="server" Text="Label" Visible="false"></asp:Label>

                                    <div runat="server" id="Image_After_Div">
                                        <a runat="server" id="Link_Image_After" style="font-size: 15px;">
                                            <i class="fa fa-paperclip" style="font-size: 20px;"></i>
                                            <asp:Label ID="lbl_Link_Image_After" runat="server" Text=""></asp:Label>
                                        </a>
                                        <asp:ImageButton ID="Btn_Remove_Link_Image_After" OnClick="Btn_Remove_Link_Image_After_Click" runat="server" Width="10px" Height="10px" ImageUrl="Main_Image/Delete.png" />
                                    </div>

                                </div>
                            </div>
                        </div><hr />
                        <%--------------------------------------------------------------------------------------------------------%>
                        <h4><asp:Label ID="lbl_procedures" runat="server" /></h4>
                        <div class="row" style="border-style:solid; border-radius:10px; padding-top:10px ;border-radius:5px">
                            
                            <div class="col-lg-6">
                                <asp:Label ID="lbl_Achievement_Verification" runat="server" Text="التحقق من الإنجاز"></asp:Label>
                                <div style="border-style: solid; border-width: 1px; height: 50px">
                                    <asp:RadioButtonList ID="Achievement_Verification_RadioButtonList" RepeatDirection="Horizontal" runat="server" CellPadding="20"> </asp:RadioButtonList>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <asp:Label ID="lbl_precaution" runat="server" Text=" الإجراء الوقائي"></asp:Label>&nbsp;
                                    <asp:TextBox ID="txt_precaution" TextMode="MultiLine" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                            
                        </div>

                        <%--*******************************************************************************************************************************************************
                        ******************************************************************************************************************************************************--%>
                         <br />
                        <div id="container" class="container-fluid" >
                            <div calss="row">
                                <h4>
                                    <asp:Label ID="lbl_Tenant_Cheque" runat="server"></asp:Label></h4>
                                        <div class="row">
                                            <div class="table-responsive">
                                                <asp:GridView ID="Maintenance_List" DataKeyNames="Maintenance_Request_ID" runat="server" AutoGenerateColumns="false"  
                                                    OnRowDeleting="Maintenance_List_RowDeleting" OnRowDataBound="Maintenance_List_RowDataBound">
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="#" ItemStyle-Width="10"><%--0--%>
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblRowNumber" Text='<%# Container.DataItemIndex + 1 %>' runat="server" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <%--------------------------------------------------------------------------------------------------%>
                                                        <asp:TemplateField HeaderText="حالة XXX"><%--1--%>
                                                            <ItemTemplate>
                                                                <asp:Label ID="lbl_Activ" runat="server" Text='<%# Eval("Activ")%>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <%--------------------------------------------------------------------------------------------------%>
                                                        <asp:TemplateField HeaderText="نوع الصيانة"><%--2--%>
                                                            <ItemTemplate>
                                                                <asp:Label ID="lbl_Categoty_AR" runat="server" Text='<%# Eval("Categoty_AR")%>'></asp:Label>
                                                                <asp:Label ID="lbl_Categoty_En" runat="server" Text='<%# Eval("Categoty_EN")%>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <%--------------------------------------------------------------------------------------------------%>
                                                        <asp:TemplateField HeaderText="الأصل "><%--3--%>
                                                            <ItemTemplate>
                                                                <asp:Label ID="lbl_Assets_Arabic_Name" runat="server" Text='<%# Eval("Assets_Arabic_Name")%>'></asp:Label>
                                                                <asp:Label ID="lbl_Assets_English_Name" runat="server" Text='<%# Eval("Assets_English_Name")%>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <%-----------------------------------------------------------------------------------%>
                                                       <asp:TemplateField HeaderText="جهة التكلفة"><%--4--%>
                                                            <ItemTemplate>
                                                                <asp:Label ID="lbl_Cost_Direction" runat="server" Text='<%# Eval("Cost_Direction")%>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <%--------------------------------------------------------------------------------------------------%>
                                                         <asp:TemplateField HeaderText="جهة التنفيذ"><%--5--%>
                                                            <ItemTemplate>
                                                                <asp:Label ID="lbl_Executing_Agency" runat="server" Text='<%# Eval("Executing_Agency")%>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <%--------------------------------------------------------------------------------------------------%>
                                                        <asp:TemplateField HeaderText="الفني المسؤول"><%--6--%>
                                                            <ItemTemplate>
                                                                <asp:Label ID="lbl_AR_T_echnical" runat="server" Text='<%# Eval("T_echnical")%>'></asp:Label>
                                                                <asp:Label ID="lbl_EN_T_echnical" runat="server" Text='<%# Eval("EN_T_echnical")%>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <%--------------------------------------------------------------------------------------------------%>
                                                        <asp:TemplateField HeaderText="المراقب"><%--7--%>
                                                            <ItemTemplate>
                                                                <asp:Label ID="lbl_AR_W_atcher" runat="server" Text='<%# Eval("W_atcher")%>'></asp:Label>
                                                                <asp:Label ID="lbl_EN_W_atcher" runat="server" Text='<%# Eval("EN_W_atcher")%>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <%--------------------------------------------------------------------------------------------------%>
                                                        <asp:TemplateField HeaderText="تاريخ البدء"><%--8--%>
                                                            <ItemTemplate>
                                                                <asp:Label ID="lbl_Start_Date" runat="server" Text='<%# Eval("Start_Date") %>'>  </asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <%------------------------------------------------------------------------%>
                                                        <asp:TemplateField HeaderText="تاريخ الأنتهاء"><%--9--%>
                                                            <ItemTemplate>
                                                                <asp:Label ID="lbl_End_Date" runat="server" Text='<%# Eval("End_Date") %>'>  </asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <%------------------------------------------------------------------------%>
                                                        <asp:TemplateField HeaderText="التكلفة "><%--10--%>
                                                            <ItemTemplate>
                                                                <asp:Label ID="lbl_Cost" runat="server" Text='<%# Eval("Cost") %>'>  
                                                                </asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <%-----------------------------------------------------------------------------------%>
                                                        <asp:CommandField ShowDeleteButton="true"  ButtonType="Image" DeleteImageUrl="~/English/Main_Application/Main_Image/Delete.png"  ControlStyle-Width="25px" ControlStyle-Height="25px" />
                                                    </Columns>
                                                    <RowStyle HorizontalAlign="Center" />
                                                </asp:GridView>
                                            </div>
                                        </div>
                            </div>
                        </div>
                        
                        

                        <%--*******************************************************************************************************************************************************
                        ******************************************************************************************************************************************************--%>

                    </div>
                </div>
            </div>
        </div>
    </div>
    <br />
    <asp:Panel ID="Maintenance_Panel" runat="server" Visible="false">
        <div class="container-fluid" id="container-wrapper_2">
            <div class="d-sm-flex align-items-center justify-content-between mb-4">
                <h1 class="h3 mb-0 text-gray-800">
                    <asp:Label ID="Add_Maintenace" runat="server" Text="إضافة طلب صيانة"></asp:Label>&nbsp;
                </h1>
            </div>
            <%--------------------------------------------------------------------------------------------------------%>
            <div class="row">
                <div class="col-lg-12">
                    <div class="card mb-12">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-lg-3">
                                    <div class="form-group">
                                        <asp:Label ID="lbl_Maintenance_Status" runat="server" Text="حالة طلب الصيانة "></asp:Label>
                                        <asp:DropDownList ID="Maintenance_Status_DropDownList" runat="server" CssClass="form-control"> </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="Maintenance_Status_RequiredFieldValidator" ControlToValidate="Maintenance_Status_DropDownList"
                                            InitialValue="..............." runat="server" ValidationGroup="complaint_report_RequiredField" ErrorMessage="* حقل مطلوب !!!" ForeColor="Red">
                                        </asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                <div class="col-lg-3">
                                    <div class="form-group">
                                        <asp:Label ID="lbl_Maintenance_Type" runat="server" Text="نوع الصيانة "></asp:Label>
                                        <asp:DropDownList ID="Maintenance_Type_DropDownList" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="Maintenance_Type_DropDownList_SelectedIndexChanged">
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="Maintenance_Type_RequiredFieldValidator" ControlToValidate="Maintenance_Type_DropDownList"
                                            InitialValue="..............." runat="server" ValidationGroup="complaint_report_RequiredField" ErrorMessage="* حقل مطلوب !!!" ForeColor="Red">
                                        </asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                <div class="col-lg-3">
                                    <div class="form-group">
                                        <asp:Label ID="lbl_Maintenance_SubType" runat="server" Text="النوع الفرعي للصيانة "></asp:Label>
                                        <asp:DropDownList ID="Maintenance_SubType_DropDownList" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="Maintenance_SubType_DropDownList_SelectedIndexChanged">
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="Maintenance_SubType_RequiredFieldValidator" ControlToValidate="Maintenance_SubType_DropDownList"
                                            InitialValue="..............." runat="server" ValidationGroup="complaint_report_RequiredField" ErrorMessage="* حقل مطلوب !!!" ForeColor="Red">
                                        </asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                <div class="col-lg-3">
                                    <div class="form-group">
                                        <asp:Label ID="lbl_Asset" runat="server" Text="الأصل"></asp:Label>
                                        <asp:DropDownList ID="Asset_DropDownList" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="Asset_DropDownList_SelectedIndexChanged">
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="Asset_RequiredFieldValidator" ControlToValidate="Asset_DropDownList"
                                            InitialValue="..............." runat="server" ValidationGroup="complaint_report_RequiredField" ErrorMessage="* حقل مطلوب !!!" ForeColor="Red">
                                        </asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </div>

                            <%--------------------------------------------------------------------------------------------------------%>

                            <div class="row">
                                <div class="col-lg-3">
                                    <div class="form-group">
                                        <asp:Label ID="lbl_Maintenance_Guarantor" runat="server" Text="تحميل التكلفة على "></asp:Label>
                                        <asp:DropDownList ID="Maintenance_Guarantor_DropDownList" runat="server" CssClass="form-control">  </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="Maintenance_Guarantor_RequiredFieldValidator" ControlToValidate="Maintenance_Guarantor_DropDownList"
                                            InitialValue="..............." runat="server" ValidationGroup="complaint_report_RequiredField" ErrorMessage="* حقل مطلوب !!!" ForeColor="Red">
                                        </asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                <div class="col-lg-3">
                                    <div class="form-group">
                                        <asp:Label ID="lbl_Executing_Agency" runat="server" Text="الجهة المنفذة"></asp:Label>
                                        <asp:DropDownList ID="Executing_Agency_DropDownList" runat="server" CssClass="form-control"> </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="Executing_Agency_RequiredFieldValidator" ControlToValidate="Executing_Agency_DropDownList"
                                            InitialValue="..............." runat="server" ValidationGroup="complaint_report_RequiredField" ErrorMessage="* حقل مطلوب !!!" ForeColor="Red">
                                        </asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </div>

                            <%--------------------------------------------------------------------------------------------------------%>

                            <div class="row">
                                <div class="col-lg">
                                    <div class="form-group">
                                        <asp:Label ID="lbl_Technical" runat="server" Text="الفني المسؤول "></asp:Label>
                                        <asp:DropDownList ID="Technical_DropDownList" runat="server" CssClass="form-control">
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="Technical_RequiredFieldValidator" ControlToValidate="Technical_DropDownList"
                                            InitialValue="..............." runat="server" ValidationGroup="complaint_report_RequiredField" ErrorMessage="* حقل مطلوب !!!" ForeColor="Red">
                                        </asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                <div class="col-lg">
                                    <div class="form-group">
                                        <asp:Label ID="lbl_Observer" runat="server" Text="المراقب"></asp:Label>
                                        <asp:DropDownList ID="Observer_DropDownList" runat="server" CssClass="form-control">
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="Observer_RequiredFieldValidator" ControlToValidate="Observer_DropDownList"
                                            InitialValue="..............." runat="server" ValidationGroup="complaint_report_RequiredField" ErrorMessage="* حقل مطلوب !!!" ForeColor="Red">
                                        </asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                <div class="col-lg">
                                    <asp:UpdatePanel ID="Start_Date_UpdatePanel" runat="server">
                                        <ContentTemplate>
                                            <asp:Label ID="lbl_Start_Date" runat="server" Text="تاريخ البدء"></asp:Label>&nbsp;

                                            <asp:RegularExpressionValidator ID="Start_Date_RegularExpressionValidator" runat="server" ControlToValidate="txt_Start_Date" ValidationExpression="(((0|1)[0-9]|2[0-9]|3[0-1])\/(0[1-9]|1[0-2])\/((19|20)\d\d))$"
                                            ErrorMessage="يجب أن يكون التاريخ بالنمط:  dd/MM/yyyy" ValidationGroup="Maintenance_RequiredField"  ForeColor="Red"/>

                                             <asp:TextBox ID="txt_Start_Date" runat="server" CssClass="form-control"></asp:TextBox>
                                            <asp:Button ID="Start_Date_Chosee" runat="server" Text="إختر التاريخ" OnClick="Start_Date_Chosee_Click" />
                                            <asp:ImageButton ID="ImageButton2" ImageUrl="Main_Image/Calander_Close.png" Width="10px" Height="10px" Visible="false" OnClick="ImageButton2_Click" runat="server" />
                                            <div id="Start_Date_Div" runat="server" visible="false" style="position: page;">
                                                <asp:Calendar ID="Start_Date_Calendar" runat="server" Height="200px" Width="220px" BackColor="White" BorderColor="#3366CC" BorderWidth="1px" CellPadding="1" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#003399" OnSelectionChanged="Start_Date_Calendar_SelectionChanged2">
                                                    <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" />
                                                    <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
                                                    <OtherMonthDayStyle ForeColor="#999999" />
                                                    <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                                                    <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
                                                    <TitleStyle BackColor="#003399" BorderColor="#3366CC" BorderWidth="1px" Font-Bold="True" Font-Size="10pt" ForeColor="#CCCCFF" Height="25px" />
                                                    <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
                                                    <WeekendDayStyle BackColor="#CCCCFF" />
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

                                <div class="col-lg">
                                    <asp:UpdatePanel ID="End_Date_UpdatePanel" runat="server">
                                        <ContentTemplate>
                                            <asp:Label ID="lbl_End_Date" runat="server" Text="تاريخ الإنتهاء"></asp:Label>&nbsp;


                                            <asp:RegularExpressionValidator ID="End_Date_RegularExpressionValidator" runat="server" ControlToValidate="txt_End_Date" ValidationExpression="(((0|1)[0-9]|2[0-9]|3[0-1])\/(0[1-9]|1[0-2])\/((19|20)\d\d))$"
                                            ErrorMessage="يجب أن يكون التاريخ بالنمط:  dd/MM/yyyy" ValidationGroup="Maintenance_RequiredField"  ForeColor="Red"/>

                                            <asp:TextBox ID="txt_End_Date" runat="server" CssClass="form-control"></asp:TextBox>
                                            <asp:Button ID="End_Date_Chosee" runat="server" Text="إختر التاريخ" OnClick="End_Date_Chosee_Click" />
                                            <asp:ImageButton ID="ImageButton3" ImageUrl="Main_Image/Calander_Close.png" Width="10px" Height="10px" Visible="false" OnClick="ImageButton3_Click" runat="server" />
                                            <div id="End_Date_Div" runat="server" visible="false" style="position: page;">
                                                <asp:Calendar ID="End_Date_Calendar" runat="server" Height="200px" Width="220px" BackColor="White" BorderColor="#3366CC" BorderWidth="1px" CellPadding="1" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#003399" OnSelectionChanged="End_Date_Calendar_SelectionChanged1">
                                                    <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" />
                                                    <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
                                                    <OtherMonthDayStyle ForeColor="#999999" />
                                                    <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                                                    <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
                                                    <TitleStyle BackColor="#003399" BorderColor="#3366CC" BorderWidth="1px" Font-Bold="True" Font-Size="10pt" ForeColor="#CCCCFF" Height="25px" />
                                                    <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
                                                    <WeekendDayStyle BackColor="#CCCCFF" />
                                                </asp:Calendar>
                                            </div>
                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="End_Date_Calendar" EventName="SelectionChanged" />
                                            <asp:AsyncPostBackTrigger ControlID="Start_Date_Chosee" EventName="Click" />
                                            <asp:AsyncPostBackTrigger ControlID="ImageButton3" EventName="Click" />
                                        </Triggers>
                                    </asp:UpdatePanel>
                                </div>
                                <div class="col-lg">
                                    <div class="form-group">
                                        <asp:Label ID="lbl_Cost" runat="server" Text="التكلفة"></asp:Label>&nbsp;
                                        <asp:TextBox ID="txt_Cost"  runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                            </div>
                            </div>
                            <asp:ImageButton ID="Add_Maintenane" runat="server" ImageUrl="~/English/Main_Application/Main_Image/plus.png" Width="40px" Height="40px" OnClick="Add_Maintenane_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </asp:Panel>
    <%-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------%>

    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-3">
                <asp:Button ID="btn_Edit_Request" runat="server" Text="حفظ  التغيرات" CssClass="btn  mb-1" BackColor="#52a2da" ForeColor="White" Width="248px" ValidationGroup="Maintenance_RequiredField" OnClick="btn_Add_Request_Click" />
            </div>
            <div class="col-lg-3">
                <asp:Button ID="btn_Back_To_Request_List" runat="server" Text="العودة إلى قائمة الطلبات" ValidationGroup="x" CssClass="btn btn-light mb-1" OnClick="btn_Edit_Request_Click"  />
            </div>
            <div >
                <br />
                <asp:LinkButton ID="Delete_Request"  runat="server" ValidationGroup="Delete" OnClick="Delete_Request_Click" OnClientClick="return confirm('Are you sure you want to delete?');"  ><i class="fa fa-trash" style="font-size:40px; color:#0779c9"></i></asp:LinkButton>
            </div>
            <div class="col-lg-4" >
                <div class="form-group" runat="server" id="Delete_Div">
                    <asp:Label ID="lbl_Reason_Delete" runat="server" Text="سبب الحذف" ></asp:Label>
                    <asp:TextBox ID="txt_Reason_Delete" TextMode="MultiLine" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="Delete_ReqFieVal" ControlToValidate="txt_Reason_Delete"
                    runat="server" ErrorMessage="* يرجى توضيح سبب الحذف" ForeColor="Red" ValidationGroup="Delete"></asp:RequiredFieldValidator>
                </div>
            </div>
        </div>
    </div>
    <script>$('#<%= Complainte_Source_DropDownList.ClientID %>').chosen();</script>
    <script>$('#<%= Units_DropDownList.ClientID %>').chosen();</script>
    <script>$('#<%= Employee_Tenant_DropDownList.ClientID %>').chosen();</script>
    <script>$('#<%= Building_Or_unit_DropDownList.ClientID %>').chosen();</script>
    <script>$('#<%= Building_Name_DropDownList.ClientID %>').chosen();</script>
    <script>$('#<%= Request_Classification_DropDownList.ClientID %>').chosen();</script>
    <script>$('#<%= Request_Type_DropDownList.ClientID %>').chosen();</script>
    <script>$('#<%= Order_Direction_DropDownList.ClientID %>').chosen();</script>
    <script>$('#<%= Order_priority_DropDownList.ClientID %>').chosen();</script>
    <script>$('#<%= Danger_Magnitude_DropDownList.ClientID %>').chosen();</script>
    <script>$('#<%= Maintenance_Status_DropDownList.ClientID %>').chosen();</script>
    <script>$('#<%= Maintenance_Type_DropDownList.ClientID %>').chosen();</script>
    <script>$('#<%= Maintenance_SubType_DropDownList.ClientID %>').chosen();</script>
    <script>$('#<%= Asset_DropDownList.ClientID %>').chosen();</script>
    <script>$('#<%= Maintenance_Guarantor_DropDownList.ClientID %>').chosen();</script>
    <script>$('#<%= Executing_Agency_DropDownList.ClientID %>').chosen();</script>
    <script>$('#<%= Technical_DropDownList.ClientID %>').chosen();</script>
    <script>$('#<%= Observer_DropDownList.ClientID %>').chosen();</script>
</asp:Content>
