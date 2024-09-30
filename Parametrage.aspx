<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Parametrage.aspx.cs" Inherits="Parametrage" %>

<%@ Register Assembly="DevExpress.Web.ASPxTreeList.v20.1, Version=20.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxTreeList" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v20.1, Version=20.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <dx:ASPxFormLayout ID="FormLayoutTypeProjet" ClientInstanceName="FormLayoutTypeProjet" runat="server" ColCount="6" Width="100%">
            <Items>
                <dx:LayoutGroup ShowCaption="False" Border-BorderColor="Transparent" Width="33%" ColSpan="3">
                    <Items>
                        <dx:LayoutGroup Caption="Phase du projet" Width="100%" ColSpan="1">
                            <Items>
                                <dx:LayoutItem Caption="Type" ShowCaption="False" ColSpan="1">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer>
                                            <dx:ASPxGridView ID="GridPhaseProjt" ClientInstanceName="GridPhaseProjt" DataSourceID="SqlDataPhaseProjt"
                                                KeyFieldName="id" Width="100%" Theme="Glass" runat="server">

                                                <Columns>
                                                    <dx:GridViewCommandColumn ButtonType="Image" Caption=" " Width="30px" ShowSelectCheckbox="false" VisibleIndex="0"
                                                        ShowEditButton="false"
                                                        ShowUpdateButton="true"
                                                        ShowDeleteButton="true"
                                                        ShowCancelButton="true">

                                                        <HeaderTemplate>
                                                            <dx:ASPxButton HorizontalAlign="Center" runat="server" Text=" " RenderMode="Link" AutoPostBack="false">
                                                                <Image Url="Image/add_large.png" Width="15px"></Image>
                                                                <ClientSideEvents Click="function(s,e){ GridPhaseProjt.AddNewRow();  }" />
                                                            </dx:ASPxButton>

                                                        </HeaderTemplate>

                                                    </dx:GridViewCommandColumn>
                                                    <dx:GridViewDataTextColumn FieldName="id" Visible="false" VisibleIndex="1">
                                                    </dx:GridViewDataTextColumn>

                                                    <dx:GridViewDataTextColumn FieldName="description" Caption="Description" Width="100%" VisibleIndex="3">
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                                <SettingsEditing Mode="Batch" />
                                                <SettingsBehavior ConfirmDelete="True" />
                                                <SettingsCommandButton>
                                                    <EditButton>
                                                        <Image Url="Image/edit.gif" />
                                                    </EditButton>
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
                                                    ShowTitlePanel="true" VerticalScrollableHeight="120" VerticalScrollBarMode="Visible"></Settings>


                                            </dx:ASPxGridView>

                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                            </Items>
                        </dx:LayoutGroup>
                        <dx:LayoutGroup Caption="Client" Width="100%" ColSpan="1">
                            <Items>
                                <dx:LayoutItem Caption="Type" ShowCaption="False" ColSpan="1" HorizontalAlign="Right">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer>
                                            <dx:ASPxGridView ID="GridClient" ClientInstanceName="GridClient" DataSourceID="SqlDataClient"
                                                KeyFieldName="id" Width="100%" Theme="Glass" runat="server">

                                                <Columns>
                                                    <dx:GridViewCommandColumn ButtonType="Image" Caption=" " Width="30px" ShowSelectCheckbox="false" VisibleIndex="0"
                                                        ShowEditButton="false"
                                                        ShowUpdateButton="true"
                                                        ShowDeleteButton="true"
                                                        ShowCancelButton="true">

                                                        <HeaderTemplate>
                                                            <dx:ASPxButton HorizontalAlign="Center" runat="server" Text=" " RenderMode="Link" AutoPostBack="false">
                                                                <Image Url="Image/add_large.png" Width="15px"></Image>
                                                                <ClientSideEvents Click="function(s,e){ GridClient.AddNewRow();  }" />
                                                            </dx:ASPxButton>

                                                        </HeaderTemplate>

                                                    </dx:GridViewCommandColumn>
                                                    <dx:GridViewDataTextColumn FieldName="id" Visible="false" VisibleIndex="1">
                                                    </dx:GridViewDataTextColumn>

                                                    <dx:GridViewDataTextColumn FieldName="Client" Caption="Description" Width="100%" VisibleIndex="3">
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                                <SettingsEditing Mode="Batch" />
                                                <SettingsBehavior ConfirmDelete="True" />
                                                <SettingsCommandButton>
                                                    <EditButton>
                                                        <Image Url="Image/edit.gif" />
                                                    </EditButton>
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
                                                    ShowTitlePanel="true" VerticalScrollableHeight="120" VerticalScrollBarMode="Visible"></Settings>
                                            </dx:ASPxGridView>

                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>

                            </Items>
                        </dx:LayoutGroup>
                    </Items>
                </dx:LayoutGroup>

                <dx:LayoutGroup Caption="Type du projet" Width="33%" ColSpan="3">
                    <Items>
                        <dx:LayoutItem Caption="Type" ShowCaption="False" ColSpan="1">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer>
                                    <dx:ASPxTreeList ID="TreeCategories" runat="server" ClientInstanceName="TreeCategories"
                                        Width="100%" Theme="Glass" AutoGenerateColumns="False" DataSourceID="SqlDataTypeProjet" KeyFieldName="id" ParentFieldName="id_Parent">
                                        <Columns>
                                            <dx:TreeListTextColumn FieldName="Type" Width="450px" VisibleIndex="0"></dx:TreeListTextColumn>
                                           
                                            <dx:TreeListCommandColumn Width="70px" ShowNewButtonInHeader="true" Caption=" ">
                                                <NewButton Visible="true" Text=" ">
                                                    <Image Url="Image/add_large.png" Width="15px" Height="15px" />
                                                </NewButton>
                                                <DeleteButton Visible="True" Text=" ">
                                                    <Image Url="Image/delete.gif" Width="15px" Height="15px" />
                                                </DeleteButton>
                                            </dx:TreeListCommandColumn>



                                        </Columns>

                                        <SettingsBehavior AllowHeaderFilter="true" />
                                        <Settings ShowHeaderFilterButton="false" VerticalScrollBarMode="Visible" ScrollableHeight="455" />
                                        <SettingsBehavior AutoExpandAllNodes="true" />

                                        <SettingsExport EnableClientSideExportAPI="True" />

                                        <SettingsSearchPanel Visible="false" />
                                        <Settings GridLines="Both" />
                                        <SettingsEditing Mode="Batch" AllowRecursiveDelete="true" />
                                        <Toolbars>
                                            <dx:TreeListToolbar ItemAlign="Right" Position="Bottom">
                                                <Items>
                                                    <dx:TreeListToolbarItem Command="Update">
                                                        <Image Url="Image/save.gif" />
                                                    </dx:TreeListToolbarItem>
                                                    <dx:TreeListToolbarItem Command="Cancel">
                                                        <Image Url="Image/cancel.gif" />
                                                    </dx:TreeListToolbarItem>

                                                </Items>
                                            </dx:TreeListToolbar>


                                        </Toolbars>

                                        <SettingsPager AlwaysShowPager="True" Mode="ShowPager" PageSize="200">
                                            <PageSizeItemSettings ShowAllItem="True" Visible="True"></PageSizeItemSettings>
                                        </SettingsPager>

                                    </dx:ASPxTreeList>


                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                    </Items>
                </dx:LayoutGroup>

                <dx:LayoutGroup Caption="Classe du projet" Width="33%" ColSpan="2">
                    <Items>
                        <dx:LayoutItem Caption="Type" ShowCaption="False" ColSpan="1" HorizontalAlign="Right">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer>
                                    <dx:ASPxGridView ID="GridClass" ClientInstanceName="GridClass" DataSourceID="SqlDataClass"
                                        KeyFieldName="id" Width="100%" Theme="Glass" runat="server">

                                        <Columns>
                                            <dx:GridViewCommandColumn ButtonType="Image" Caption=" " Width="30px" ShowSelectCheckbox="false" VisibleIndex="0"
                                                ShowEditButton="false"
                                                ShowUpdateButton="true"
                                                ShowDeleteButton="true"
                                                ShowCancelButton="true">

                                                <HeaderTemplate>
                                                    <dx:ASPxButton HorizontalAlign="Center" runat="server" Text=" " RenderMode="Link" AutoPostBack="false">
                                                        <Image Url="Image/add_large.png" Width="15px"></Image>
                                                        <ClientSideEvents Click="function(s,e){ GridClass.AddNewRow();  }" />
                                                    </dx:ASPxButton>

                                                </HeaderTemplate>
                                            </dx:GridViewCommandColumn>
                                            <dx:GridViewDataTextColumn FieldName="id" Visible="false" VisibleIndex="1">
                                            </dx:GridViewDataTextColumn>

                                            <dx:GridViewDataTextColumn FieldName="Classe" Caption="Description" Width="100%" VisibleIndex="3">
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                        <SettingsEditing Mode="Batch" />
                                        <SettingsBehavior ConfirmDelete="True" />
                                        <SettingsCommandButton>
                                            <EditButton>
                                                <Image Url="Image/edit.gif" />
                                            </EditButton>
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
                                            ShowTitlePanel="true" VerticalScrollableHeight="200" VerticalScrollBarMode="Visible"></Settings>
                                    </dx:ASPxGridView>

                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>



                    </Items>
                </dx:LayoutGroup>
                <dx:LayoutGroup Caption="Type révision" Width="33%" ColSpan="2">
                    <Items>
                        <dx:LayoutItem Caption="Type" ShowCaption="False" ColSpan="1" HorizontalAlign="Right">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer>
                                    <dx:ASPxGridView ID="GridRevision" ClientInstanceName="GridRevision" DataSourceID="SqlDataTypeRevision"
                                        KeyFieldName="id" Width="100%" Theme="Glass" runat="server">

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
                                            <dx:GridViewDataTextColumn FieldName="id" Visible="false" VisibleIndex="1">
                                            </dx:GridViewDataTextColumn>

                                            <dx:GridViewDataTextColumn FieldName="TypeClasse" VisibleIndex="2" Width="100px">
                                            </dx:GridViewDataTextColumn>

                                            <dx:GridViewDataTextColumn FieldName="Description" Caption="Description" VisibleIndex="3">
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                        <SettingsEditing Mode="Batch" />
                                        <SettingsBehavior ConfirmDelete="True" />
                                        <SettingsCommandButton>
                                            <EditButton>
                                                <Image Url="Image/edit.gif" />
                                            </EditButton>
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
                                            ShowTitlePanel="true" VerticalScrollableHeight="200" VerticalScrollBarMode="Visible"></Settings>
                                    </dx:ASPxGridView>

                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>



                    </Items>
                </dx:LayoutGroup>
                <dx:LayoutGroup Caption="Discipline" Width="33%" ColSpan="2">
                    <Items>
                        <dx:LayoutItem Caption="Type" ShowCaption="False" ColSpan="1" HorizontalAlign="Right">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer>
                                    <dx:ASPxGridView ID="GridDiscipline" ClientInstanceName="GridDiscipline" DataSourceID="SqlDataDiscipline"
                                        KeyFieldName="id" Width="100%" Theme="Glass" runat="server">

                                        <Columns>
                                            <dx:GridViewCommandColumn ButtonType="Image" Caption=" " Width="30px" ShowSelectCheckbox="false" VisibleIndex="0"
                                                ShowEditButton="false"
                                                ShowUpdateButton="true"
                                                ShowDeleteButton="true"
                                                ShowCancelButton="true">

                                                <HeaderTemplate>
                                                    <dx:ASPxButton HorizontalAlign="Center" runat="server" Text=" " RenderMode="Link" AutoPostBack="false">
                                                        <Image Url="Image/add_large.png" Width="15px"></Image>
                                                        <ClientSideEvents Click="function(s,e){ GridDiscipline.AddNewRow();  }" />
                                                    </dx:ASPxButton>

                                                </HeaderTemplate>
                                            </dx:GridViewCommandColumn>

                                            <dx:GridViewDataTextColumn FieldName="Abreviation" Visible="true" Width="100px" VisibleIndex="1">
                                            </dx:GridViewDataTextColumn>

                                            <dx:GridViewDataTextColumn FieldName="Designation" Caption="Description" VisibleIndex="2">
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                        <SettingsEditing Mode="Batch" />
                                        <SettingsBehavior ConfirmDelete="True" />
                                        <SettingsCommandButton>
                                            <EditButton>
                                                <Image Url="Image/edit.gif" />
                                            </EditButton>
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
                                            ShowTitlePanel="true" VerticalScrollableHeight="200" VerticalScrollBarMode="Visible"></Settings>
                                    </dx:ASPxGridView>


                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>



                    </Items>
                </dx:LayoutGroup>
            </Items>
        </dx:ASPxFormLayout>



        <asp:SqlDataSource ID="SqlDataPhaseProjt" runat="server" ConnectionString="<%$ ConnectionStrings:PointeuseConnectionString %>"
            SelectCommand="GetPhaseProjt" SelectCommandType="StoredProcedure" DeleteCommand="DELETE FROM Phase WHERE (id = @id)" InsertCommand="INSERT INTO Phase(description) VALUES (@description)" UpdateCommand="UPDATE Phase SET description = @description WHERE (id = @id)">
            <DeleteParameters>
                <asp:Parameter Name="id" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="description" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="description" />
                <asp:Parameter Name="id" />
            </UpdateParameters>
        </asp:SqlDataSource>

        <asp:SqlDataSource ID="SqlDataTypeProjet" runat="server" ConnectionString="<%$ ConnectionStrings:PointeuseConnectionString %>"
            SelectCommand="GetTypeProjet" SelectCommandType="StoredProcedure" DeleteCommand="DELETE FROM Type WHERE (id = @id)" InsertCommand="INSERT INTO Type(id_Parent, Type) VALUES (@id_Parent, @Type)" UpdateCommand="UPDATE Type SET Type = @Type, id_Parent = @id_Parent WHERE (id = @id)">
            <DeleteParameters>
                <asp:Parameter Name="id" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="id_Parent" />
                <asp:Parameter Name="Type" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Type" />
                <asp:Parameter Name="id_Parent" />
                <asp:Parameter Name="id" />
            </UpdateParameters>
        </asp:SqlDataSource>

        <asp:SqlDataSource ID="SqlDataClient" runat="server" ConnectionString="<%$ ConnectionStrings:PointeuseConnectionString %>"
            SelectCommand="GetClient" SelectCommandType="StoredProcedure" DeleteCommand="DELETE FROM Client WHERE (id = @id)" InsertCommand="INSERT INTO Client(Client) VALUES (@Client)" UpdateCommand="UPDATE Client SET Client = @Client WHERE (id = @id)">
            <DeleteParameters>
                <asp:Parameter Name="id" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Client" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Client" />
                <asp:Parameter Name="id" />
            </UpdateParameters>
        </asp:SqlDataSource>

        <asp:SqlDataSource ID="SqlDataClass" runat="server" ConnectionString="<%$ ConnectionStrings:PointeuseConnectionString %>"
            SelectCommand="GetClass" SelectCommandType="StoredProcedure" DeleteCommand="DELETE FROM Classe WHERE (id = @id)" InsertCommand="INSERT INTO Classe(Classe) VALUES (@Classe)" UpdateCommand="UPDATE Classe SET Classe = @Classe WHERE (id = @id)">
            <DeleteParameters>
                <asp:Parameter Name="id" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Classe" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Classe" />
                <asp:Parameter Name="id" />
            </UpdateParameters>
        </asp:SqlDataSource>

        <asp:SqlDataSource ID="SqlDataTypeRevision" runat="server" ConnectionString="<%$ ConnectionStrings:PointeuseConnectionString %>"
            SelectCommand="GetTypeRevision" SelectCommandType="StoredProcedure"
            InsertCommand="InsertTypeRevision" InsertCommandType="StoredProcedure"
            UpdateCommand="UpdatetypeRevision" UpdateCommandType="StoredProcedure"
            DeleteCommand="DeleteTypeRevision" DeleteCommandType="StoredProcedure">
            <DeleteParameters>
                <asp:Parameter Name="id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="TypeClasse" Type="String" />
                <asp:Parameter Name="Description" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="TypeClasse" Type="String" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="id" Type="Int32" />
            </UpdateParameters>


        </asp:SqlDataSource>

        <asp:SqlDataSource ID="SqlDataDiscipline" runat="server" ConnectionString="<%$ ConnectionStrings:PointeuseConnectionString %>"
            SelectCommand="GetDiscipline" SelectCommandType="StoredProcedure"
            InsertCommand="InsertDiscipline" InsertCommandType="StoredProcedure"
            DeleteCommand="deleteDiscipline" DeleteCommandType="StoredProcedure"
            UpdateCommand="updateDiscipline" UpdateCommandType="StoredProcedure">
            <InsertParameters>
                <asp:Parameter Name="Abreviation" />
                <asp:Parameter Name="Designation" />
            </InsertParameters>
            <DeleteParameters>
                <asp:Parameter Name="id" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="Abreviation" />
                <asp:Parameter Name="Designation" />
                <asp:Parameter Name="id" />
            </UpdateParameters>
        </asp:SqlDataSource>

    </form>
</body>
</html>
