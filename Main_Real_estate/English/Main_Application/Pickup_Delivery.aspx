<%@ Page Title="" Language="C#" MasterPageFile="~/English/Main_Application/English.Master" AutoEventWireup="true" CodeBehind="Pickup_Delivery.aspx.cs" Inherits="Main_Real_estate.English.Main_Application.Pickup_Delivery" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/chosen/1.8.7/chosen.jquery.min.js"></script>
    <link href="../CSS/DDL.css" rel="stylesheet" /> 


   <%-- <style>
        table, th, td {
            
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
            text-align: center;

        }


        .table-row-stripe tr, .table-row-stripe td { background-color: #fff; }
        .table-row-stripe table tr, .table-row-stripe table tr td{ border: none; padding: 10px;}
        .table-row-stripe tr{
            text-align: right !important;
            border-bottom: 1px solid #ddd;
            border-top: 1px solid #ddd;
            border-collapse: collapse;
        } 
       
        .table-row-stripe td, .table-row-stripe th{
            padding: 5px;
            text-align: center;
        }
        
    </style>--%>

    <style>
        .Tbl table {
            font-family: arial, sans-serif;
            border-collapse: collapse;
            width: 100%;
        }

        .Tbl td, th {
            border: 1px solid #dddddd;
            text-align: center;
            padding: 8px;
        }

    </style>
    

    <div class="container-fluid" id="container-wrapper" style="margin: auto;">
        <div class="row">
            <div class="col-lg-12">
                <div class="card mb-10">
                    <div class="card-body">
                        <div class="d-sm-flex align-items-center justify-content-between mb-4"><h1 class="h3 mb-0 text-gray-800">
                            <asp:Label ID="lbl_Titel" runat="server" />
                        </h1></div><br />
                        <div class="row">
                             <div class="col-lg-2">
                                <div class="form-group">
                                    <asp:Label ID="lbl_Tenan_Name" runat="server" Text="اسم المستأجر"></asp:Label>
                                    <asp:DropDownList ID="Tenan_Name_DropDownList" runat="server"  CssClass="form-control">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="Tenan_Name_RequiredFieldValidator" ControlToValidate="Tenan_Name_DropDownList"
                                        InitialValue="..............." runat="server" ValidationGroup="Contract_RequiredField" ErrorMessage="* حقل مطلوب !!!" ForeColor="Red">
                                    </asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="col-lg-2">
                                <div class="form-group">
                                    <asp:Label ID="lbl_Ownership_Name" runat="server" Text="اسم الملكية"></asp:Label>
                                    <asp:DropDownList ID="Ownership_Name_DropDownList" runat="server" CssClass="form-control" AutoPostBack="true"
                                        OnSelectedIndexChanged="Ownership_Name_DropDownList_SelectedIndexChanged">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="Ownership_Name_RequiredFieldValidator" ControlToValidate="Ownership_Name_DropDownList"
                                        InitialValue="..............." runat="server" ValidationGroup="Contract_RequiredField" ErrorMessage="* حقل مطلوب !!!" ForeColor="Red">
                                    </asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="col-lg-2">
                                <div class="form-group">
                                    <asp:Label ID="lbl_Building_Name" runat="server" Text="اسم البناء"></asp:Label>
                                    <asp:DropDownList ID="Building_Name_DropDownList" runat="server" CssClass="form-control" AutoPostBack="true"
                                        OnSelectedIndexChanged="Building_Name_DropDownList_SelectedIndexChanged">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="Building_Name_RequiredFieldValidator" ControlToValidate="Building_Name_DropDownList"
                                       InitialValue="..............." runat="server" ValidationGroup="Contract_RequiredField" ErrorMessage="* حقل مطلوب !!!" ForeColor="Red">
                                    </asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="col-lg-2">
                                <div class="form-group">
                                    <asp:Label ID="lbl_Units" runat="server" Text="الوحدة"></asp:Label>
                                    <asp:DropDownList ID="Units_DropDownList" runat="server" CssClass="form-control">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="Units_DropDownList"
                                        InitialValue="..............." runat="server" ValidationGroup="Contract_RequiredField" ErrorMessage="* حقل مطلوب !!!" ForeColor="Red">
                                    </asp:RequiredFieldValidator>
                                </div>
                            </div>



                            <div class="col-lg-2">
                                <div class="form-group">
                                    <asp:Label ID="lbl_Prosees" runat="server" Text="العملية"></asp:Label>
                                    <asp:DropDownList ID="Prosees_DropDownList" runat="server" CssClass="form-control"></asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="Prosees_DropDownList"
                                        InitialValue="..............." runat="server" ValidationGroup="Contract_RequiredField" ErrorMessage="* حقل مطلوب !!!" ForeColor="Red">
                                    </asp:RequiredFieldValidator>
                                </div>
                            </div>


                            <div class="col-lg-2">
                                <div class="form-group" >
                                    <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                                        <ContentTemplate>
                                            <asp:Label ID="lbl_Sign_Date" runat="server" Text="تاريخ توقيع العقد"></asp:Label>&nbsp;
                                        <asp:TextBox ID="txt_Sign_Date" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox>
                                            <asp:Button ID="Sign_Date_Chosee" runat="server" Text="إختر التاريخ" OnClick="Date_Chosee_Click" />
                                            <asp:ImageButton ID="ImageButton1" ImageUrl="Main_Image/Calander_Close.png" Width="10px" Height="10px" Visible="false" OnClick="ImageButton1_Click" runat="server" />
                                            <div id="Sign_Date_divCalendar" runat="server" style="position: page;" visible="false">

                                                <asp:Calendar ID="Sign_Date_Calendar" runat="server" Height="200px" Width="220px" BackColor="White" BorderColor="#3366CC" BorderWidth="1px" CellPadding="1" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#003399" OnSelectionChanged="Sign_Date_Calendar_SelectionChanged1">
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
                                            <asp:AsyncPostBackTrigger ControlID="Sign_Date_Chosee" EventName="Click" />
                                            <asp:AsyncPostBackTrigger ControlID="Sign_Date_Calendar" EventName="SelectionChanged" />
                                            <asp:AsyncPostBackTrigger ControlID="ImageButton1" EventName="Click" />
                                        </Triggers>
                                    </asp:UpdatePanel>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                         <table id="tblData" runat="server" style="margin: 10px; padding: 10px; " class="Tbl">
                        <tr>
                            <th><asp:Label ID="lbl_Titel_List" runat="server"/></th><%--قائمة الجرد--%>
                            <th><asp:Label ID="lbl_Titel_Status" runat="server"/></th><%-- الحالة--%>
                            <th><asp:Label ID="lbl_Titel_Note" runat="server"/></th><%-- ملاحظات--%>
                        </tr>

                        <tr>
                            <td><asp:Label ID="lbl_Key" runat="server"/></td>
                            <td><asp:RadioButtonList ID="Key_Radio" runat="server" RepeatDirection="Horizontal" ></asp:RadioButtonList></td>
                            <td><asp:TextBox ID="txt_Key" runat="server" Width="100%"></asp:TextBox></td>
                        </tr>
                        <%-----------------------------------------------------------------------------%>
                        <tr>
                            <td><asp:Label ID="lbl_Ferneture" runat="server"/></td>
                            <td> <asp:RadioButtonList ID="Ferneture_Radio" runat="server" RepeatDirection="Horizontal"></asp:RadioButtonList></td>
                            <td><asp:TextBox ID="txt_Ferneture" runat="server" Width="100%"></asp:TextBox></td>
                        </tr>
                        <%-----------------------------------------------------------------------------%>
                        <tr>
                            <td><asp:Label ID="lbl_Device" runat="server"/></td>
                            <td><asp:RadioButtonList ID="Device_Radio" runat="server" RepeatDirection="Horizontal"></asp:RadioButtonList> </td>
                            <td><asp:TextBox ID="txt_Device" runat="server" Width="100%"></asp:TextBox></td>
                        </tr>
                        <%-----------------------------------------------------------------------------%>
                        <tr>
                            <td><asp:Label ID="lbl_kitchen" runat="server"/></td>
                            <td><asp:RadioButtonList ID="kitchen_Radio" runat="server" RepeatDirection="Horizontal"></asp:RadioButtonList></td>
                            <td><asp:TextBox ID="txt_kitchen" runat="server" Width="100%"></asp:TextBox></td>
                        </tr>
                        <%-----------------------------------------------------------------------------%>
                        <tr>
                            <td><asp:Label ID="lbl_electricity" runat="server"/></td>
                            <td><asp:RadioButtonList ID="electricity_Radio" runat="server" RepeatDirection="Horizontal"> </asp:RadioButtonList></td>
                            <td><asp:TextBox ID="txt_electricity" runat="server" Width="100%"></asp:TextBox></td>
                        </tr>
                        <%-----------------------------------------------------------------------------%>
                        <tr>
                            <td><asp:Label ID="lbl_Floor" runat="server"/></td>
                            <td><asp:RadioButtonList ID="Floor_Radio" runat="server" RepeatDirection="Horizontal"></asp:RadioButtonList></td>
                            <td><asp:TextBox ID="txt_Floor" runat="server" Width="100%"></asp:TextBox></td>
                        </tr>
                        <%-----------------------------------------------------------------------------%>
                        <tr>
                            <td><asp:Label ID="lbl_Pathroom" runat="server"/></td>
                            <td><asp:RadioButtonList ID="Pathroom_Radio" runat="server" RepeatDirection="Horizontal"> </asp:RadioButtonList></td>
                            <td><asp:TextBox ID="txt_Pathroom" runat="server" Width="100%"></asp:TextBox></td>
                        </tr>
                        <%-----------------------------------------------------------------------------%>
                        <tr>
                            <td><asp:Label ID="lbl_Wall" runat="server"/></td>
                            <td><asp:RadioButtonList ID="Wall_Radio" runat="server" RepeatDirection="Horizontal"></asp:RadioButtonList></td>
                            <td><asp:TextBox ID="txt_Wall" runat="server" Width="100%"></asp:TextBox></td>
                        </tr>
                        <%-----------------------------------------------------------------------------%>
                        <tr>
                            <td><asp:Label ID="lbl_Door" runat="server"/></td>
                            <td><asp:RadioButtonList ID="Door_Radio" runat="server" RepeatDirection="Horizontal"></asp:RadioButtonList> </td>
                            <td><asp:TextBox ID="txt_Dor" runat="server" Width="100%"></asp:TextBox></td>
                        </tr>
                        <%-----------------------------------------------------------------------------%>
                        <tr>
                            <td><asp:Label ID="lbl_Window" runat="server"/></td>
                            <td><asp:RadioButtonList ID="Window_Radio" runat="server" RepeatDirection="Horizontal"></asp:RadioButtonList></td>
                            <td> <asp:TextBox ID="txt_Window" runat="server" Width="100%"></asp:TextBox></td>
                        </tr>
                        <%-----------------------------------------------------------------------------%>
                        <tr>
                            <td><asp:Label ID="lbl_AC" runat="server"/></td>
                            <td><asp:RadioButtonList ID="AC_Radio" runat="server" RepeatDirection="Horizontal"></asp:RadioButtonList></td>
                            <td><asp:TextBox ID="txt_AC" runat="server" Width="100%"></asp:TextBox></td>
                        </tr>
                        <%-----------------------------------------------------------------------------%>
                        <tr><td colspan="3" ><asp:Label ID="lbl_Discription" runat="server"/></td> </tr>
                        <tr><td colspan="3"> <asp:TextBox ID="txt_Discription" runat="server" TextMode="MultiLine" Width="100%"></asp:TextBox></td> </tr>
                    </table>
                </div>
          </div>
        </div>
        <br />
    <asp:Button ID="btn_Pickup_Delivery" runat="server" Text="إضافة " CssClass="btn" BackColor="#52a2da" ValidationGroup="Contract_RequiredField" ForeColor="White" OnClick="btn_Pickup_Delivery_Click" />
      <br /><br />  
    </div>

   

    


 

<script>$('#<%= Units_DropDownList.ClientID %>').chosen();</script>
<script>$('#<%= Ownership_Name_DropDownList.ClientID %>').chosen();</script>
<script>$('#<%= Building_Name_DropDownList.ClientID %>').chosen();</script>
<script>$('#<%= Prosees_DropDownList.ClientID %>').chosen();</script>
<script>$('#<%= Tenan_Name_DropDownList.ClientID %>').chosen();</script>
</asp:Content>
