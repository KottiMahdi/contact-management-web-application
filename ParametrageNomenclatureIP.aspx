<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ParametrageNomenclatureIP.aspx.cs" Inherits="ParametrageNomenclatureIP" %>

<%@ Register Assembly="DevExpress.Web.ASPxTreeList.v20.1, Version=20.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxTreeList" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v20.1, Version=20.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>

    <script type="text/javascript">

        function calbbackresulte() {

            var IP = TxtIP.GetText();

            if (IP != "") {

                PopupPing.Show();
                czas.SetEnabled(true);
                ProgCallback.PerformCallback('TauxCharge');
                callbac.PerformCallback();

            }

            else {
                txterror.SetText('SVP Choisir IP adresse');
                PopupAlert.Show();
            }

        }


        function endCallback(s, e) {
            var chois = s.cp_Etat;

            if (chois == "Success") {
                TxtResultat.SetText(chois);
                czas.SetEnabled(false);
                idProgTauxCharg.SetPosition(100);
            }
            else {
                TxtResultat.SetText(chois);
               
                TxtResultatRef.SetText(chois);
                czas.SetEnabled(false);
                idProgTauxCharg.SetPosition(100);
            }



        }

    </script>
</head>
<body>

    <form id="form1" runat="server">
        <div>
            <dx:ASPxFormLayout ID="FormLayoutTypeProjet" ClientInstanceName="FormLayoutTypeProjet" runat="server" ColCount="7" Width="100%">
                <Items>
                    <dx:LayoutGroup Caption="Configuration IP" Border-BorderColor="Transparent" ColSpan="7">

                        <Items>
                            <dx:LayoutItem ShowCaption="False">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer>
                                        <table width="100%">
                                            <tr>
                                                <td width="90%">
                                                    <dx:ASPxTextBox ID="TxtIP" Height="45px" Theme="Office365" ClientInstanceName="TxtIP" runat="server" Width="100%"></dx:ASPxTextBox>
                                                </td>
                                                <td>
                                                    <dx:ASPxButton ID="btnConfirmer" ClientInstanceName="btnConfirmer" runat="server" Height="35px"
                                                        AutoPostBack="False" Text="Ping" Font-Bold="true" Width="320px" Theme="Glass">
                                                        <ClientSideEvents Click="calbbackresulte" />
                                                        <Image Height="35px" Width="35px" Url="~/Image/place-marker-48.png">
                                                        </Image>
                                                    </dx:ASPxButton>
                                                </td>
                                            </tr>
                                        </table>

                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>

                        </Items>

                    </dx:LayoutGroup>
                    <dx:LayoutGroup Caption="Ajout nomenclature IP" Width="45%" ColSpan="3">
                        <Items>
                            <dx:LayoutItem Caption="Type" ShowCaption="False" Width="45%" ColSpan="1" HorizontalAlign="Right">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer Width="45%">
                                        <dx:ASPxGridView ID="GridRevision" ClientInstanceName="GridRevision" DataSourceID="SqlDataNomenclatureIP"
                                            KeyFieldName="IDMachines" Width="100%" Theme="Glass" runat="server">

                                            <Columns>
                                                <dx:GridViewCommandColumn ButtonType="Image" Caption=" " Width="30px" ShowSelectCheckbox="false" VisibleIndex="0"
                                                    ShowEditButton="false"
                                                    ShowUpdateButton="true"
                                                    ShowDeleteButton="true"
                                                    ShowCancelButton="true">

                                                    <HeaderTemplate>
                                                        <dx:ASPxButton HorizontalAlign="Center" runat="server" Text=" " RenderMode="Link" AutoPostBack="false">
                                                            <Image Url="Image/add_large.png" Width="15px"></Image>
                                                            <ClientSideEvents Click="function(s,e){ GridRevision.AddNewRow();  }" />
                                                        </dx:ASPxButton>

                                                    </HeaderTemplate>
                                                </dx:GridViewCommandColumn>
                                                <dx:GridViewDataTextColumn FieldName="IDMachines" Visible="true" CellStyle-HorizontalAlign="Center" Width="80px" VisibleIndex="1">
                                                </dx:GridViewDataTextColumn>

                                                <dx:GridViewDataTextColumn FieldName="IP" VisibleIndex="2" Width="100px">
                                                </dx:GridViewDataTextColumn>

                                                <dx:GridViewDataTextColumn FieldName="Description" Width="200px" Caption="Description" VisibleIndex="3">
                                                </dx:GridViewDataTextColumn>
                                            </Columns>
                                            <SettingsEditing Mode="Batch" />
                                            <SettingsBehavior ConfirmDelete="True" />
                                            <SettingsCommandButton>

                                                <DeleteButton>
                                                    <Image Url="Image/delete.gif" />
                                                </DeleteButton>
                                                <CancelButton>
                                                    <Image Url="Image/cancel.gif" />
                                                </CancelButton>
                                                <UpdateButton>
                                                    <Image Url="Image/save.gif" />
                                                </UpdateButton>
                                            </SettingsCommandButton>
                                            <SettingsPager PageSize="10" EnableAdaptivity="true">
                                                <PageSizeItemSettings Visible="true" Position="Right" ShowAllItem="true">
                                                </PageSizeItemSettings>
                                            </SettingsPager>
                                            <SettingsBehavior AutoExpandAllGroups="True" AllowFocusedRow="true" />
                                            <Settings ShowFooter="false" ShowGroupFooter="VisibleIfExpanded" ShowGroupedColumns="false" ShowColumnHeaders="true"
                                                ShowTitlePanel="false" VerticalScrollableHeight="150" VerticalScrollBarMode="Visible"></Settings>
                                        </dx:ASPxGridView>
                                        <asp:SqlDataSource ID="SqlDataNomenclatureIP" runat="server" ConnectionString="<%$ ConnectionStrings:PointeuseConnectionString %>"
                                            SelectCommand="GetNomenclatureIP" SelectCommandType="StoredProcedure"
                                            InsertCommand="InsertNomenclatureIP" InsertCommandType="StoredProcedure"
                                            UpdateCommand="UpdateNomenclatureIP" UpdateCommandType="StoredProcedure"
                                            DeleteCommand="DeleteNomenclatureIP" DeleteCommandType="StoredProcedure">
                                            <DeleteParameters>
                                                <asp:Parameter Name="IDMachines" Type="Int32" />
                                            </DeleteParameters>
                                            <InsertParameters>
                                                <asp:Parameter Name="IP" Type="String" />
                                                <asp:Parameter Name="Description" Type="String" />
                                            </InsertParameters>
                                            <UpdateParameters>
                                                <asp:Parameter Name="IP" Type="String" />
                                                <asp:Parameter Name="Description" Type="String" />
                                                <asp:Parameter Name="IDMachines" Type="Int32" />
                                            </UpdateParameters>


                                        </asp:SqlDataSource>

                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>

                        </Items>
                    </dx:LayoutGroup>
                    <dx:LayoutGroup ShowCaption="False" Width="5%" Height="280px" ColSpan="1" ColumnCount="1">
                        <Items>
                            <dx:LayoutItem ShowCaption="False">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer>
                                        <table width="100%">
                                            <tr height="220px">
                                                <td>

                                                    <dx:ASPxButton ID="ASPxButton1" ClientInstanceName="btnConfirmer" runat="server" Height="35px"
                                                        AutoPostBack="False" Text=" " Width="100%" Theme="Glass">
                                                        <ClientSideEvents Click="function(s, e) {
                                                                      CallbackDetailProjet.PerformCallback('Ajouter');
                                                                    }
                                                                    " />
                                                        <Image Height="35px" Width="35px" Url="~/Image/right.png">
                                                        </Image>
                                                    </dx:ASPxButton>


                                                </td>
                                            </tr>

                                        </table>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>

                        </Items>
                    </dx:LayoutGroup>
                    <dx:LayoutGroup Caption="Détail Machine" Width="55%" ColSpan="3" ColumnCount="2" Height="280px">
                        <Items>
                            <dx:LayoutItem Caption="IP">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer>
                                        <dx:ASPxTextBox ID="TxtIPs" Height="35px" Theme="Office365" ClientInstanceName="TxtIPs" runat="server" Width="100%"></dx:ASPxTextBox>

                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="Réference Machine">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer>
                                        <dx:ASPxTextBox ID="TxtRef" Height="35px" Theme="Office365" ClientInstanceName="TxtRef" runat="server" Width="100%"></dx:ASPxTextBox>

                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="device id">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer>
                                        <dx:ASPxTextBox ID="TxtDevice" Height="35px" Theme="Office365" ClientInstanceName="TxtDevice" runat="server" Width="100%"></dx:ASPxTextBox>

                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="MachineAlias">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer>

                                        <dx:ASPxTextBox ID="TxtAlias" Height="30px" Theme="Office365" ClientInstanceName="TxtAlias" runat="server" Width="100%"></dx:ASPxTextBox>

                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="Port">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer>

                                        <dx:ASPxTextBox ID="TxtPord" Height="30px" Theme="Office365" ClientInstanceName="TxtPord" runat="server" Width="100%"></dx:ASPxTextBox>

                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="Enabled">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer>
                                        <dx:ASPxTextBox ID="TxtEnable" Height="35px" Theme="Office365" ClientInstanceName="TxtEnable" runat="server" Width="100%"></dx:ASPxTextBox>

                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="device_name">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer>
                                        <dx:ASPxTextBox ID="txtdevicename" Height="35px" Theme="Office365" ClientInstanceName="txtdevicename" runat="server" Width="100%"></dx:ASPxTextBox>

                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="Administrateur">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer>

                                        <dx:ASPxTextBox ID="TxtAdministrateur" Height="30px" Theme="Office365" ClientInstanceName="TxtAdministrateur" runat="server" Width="100%"></dx:ASPxTextBox>

                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem ShowCaption="False" ColumnSpan="2" HorizontalAlign="Right">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem ShowCaption="False" ColumnSpan="2" HorizontalAlign="Right">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer>
                                        <dx:ASPxButton ID="ASPxButton2" ClientInstanceName="btnConfirmer" runat="server" Height="35px"
                                            AutoPostBack="False" Text=" " Width="320px" Theme="Glass">
                                            <ClientSideEvents Click="function(s, e) {
                                                                      GridIPAffecter.PerformCallback();
                                                                    }
                                                                    
                                                                    " />

                                            <Image Height="35px" Width="30px" Url="~/Image/Affectation2.png">
                                            </Image>
                                        </dx:ASPxButton>

                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                        </Items>
                    </dx:LayoutGroup>
                    <dx:LayoutGroup Caption="Machine affecter" Width="100%" ColSpan="7">
                        <Items>

                            <dx:LayoutItem ShowCaption="False">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer>

                                        <dx:ASPxGridView ID="GridIPAffecter" ClientInstanceName="GridIPAffecter" DataSourceID="SqlIPAffecter" KeyFieldName="device_id" OnCustomCallback="GridIPAffecter_CustomCallback"
                                            Width="100%" Theme="Glass" runat="server">

                                            <Columns>
                                                <dx:GridViewCommandColumn ButtonType="Image" Caption=" " Width="30px" ShowSelectCheckbox="false" VisibleIndex="0"
                                                    ShowUpdateButton="true"
                                                    ShowDeleteButton="true"
                                                    ShowCancelButton="true">
                                                </dx:GridViewCommandColumn>

                                                <dx:GridViewDataTextColumn FieldName="device_id" VisibleIndex="2" Width="100px">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="MachineAlias" VisibleIndex="2" Width="400px">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="MachineNom" VisibleIndex="2" Width="200px">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="MachineReference" VisibleIndex="2" Width="200px">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="IP" VisibleIndex="2" Width="100px">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Port" Width="100px" Caption="Port" VisibleIndex="3">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Enabled" Width="100px" Caption="Enabled" VisibleIndex="3">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Administrateur" Caption="Administrateur" VisibleIndex="3">
                                                </dx:GridViewDataTextColumn>
                                            </Columns>
                                            <SettingsEditing Mode="EditForm" />
                                            <SettingsBehavior ConfirmDelete="True" />
                                            <SettingsCommandButton>

                                                <DeleteButton>
                                                    <Image Url="Image/delete.gif" />
                                                </DeleteButton>
                                                <CancelButton>
                                                    <Image Url="Image/cancel.gif" />
                                                </CancelButton>
                                                <UpdateButton>
                                                    <Image Url="Image/save.gif" />
                                                </UpdateButton>
                                            </SettingsCommandButton>
                                            <SettingsPager PageSize="10" EnableAdaptivity="true">
                                                <PageSizeItemSettings Visible="true" Position="Right" ShowAllItem="true">
                                                </PageSizeItemSettings>
                                            </SettingsPager>
                                            <SettingsBehavior AutoExpandAllGroups="True" AllowFocusedRow="true" />
                                            <Settings ShowFooter="false" ShowGroupFooter="VisibleIfExpanded" ShowGroupedColumns="false" ShowColumnHeaders="true"
                                                ShowTitlePanel="false" VerticalScrollableHeight="150" VerticalScrollBarMode="Visible"></Settings>
                                        </dx:ASPxGridView>
                                        <asp:SqlDataSource ID="SqlIPAffecter" runat="server" ConnectionString="<%$ ConnectionStrings:PointeuseConnectionString %>"
                                            SelectCommand="SelecttMAchineIP" SelectCommandType="StoredProcedure"
                                            InsertCommand="InsertMachineIP" InsertCommandType="StoredProcedure"
                                            DeleteCommand="DeleteMachineIP" DeleteCommandType="StoredProcedure">
                                            <DeleteParameters>
                                                <asp:Parameter Name="device_id" Type="Int32" />
                                            </DeleteParameters>
                                            <InsertParameters>
                                                <asp:Parameter Name="MachineAlias" Type="String" />
                                                <asp:Parameter Name="MachineNom" Type="String" />
                                                <asp:Parameter Name="MachineReference" Type="String" />
                                                <asp:Parameter Name="MachineAlias" Type="String" />
                                                <asp:Parameter Name="IP" Type="String" />
                                                <asp:Parameter Name="Enabled" />
                                                <asp:Parameter Name="IPAdministrateur" Type="String" />
                                            </InsertParameters>



                                        </asp:SqlDataSource>

                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>



                        </Items>
                    </dx:LayoutGroup>
                </Items>
            </dx:ASPxFormLayout>

        </div>

        <dx:ASPxPopupControl ID="PopupPing" runat="server" HeaderText="Information" ClientInstanceName="PopupPing"
            Width="500px" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="TopSides" Theme="Glass">

            <ContentCollection>
                <dx:PopupControlContentControl ID="PopupControlContentControl3" runat="server">

                    <dx:ASPxCallbackPanel ID="callbac" ClientInstanceName="callbac" runat="server" OnCallback="callbac_Callback" Height="540px">
                        <ClientSideEvents EndCallback="function(s, e) {endCallback(s,e);}" />
                        <PanelCollection>
                            <dx:PanelContent>

                                <dx:ASPxFormLayout ID="ASPxFormLayout4" ClientInstanceName="FormLayoutDEtailStatusProg" runat="server" Width="100%" ColCount="1">
                                    <Items>
                                        <dx:LayoutGroup ShowCaption="False" Width="100%" ColCount="1">
                                <Items>
                                    <dx:LayoutItem ShowCaption="false" ColSpan="1" Width="100%">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer>

                                                <dx:ASPxProgressBar runat="server" ID="idProgTauxCharg" ClientInstanceName="idProgTauxCharg" Theme="Glass" Width="100%">
                                                </dx:ASPxProgressBar>

                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                </Items>
                            </dx:LayoutGroup>
                                        <dx:LayoutGroup Caption="IP Adresse" ColSpan="1" Width="100%">
                                            <Items>
                                                <dx:LayoutItem ShowCaption="False" Width="100%">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer>
                                                            <dx:ASPxLabel ID="txtAddress" ClientInstanceName="txtAddress" runat="server"></dx:ASPxLabel>
                                                        </dx:LayoutItemNestedControlContainer>
                                                    </LayoutItemNestedControlCollection>
                                                </dx:LayoutItem>

                                            </Items>
                                        </dx:LayoutGroup>
                                        <dx:LayoutGroup Caption="Temps de parcours" ColSpan="1" Width="100%">
                                            <Items>
                                                <dx:LayoutItem ShowCaption="False" Width="100%">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer>
                                                            <dx:ASPxTextBox ID="TxtRoundTrip" ClientInstanceName="TxtRoundTrip" runat="server" Width="100%" Theme="Glass"></dx:ASPxTextBox>
                                                        </dx:LayoutItemNestedControlContainer>

                                                    </LayoutItemNestedControlCollection>
                                                </dx:LayoutItem>
                                            </Items>
                                        </dx:LayoutGroup>
                                        <dx:LayoutGroup Caption="Temps de vivre" ColSpan="1" Width="100%">
                                            <Items>
                                                <dx:LayoutItem ShowCaption="False" Width="100%">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer>
                                                            <dx:ASPxTextBox ID="txtlive" ClientInstanceName="txtlive" runat="server" Width="100%" Theme="Glass"></dx:ASPxTextBox>

                                                        </dx:LayoutItemNestedControlContainer>
                                                    </LayoutItemNestedControlCollection>
                                                </dx:LayoutItem>

                                            </Items>
                                        </dx:LayoutGroup>
                                        <dx:LayoutGroup Caption="Ne fragmentez pas" ColSpan="1" Width="100%">
                                            <Items>
                                                <dx:LayoutItem ShowCaption="False" Width="100%">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer>
                                                            <dx:ASPxTextBox ID="txtfragment" ClientInstanceName="txtfragment" runat="server" Width="100%" Theme="Glass"></dx:ASPxTextBox>

                                                        </dx:LayoutItemNestedControlContainer>
                                                    </LayoutItemNestedControlCollection>
                                                </dx:LayoutItem>

                                            </Items>
                                        </dx:LayoutGroup>
                                        <dx:LayoutGroup Caption="Taille du tampon" ColSpan="1" Width="100%">
                                            <Items>
                                                <dx:LayoutItem ShowCaption="False" Width="100%">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer>
                                                            <dx:ASPxTextBox ID="txtsize" ClientInstanceName="txtsize" runat="server" Width="100%" Theme="Glass"></dx:ASPxTextBox>

                                                        </dx:LayoutItemNestedControlContainer>
                                                    </LayoutItemNestedControlCollection>
                                                </dx:LayoutItem>

                                            </Items>
                                        </dx:LayoutGroup>

                                        <dx:LayoutGroup ShowCaption="False" ColSpan="1" Width="100%">
                                            <Items>
                                                <dx:LayoutItem ShowCaption="False" Width="100%" NestedControlStyle-HorizontalAlign="Center">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer>
                                                            <dx:ASPxLabel ID="TxtResultat" ClientInstanceName="TxtResultat" Width="100%" Font-Bold="true" ForeColor="Red" runat="server"></dx:ASPxLabel>
                                                        </dx:LayoutItemNestedControlContainer>
                                                    </LayoutItemNestedControlCollection>
                                                </dx:LayoutItem>

                                            </Items>
                                        </dx:LayoutGroup>


                                    </Items>
                                </dx:ASPxFormLayout>
                                <table width="100%">
                                    <tr>
                                        <td height="20px"></td>
                                    </tr>
                                    <tr>
                                        <td width="50%">
                                            <dx:ASPxButton ID="ASPxButton7" runat="server" Text="Fermer" Width="100%" AutoPostBack="False"
                                                Theme="Glass">
                                                <ClientSideEvents Click="function(s, e) {
                                                              PopupPing.Hide(); 		
                                                               }"></ClientSideEvents>
                                            </dx:ASPxButton>
                                        </td>

                                    </tr>
                                </table>
                            </dx:PanelContent>

                        </PanelCollection>
                    </dx:ASPxCallbackPanel>
                </dx:PopupControlContentControl>
            </ContentCollection>
        </dx:ASPxPopupControl>
        <dx:ASPxPopupControl ID="PopupAlert" runat="server" HeaderText="Information" ClientInstanceName="PopupAlert"
    Width="400px" PopupHorizontalAlign="WindowCenter"
    PopupVerticalAlign="TopSides" Theme="Glass">
    <ContentCollection>
        <dx:PopupControlContentControl ID="PopupControlContentControl5" runat="server">



            <table width="100%">
                <tr>
                    <td align="center">

                        <dx:ASPxLabel ID="txterror" ClientInstanceName="txterror" runat="server" ForeColor="Maroon"></dx:ASPxLabel>

                    </td>


                </tr>
                <tr>

                    <td align="center">
                        <dx:ASPxButton ID="ASPxButton21" runat="server" Text="OK" Width="100%" AutoPostBack="False"
                            Theme="Glass">
                            <ClientSideEvents Click="function(s, e) {
                                                   PopupAlert.Hide(); 
                                                   
                                                   }"></ClientSideEvents>
                        </dx:ASPxButton>
                    </td>
                </tr>
            </table>



        </dx:PopupControlContentControl>
    </ContentCollection>
</dx:ASPxPopupControl>
        <dx:ASPxCallback ID="ProgCallback" runat="server" ClientInstanceName="ProgCallback" OnCallback="ProgCallback_Callback">
        </dx:ASPxCallback>

        <dx:ASPxCallback ID="cbkTimer" runat="server" ClientInstanceName="cbkTimer" OnCallback="cbkTimer_Callback">
            <ClientSideEvents CallbackComplete="function(s, e) { idProgTauxCharg.SetPosition(e.result); }" />
        </dx:ASPxCallback>

        <dx:ASPxTimer ID="czas" runat="server" ClientInstanceName="czas" Interval="100" Enabled="False">
            <ClientSideEvents Tick="function(s, e) {
	            cbkTimer.PerformCallback();}" />
        </dx:ASPxTimer>

    </form>

</body>
</html>
