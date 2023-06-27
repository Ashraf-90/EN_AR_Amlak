<%@ Page Title="" Language="C#" MasterPageFile="~/English/Main_Application/English.Master" AutoEventWireup="true" CodeBehind="ENDashBoard.aspx.cs" Inherits="Main_Real_estate.English.Main_Application.ENDashBoard" %>
<%@ Register TagPrefix="ej" Namespace="Syncfusion.JavaScript.DataVisualization.Models" Assembly="Syncfusion.EJ" %>
<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"  Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <script src="http://cdn.syncfusion.com/js/assets/external/jquery.globalize.min.js"></script>

    <script src="https://cdn.syncfusion.com/js/assets/i18n/ej.culture.es-CO.min.js"></script>

    <script> 

        function textRendering(args) {

            args.data.text = args.data.text.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");

        }

    </script>

    <style>
        label {
            margin-bottom: -25px !important;
            text-align: center !important;
        }

        .tooltipDivChart1 {
            background-color: #E94649;
            color: white;
            width: 130px;
        }

        #Tooltip > div:first-child {
            float: left;
        }

        #Tooltip #value {
            float: right;
            height: 50px;
            width: 68px;
        }

            #Tooltip #value > div {
                margin: 5px 5px 5px 5px;
            }

        #Tooltip #efpercentage {
            font-size: 20px;
            font-family: segoe ui;
            padding-left: 2px;
        }

        #Tooltip #ef {
            font-size: 12px;
            font-family: segoe ui;
        }

        #eficon {
            background-image: url("../Content/images/chart/eficon.png");
            height: 60px;
            width: 60px;
            background-repeat: no-repeat;
        }

        .Indicator_buttons{
            border-radius:50px;
            border-style: solid; 
            width: 20px; 
            margin-right: 20px; 
            margin-top: 20px; 
            height: 20px; 
        }
        .Indicator_buttons:active{

        }
        
    </style>




    <div class="container-fluid" id="container-wrapper1">
        <asp:Label ID="Label1" runat="server" Text="Label" Visible="false"></asp:Label>
        <asp:Label ID="Label2" runat="server" Text="Label" Visible="false"></asp:Label>
        <asp:Label ID="Label3" runat="server" Text="Label" Visible="false"></asp:Label>

        <asp:Label ID="Label4" runat="server" Text="Label" Visible="false"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label5" runat="server" Text="Label" Visible="false"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label6" runat="server" Text="Label" Visible="false"></asp:Label>

        <asp:Label ID="Label7" runat="server" Text="Label" Visible="false"></asp:Label>



        <div class="row" style="width: 100%; background-color: #52a2da; border-radius: 10px; margin-right: 2px; padding: 10px;">
            <div class="col-lg" >
                <div class="form-group">
                    <asp:Label ID="lbl_Mounth" runat="server" Text="Month" ForeColor="White"></asp:Label>
                    <asp:DropDownList ID="Mounth_DropDownList" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="Mounth_DropDownList_SelectedIndexChanged">
                        <asp:ListItem Value="1" Text="Jan"></asp:ListItem>
                        <asp:ListItem Value="2" Text="Feb"></asp:ListItem>
                        <asp:ListItem Value="3" Text="Mar"></asp:ListItem>
                        <asp:ListItem Value="4" Text="Apr"></asp:ListItem>
                        <asp:ListItem Value="5" Text="May "></asp:ListItem>
                        <asp:ListItem Value="6" Text="Jun"></asp:ListItem>
                        <asp:ListItem Value="7" Text="Jul"></asp:ListItem>
                        <asp:ListItem Value="8" Text="Aug"></asp:ListItem>
                        <asp:ListItem Value="9" Text="Sep"></asp:ListItem>
                        <asp:ListItem Value="10" Text="Oct"></asp:ListItem>
                        <asp:ListItem Value="11" Text="Nov"></asp:ListItem>
                        <asp:ListItem Value="12" Text="Dec"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="Mounth_RequiredFieldValidator" ControlToValidate="Mounth_DropDownList"
                        InitialValue="إختر الشهر ...." runat="server" ValidationGroup="collection_RequiredField" ErrorMessage="* حقل مطلوب !!!" ForeColor="Red">
                    </asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="col-lg">
                <div class="form-group">
                    <asp:Label ID="lbl_Year" runat="server" Text="Year" ForeColor="White"></asp:Label>
                    <asp:DropDownList ID="Year_DropDownList" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="Year_DropDownList_SelectedIndexChanged">
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="Year_DropDownList"
                        InitialValue="إخترالسنة ...." runat="server" ValidationGroup="collection_RequiredField" ErrorMessage="* حقل مطلوب !!!" ForeColor="Red">
                    </asp:RequiredFieldValidator>
                </div>
            </div>

            <div class="col-lg" runat="server" id="Ownership_Div">
                <div class="form-group">
                    <asp:Label ID="lbl_Ownership_Name" runat="server" Text="Property Name" ForeColor="White"></asp:Label>
                    <asp:DropDownList ID="Ownership_Name_DropDownList" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="Ownership_Name_DropDownList_SelectedIndexChanged">
                    </asp:DropDownList>
                </div>
            </div>
            <div class="col-lg">
                <div class="form-group">
                    <asp:Label ID="lbl_Building_Name" runat="server" Text="Building Name" ForeColor="White"></asp:Label>
                    <asp:DropDownList ID="Building_Name_DropDownList" runat="server" CssClass="form-control" Enabled="false" AutoPostBack="true" OnSelectedIndexChanged="Building_Name_DropDownList_SelectedIndexChanged">
                    </asp:DropDownList>
                </div>
            </div>
        </div>
        <br />
        <br />
        
        <%--        *************************************************************************************************************************************************************************************************************************--%>
        <div style="border: 3px solid #92bfdc; background-color: #dfeef8; padding-right: 20px; padding-top: 10px; border-radius: 10px">
            <asp:Label ID="lbl_titel_DashBoard" runat="server" Font-Size="30px" Text="Dashboard"></asp:Label><br />
            <br />



            <div class="row" style="margin-right: 5px; margin-left:15px">
                <div>
                    <div class="card h-30" style="width: 150px; text-align: center">
                        <div class="card-body">
                            <div class="col-auto">
                                <i class="fa fa-globe" style="font-size: 50px; color: #52a2da"></i>
                            </div>
                            <div class="col mr-2" >
                                <div class="h5 mb-0 font-weight-bold text-gray-800">
                                    <asp:Label ID="lbl_OwnerShip_Count" runat="server"></asp:Label>
                                </div>
                                <div class="text-xs font-weight-bold text-uppercase mb-1">Properties Count</div>
                            </div>
                        </div>
                    </div>

                </div>
                &nbsp;&nbsp;
            <div>

                <div class="card h-30" style="width: 150px; text-align:center">
                    <div class="card-body">
                        <div class="col-auto">
                            <i class="fa fa-building" style="font-size: 50px; color: #52a2da"></i>
                        </div>
                        <div class="col mr-2">
                            <div class="h5 mb-0 font-weight-bold text-gray-800">
                                <asp:Label ID="lbl_Building_Count" runat="server"></asp:Label>
                            </div>
                            <div class="text-xs font-weight-bold text-uppercase mb-1">Buildings Count</div>
                        </div>
                    </div>
                </div>
            </div>
                &nbsp;&nbsp;
            <div>
                <div class="card h-30" style="width: 150px; text-align:center">
                    <div class="card-body">
                        <div class="col-auto">
                            <i class="fas fa-home fa-2x " style="font-size: 50px; color: #52a2da"></i>
                        </div>
                        <div class="col mr-2" >
                            <div class="h5 mb-0 font-weight-bold text-gray-800">
                                <asp:Label ID="lbl_Units_Count" runat="server"></asp:Label>
                            </div>
                            <div class="text-xs font-weight-bold text-uppercase mb-1">Units Count</div>
                        </div>
                    </div>
                </div>
            </div>
            </div>
            <br />
            <%--********************************************************** حالات الوحدات ************************************************--%>
            <div class="row" style="margin-left: 10px" >
                <div class="col-lg-6">
                    <div class="card mb-3">
                        <div class="card-body">
                            <script type="text/javascript" src="../Scripts/ChartData.js"></script>
                            <ej:WaitingPopup runat="server" ID="waitingpopup4" ShowOnInit="false"></ej:WaitingPopup>
                            <ej:Chart ID="Units_Statuse" runat="server" Width="400" Height="250" IsResponsive="true" OnClientLoad="onChartLoad">
                                <Title Text="Rental Cases"></Title>
                                <Series>
                                    <ej:Series EnableAnimation="True" Name="New York" XName="Xvalue" YName="YValue1" Type="Doughnut" Explode="True"
                                        LabelPosition="Inside" DoughnutSize="1" Marker-DataLabel-Visible="True" Marker-DataLabel-EnableContrastColor="true"
                                        Marker-DataLabel-Font-FontSize="20px"
                                        Marker-DataLabel-Font-FontWeight="Lighter" >

                                    </ej:Series>
                                </Series>
                                <Legend Position="Bottom" Visible="false" />
                            </ej:Chart>

                            <div class="row" >
                                <asp:Button ID="Undermaintenance" runat="server" CssClass="Indicator_buttons" BackColor="#3bafda"  OnClick="Undermaintenance_Click"/>
                                &nbsp;
                                <span style="margin-top: 20px">Under construction or maintenance</span>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Button ID="Available" runat="server" CssClass="Indicator_buttons" BackColor="#da4453"  OnClick="Available_Click"/>
                                &nbsp;
                                <span style="margin-top: 20px">vacant</span>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Button ID="UnderProplem" runat="server" CssClass="Indicator_buttons" BackColor="#8cc152" OnClick="UnderProplem_Click" />
                                &nbsp;
                                <span style="margin-top: 20px">There is a dispute</span>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Button ID="Rented" runat="server" CssClass="Indicator_buttons" BackColor="#fcbb42"  OnClick="Rented_Click"/>
                                &nbsp;
                                <span style="margin-top: 20px">Rented</span>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Button ID="Button1" runat="server" CssClass="Indicator_buttons" BackColor="#005277"  OnClick="Expaired_Contract"/>
                                &nbsp;
                                <span style="margin-top: 20px">Expired</span>
                            </div>
                        </div>
                    </div>
                </div>

                <%--********************************************************** المصاريف ************************************************--%>
                <div class="col-lg-6" >
                    <div class="card mb-3">
                        <div class="card-body">
                            <ej:WaitingPopup runat="server" ID="waitingpopup" ShowOnInit="false"></ej:WaitingPopup>
                            <ej:Chart ID="Expenses_Chart" runat="server" Width="550" Height="290" OnClientLoad="onChartLoad" IsResponsive="true" OnClientDisplayTextRendering="textRendering">
                                <CommonSeriesOptions EnableAnimation="True" Tooltip-Visible="true"
                                    Tooltip-Format="#point.x# : #point.y# #series.name# Qatari Ryal">
                                    <Marker>
                                        <DataLabel Visible="True" ShowEdgeLabels="true" EnableContrastColor="true">
                                        </DataLabel>
                                    </Marker>
                                </CommonSeriesOptions>
                                <PrimaryYAxis RangePadding="Normal" LabelFormat="n0">
                                </PrimaryYAxis>

                                <Series>
                                    <ej:Series Name="Administrative expenses" XName="Xvalue" YName="YValue1" Fill="rgba(59,175,218,1)"></ej:Series>
                                    <ej:Series Name="Real estate expenses" XName="Xvalue" YName="YValue2" Fill="rgba(140,193,82,1)"></ej:Series>
                                    <ej:Series Name="maintenance expenses" XName="Xvalue" YName="YValue3" Fill="rgba(252,187,66,1)"></ej:Series>
                                </Series>
                                <Title Text="Expenses"></Title>
                                <Legend Position="Bottom"></Legend>
                            </ej:Chart>
                        </div>
                    </div>
                </div>
            </div>
            <hr />
            <%--********************************************************** التدفق النقدي ************************************************--%>
            <div class="col-lg-12" style="margin-left: 5px; margin-right: -10px;">
                <div class="card mb-3">
                    <div class="card-body">
                        &nbsp;&nbsp;&nbsp;<asp:Label ID="lbl_Cash_Flow" runat="server"></asp:Label><br />
                        <div id="Tooltip" style="display: none;">
                            <div id="icon">
                                <div id="eficon"></div>
                            </div>
                            <div id="value">
                                <div>
                                    <label id="efpercentage">&nbsp;#point.y#</label>
                                    <label id="ef">Qatari Ryal</label>
                                </div>
                            </div>

                        </div>
                        <div id="container">
                            <script type="text/javascript" src="../Scripts/ChartData.js"></script>
                            <ej:WaitingPopup runat="server" ID="waitingpopup1" ShowOnInit="false"></ej:WaitingPopup>
                            <ej:Chart ClientIDMode="Static" ID="Chart1" runat="server" Width="1200" Height="350" IsResponsive="true" OnClientLoad="onChartLoad" OnClientDisplayTextRendering="textRendering">
                                <PrimaryXAxis title-text="الأشهر" ValueType="Category" />
                                <PrimaryYAxis LabelFormat="{value}" RangePadding="Round" title-text="Qatari Ryal" />
                                <CommonSeriesOptions Type="Line" DoughnutSize="0.2" tooltip-visible="true" tooltip-template="Tooltip" marker-size-height="10"
                                    marker-size-width="10" marker-border-width="2" marker-visible="true" EnableAnimation="True" />
                                <PrimaryYAxis RangePadding="Normal" LabelFormat="n0"></PrimaryYAxis>
                                <Series>
                                    <ej:Series Name="Supposed" XName="Xvalue" YName="YValue1" Fill="#8cc152"></ej:Series>
                                    <ej:Series Name="Revenues" XName="Xvalue" YName="YValue2" Fill="#3bafda"></ej:Series>
                                    <ej:Series Name="Expenses" XName="Xvalue" YName="YValue3" Fill="#da4453"></ej:Series>

                                </Series>
                                <Legend Visible="true"></Legend>
                            </ej:Chart>
                        </div>
                    </div>
                </div>
            </div>
            <hr />
            <div class="row" style="margin-left: 10px">
                <%--********************************************************** القيمة الإيجارية ************************************************--%>
                <div class="col-lg-6">
                    <div class="card mb-3">
                        <div class="card-body">
                            <ej:WaitingPopup runat="server" ID="waitingpopup2" ShowOnInit="false"></ej:WaitingPopup>
                            <ej:Chart ID="Rental_Value" Locale="fr-FR" runat="server" Width="520" Height="350" OnClientLoad="onChartLoad" IsResponsive="true" OnClientDisplayTextRendering="textRendering">
                                <CommonSeriesOptions EnableAnimation="True" Tooltip-Visible="true"
                                    Tooltip-Format="#point.x# : #point.y# #series.name# Qatari Ryal">
                                    <Marker>
                                        <DataLabel Visible="True" ShowEdgeLabels="true" EnableContrastColor="true">
                                        </DataLabel>
                                    </Marker>
                                </CommonSeriesOptions>
                                <PrimaryYAxis RangePadding="Normal" LabelFormat="n0"></PrimaryYAxis>
                                <Series>
                                    <ej:Series Name=" Supposed" XName="Xvalue" YName="YValue1" Fill="#fcbb42"></ej:Series>
                                    <ej:Series Name="due" XName="Xvalue" YName="YValue2" Fill="#da4453"></ej:Series>
                                    <ej:Series Name="Collected" XName="Xvalue" YName="YValue3" Fill="#37bc9b"></ej:Series>
                                </Series>
                                <Title Text="Rental value"></Title>
                                <Legend Position="Bottom"></Legend>
                            </ej:Chart>
                        </div>
                    </div>
                </div>
                <%--********************************************************** العائد الفعلي ************************************************--%>
                <div class="col-lg-6">
                    <div class="card mb-3">
                        <div class="card-body">
                            <asp:Label ID="lbl_Real_Income" runat="server"></asp:Label><br />
                            <ej:WaitingPopup runat="server" ID="waitingpopup8" ShowOnInit="false"></ej:WaitingPopup>
                            <ej:Chart ID="Real_Income_Chart_2" runat="server" Width="520" Height="325" OnClientLoad="onChartLoad" IsResponsive="true" OnClientDisplayTextRendering="textRendering">
                                <CommonSeriesOptions EnableAnimation="True" Tooltip-Visible="true"
                                    Tooltip-Format="#point.x# : #point.y# #series.name# Qatari Ryal">
                                    <Marker>
                                        <DataLabel Visible="True" ShowEdgeLabels="true" EnableContrastColor="true">
                                        </DataLabel>
                                    </Marker>
                                </CommonSeriesOptions>
                                <PrimaryYAxis RangePadding="Normal" LabelFormat="n0"></PrimaryYAxis>
                                <Series>
                                    <ej:Series Name="Total Income" XName="Xvalue" YName="YValue1" Fill="#fcbb42"></ej:Series>
                                    <ej:Series Name="Actual Income" XName="Xvalue" YName="YValue2" Fill="#8cc152"></ej:Series>
                                    <ej:Series Name="Total Expenses" XName="Xvalue" YName="YValue3" Fill="#3bafda"></ej:Series>
                                </Series>
                                <Legend Position="Bottom"></Legend>
                            </ej:Chart>

                        </div>
                    </div>
                </div>
            </div>
            <hr />
            <div class="row" style="margin-left: 10px">
                <%--********************************************************** الإهلاك  ************************************************--%>
                <div class="col-lg-6">
                    <div class="card mb-3">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-lg-6">
                                    <asp:TextBox ID="txt_Destruction_Value" runat="server" TextMode="Number" Text="30" AutoPostBack="true" OnTextChanged="txt_Destruction_Value_TextChanged"></asp:TextBox><br />
                                    <br />
                                    <div runat="server" id="div_1">
                                        <asp:Label ID="Label14" runat="server" Text="Annual Depreciation  :" Font-Size="15px" ForeColor="#3bafda" Font-Bold="true"></asp:Label>&nbsp;&nbsp;
                                        <asp:Label ID="Label15" runat="server"></asp:Label>
                                        <br />
                                        <br />
                                        <asp:Label ID="Label16" runat="server" Text="Cumulative Depreciation  :" Font-Size="15px" ForeColor="#3bafda" Font-Bold="true"></asp:Label>&nbsp;&nbsp;
                                        <asp:Label ID="Label17" runat="server"></asp:Label>
                                        <br />
                                        <br />
                                        <asp:Label ID="Label12" runat="server" Text="Building Age :" Font-Size="15px" ForeColor="#967adc" Font-Bold="true"></asp:Label>&nbsp;&nbsp;
                                        <asp:Label ID="Label13" runat="server"></asp:Label>
                                        <br />
                                        <br />
                                        <asp:Label ID="Label18" runat="server" Text="Remaining Age Of Building  :" Font-Size="15px" ForeColor="#ff8d4f" Font-Bold="true"></asp:Label>&nbsp;&nbsp;
                                        <asp:Label ID="Label19" runat="server"></asp:Label>
                                        <br />
                                        <br />
                                        <asp:Label ID="Label20" runat="server" Text="Remaining Of Building Value  :" Font-Size="15px" ForeColor="#ff8d4f" Font-Bold="true"></asp:Label>&nbsp;&nbsp;
                                        <asp:Label ID="Label21" runat="server"></asp:Label>
                                    </div>


                                    <div runat="server" id="div_2">
                                        <asp:Label ID="Label22" runat="server" Font-Size="15px" ForeColor="#3bafda"></asp:Label>&nbsp;&nbsp;
                                        <asp:Label ID="Label23" runat="server"></asp:Label>
                                        <br />
                                        <br />
                                        <asp:Label ID="Label24" runat="server" Text="Remaining Of All Properties Value  :" Font-Size="15px" ForeColor=" #da4453" Font-Bold="true"></asp:Label>&nbsp;&nbsp;
                                        <asp:Label ID="Label25" runat="server"></asp:Label>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <ej:WaitingPopup runat="server" ID="waitingpopup3" ShowOnInit="false"></ej:WaitingPopup>
                                    <ej:Chart runat="server" ID="destruction_Char" Enable3D="True" IsResponsive="True" OnClientDisplayTextRendering="textRendering">
                                        <size width="300" height="250"></size>
                                        <Legend Visible="True" Position="Left" Alignment="Center" EnableScrollbar="False"></Legend>
                                        <CommonSeriesOptions LabelPosition="Outside">
                                            <Tooltip Visible="true" Format="#point.x# : #point.y# " />
                                            <Marker>
                                                <DataLabel Shape="None" Visible="true" TextPosition="Top">
                                                    <Border Width="1" />
                                                    <ConnectorLine Height="70" Color="Black" />
                                                </DataLabel>
                                            </Marker>
                                        </CommonSeriesOptions>
                                        <Series>
                                            <ej:Series Type="Pie" Width="970" LabelPosition="Outside" PieCoefficient="0.7" StartAngle="145" ExplodeIndex="0" Fill="Bule">
                                                <Border Width="2" Color="White" />
                                            </ej:Series>
                                        </Series>
                                        <Legend Position="Bottom"></Legend>
                                    </ej:Chart>
                                    <br />
                                    <asp:Label ID="lbl_Depreciation_percentage" runat="server" Font-Bold="true"></asp:Label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                 <%--********************************************************** الربح الصافي ************************************************--%>
                <div class="col-lg-6">
                    <div class="card mb-3">
                        <div class="card-body">
                            <ej:WaitingPopup runat="server" ID="waitingpopup5" ShowOnInit="false"></ej:WaitingPopup>
                            <ej:Chart ID="Chart2" runat="server" Width="500" Height="280" OnClientLoad="onChartLoad" IsResponsive="true" OnClientDisplayTextRendering="textRendering">
                                <CommonSeriesOptions EnableAnimation="True" Tooltip-Visible="true"
                                    Tooltip-Format="#point.x# : #point.y# #series.name# Qatari Ryal">
                                    <Marker>
                                        <DataLabel Visible="True" ShowEdgeLabels="true" EnableContrastColor="true">
                                        </DataLabel>
                                    </Marker>
                                </CommonSeriesOptions>
                                <PrimaryYAxis RangePadding="Normal" LabelFormat="n0"></PrimaryYAxis>
                                <Series>
                                    <ej:Series Name="Depreciation " XName="Xvalue" YName="YValue1" Fill=" #da4453"></ej:Series>
                                    <ej:Series Name="Net Profit" XName="Xvalue" YName="YValue2" Fill="#8cc152"></ej:Series>
                                    <ej:Series Name="Total profit" XName="Xvalue" YName="YValue3" Fill="#3bafda"></ej:Series>
                                </Series>
                                <Title Text="Net Profit"></Title>
                                <Legend Position="Bottom"></Legend>
                            </ej:Chart>
                        </div>
                    </div>
                </div>
            </div>
            <hr />
            <div class="row" style="margin-left: 10px">
                <%--********************************************************** العائد على القيمة العفارية ************************************************--%>
                <div class="col-lg-6">
                    <div class="card mb-3">
                        <div class="card-body">
                            &nbsp;&nbsp;&nbsp;<asp:Label ID="Lbl_RealEstae" runat="server"></asp:Label><br />
                            <ej:Chart runat="server" ID="RealEstae_Chart" Enable3D="True" IsResponsive="True" OnClientDisplayTextRendering="textRendering">
                                <size width="350" height="250"></size>
                                <Legend Visible="True" Position="Left" Alignment="Center" EnableScrollbar="False"></Legend>
                                <CommonSeriesOptions LabelPosition="Outside">
                                    <Tooltip Visible="true" Format="#point.x# : #point.y# " />
                                    <Marker>
                                        <DataLabel Shape="None" Visible="true" TextPosition="Top">
                                            <Border Width="1" />
                                            <ConnectorLine Height="70" Color="Black" />
                                        </DataLabel>
                                    </Marker>
                                </CommonSeriesOptions>
                                <PrimaryYAxis RangePadding="Normal" LabelFormat="n0"></PrimaryYAxis>

                                <Series>
                                    <ej:Series Type="Pie" Width="970" LabelPosition="Outside" PieCoefficient="0.7" StartAngle="145" ExplodeIndex="0" Fill="Bule">
                                        <Border Width="2" Color="White" />
                                    </ej:Series>
                                </Series>
                                <Legend Position="Bottom"></Legend>
                            </ej:Chart>
                            <br />
                            <asp:Label ID="lbl_Titel_RealEstate_Value" runat="server" Text="Building Value :" ForeColor="#fcbb42" Font-Bold="true"></asp:Label>
                            <asp:Label ID="lbl_RealEstate_Value" runat="server" Text="99075000000"></asp:Label>
                            <br />
                            <asp:Label ID="lbl_Titel_Yearly_Income" runat="server" Text="The annual income :" ForeColor="#da4453" Font-Bold="true"></asp:Label>
                            <asp:Label ID="Yearly_Income" runat="server" Text=" 0"></asp:Label>
                            <br />
                            <asp:Label ID="lbl_TitelRealEstate_Value_percentage" runat="server" Text="percentage : " ForeColor="#3bafda" Font-Bold="true"></asp:Label>
                            <asp:Label ID="lbl_RealEstate_Value_percentage" runat="server" Text="0 %"></asp:Label>
                        </div>
                    </div>
                </div>
                 <%--****************************************************متبقي التوزيع*********************************************************--%>
                <div class="col-lg-6">
                    <div class="card mb-3">
                        <div class="card-body">
                            <span>Remaining After Distribution</span>
                            <script type="text/javascript" src="../Scripts/ChartData.js"></script>
                            <ej:WaitingPopup runat="server" ID="waitingpopup7" ShowOnInit="false"></ej:WaitingPopup>
                            <ej:Chart ID="Chart3" runat="server" Width="530" Height="340" IsResponsive="true" OnClientLoad="onChartLoad" OnClientDisplayTextRendering="textRendering">
                                <PrimaryYAxis Title-Text="Qatari Ryal" LabelFormat="{value}QR" />
                                <CommonSeriesOptions EnableAnimation="True" Type="Bar" Tooltip-Visible="true"
                                    Tooltip-Format="#series.name# <br/> #point.x# : #point.y#" PieCoefficient="0.5">
                                    <Marker>
                                        <Border Width="2"></Border>
                                        <DataLabel Visible="True" TextPosition="top" HorizontalTextAlignment="Near" EnableContrastColor="true">
                                            <Font FontSize="13px" FontFamily="Segoe UI" FontStyle="Normal" FontWeight="Regular"></Font>
                                        </DataLabel>
                                    </Marker>
                                </CommonSeriesOptions>
                                <PrimaryYAxis RangePadding="Normal" LabelFormat="n0"></PrimaryYAxis>
                                <Series>
                                    <ej:Series Name="Total salaries" XName="Xvalue" YName="YValue1" Fill="#ff8d4f"></ej:Series>
                                    <ej:Series Name="Net Profit" XName="Xvalue" YName="YValue2" Fill="#8cc152"></ej:Series>
                                    <ej:Series Name="Remaining After Distribution" XName="Xvalue" YName="YValue3" Fill="#3bafda"></ej:Series>
                                </Series>
                                <Legend Position="Bottom" Alignment="Center"></Legend>
                            </ej:Chart>
                        </div>
                    </div>
                </div>
            </div>
            <hr />
            <div class="row" style="margin-left: 10px">
                <%--********************************************************** الإستدامة  العقارية  ************************************************--%>
                <div class="col-lg-6">
                    <div class="card mb-3">
                        <div class="card-body">
                            <div class="row">
                                <span>Real estate sustainability</span>
                                <script type="text/javascript" src="../Scripts/ChartData.js"></script>
                                <ej:WaitingPopup runat="server" ID="waitingpopup6" ShowOnInit="false"></ej:WaitingPopup>

                                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <asp:RadioButtonList ID="Realestate_sustainability_Radio" runat="server" AutoPostBack="true" RepeatDirection="Horizontal" CellPadding="10" OnSelectedIndexChanged="Realestate_sustainability_Radio_SelectedIndexChanged">
                                            <asp:ListItem Value="1" Text="annual " Selected="True"></asp:ListItem>
                                            <asp:ListItem Value="2" Text="cumulative " ></asp:ListItem>
                                        </asp:RadioButtonList>
                                        <ej:Chart ClientIDMode="Static" ID="Chart4" runat="server" Width="600" Height="300" IsResponsive="true" OnClientLoad="onChartLoad">
                                            <PrimaryXAxis title-text="the years" ValueType="Category" />
                                            <PrimaryYAxis LabelFormat="{value}" RangePadding="Round" title-text="million" />
                                            <CommonSeriesOptions Type="Line" DoughnutSize="0.2" tooltip-visible="true" Tooltip-Format="#point.x# : #point.y# #series.name# مليون" tooltip-template="Tooltip" marker-size-height="10"
                                                marker-size-width="10" marker-border-width="2" marker-visible="true" EnableAnimation="True" />
                                            <PrimaryYAxis RangePadding="Normal" LabelFormat="n0"></PrimaryYAxis>
                                            <Series>
                                                <ej:Series Name="depreciation" XName="Xvalue" YName="YValue1" Fill="#3bafda"></ej:Series>
                                                <ej:Series Name="investment" XName="Xvalue" YName="YValue2" Fill="#8cc152"></ej:Series>

                                            </Series>
                                            <Legend Visible="true"></Legend>
                                        </ej:Chart>

                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="Realestate_sustainability_Radio" EventName="SelectedIndexChanged" />
                                    </Triggers>
                                </asp:UpdatePanel>
                            </div>
                        </div>
                    </div>
                </div>
                <%--*********************************************************القيمة العقارية ************************************************--%>
                <div class="col-lg-6">
                    <div class="card mb-3">
                        <div class="card-body">
                            <div class="row">
                                <span>Real estate value and book value</span>
                                <div id="Real_Estae_Value_container">
                                    <script type="text/javascript" src="../Scripts/ChartData.js"></script>
                                    <ej:WaitingPopup runat="server" ID="waitingpopup10" ShowOnInit="false"></ej:WaitingPopup>
                                    <ej:Chart ClientIDMode="Static" ID="Chart5" runat="server" Width="600" Height="340" IsResponsive="true" OnClientLoad="onChartLoad">
                                        <PrimaryXAxis title-text="the years" ValueType="Category" />
                                        <PrimaryYAxis LabelFormat="{value}" RangePadding="Round" title-text="million" />
                                        <CommonSeriesOptions Type="Line" DoughnutSize="0.2" tooltip-visible="true" Tooltip-Format="#point.x# : #point.y# #series.name# مليون" tooltip-template="Tooltip"  marker-size-height="10"
                                            marker-size-width="10" marker-border-width="2" marker-visible="true" EnableAnimation="True" />
                                        <PrimaryYAxis RangePadding="Normal" LabelFormat="n0"></PrimaryYAxis>
                                        <Series>
                                            <ej:Series Name="Real estate value" XName="Xvalue" YName="YValue1" Fill="#3bafda"></ej:Series>
                                            <ej:Series Name="book value" XName="Xvalue" YName="YValue2" Fill="#8cc152"></ej:Series>

                                        </Series>
                                        <Legend Visible="true"></Legend>
                                    </ej:Chart>
                                </div>
                            </div>
                           
                        </div>
                    </div>
                </div>
            </div>
            <hr />
            <div class="row" style="margin-left: 10px">
                <%--********************************************************** مؤشر الإستدامة السنوي  ************************************************--%>
                <div class="col-lg-6">
                    <div class="card mb-3">
                        <div class="card-body">
                            <asp:Label ID="Label8" runat="server" Text="Annual Sustainability"></asp:Label><br />
                            &nbsp;&nbsp;&nbsp;<asp:Label ID="Label9" runat="server"></asp:Label><br />
                            <ej:Chart runat="server" ID="Chart6" Enable3D="True" IsResponsive="True" OnClientDisplayTextRendering="textRendering">
                                <size width="350" height="250"></size>
                                <Legend Visible="True" Position="Left" Alignment="Center" EnableScrollbar="False"></Legend>
                                <CommonSeriesOptions LabelPosition="Outside">
                                    <Tooltip Visible="true" Format="#point.x# : #point.y# " />
                                    <Marker>
                                        <DataLabel Shape="None" Visible="true" TextPosition="Top">
                                            <Border Width="1" />
                                            <ConnectorLine Height="70" Color="Black" />
                                        </DataLabel>
                                    </Marker>
                                </CommonSeriesOptions>
                                <PrimaryYAxis RangePadding="Normal" LabelFormat="n0"></PrimaryYAxis>
                                <Series>
                                    <ej:Series Type="Pie" Width="970" LabelPosition="Outside" PieCoefficient="0.7" StartAngle="145" ExplodeIndex="0" Fill="Bule">
                                        <Border Width="2" Color="White" />
                                    </ej:Series>
                                </Series>
                                <Legend Position="Bottom"></Legend>
                            </ej:Chart>
                            <br />
                            <asp:Label ID="lbl_Titel_Total_Annual_Loss" runat="server" Text="Total annual depreciation : " ForeColor="#da4453" Font-Bold="true"></asp:Label>
                            <asp:Label ID="lbl_Total_Annual_Loss" runat="server"></asp:Label>&nbsp;&nbsp;
                            (<asp:Label ID="lbl_Annual_Sustainability_percentage" runat="server" ForeColor="#da4453" Font-Bold="true"></asp:Label>)
                            <br />
                            <br />
                            <asp:Label ID="lbl_Titel_All_OwnerShip_Value" runat="server" Text="Total real estate values: " ForeColor="#fcbb42" Font-Bold="true"></asp:Label>
                            <asp:Label ID="lbl_All_OwnerShip_Value" runat="server"></asp:Label>&nbsp;&nbsp;
                            (<asp:Label ID="Label34" runat="server" ForeColor="#fcbb42" Font-Bold="true"></asp:Label>)
                            
                        </div>
                    </div>
                </div>
                 <%--******************************************************* مؤشر الإستدامة التراكمي ****************************************************--%>
                <div class="col-lg-6">
                    <div class="card mb-3">
                        <div class="card-body">
                            <asp:Label ID="Label26" runat="server" Text="Cumulative Sustainability"></asp:Label><br />
                            &nbsp;&nbsp;&nbsp;<asp:Label ID="Label27" runat="server"></asp:Label><br />
                            <ej:Chart runat="server" ID="Chart7" Enable3D="True" IsResponsive="True" OnClientDisplayTextRendering="textRendering">
                                <size width="350" height="270"></size>
                                <Legend Visible="True" Position="Left" Alignment="Center" EnableScrollbar="False"></Legend>
                                <CommonSeriesOptions LabelPosition="Outside">
                                    <Tooltip Visible="true" Format="#point.x# : #point.y# " />
                                    <Marker>
                                        <DataLabel Shape="None" Visible="true" TextPosition="Top">
                                            <Border Width="1" />
                                            <ConnectorLine Height="70" Color="Black" />
                                        </DataLabel>
                                    </Marker>
                                </CommonSeriesOptions>
                                <PrimaryYAxis RangePadding="Normal" LabelFormat="n0"></PrimaryYAxis>
                                <Series>
                                    <ej:Series Type="Pie" Width="970" LabelPosition="Outside" PieCoefficient="0.7" StartAngle="145" ExplodeIndex="0" Fill="Bule">
                                        <Border Width="2" Color="White" />
                                    </ej:Series>
                                </Series>
                                <Legend Position="Bottom"></Legend>
                            </ej:Chart>





                            <asp:Label ID="lbl_Titel_MHT" runat="server" Text="Total cumulative depreciation : " ForeColor="#da4453" Font-Bold="true"></asp:Label>
                            <asp:Label ID="lbl_MHT" runat="server"></asp:Label>&nbsp;&nbsp;
                            (<asp:Label ID="Label35" runat="server" ForeColor="#da4453"  Font-Bold="true"></asp:Label>)
                            <br />
                            <br />
                            <asp:Label ID="lbl_Titel_MKA" runat="server" Text="Total real estate values : " ForeColor="#fcbb42" Font-Bold="true"></asp:Label>
                            <asp:Label ID="lbl_MKA" runat="server"></asp:Label>&nbsp;&nbsp;
                            (<asp:Label ID="lbl_Cumulative_Sustainability_percentage" runat="server" ForeColor="#fcbb42" Font-Bold="true"></asp:Label>)
                        </div>
                    </div>
                </div>
            </div>
            <hr />

            <div class="row"  style="margin-left: 10px">
                <%--********************************************************** قيم الملكيات المرهونة و الغير مرهونة  ************************************************--%>
                <div class="col-lg-6">
                    <div class="card mb-3">
                        <div class="card-body">
                            <asp:Label ID="Label11" runat="server" Text="Mortgage and non-mortgage property values"></asp:Label><br />
                            &nbsp;&nbsp;&nbsp;<asp:Label ID="Label28" runat="server"></asp:Label><br />

                            <ej:Chart runat="server" ID="Chart8" Enable3D="True" IsResponsive="True" OnClientDisplayTextRendering="textRendering" >
                                <size width="350" height="300"></size>
                                <Legend Visible="True" Position="Left" Alignment="Center" EnableScrollbar="False"></Legend>
                                <CommonSeriesOptions LabelPosition="Outside">
                                    <Tooltip Visible="true" Format="#point.x# : #point.y# " />
                                    <Marker>
                                        <DataLabel Shape="None" Visible="true" TextPosition="Top">
                                            <Border Width="1" />
                                            <ConnectorLine Height="70" Color="Black" />
                                        </DataLabel>
                                    </Marker>
                                </CommonSeriesOptions>
                                <PrimaryYAxis RangePadding="Normal" LabelFormat="n0"></PrimaryYAxis>
                                <Series>
                                    <ej:Series Type="Pie" Width="970" LabelPosition="Outside" PieCoefficient="0.7" StartAngle="145" ExplodeIndex="0" Fill="Bule">
                                        <Border Width="2" Color="White" />
                                    </ej:Series>
                                </Series>
                                <Legend Position="Bottom"></Legend>
                            </ej:Chart>
                            <asp:Label ID="Label39" runat="server" Text="The Value Of All Properties : " ForeColor="#8cc152" Font-Bold="true"></asp:Label>
                            <asp:Label ID="Label40" runat="server"></asp:Label>&nbsp;&nbsp;
                            (<asp:Label ID="Label41" runat="server" ForeColor="#8cc152" Font-Bold="true" Text="100%"></asp:Label>)
                            <br />
                            <br />
                            <asp:Label ID="Label55" runat="server" Text="Free Property Values : " ForeColor="#f6b53f" Font-Bold="true"></asp:Label>
                            <asp:Label ID="Label56" runat="server"></asp:Label>&nbsp;&nbsp;
                            (<asp:Label ID="Label57" runat="server" ForeColor="#f6b53f" Font-Bold="true" Text="100%"></asp:Label>)
                            <br />
                            <br />
                            <asp:Label ID="Label36" runat="server" Text="Mortgaged Property Value : " ForeColor="#da4453" Font-Bold="true"></asp:Label>
                            <asp:Label ID="Label37" runat="server"></asp:Label>&nbsp;&nbsp;
                            (<asp:Label ID="All_Ownership_Value" runat="server" ForeColor="#da4453"  Font-Bold="true"></asp:Label>)
                            
                            
                        </div>
                    </div>
                </div>
                 <%--******************************************************* المبالغ المسددة و المبالغ المتبقية ****************************************************--%>
                <div class="col-lg-6">
                    <div class="card mb-3">
                        <div class="card-body">
                            <asp:Label ID="Label29" runat="server" Text="Paid Amounts And Remaining Amounts"></asp:Label><br />
                            &nbsp;&nbsp;&nbsp;<asp:Label ID="Label30" runat="server"></asp:Label><br />
                            <ej:Chart useGroupingSeparator="true" runat="server" ID="Chart9" Enable3D="True" IsResponsive="True" OnClientDisplayTextRendering="textRendering">
                                <size width="350" height="270"></size>
                                <Legend Visible="True" Position="Left" Alignment="Center" EnableScrollbar="False"></Legend>
                                <CommonSeriesOptions LabelPosition="Outside">
                                    <Tooltip Visible="true" Format="#point.x# : #point.y# " />
                                    <Marker>
                                        <DataLabel Shape="None" Visible="true" TextPosition="Top">
                                            <Border Width="1" />
                                            <ConnectorLine Height="70" Color="Black" />
                                        </DataLabel>
                                    </Marker>
                                </CommonSeriesOptions>
                                <PrimaryYAxis RangePadding="Normal" LabelFormat="n0"></PrimaryYAxis>
                                <Series>
                                    <ej:Series Type="Pie" Width="970" LabelPosition="Outside" PieCoefficient="0.7" StartAngle="145" ExplodeIndex="0" Fill="Bule">
                                        <Border Width="2" Color="White" />
                                    </ej:Series>
                                </Series>
                                <Legend Position="Bottom"></Legend>
                            </ej:Chart>
                            <br />
                            

                             <asp:Label ID="Label58" runat="server" Text="Value Of All Amounts : " ForeColor="#8cc152" Font-Bold="true"></asp:Label>
                            <asp:Label ID="Label59" runat="server"></asp:Label>&nbsp;&nbsp;
                            (<asp:Label ID="Label60" runat="server" ForeColor="#8cc152" Font-Bold="true" Text="100%"></asp:Label>)
                            <br />
                            <br />
                            <asp:Label ID="Label38" runat="server" Text="Paid Amount : " ForeColor="#da4453" Font-Bold="true"></asp:Label>
                            <asp:Label ID="Label42" runat="server"></asp:Label>&nbsp;&nbsp;
                            (<asp:Label ID="All_Paid_Amount" runat="server" ForeColor="#da4453"  Font-Bold="true"></asp:Label>)
                            <br />
                            <br />
                            <asp:Label ID="Label44" runat="server" Text="Remaining Amount : " ForeColor="#fcbb42" Font-Bold="true"></asp:Label>
                            <asp:Label ID="Label45" runat="server"></asp:Label>&nbsp;&nbsp;
                            (<asp:Label ID="Label46" runat="server" ForeColor="#fcbb42" Font-Bold="true"></asp:Label>)
                        </div>
                    </div>
                </div>
            </div>






            <%-- **************************************************  معلومات الرهن العقاري *************************************************************************** --%>
            <div class="row"  style="margin-left: 10px">
                <div class="col-lg-6">
                    <div class="card mb-3">
                        <div class="card-body">
                            <asp:Label ID="Label32" runat="server" Text="Customer Evaluation"></asp:Label><br />
                             <ej:Chart runat="server" ID="Chart10" Enable3D="True" IsResponsive="True" OnClientDisplayTextRendering="textRendering">
                                <size width="350" height="253"></size>
                                <Legend Visible="false" Position="Left" Alignment="Center" EnableScrollbar="False"></Legend>
                                <CommonSeriesOptions LabelPosition="Inside">
                                    <Tooltip Visible="true"  />
                                    <Marker>
                                        <DataLabel Shape="None" Visible="true" TextPosition="Top">
                                            <Border Width="1" />
                                            <ConnectorLine Height="70" Color="Black" />
                                        </DataLabel>
                                    </Marker>
                                </CommonSeriesOptions>
                                <PrimaryYAxis RangePadding="Normal" LabelFormat="n0"></PrimaryYAxis>
                              <Series>
                                    <ej:Series EnableAnimation="True" Name="New York" XName="Xvalue" YName="YValue1" Type="Pie" Explode="True"
                                        LabelPosition="Inside" DoughnutSize="1" Marker-DataLabel-Visible="True" Marker-DataLabel-EnableContrastColor="true"
                                        Marker-DataLabel-Font-FontSize="20px"
                                        Marker-DataLabel-Font-FontWeight="Lighter"  >

                                    </ej:Series>
                                  </Series>
                                <Legend Position="Bottom"></Legend>
                            </ej:Chart>
                            <div class="row" >
                                <asp:Button ID="Button2" runat="server" CssClass="Indicator_buttons" BackColor="#8bc652"  Enabled="false" />
                                &nbsp;
                                <span style="margin-top: 20px">A</span>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Button ID="Button3" runat="server" CssClass="Indicator_buttons" BackColor="#69d2e7"  Enabled="false" />
                                &nbsp;
                                <span style="margin-top: 20px">B</span>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Button ID="Button4" runat="server" CssClass="Indicator_buttons" BackColor="#e27f2d"  Enabled="false" />
                                &nbsp;
                                <span style="margin-top: 20px">C</span>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Button ID="Button5" runat="server" CssClass="Indicator_buttons" BackColor="#005277" Enabled="false" />
                                &nbsp;
                                <span style="margin-top: 20px">D</span>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Button ID="Button6" runat="server" CssClass="Indicator_buttons" BackColor="Red"  Enabled="false" />
                                &nbsp;
                                <span style="margin-top: 20px">E</span>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-lg-6">
                    <div class="card mb-3">
                        <div class="card-body">
                            <asp:Label ID="Label33" runat="server" Text="Building maintenance"></asp:Label><br />
                            <div class="row">
                            <div class="col-lg-8">
                                 <ej:Chart runat="server" ID="Chart11" Enable3D="True" IsResponsive="True" OnClientDisplayTextRendering="textRendering">
                                <size width="350" height="300"></size>
                                <Legend Visible="True" Position="Left" Alignment="Center" EnableScrollbar="False"></Legend>
                                <CommonSeriesOptions LabelPosition="Outside">
                                    <Tooltip Visible="true" Format="#point.x# : #point.y# " />
                                    <Marker>
                                        <DataLabel Shape="None" Visible="true" TextPosition="Top">
                                            <Border Width="1" />
                                            <ConnectorLine Height="70" Color="Black" />
                                        </DataLabel>
                                    </Marker>
                                </CommonSeriesOptions>
                                <PrimaryYAxis RangePadding="Normal" LabelFormat="n0"></PrimaryYAxis>
                                <Series>
                                    <ej:Series Type="Pie" Width="970" LabelPosition="Outside" PieCoefficient="0.7" StartAngle="145" ExplodeIndex="0" Fill="Bule">
                                        <Border Width="2" Color="White" />
                                    </ej:Series>
                                </Series>
                                <Legend Position="Bottom"></Legend>
                            </ej:Chart>
                            </div>
                             <%--<div class="col-lg-4" style="top:50px">
                                 <asp:Label ID="Label43" runat="server" Text="جديد : 47,61 %" ForeColor="#e94649" Font-Bold="true"></asp:Label><br />
                                 <asp:Label ID="Label47" runat="server" Text="متابعة : 19,04 %" ForeColor="#f6b53f" Font-Bold="true"></asp:Label><br />
                                 <asp:Label ID="Label48" runat="server" Text="دراسة صيانة : 19,04 %" ForeColor="#6faab0" Font-Bold="true"></asp:Label><br />
                                 <asp:Label ID="Label49" runat="server" Text="دراسة صيانة 2 : 9,52 %" ForeColor="#c4c24a" Font-Bold="true"></asp:Label><br />
                                 <asp:Label ID="Label50" runat="server" Text=" متهالك : 2,38 %" ForeColor="#fb954f" Font-Bold="true"></asp:Label><br />
                                 <asp:Label ID="Label51" runat="server" Text=" متعدد : 2,38 %" ForeColor="#8bc652" Font-Bold="true"></asp:Label><br />
                                 <asp:Label ID="Label52" runat="server" Text=" غير صالح : 0.00 %" ForeColor="#005277" Font-Bold="true"></asp:Label><br />
                            </div>--%>
                        </div>
                        </div>
                    </div>
                </div>
                <%--****************************************************** النسب المؤوية لجنسيات المستأجرين ******************************************************--%>
                <div class="col-lg-6">
                    <div class="card mb-3">
                        <div class="card-body">
                            <asp:Label ID="Label10" runat="server" Text="Percentages Of Nationalities Of Tenants For Singel Contracts"></asp:Label><br />
                            <br />
                            <asp:Chart ID="Chart12" runat="server" BackColor="#dfeef8" BackGradientStyle="Center"
                                BorderlineWidth="0" Height="360px" Palette="None" PaletteCustomColors="Maroon"
                                Width="550px" BorderlineColor="64, 0, 64">
                                <Titles>
                                    <asp:Title ShadowOffset="0" Name="Items" />
                                </Titles>
                                <Legends>
                                    <asp:Legend Alignment="Center" Docking="Bottom" IsTextAutoFit="False" Name="الجنسيات" LegendStyle="Row" />
                                </Legends>
                                <Series>
                                    <asp:Series Name="Nationalities" ToolTip=" #VALX  #VALY %" Color="#52a2da" />
                                </Series>
                                <ChartAreas>
                                    <asp:ChartArea Name="ChartArea1" BorderWidth="50" />
                                    
                                </ChartAreas>
                            </asp:Chart>

                        </div>
                    </div>
                </div>

                 <div class="col-lg-6">
                    <div class="card mb-3">
                        <div class="card-body">
                            <asp:Label ID="Label53" runat="server" Text="Percentages Of Nationalities Of Tenants For Multi Contracts"></asp:Label><br />
                            <br />
                            <asp:Chart ID="Chart13" runat="server" BackColor="#dfeef8" BackGradientStyle="Center"
                                BorderlineWidth="0" Height="360px" Palette="None" PaletteCustomColors="Maroon"
                                Width="550px" BorderlineColor="64, 0, 64">
                                <Titles>
                                    <asp:Title ShadowOffset="0" Name="Items" />
                                </Titles>
                                <Legends>
                                    <asp:Legend Alignment="Center" Docking="Bottom" IsTextAutoFit="False" Name="الجنسيات" LegendStyle="Row" />
                                </Legends>
                                <Series>
                                    <asp:Series Name="Nationalities" ToolTip=" #VALX  #VALY %" Color="#d670ac" />
                                </Series>
                                <ChartAreas>
                                    <asp:ChartArea Name="ChartArea1" BorderWidth="50" />
                                </ChartAreas>
                            </asp:Chart>

                        </div>
                    </div>
                </div>

                <%--*****************--%>



                <div class="col-lg-6" style="display:none">
                    <div class="card mb-3">
                        <div class="card-body">
                            <asp:Label ID="Contarct_N_P" runat="server" Text="النسب المئوية جنسيات المستأجرين للعقود المفردة"></asp:Label><br />
                            <br />
                            <asp:GridView AutoGenerateColumns="false" ID="nationality_GridView" runat="server"
                                CssClass="table align-items-center table-flush" BackColor="White" BorderColor="#CCCCCC"
                                BorderStyle="None" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Horizontal" Font-Size="Small">
                                <Columns>
                                    <asp:BoundField DataField="Arabic_nationality" HeaderText="الجنسية" />
                                    <asp:BoundField DataField="percent" HeaderText="النسبة" DataFormatString="{0:0}%" />
                                </Columns>
                                <EditRowStyle HorizontalAlign="Center" />
                                <FooterStyle BackColor="#CCCC99" ForeColor="Black" HorizontalAlign="Center" />
                                <HeaderStyle BackColor="#52a2da" Font-Bold="false" ForeColor="White" Font-Size="12px" HorizontalAlign="Center" />
                                <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Center" />
                                <RowStyle HorizontalAlign="Center" />
                                <SelectedRowStyle BackColor="#CC3333" Font-Bold="false" ForeColor="White" />
                                <SortedAscendingCellStyle BackColor="#F7F7F7" />
                                <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                                <SortedDescendingCellStyle BackColor="#E5E5E5" />
                                <SortedDescendingHeaderStyle BackColor="#242121" />
                            </asp:GridView>
                        </div>
                    </div>
                </div>
                 <div class="col-lg-6" style="display:none">
                    <div class="card mb-3">
                        <div class="card-body">
                            <asp:Label ID="Label31" runat="server" Text="النسب المئوية جنسيات المستأجرين للعقود المجملة"></asp:Label><br />
                    <br />
                    <asp:GridView AutoGenerateColumns="false" ID="B_nationality_GridView" runat="server"
                        CssClass="table align-items-center table-flush" BackColor="White" BorderColor="#CCCCCC"
                        BorderStyle="None" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Horizontal" Font-Size="Small">
                        <Columns>
                            <asp:BoundField DataField="Arabic_nationality" HeaderText="الجنسية" />
                            <asp:BoundField DataField="percent" HeaderText="النسبة" DataFormatString="{0:0}%" />
                        </Columns>
                        <EditRowStyle HorizontalAlign="Center" />
                        <FooterStyle BackColor="#CCCC99" ForeColor="Black" HorizontalAlign="Center" />
                        <HeaderStyle BackColor="#d770ad" Font-Bold="false" ForeColor="White" Font-Size="12px" HorizontalAlign="Center" />
                        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Center" />
                        <RowStyle HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="#CC3333" Font-Bold="false" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F7F7F7" />
                        <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                        <SortedDescendingCellStyle BackColor="#E5E5E5" />
                        <SortedDescendingHeaderStyle BackColor="#242121" />
                    </asp:GridView>
                        </div>
                    </div>
                </div>




                
            </div>
        </div>
    </div>
</asp:Content>
