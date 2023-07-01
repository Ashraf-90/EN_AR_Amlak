<%@ Page Title="" Language="C#" MasterPageFile="~/English/Main_Application/English.Master" AutoEventWireup="true" CodeBehind="Contract_List.aspx.cs" Inherits="Main_Real_estate.English.Main_Application.Contract_List" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

     <script type="text/javascript">
         $(document).ready(function () {
             var table = $('.datatable').DataTable({
                 dom: 'Bfrtip',
                 /*lengthChange: false,*/
                 "pageLength": 10000,
                 buttons: [
                     //'copyHtml5',
                     'excelHtml5',
                     //'csvHtml5',
                     /*'pdfHtml5'*/
                 ],
                 language: {
                     url: 'https://cdn.datatables.net/plug-ins/1.12.1/i18n/en.json'
                 }
             });

             
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
        .table-bordered td, .table-bordered th {
        border: 1px solid #fff !important
    }
        .Indicator_buttons{
         
            border-radius:50px;
            border-style: solid; 
            width: 20px; 
            margin-right: 20px; 
            margin-top: 20px; 
            height: 20px; 
        }
        
         .UUL {
            
            list-style-type: none;
            
            margin: auto;
            padding: 0;
            overflow: hidden;
            background-color: #52a2da;
            border-radius: .375rem .375rem 0 0;
            display: flex;
        }

        .UUL li {
            float: right;
        }

        .UUL li a {
            display: block;
            color: white;
            text-align: center;
            padding-left: 50px;
            padding-right:15px;
            padding-top : 16px;
            padding-bottom : 16px;
            text-decoration: none;

        }

        .UUL li a:hover{
            background-color: #61aadd;
            color: #fff;
        }
       
    </style>

     <!-- Container Fluid-->
    <div class="container-fluid" id="container-wrapper">
        <div class="row">
            <div class="col-lg-2 mb-3">
                <h1 class="h3 mb-0 text-gray-800">
                    <asp:Label ID="lbl_titel_Contracts_List" runat="server" Text=" العقود"></asp:Label>
                </h1>
            </div>
            <div class="col-lg-3 mb-3">
                <asp:LinkButton ID="Add" CssClass="btn btn-primary" runat="server" PostBackUrl="~/English/Main_Application/Add-Contract.aspx" >
                    <i class="fa fa-plus" style="font-size:25px;"></i> &nbsp; إبرام عقد جديد</asp:LinkButton>
            </div>
        </div>
       
       <div class="row">
            <div class="col-lg-12 mb-4">
                <!-- Simple Tables -->
                <div class="card">
                 
                    <div id="Grid" >
                        
                            <!-- Simple Tables -->
                            <ul class="UUL">
                                <li><a runat="server" id="A_3" onserverclick="A_3_ServerClick"><asp:Label ID="lbl_A_3" runat="server" /></a></li>
                                <li><a runat="server" id="A_1" onserverclick="A_1_ServerClick"><asp:Label ID="lbl_A_1" runat="server" /></a></li>
                                <li><a runat="server" id="A_2" onserverclick="A_2_ServerClick"><asp:Label ID="lbl_A_2" runat="server" /></a></li>
                            </ul>    

                   
                            <div class="row">&nbsp;&nbsp;&nbsp;
                                <asp:Button ID="btn_all_Contract" runat="server"   CssClass="Indicator_buttons"  OnClick="btn_all_Contract_Click"/>
                                &nbsp;
                                    <span style="margin-top: 20px; "><asp:Label ID="lbl_all_Contract" runat="server" /></span>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;




                                <asp:Button ID="btn_New_Contract" runat="server"   CssClass="Indicator_buttons" BackColor="#c5f8eb" OnClick="btn_New_Contarct_Click"/>
                                &nbsp;
                                    <span style="margin-top: 20px"><asp:Label ID="lbl_New_Contract" runat="server" /></span>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;




                                    <asp:Button ID="btn_Under_Expaired_Contract" runat="server" CssClass="Indicator_buttons" BackColor="#faced2" OnClick="btn_Under_Expaired_Contract_Click"/>
                                &nbsp;
                                    <span style="margin-top: 20px"><asp:Label ID="lbl_Under_Expaired_Contract" runat="server" /></span>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;




                                    <asp:Button ID="btn_Expaired_Contract" runat="server"   CssClass="Indicator_buttons" BackColor="#cbd0d8" OnClick="btn_Expaired_Contract_Click"/>
                                &nbsp;
                                    <span style="margin-top: 20px"><asp:Label ID="lbl_Expaired_Contract" runat="server" /></span>
                        
                        </div>
                            <br />
         
        
                         
                        <span runat="server" id="U_C_Span" style="margin:auto; font-size:30px">
                            &nbsp;&nbsp;&nbsp;<asp:Label ID="Label1" runat="server" Text="كافة العقود" />
                        </span>


                        <asp:Repeater  ID="Repeater1" runat="server" OnItemDataBound="contract_List_ItemDataBound" ClientIDMode="Static">
                            <HeaderTemplate>
                                <table  cellspacing="0" class="datatable table table-bordered">
                                    <thead>
                                        <%--<th style="text-align: center;vertical-align: middle;">م</th>--%>
                                        <th style="text-align:center;vertical-align: middle;"><asp:Label ID="lbl_Contract_NO" runat="server" /></th><%--رقم العقد--%>
                                        <th style="text-align:center;vertical-align: middle;"><asp:Label ID="lbl_Zone" runat="server" /></th><%--المنطقة--%>
                                        <th style="vertical-align: middle;"><asp:Label ID="lbl_Code" runat="server" /></th><%--رمز الملكية--%>
                                        <th style="vertical-align: middle;"><asp:Label ID="lbl_Ownership" runat="server" /></th><%-- الملكية--%>
                                        <th style="vertical-align: middle;"><asp:Label ID="lbl_Rented_Item" runat="server" /></th><%--العنصر المؤجر--%>
                                        <th style="text-align:center;vertical-align: middle"><asp:Label ID="lbl_Tenant" runat="server" /></th><%--اسم المستأجر--%>
                                        <th style="text-align:center;vertical-align: middle"><asp:Label ID="lbl_Nationality" runat="server" /></th><%-- الجنسية--%>
                                        <th style="vertical-align: middle;"><asp:Label ID="lbl_Contract_type" runat="server" /></th><%--نوع العقد--%>
                                        <th style="vertical-align: middle;"><asp:Label ID="lbl_Years" runat="server" /></th><%--عدد السنوات--%>
                                        <th style="vertical-align: middle;"><asp:Label ID="lbl_Value" runat="server" /></th><%--قيمة الغيجار--%>
                                        <th style="vertical-align: middle;"><asp:Label ID="lbl_Start" runat="server" /></th><%--تاريخ اابدء--%>
                                        <th style="vertical-align: middle;"><asp:Label ID="lbl_End" runat="server" /></th><%--تاريخ الإنتهاء--%>
                                        <th style="display:none" >X</th>
                                        <th style="text-align:center;" runat="server" id="H_One"></th>
                                    </thead>
                                <tbody>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr id="row" runat="server">
                                    <%--<td> <asp:Label ID="lblRowNumber" Text='<%# Container.ItemIndex + 1 %>' runat="server" /></td>--%>
                                    <td><asp:LinkButton ID="Contract_NO" Text='<%# Eval("CON_NO") %>'  runat="server" CommandArgument='<%# Eval("ID") %>' OnClick="Contract_NO_Click" ></asp:LinkButton></td>
                                    <td>
                                        <asp:Label ID="lbl_zone_arabic_name" runat="server" Text='<%# Eval("zone_arabic_name") %>' />
                                        <asp:Label ID="lbl_zone_English_name" runat="server" Text='<%# Eval("zone_English_name") %>' />
                                    </td>
                                    <td><asp:Label ID="lbl_owner_ship_Code" runat="server" Text='<%# Eval("owner_ship_Code") %>' /></td>
                                    <td>
                                        <asp:Label ID="lbl_Owner_Ship_AR_Name" runat="server" Text='<%# Eval("Owner_Ship_AR_Name") %>' />
                                        <asp:Label ID="lbl_Owner_Ship_EN_Name" runat="server" Text='<%# Eval("Owner_Ship_EN_Name") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="lbl_Unit_Number" runat="server" Text='<%# Eval("Unit_Number") %>' />
                                        <asp:Label ID="lbl_EN_Unit_Number" runat="server" Text='<%# Eval("EN_Unit_Number") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="lbl_Tenants_Arabic_Name" runat="server" Text='<%# Eval("Tenants_Arabic_Name") %>' />
                                        <asp:Label ID="lbl_Tenants_English_Name" runat="server" Text='<%# Eval("Tenants_English_Name") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="lbl_Arabic_nationality" runat="server" Text='<%# Eval("Arabic_nationality") %>' />
                                        <asp:Label ID="lbl_English_nationality" runat="server" Text='<%# Eval("English_nationality") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="lbl_Contract_Type" runat="server" Text='<%# Eval("Contract_Arabic_Type") %>' />
                                        <asp:Label ID="lbl_Contract_English_Type" runat="server" Text='<%# Eval("Contract_English_Type") %>' />Payment_Amount
                                    </td>
                                    <td><asp:Label ID="lbl_Number_Of_Years" runat="server" Text='<%# Eval("Number_Of_Years") %>' /></td>
                                    <td><asp:Label ID="lbl_Payment_Amount" runat="server"  Text='<%# Eval("Payment_Amount") %>'/></td>
                                    <td><asp:Label ID="lbl_Start_Date" runat="server" Text='<%# Eval("Start_Date") %>' /></td>
                                    <td><asp:Label ID="lbl_End_Date" runat="server" Text='<%# Eval("End_Date") %>' /></td>
                                    <td style="display:none"><asp:Label ID="lbl_New_ReNewed_Expaired"  runat="server" Text='<%# Eval("New_ReNewed_Expaired") %>' /></td>
                                    <td runat="server" id="B_One">
                                        <asp:LinkButton ID="U_Edit" ForeColor="#0779c9" runat="server" CommandArgument='<%# Eval("ID") %>' OnClick="U_Edit_Click" > <i class="fa fa-pencil" style="font-size:18px;"></i> </asp:LinkButton>
                                        &nbsp;&nbsp;
                                        <asp:LinkButton id="U_Renew" ForeColor="#0779c9" Visible="false"  runat="server" CommandArgument='<%# Eval("ID") %>' OnClick="U_Renew_Click" > <i class="fa fa-refresh" style="font-size:18px;"></i> </asp:LinkButton>
                                        &nbsp;&nbsp;
                                        <asp:LinkButton id="U_Finsh" ForeColor="#0779c9"   runat="server" CommandArgument='<%# Eval("ID") %>' 
                                        OnClientClick="return confirm('هل تريد إنهاء العقد فعلاً ؟');" OnClick="Finsh_Click" > <i class="fa fa-hourglass-end" style="font-size:18px;"></i> </asp:LinkButton>
                                    </td>
                                </tr>
                            </ItemTemplate>
                            <FooterTemplate>
                                </tbody>
                                </table>
                            </FooterTemplate>
                        </asp:Repeater>
            <%--***************************************************************************************************************************************************************************************************************************--%>

                        <asp:Repeater  ID="contract_List" runat="server" Visible="false" OnItemDataBound="contract_List_ItemDataBound1" ClientIDMode="Static">
                            <HeaderTemplate>
                                <table  cellspacing="0" class="datatable table table-bordered">
                                    <thead>

                                        <th style="text-align:center;vertical-align: middle;"><asp:Label ID="lbl_Contract_NO" runat="server" /></th><%--رقم العقد--%>
                                        <th style="text-align:center;vertical-align: middle;"><asp:Label ID="lbl_Zone" runat="server" /></th><%--المنطقة--%>
                                        <th style="vertical-align: middle;"><asp:Label ID="lbl_Code" runat="server" /></th><%--رمز الملكية--%>
                                        <th style="vertical-align: middle;"><asp:Label ID="lbl_Ownership" runat="server" /></th><%-- الملكية--%>
                                        <th style="vertical-align: middle;"><asp:Label ID="lbl_Building" runat="server" /></th><%-- البناء--%>
                                        <th style="vertical-align: middle;"><asp:Label ID="lbl_Unit" runat="server" /></th><%-- الوحدة--%>
                                        <th style="text-align:center;vertical-align: middle"><asp:Label ID="lbl_Tenant" runat="server" /></th><%--اسم المستأجر--%>
                                        <th style="text-align:center;vertical-align: middle"><asp:Label ID="lbl_Nationality" runat="server" /></th><%-- الجنسية--%>
                                        <th style="vertical-align: middle;"><asp:Label ID="lbl_Contract_type" runat="server" /></th><%--نوع العقد--%>
                                        <th style="vertical-align: middle;"><asp:Label ID="lbl_Years" runat="server" /></th><%--عدد السنوات--%>
                                        <th style="vertical-align: middle;"><asp:Label ID="lbl_Value" runat="server" /></th><%--قيمة الغيجار--%>
                                        <th style="vertical-align: middle;"><asp:Label ID="lbl_Start" runat="server" /></th><%--تاريخ اابدء--%>
                                        <th style="vertical-align: middle;"><asp:Label ID="lbl_End" runat="server" /></th><%--تاريخ الإنتهاء--%>
                                        <th style="display:none" >X</th>
                                        <th style="text-align:center; width:73px"  runat="server" id="H_One"></th>
                                    </thead>
                                <tbody>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr id="row" runat="server" >
                                    <td><asp:LinkButton ID="Contract_NO" Text='<%# Eval("CON_NO") %>'  runat="server" CommandArgument='<%# Eval("Contract_Id") %>' OnClick="C_ID_ServerClick" ></asp:LinkButton></td>
                                    <td>
                                        <asp:Label ID="lbl_zone_arabic_name" runat="server" Text='<%# Eval("zone_arabic_name") %>' />
                                        <asp:Label ID="lbl_zone_English_name" runat="server" Text='<%# Eval("zone_English_name") %>' />
                                    </td>
                                    <td><asp:Label ID="lbl_owner_ship_Code" runat="server" Text='<%# Eval("owner_ship_Code") %>' /></td>
                                    <td>
                                        <asp:Label ID="lbl_Owner_Ship_AR_Name" runat="server" Text='<%# Eval("Owner_Ship_AR_Name") %>' />
                                        <asp:Label ID="lbl_Owner_Ship_EN_Name" runat="server" Text='<%# Eval("Owner_Ship_EN_Name") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="lbl_Building_Arabic_Name" runat="server" Text='<%# Eval("Building_Arabic_Name") %>' />
                                        <asp:Label ID="lbl_Building_English_Name" runat="server" Text='<%# Eval("Building_English_Name") %>' />
                                    </td>
                                    <td><asp:Label ID="lbl_Unit_Number" runat="server" Text='<%# Eval("Unit_Number") %>' /></td>
                                    <td>
                                        <asp:Label ID="lbl_Tenants_Arabic_Name" runat="server" Text='<%# Eval("Tenants_Arabic_Name") %>' />
                                        <asp:Label ID="lbl_Tenants_English_Name" runat="server" Text='<%# Eval("Tenants_English_Name") %>' />
                                    </td>
                                     <td>
                                        <asp:Label ID="lbl_Arabic_nationality" runat="server" Text='<%# Eval("Arabic_nationality") %>' />
                                        <asp:Label ID="lbl_English_nationality" runat="server" Text='<%# Eval("English_nationality") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="lbl_Contract_Type" runat="server" Text='<%# Eval("Contract_Arabic_Type") %>' />
                                        <asp:Label ID="lbl_Contract_English_Type" runat="server" Text='<%# Eval("Contract_English_Type") %>' />
                                    </td>
                                    <td><asp:Label ID="lbl_Number_Of_Years" runat="server" Text='<%# Eval("Number_Of_Years") %>' /></td>
                                    <td><asp:Label ID="lbl_Payment_Amount" runat="server" Text='<%# Eval("Payment_Amount") %>' /></td>
                                    <td><asp:Label ID="lbl_Start_Date" runat="server" Text='<%# Eval("Start_Date") %>' /></td>
                                    <td><asp:Label ID="lbl_End_Date" runat="server" Text='<%# Eval("End_Date") %>' /></td>
                                    <td style="display:none"><asp:Label ID="lbl_New_ReNewed_Expaired"  runat="server" Text='<%# Eval("New_ReNewed_Expaired") %>' /></td>
                                    <td runat="server" id="B_One">
                                        <asp:LinkButton ID="U_Edit" ForeColor="#0779c9" runat="server" CommandArgument='<%# Eval("Contract_Id") %>' OnClick="Edit_Contract" > <i class="fa fa-pencil" style="font-size:18px;"></i> </asp:LinkButton>
                                        &nbsp;&nbsp;
                                        <asp:LinkButton id="U_Renew" ForeColor="#0779c9" Visible="false"  runat="server" CommandArgument='<%# Eval("Contract_Id") %>' OnClick="Renew_Contract" > <i class="fa fa-refresh" style="font-size:18px;"></i> </asp:LinkButton>
                                         &nbsp;&nbsp;
                                        <asp:LinkButton id="U_Finsh" ForeColor="#0779c9"   runat="server" CommandArgument='<%# Eval("Contract_Id") %>' 
                                        OnClientClick="return confirm('هل تريد إنهاء العقد فعلاً ؟');" OnClick="U_Finsh_Click" > <i class="fa fa-hourglass-end" style="font-size:18px;"></i> </asp:LinkButton>
                                    </td>
                                </tr>
                            </ItemTemplate>
                            <FooterTemplate>
                                </tbody>
                                </table>
                            </FooterTemplate>
                        </asp:Repeater>
                       <%--***************************************************************************************************************************************************************************************************************************--%>
                       
                        <asp:Repeater  ID="Building_Contarct_List" runat="server" Visible="false" OnItemDataBound="Building_Contarct_List_ItemDataBound" ClientIDMode="Static">
                            <HeaderTemplate>
                                <table  cellspacing="0" class="datatable table table-bordered">
                                    <thead>
                                        <th style="text-align:center;vertical-align: middle;"><asp:Label ID="lbl_Contract_NO" runat="server" /></th><%--رقم العقد--%>
                                        <th style="text-align:center;vertical-align: middle;"><asp:Label ID="lbl_Zone" runat="server" /></th><%--المنطقة--%>
                                        <th style="vertical-align: middle;"><asp:Label ID="lbl_Code" runat="server" /></th><%--رمز الملكية--%>
                                        <th style="vertical-align: middle;"><asp:Label ID="lbl_Ownership" runat="server" /></th><%-- الملكية--%>
                                        <th style="vertical-align: middle;"><asp:Label ID="lbl_Building" runat="server" /></th><%-- البناء--%>
                                        <th style="text-align:center;vertical-align: middle"><asp:Label ID="lbl_Tenant" runat="server" /></th><%--اسم المستأجر--%>
                                        <th style="text-align:center;vertical-align: middle"><asp:Label ID="lbl_Nationality" runat="server" /></th><%-- الجنسية--%>
                                        <th style="vertical-align: middle;"><asp:Label ID="lbl_Contract_type" runat="server" /></th><%--نوع العقد--%>
                                        <th style="vertical-align: middle;"><asp:Label ID="lbl_Years" runat="server" /></th><%--عدد السنوات--%>
                                        <th style="vertical-align: middle;"><asp:Label ID="lbl_Value" runat="server" /></th><%--قيمة الغيجار--%>
                                        <th style="vertical-align: middle;"><asp:Label ID="lbl_Start" runat="server" /></th><%--تاريخ اابدء--%>
                                        <th style="vertical-align: middle;"><asp:Label ID="lbl_End" runat="server" /></th><%--تاريخ الإنتهاء--%>
                                        <th style="display:none" >X</th>
                                        <th style="text-align:center; width:73px ;" runat="server" id="H_Two"></th>
                                        <th style="text-align:center;" runat="server" id="H_Two_Two"></th>
                                    </thead>
                                <tbody>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr id="row" runat="server">
                                    <td><asp:LinkButton ID="Contract_NO" Text='<%# Eval("CON_NO") %>'  runat="server" CommandArgument='<%# Eval("Contract_Id") %>' OnClick="C_ID_ServerClick" ></asp:LinkButton></td>
                                    <td>
                                        <asp:Label ID="lbl_zone_arabic_name" runat="server" Text='<%# Eval("zone_arabic_name") %>' />
                                        <asp:Label ID="lbl_zone_English_name" runat="server" Text='<%# Eval("zone_English_name") %>' />
                                    </td>
                                    <td><asp:Label ID="lbl_owner_ship_Code" runat="server" Text='<%# Eval("owner_ship_Code") %>' /></td>
                                    <td>
                                        <asp:Label ID="lbl_Owner_Ship_AR_Name" runat="server" Text='<%# Eval("Owner_Ship_AR_Name") %>' />
                                        <asp:Label ID="lbl_Owner_Ship_EN_Name" runat="server" Text='<%# Eval("Owner_Ship_EN_Name") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="lbl_Building_Arabic_Name" runat="server" Text='<%# Eval("Building_Arabic_Name") %>' />
                                        <asp:Label ID="lbl_Building_English_Name" runat="server" Text='<%# Eval("Building_English_Name") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="lbl_Tenants_Arabic_Name" runat="server" Text='<%# Eval("Tenants_Arabic_Name") %>' />
                                        <asp:Label ID="lbl_Tenants_English_Name" runat="server" Text='<%# Eval("Tenants_English_Name") %>' />
                                    </td>
                                     <td>
                                        <asp:Label ID="lbl_Arabic_nationality" runat="server" Text='<%# Eval("Arabic_nationality") %>' />
                                        <asp:Label ID="lbl_English_nationality" runat="server" Text='<%# Eval("English_nationality") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="lbl_Contract_Type" runat="server" Text='<%# Eval("Contract_Arabic_Type") %>' />
                                        <asp:Label ID="lbl_Contract_English_Type" runat="server" Text='<%# Eval("Contract_English_Type") %>' />
                                    </td>
                                    <td><asp:Label ID="lbl_Number_Of_Years" runat="server" Text='<%# Eval("Number_Of_Years") %>' /></td>
                                    <td><asp:Label ID="lbl_B_Payment_Amount" runat="server" Text='<%# Eval("Payment_Amount") %>' /></td>
                                    <td><asp:Label ID="lbl_Start_Date" runat="server" Text='<%# Eval("Start_Date") %>' /></td>
                                    <td><asp:Label ID="lbl_End_Date" runat="server" Text='<%# Eval("End_Date") %>' /></td>
                                    <td style="display:none"><asp:Label ID="lbl_New_ReNewed_Expaired"  runat="server" Text='<%# Eval("New_ReNewed_Expaired") %>' /></td>
                                    <td runat="server" id="B_Two">
                                        <asp:LinkButton ID="B_Edit" ForeColor="#0779c9"  runat="server" CommandArgument='<%# Eval("Contract_Id") %>' OnClick="Edit_B_Contract" > <i class="fa fa-pencil" style="font-size:18px;"></i> </asp:LinkButton>
                                        &nbsp;&nbsp;
                                        <asp:LinkButton id="B_Renew" ForeColor="#0779c9" Visible="false"   runat="server" CommandArgument='<%# Eval("Contract_Id") %>' OnClick="Renew_B_Contract" > <i class="fa fa-refresh" style="font-size:18px;"></i> </asp:LinkButton><br />
                                    </td>
                                    <td runat="server" id="B_Two_Two">
                                        <asp:LinkButton id="B_Finsh" ForeColor="#0779c9"   runat="server" CommandArgument='<%# Eval("Contract_Id") %>' 
                                        OnClientClick="return confirm('هل تريد إنهاء العقد فعلاً ؟');" OnClick="B_Finsh_Click" > <i class="fa fa-hourglass-end" style="font-size:18px;"></i> </asp:LinkButton>
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
