<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ComparesionPointage.aspx.cs" Inherits="ComparesionPointage" %>

<%@ Register Assembly="DevExpress.Web.v20.1, Version=20.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<!DOCTYPE html>



<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <style>
        .container {
            display: table;
            margin-bottom: 34px;
        }

        .editor {
            width: 300px;
            padding-bottom: 16px;
        }

        .content {
            vertical-align: middle;
            line-height: 150%;
        }

        @media(min-width:620px) {
            .editor, .content {
                display: table-cell;
            }
        }
        /* BlueBall button */
        .blueBall {
            background-image: url(../Image/icons8-zoom-in-64.png);
            width: 60px;
            height: 60px;
        }

        .blueBallHottracked {
            background-position: -5px 0px;
        }

        .blueBallPressed {
            background-position: -10px 0px;
        }
    </style>
    <script type="text/javascript">
        function callabchInfo() {
            GridbaseIntranet.PerformCallback();
            GridbaseIntranetVerifications.PerformCallback();
            CallEnvoy.PerformCallback();
        }

    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <table width="100%">
                <tr>
                    <td>
                        <dx:ASPxFormLayout ID="ASPxFormLayout2" ClientInstanceName="FormLayoutDEtailStatusProg" runat="server" ColCount="4" Width="100%">
                            <Items>
                                <dx:LayoutGroup Caption="Pointeuse" Width="200px" Height="45px" ColCount="1">
                                    <Items>
                                        <dx:LayoutItem ShowCaption="False">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer>

                                                    <dx:ASPxComboBox runat="server" Width="100%" ID="cmbPointeuse" ClientInstanceName="cmbPointeuse"
                                                        ValueField="IP" Theme="Glass" DisplayFormatString="{1}" DataSourceID="SqlPointeuse">
                                                        <Columns>
                                                            <dx:ListBoxColumn FieldName="device_id" Visible="false"></dx:ListBoxColumn>
                                                            <dx:ListBoxColumn FieldName="IP" Caption="IP"></dx:ListBoxColumn>
                                                            <dx:ListBoxColumn FieldName="MachineAlias" Caption="MachineAlias" Width="200px"></dx:ListBoxColumn>
                                                        </Columns>
                                                    </dx:ASPxComboBox>

                                                    <asp:SqlDataSource ID="SqlPointeuse" runat="server" ConnectionString="<%$ ConnectionStrings:PointeuseConnectionString %>"
                                                        SelectCommand="SelectPointeuseAffecte" SelectCommandType="StoredProcedure"></asp:SqlDataSource>

                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                    </Items>
                                </dx:LayoutGroup>
                                <dx:LayoutGroup Caption="Période" Width="300px" Height="45px" ColumnSpan="1" ColCount="2">
                                    <Items>
                                        <dx:LayoutItem Caption="Période">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer>
                                                    <dx:ASPxDateEdit ID="CmbMonths" ClientInstanceName="CmbMonths" runat="server" ShowShadow="false" Width="200px"
                                                        Theme="Glass" DisplayFormatString="MMMM yyyy" PickerType="Months">
                                                        <CalendarProperties>
                                                            <FastNavProperties InitialView="Months" MaxView="Years" />
                                                        </CalendarProperties>

                                                    </dx:ASPxDateEdit>


                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>

                                    </Items>
                                </dx:LayoutGroup>
                                <dx:LayoutGroup Caption="Ressource" Width="200px" ColCount="1" Height="45px">
                                    <Items>
                                        <dx:LayoutItem ShowCaption="False">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer>

                                                    <dx:ASPxComboBox runat="server" Width="200px" ID="cmbRessource" ClientInstanceName="cmbRessource"
                                                        TextField="Nom" ValueField="Matricule" Theme="Glass" DataSourceID="SqlDataRessource">
                                                    </dx:ASPxComboBox>

                                                    <asp:SqlDataSource ID="SqlDataRessource" runat="server" ConnectionString="<%$ ConnectionStrings:PointeuseConnectionString %>"
                                                        SelectCommand="SelectEmploye" SelectCommandType="StoredProcedure"></asp:SqlDataSource>

                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                    </Items>
                                </dx:LayoutGroup>
                            </Items>
                        </dx:ASPxFormLayout>
                    </td>
                    <td style="width: 70%; text-align: left">

                        <dx:ASPxButton ID="btnBlueBall" ClientInstanceName="btnBlueBall" runat="server" AutoPostBack="False" AllowFocus="False" RenderMode="Link">
                            <ClientSideEvents Click="callabchInfo" />
                            <Image>
                                <SpriteProperties CssClass="blueBall" HottrackedCssClass="blueBallHottracked" PressedCssClass="blueBallPressed" />
                            </Image>
                        </dx:ASPxButton>

                    </td>
                </tr>
            </table>

            <dx:ASPxFormLayout ID="ASPxFormLayout3" ClientInstanceName="FormLayoutDEtailStatusProg" runat="server" ColCount="3" Width="100%">
                <Items>
                    <dx:LayoutGroup Caption="Base intranet" ColSpan="1" Width="40%" Height="530px">
                        <Items>

                            <dx:LayoutItem ShowCaption="False" Width="100%" ColSpan="1">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer>
                                        <dx:ASPxGridView ID="GridbaseIntranet" ClientInstanceName="GridbaseIntranet" OnCustomCallback="GridbaseIntranet_CustomCallback" DataSourceID="SqlDataBaseIntranet" runat="server" Width="100%" Theme="Glass" AutoGenerateColumns="False" KeyFieldName="id">

                                            <Columns>
                                                <dx:GridViewDataTextColumn FieldName="id" ReadOnly="True" Visible="false" ShowInCustomizationForm="True" VisibleIndex="0">
                                                    <EditFormSettings Visible="False" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="MachineNumber" Visible="false" ShowInCustomizationForm="True" VisibleIndex="1">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="IndRegID" ShowInCustomizationForm="True" Caption="Nom" VisibleIndex="2">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="DateTimeRecord" Caption="Période" ShowInCustomizationForm="True" VisibleIndex="3">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="dwVerifyMode" Visible="false" ShowInCustomizationForm="True" VisibleIndex="4">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="dwInOutMode" Visible="false" ShowInCustomizationForm="True" VisibleIndex="5">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="dwWorkCode" Visible="false" ShowInCustomizationForm="True" VisibleIndex="6">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataDateColumn FieldName="DateOnlyRecord" Visible="false" ShowInCustomizationForm="True" VisibleIndex="7">
                                                </dx:GridViewDataDateColumn>
                                                <dx:GridViewDataDateColumn FieldName="TimeOnlyrecord" Visible="false" ShowInCustomizationForm="True" VisibleIndex="8">
                                                </dx:GridViewDataDateColumn>
                                                <dx:GridViewDataTextColumn FieldName="IPMachineNumber" Caption="IP" ShowInCustomizationForm="True" VisibleIndex="9">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="lblDeviceInfo" Visible="false" ShowInCustomizationForm="True" VisibleIndex="10">
                                                </dx:GridViewDataTextColumn>
                                            </Columns>
                                            <SettingsPager PageSize="30" EnableAdaptivity="true">
                                                <PageSizeItemSettings Visible="true" Position="Right" ShowAllItem="true">
                                                </PageSizeItemSettings>
                                            </SettingsPager>
                                        </dx:ASPxGridView>
                                        <asp:SqlDataSource ID="SqlDataBaseIntranet" runat="server" ConnectionString="<%$ ConnectionStrings:PointeuseConnectionString %>"
                                            SelectCommand="Selectacc_monitor_log" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:Parameter Name="IndRegID" />
                                                <asp:Parameter Name="Periode" />
                                                <asp:Parameter Name="IPMachineNumber" />
                                            </SelectParameters>

                                        </asp:SqlDataSource>

                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                        </Items>
                    </dx:LayoutGroup>

                    <dx:LayoutGroup Caption="" ColSpan="1" Width="5%" Height="530px">
                        <Items>
                            <dx:LayoutItem ShowCaption="False" Width="100%">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer>
                                        <table width="100%" height="430px">
                                            <tr>
                                                <td height="100px"></td>
                                            </tr>
                                            <tr>
                                                <td align="center">
                                                    <dx:ASPxButton ID="btnAffecter" runat="server" Text="Ajouter" Width="100px"
                                                        AutoPostBack="False" Theme="Glass">
                                                        <ClientSideEvents Click="function(s, e) {
                                                  CallAffectEtude();  
                                                   }"></ClientSideEvents>
                                                        <Image Url="~/Image/page-prev.gif" Height="20px"></Image>

                                                    </dx:ASPxButton>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="center">
                                                    <dx:ASPxButton ID="btnRetourner" runat="server" Text="Tous" Width="100px" Height="30px"
                                                        AutoPostBack="False" Theme="Glass">
                                                        <ClientSideEvents Click="function(s, e) {
                                                  CallRetourEtude();  	
                                                   }"></ClientSideEvents>


                                                        <Image Url="~/Image/page-prev.gif" Height="20px"></Image>
                                                        <Image Url="~/Image/double-left-100.png" Height="20px"></Image>
                                                    </dx:ASPxButton>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td height="100px"></td>
                                            </tr>
                                        </table>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>


                        </Items>
                    </dx:LayoutGroup>
                    <dx:LayoutGroup Caption="Base pointeuse" ColSpan="1" Width="40%" Height="530px">
                        <Items>
                            <dx:LayoutItem ShowCaption="False" Width="100%">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer>

                                        <dx:ASPxGridView ID="GridbaseIntranetVerifications" ClientInstanceName="GridbaseIntranetVerifications" OnCustomCallback="GridbaseIntranetVerifications_CustomCallback"
                                            DataSourceID="SqlDataBaseIntranetVerivecation" OnHtmlRowPrepared="GridbaseIntranetVerifications_HtmlRowPrepared"
                                            runat="server" Width="100%" Theme="Glass" AutoGenerateColumns="False" KeyFieldName="id">
                                            <Columns>
                                                <dx:GridViewDataTextColumn FieldName="id" ReadOnly="True" Visible="false" ShowInCustomizationForm="True" VisibleIndex="0">
                                                    <EditFormSettings Visible="False" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="MachineNumber" Visible="false" ShowInCustomizationForm="True" VisibleIndex="1">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="IndRegID" ShowInCustomizationForm="True" Caption="Nom" VisibleIndex="2">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="DateTimeRecord" Caption="Période" ShowInCustomizationForm="True" VisibleIndex="3">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="dwVerifyMode" Visible="false" ShowInCustomizationForm="True" VisibleIndex="4">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="dwInOutMode" Visible="false" ShowInCustomizationForm="True" VisibleIndex="5">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="dwWorkCode" Visible="false" ShowInCustomizationForm="True" VisibleIndex="6">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataDateColumn FieldName="DateOnlyRecord" Visible="false" ShowInCustomizationForm="True" VisibleIndex="7">
                                                </dx:GridViewDataDateColumn>
                                                <dx:GridViewDataDateColumn FieldName="TimeOnlyrecord" Visible="false" ShowInCustomizationForm="True" VisibleIndex="8">
                                                </dx:GridViewDataDateColumn>
                                                <dx:GridViewDataTextColumn FieldName="IPMachineNumber" Caption="IP" ShowInCustomizationForm="True" VisibleIndex="9">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="lblDeviceInfo" Visible="false" ShowInCustomizationForm="True" VisibleIndex="10">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="CodVerif" Visible="false" ShowInCustomizationForm="True" VisibleIndex="11">
                                                </dx:GridViewDataTextColumn>

                                            </Columns>
                                            <SettingsPager PageSize="30" EnableAdaptivity="true">
                                                <PageSizeItemSettings Visible="true" Position="Right" ShowAllItem="true">
                                                </PageSizeItemSettings>
                                            </SettingsPager>
                                        </dx:ASPxGridView>

                                        <asp:SqlDataSource ID="SqlDataBaseIntranetVerivecation" runat="server" ConnectionString="<%$ ConnectionStrings:PointeuseConnectionString %>"
                                            SelectCommand="Selectacc_monitor_log_Verification" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:Parameter Name="IndRegID" />
                                                <asp:Parameter Name="Periode" />
                                                <asp:Parameter Name="IPMachineNumber" />
                                            </SelectParameters>

                                        </asp:SqlDataSource>

                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                        </Items>
                    </dx:LayoutGroup>

                </Items>
            </dx:ASPxFormLayout>


            <dx:ASPxCallbackPanel ID="CallEnvoy" ClientInstanceName="CallEnvoy" runat="server" OnCallback="CallEnvoy_Callback">
                <ClientSideEvents EndCallback="function(s, e) {
	               EndCallbac(s,e)
                }" />
            </dx:ASPxCallbackPanel>
        </div>
    </form>
</body>
</html>
