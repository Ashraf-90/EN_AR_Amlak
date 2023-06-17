<%@ Page Title="" Language="C#" MasterPageFile="~/English/Main_Application/English.Master" AutoEventWireup="true" CodeBehind="Rental_Disclosure_test.aspx.cs" Inherits="Main_Real_estate.English.Main_Application.Rental_Disclosure_test" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/chosen/1.8.7/chosen.jquery.min.js"></script>
    <link href="../CSS/DDL.css" rel="stylesheet" />

    <style>
        table, th, td {
            border: 1px solid black;
            border-collapse: collapse;
            text-align: center !important;
            font-size: 13px;
            padding: 7px !important;
        }

        th {
            background-color: #52a2da;
            color: #fff;
            text-align: center;
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

                    .UUL li a:hover {
                        background-color: #61aadd;
                        color: #fff;
                    }

        .right-spaced {
            margin-right: 20px
        }
    </style>
    <%------------------------------------------------------------------------------------------------------------------------%>
    <ul class="UUL">
        <li><a runat="server" id="A_1" onserverclick="A_1_ServerClick"><asp:Label ID="lbl_A_1" runat="server"/></a></li>
        <li><a runat="server" id="A_2" onserverclick="A_2_ServerClick"><asp:Label ID="lbl_A_2" runat="server"/></a></li>
        <li><a runat="server" id="A_3" onserverclick="A_3_ServerClick"><asp:Label ID="lbl_A_3" runat="server"/></a></li>
    </ul>
    <br />
    <div class="container-fluid">
        <div class="row" style="margin-right: 10px">
        <div class="col-lg-2">
            <div class="form-group">
                <asp:Label ID="lbl_Ownershi_Code" runat="server"/>
                <asp:DropDownList ID="Ownershi_Code_DropDownList" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="Ownershi_Code_DropDownList_SelectedIndexChanged">
                </asp:DropDownList>
            </div>
        </div>
        <div class="col-lg-3">
            <div class="form-group">
                <asp:Label ID="lbl_wnershi_Name" runat="server"/>
                <asp:DropDownList ID="Ownershi_Name_DropDownList" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="Ownershi_Name_DropDownList_SelectedIndexChanged">
                </asp:DropDownList>
            </div>
        </div>

        <div class="col-lg-2" style="display:none">
            <div class="form-group">
                <asp:Label ID="lbl_Street_No" runat="server" Text="اسم المنطقة" />
                <asp:DropDownList ID="Zone_N_DropDownList" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="Zone_N_DropDownList_SelectedIndexChanged">
                </asp:DropDownList>
            </div>
        </div>
    </div>
    </div>
    
    <asp:Label ID="Quari" runat="server" Text="1" Visible="false" />&nbsp;&nbsp;
    <asp:Label ID="Typee" runat="server" Text="كشف المؤجرات للكل " Font-Size="20" Visible="true" />
    <%------------------------------------------------------------------------------------------------------------------------%>
    <div class="container-fluid" id="container-wrapper">
        <div class="row" style="font-size: 10px">
            <div class="col-lg-12 ">
                <asp:Repeater ID="OWnershi_Repeater" runat="server" OnItemDataBound="OWnershi_Repeater_ItemDataBound">
                    <ItemTemplate>
                        <div style="padding: 10px">
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("owner_ship_Code") %>' Font-Size="20px" Font-Bold="true"></asp:Label>
                            <table class="datatable table table-striped table-bordered">
                                <thead>
                                    <tr>
                                        <th style="background-color: #0779c9; color: white; font-size: 16px"><asp:Label ID="lblRowNumber" Text='<%# Container.ItemIndex + 1 %>' runat="server" /></th>
                                        <th colspan="15" style="background-color: #0779c9; color: white; font-size: 16px">
                                            <asp:Label ID="lbl_Ownersihp_Id" runat="server" Visible="false" Text='<%# Eval("Owner_Ship_Id") %>'></asp:Label>
                                            <asp:Label ID="lbl_Owner_Ship_AR_Name" runat="server" Text='<%# Eval("Owner_Ship_AR_Name") %>'></asp:Label>
                                            <asp:Label ID="lbl_Owner_Ship_EN_Name" runat="server" Text='<%# Eval("Owner_Ship_EN_Name") %>'></asp:Label>&nbsp;&nbsp;&nbsp;
                                            <asp:Label ID="lbl_owner_ship_Code" runat="server" Text='<%# Eval("owner_ship_Code") %>'></asp:Label>&nbsp;&nbsp;<asp:Label ID="lbl_Owner_Name" runat="server"/>&nbsp;
                                            <asp:Label ID="lbl_Owner_Arabic_name" runat="server" Text='<%# Eval("Owner_Arabic_name") %>'></asp:Label>
                                            <asp:Label ID="lbl_Owner_English_name" runat="server" Text='<%# Eval("Owner_English_name") %>'></asp:Label>&nbsp;&nbsp;<asp:Label ID="lbl_Street" runat="server"/>&nbsp;
                                            <asp:Label ID="lbl_Street_Name" runat="server" Text='<%# Eval("Street_Name") %>'></asp:Label>
                                            <asp:Label ID="lbl_Street_NO" runat="server" Text='<%# Eval("Street_NO") %>'></asp:Label>
                                        </th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%-----------------------------------------------------------------%>
                                    <asp:Repeater ID="Buildingg_Repeater" runat="server" OnItemDataBound="Buildingg_Repeater_ItemDataBound">
                                        <ItemTemplate>
                                            <tr>
                                                <th colspan="15" style="background-color: #d770ad; font-size: 16px">
                                                    <asp:Label ID="lbl_Building" runat="server"/>
                                                    <asp:Label ID="lbl_Building_No" runat="server" Text='<%# Eval("Building_NO") %>'></asp:Label>
                                                    <asp:Label ID="lbl_Building_Id" runat="server" Visible="false" Text='<%# Eval("Half_Building_ID") %>'></asp:Label>
                                                </th>
                                            </tr>
                                    <%-----------------------------------------------------------------%>
                                            <tr>
                                                <th>م</th>
                                                <th><asp:Label ID="lbl_No_Type" runat="server"/></th><%--رقم / نوع الوحدة--%>
                                                <th><asp:Label ID="lbl_Details" runat="server"/></th><%--التصنيف--%>
                                                <th><asp:Label ID="lbl_Condition" runat="server"/></th><%--الحالة--%>
                                                <th><asp:Label ID="lbl_Elec" runat="server"/></th><%--كرهباء--%>
                                                <th><asp:Label ID="lbl_Water" runat="server"/></th><%--ماء--%>
                                                <th><asp:Label ID="lbl_Tenant" runat="server"/></th><%--مستاجر--%>
                                                <th><asp:Label ID="lbl_Phon" runat="server"/></th><%--هاتف--%>
                                                <th><asp:Label ID="lbl_post" runat="server"/></th><%--ص.ب--%>
                                                <th><asp:Label ID="lbl_period" runat="server"/></th><%--مدة الإيجار--%>
                                                <th><asp:Label ID="lbl_Start" runat="server"/></th><%--بداية--%>
                                                <th><asp:Label ID="lbl_End" runat="server"/></th><%--نهاية--%>
                                                <th><asp:Label ID="lbl_Amount" runat="server"/></th><%--مبلغ--%>
                                                <th><asp:Label ID="lbl_Method" runat="server"/></th><%--سداد--%>
                                                <th><asp:Label ID="lbl_Notic" runat="server"/></th><%--ملاحظات--%>
                                            </tr>
                                            <asp:Repeater ID="Unit_Repeater" runat="server" ClientIDMode="Static" OnItemDataBound="Unit_Repeater_ItemDataBound">
                                                <ItemTemplate>
                                                    <tr>
                                                        <td><asp:Label ID="lblRowNumber" Text='<%# Container.ItemIndex + 1 %>' runat="server" /></td>
                                                        <td>
                                                            <asp:Label ID="lbl_Unit_Number" runat="server" Text='<%# Eval("Unit_Number") %>'></asp:Label>/
                                                            <asp:Label ID="lbl_Unit_Arabic_Type" runat="server" Text='<%# Eval("Unit_Arabic_Type") %>'></asp:Label>
                                                            <asp:Label ID="lbl_Unit_English_Type" runat="server" Text='<%# Eval("Unit_English_Type") %>'></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="lbl_Unit_Arabic_Detail" runat="server" Text='<%# Eval("Unit_Arabic_Detail") %>'></asp:Label>
                                                            <asp:Label ID="lbl_Unit_English_Detail" runat="server" Text='<%# Eval("Unit_English_Detail") %>'></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="lbl_Unit_Arabic_Condition" runat="server" Text='<%# Eval("Unit_Arabic_Condition") %>'></asp:Label>
                                                            <asp:Label ID="lbl_Unit_English_Condition" runat="server" Text='<%# Eval("Unit_English_Condition") %>'></asp:Label>
                                                        </td>
                                                        <td><asp:Label ID="lbl_Electricityt_Number" runat="server" Text='<%# Eval("Electricityt_Number") %>'></asp:Label></td>
                                                        <td><asp:Label ID="lbl_Water_Number" runat="server" Text='<%# Eval("Water_Number") %>'></asp:Label></td>
                                                        <td>
                                                            <asp:Label ID="lbl_Tenants_Arabic_Name" runat="server" Text='<%# Eval("Tenants_Arabic_Name") %>'></asp:Label>
                                                            <asp:Label ID="lbl_Tenants_English_Name" runat="server" Text='<%# Eval("Tenants_English_Name") %>'></asp:Label>
                                                        </td>
                                                        <td><asp:Label ID="lbl_Tenants_Mobile" runat="server" Text='<%# Eval("Tenants_Mobile") %>'></asp:Label></td>
                                                        <td><asp:Label ID="lbl_P_O_Box" runat="server" Text='<%# Eval("P_O_Box") %>'></asp:Label></td>
                                                        <td><asp:Label ID="lbl_Number_Of_Years" runat="server" Text='<%# Eval("Number_Of_Years") %>'></asp:Label></td>
                                                        <td><asp:Label ID="lbl_Start_Date" runat="server" Text='<%# Eval("Start_Date") %>'></asp:Label></td>
                                                        <td><asp:Label ID="lbl_End_Date" runat="server" Text='<%# Eval("End_Date") %>'></asp:Label></td>
                                                        <td><asp:Label ID="lbl_Payment_Amount" runat="server" Text='<%# Eval("Payment_Amount") %>'></asp:Label></td>
                                                        <td><asp:Label ID="lbl_Paymen_Method" runat="server" Text='<%# Eval("Paymen_Method") %>'></asp:Label></td>
                                                        <td> <asp:Label ID="lbl_Contract_Details" runat="server" Text='<%# Eval("Contract_Details") %>'></asp:Label></td>
                                                    </tr>
                                                </ItemTemplate>
                                            </asp:Repeater>

                                        </ItemTemplate>
                                    </asp:Repeater>

                                </tbody>
                            </table>
                            <%-----------------------------------------------------------------%>
                        </div>
                        <hr />
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </div>
    <script>$('#<%= Ownershi_Code_DropDownList.ClientID %>').chosen();</script>
    <script>$('#<%= Ownershi_Name_DropDownList.ClientID %>').chosen();</script>
    <script>$('#<%= Zone_N_DropDownList.ClientID %>').chosen();</script>



    
</asp:Content>
