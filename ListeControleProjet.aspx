<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ListeControleProjet.aspx.cs" Inherits="ListeControleProjet" %>


<%@ Register Assembly="DevExpress.Web.v20.1, Version=20.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxHtmlEditor.v20.1, Version=20.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxHtmlEditor" TagPrefix="dx" %>



<form id="form1" runat="server">

    <style type="text/css">
    .label_td {
        background-color: #D3E9F0;
        border: 1px solid #4986A2;
        padding-left: 2px;
        width: 200px;
        font-family: Tahoma;
        font-size: 12px;
    }

    .labelDon_td {
        background-color: #BCF6AA;
        border: 1px solid #005700;
        padding-left: 2px;
        width: 100px;
        font-family: Tahoma;
        font-size: 12px;
    }
</style>

    <style>
.tooltip {
  position: relative;
  display: inline-block;
  border-bottom: 1px dotted black;
}

.tooltip .tooltiptext {
  visibility: hidden;
  width: 220px;
  background-color: #D3E9F0;
        border: 1px solid #4986A2;
        padding-left: 2px;
   
  color:black;
  text-align: center;
  border-radius: 6px;
  padding: 5px 0;

  /* Position the tooltip */
  position: absolute;
  z-index: 1;
}

.tooltip:hover .tooltiptext {
  visibility: visible;
}
</style>
    <div>
        <div class="tooltip">
                          <asp:Image runat="server" Visible="true" ImageUrl="~/Images/help-icn.png" ID="image2"></asp:Image>
                        
                              <span  class="tooltiptext">
                                    <asp:Table ID="Table1" runat="server" Width="200px">




                                        <asp:TableRow ID="TableRow1" runat="server">
                                            <asp:TableCell ID="TableCell1" Font-Size="10" runat="server" ColumnSpan="2" Font-Bold="True">
                                               
                                                a
                                            </asp:TableCell>
                                        </asp:TableRow>
                                        <asp:TableRow ID="TableRow2" runat="server">
                                            <asp:TableCell ID="TableCell2" runat="server" Width="10px">
                                                <asp:Label runat="server" Text=" " ID="Label2"></asp:Label>


                                            </asp:TableCell>
                                            <asp:TableCell ID="TableCell3" runat="server"></asp:TableCell>
                                        </asp:TableRow>
                                        <asp:TableRow ID="TableRow3" runat="server">
                                            <asp:TableCell ID="TableCell4" runat="server" BackColor="LightGreen" Width="30px">
                                            </asp:TableCell>
                                            <asp:TableCell ID="TableCell5" runat="server" Font-Size="8" Font-Bold="True" BackColor="LightYellow">
                                                                       
                                                f
                                            </asp:TableCell>
                                        </asp:TableRow>
                                        <asp:TableRow ID="TableRow4" runat="server">
                                            <asp:TableCell ID="TableCell6" runat="server" BackColor="Yellow" Font-Bold="True" Width="30px">
                                            </asp:TableCell>
                                            <asp:TableCell ID="TableCell7" runat="server" Font-Size="8" Font-Bold="True" BackColor="LightYellow">
                                                                       
                                                g
                                            </asp:TableCell>
                                        </asp:TableRow>
                                        <asp:TableRow ID="TableRow6" runat="server">
                                            <asp:TableCell ID="TableCell10" runat="server" BackColor="Orange" Width="30px">

                                            </asp:TableCell>
                                            <asp:TableCell ID="TableCell11" runat="server" Font-Size="8" Font-Bold="True" BackColor="LightYellow">
                                                                        
                                               t
                                            </asp:TableCell>
                                        </asp:TableRow>
                                        <asp:TableRow ID="TableRow7" runat="server">
                                            <asp:TableCell ID="TableCell12" runat="server" Width="30px" BackColor="Tomato">

                                            </asp:TableCell>
                                            <asp:TableCell ID="TableCell13" runat="server" Font-Size="8" Font-Bold="True" BackColor="LightYellow">
                                              t
                                            </asp:TableCell>
                                        </asp:TableRow>




                                    </asp:Table>
                                </span>


                                      </div>
        <dx:ASPxGridView ID="GridControleQualiteProj" ClientInstanceName="GridControleQualiteProj" runat="server"
            AutoGenerateColumns="False" KeyFieldName="ID" DataSourceID="SqlControleQualiteProj" Width="100%" EnableTheming="True">

            <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
            <SettingsSearchPanel Visible="True" />

            <Columns>
                <dx:GridViewCommandColumn SelectAllCheckboxMode="Page" ShowClearFilterButton="True" ShowSelectCheckbox="True" Width="60px" VisibleIndex="0">
                    <FooterCellStyle BackColor="#F5F5DC" ForeColor="Maroon" HorizontalAlign="Center" Font-Bold="true" />
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="ID" Caption="Item" Width="45px" Visible="true" VisibleIndex="1">
                    <FooterCellStyle BackColor="#F5F5DC" HorizontalAlign="Right" Font-Bold="true" />
                </dx:GridViewDataTextColumn>

                <dx:GridViewDataTextColumn Caption="Discpline" FieldName="Discpline" ShowInCustomizationForm="True" GroupIndex="0" SortIndex="0" SortOrder="Ascending" VisibleIndex="3" Width="60px">
                    <EditFormSettings Visible="false" />
                    <FooterCellStyle BackColor="#F5F5DC" HorizontalAlign="Right" Font-Bold="true" />
                    <HeaderStyle HorizontalAlign="Center" BackColor="DodgerBlue"></HeaderStyle>
                    <GroupRowTemplate>
                        <table>
                            <tr>
                                <td style="color: #3300FF; font-style: Arial; font-size: 60px;">
                                    <dx:ASPxLabel ID="lblgrp" runat="server" Font-Bold="true" Text='<%# Eval("Discpline")%>'></dx:ASPxLabel>
                                </td>
                            </tr>
                        </table>
                    </GroupRowTemplate>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Designation" Caption="Designation" Width="600px" VisibleIndex="2">
                    <HeaderStyle HorizontalAlign="Center" BackColor="DodgerBlue"></HeaderStyle>
                    <GroupFooterCellStyle ForeColor="Brown" HorizontalAlign="Right" Font-Bold="true"></GroupFooterCellStyle>
                    <FooterCellStyle BackColor="#F5F5DC" HorizontalAlign="Right" Font-Bold="true" />
                    <EditFormSettings Visible="true"></EditFormSettings>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Reference" Caption="Affaire" Width="90px" Visible="false" VisibleIndex="3" PropertiesTextEdit-Height="5px">
                    <FooterCellStyle BackColor="#F5F5DC" ForeColor="Maroon" HorizontalAlign="Center" Font-Bold="true" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CodeDocument" Caption="N° Documents EPPM" Width="200px" VisibleIndex="4">
                    <HeaderStyle BackColor="LightSalmon" />
                    <FooterCellStyle BackColor="#F5F5DC" ForeColor="Maroon" HorizontalAlign="Center" Font-Bold="true" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="RQEP" Caption="RQEP" Width="60px" VisibleIndex="5">
                    <HeaderStyle BackColor="LightSalmon" />
                    <FooterCellStyle BackColor="#F5F5DC" ForeColor="Maroon" HorizontalAlign="Center" Font-Bold="true" />
                    <GroupFooterCellStyle ForeColor="Black" HorizontalAlign="Right" Font-Bold="true"></GroupFooterCellStyle>
                    <EditFormSettings Visible="true"></EditFormSettings>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="DPCPE" VisibleIndex="6" Width="70px" Caption="DP/CPE">
                    <HeaderStyle BackColor="LightSalmon" />
                    <FooterCellStyle BackColor="#F5F5DC" HorizontalAlign="Right" Font-Bold="true" />
                    <EditFormSettings Visible="true"></EditFormSettings>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Design Coord"  FieldName="DesignCoord"  Width="110px" VisibleIndex="7">
                    <HeaderStyle BackColor="LightSalmon" />
                    <FooterCellStyle BackColor="#F5F5DC" HorizontalAlign="Right" Font-Bold="true" />
                    <EditFormSettings Visible="true"></EditFormSettings>
                </dx:GridViewDataTextColumn>
                 <dx:GridViewDataTextColumn  Caption=" " Width="20px" Visible="true" VisibleIndex="7">
                     <FooterCellStyle BackColor="#F5F5DC" HorizontalAlign="Right" Font-Bold="true" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewBandColumn Caption="Ingénieur / Projeteur" Name="ListeDoc" VisibleIndex="8" HeaderStyle-BackColor="Tomato">
                    <Columns>
                        <dx:GridViewDataTextColumn Caption="PC" FieldName="PC" Width="60px">

                            <FooterCellStyle BackColor="#F5F5DC" ForeColor="Maroon" HorizontalAlign="Center" Font-Bold="true" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="EL" Caption="EL" Width="60px">
                            <FooterCellStyle BackColor="#F5F5DC" HorizontalAlign="Right" Font-Bold="true" />
                            <EditFormSettings Visible="true"></EditFormSettings>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="INS" Caption="INS" Width="60px">
                            <FooterCellStyle BackColor="#F5F5DC" HorizontalAlign="Right" Font-Bold="true" />
                            <EditFormSettings Visible="true"></EditFormSettings>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="MEPP" Caption="ME/PP" Width="60px">
                            <FooterCellStyle BackColor="#F5F5DC" HorizontalAlign="Right" Font-Bold="true" />
                            <EditFormSettings Visible="true"></EditFormSettings>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="CV" Caption="CV" Width="60px">
                            <FooterCellStyle BackColor="#F5F5DC" HorizontalAlign="Right" Font-Bold="true" />
                            <EditFormSettings Visible="true"></EditFormSettings>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="SF" Caption="SF" Width="60px">
                            <FooterCellStyle BackColor="#F5F5DC" HorizontalAlign="Right" Font-Bold="true" />
                            <EditFormSettings Visible="true"></EditFormSettings>
                        </dx:GridViewDataTextColumn>
                    </Columns>
                    <HeaderStyle HorizontalAlign="Center" />

                </dx:GridViewBandColumn>
                 <dx:GridViewDataTextColumn  Caption=" " Width="20px" Visible="true" VisibleIndex="8">
                     <FooterCellStyle BackColor="#F5F5DC" HorizontalAlign="Right" Font-Bold="true" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewBandColumn Caption="Ingénieur Senior / Projeteur Senior" Name="ListeDoc" VisibleIndex="9" HeaderStyle-BackColor="Orange">
                    <Columns>
                        <dx:GridViewDataTextColumn FieldName="ISPC" Caption="PC" Width="60px">
                            <FooterCellStyle BackColor="#F5F5DC" HorizontalAlign="Right" Font-Bold="true" />
                            <EditFormSettings Visible="true"></EditFormSettings>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="ISELPRJS" Caption="EL" Width="60px">
                            <FooterCellStyle BackColor="#F5F5DC" HorizontalAlign="Right" Font-Bold="true" />
                            <EditFormSettings Visible="true"></EditFormSettings>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="ISINSPRJS" Caption="INS" Width="60px">
                            <FooterCellStyle BackColor="#F5F5DC" HorizontalAlign="Right" Font-Bold="true" />
                            <EditFormSettings Visible="true"></EditFormSettings>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="ISMEPPPRJS" Caption="ME/PP" Width="60px">
                            <FooterCellStyle BackColor="#F5F5DC" HorizontalAlign="Right" Font-Bold="true" />
                            <EditFormSettings Visible="true"></EditFormSettings>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="ISCVPRJS" Caption="CV" Width="60px">
                            <FooterCellStyle BackColor="#F5F5DC" HorizontalAlign="Right" Font-Bold="true" />
                            <EditFormSettings Visible="true"></EditFormSettings>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="ISSFPRJS" Caption="SF" Width="60px">
                            <FooterCellStyle BackColor="#F5F5DC" HorizontalAlign="Right" Font-Bold="true" />
                            <EditFormSettings Visible="true"></EditFormSettings>
                        </dx:GridViewDataTextColumn>
                    </Columns>
                    <HeaderStyle HorizontalAlign="Center" />

                </dx:GridViewBandColumn>
                 <dx:GridViewDataTextColumn  Caption=" " Width="20px" Visible="true" VisibleIndex="9">
                     <FooterCellStyle BackColor="#F5F5DC" HorizontalAlign="Right" Font-Bold="true" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewBandColumn Caption="Project Specialist leader" Name="ListeDoc" VisibleIndex="10" HeaderStyle-BackColor="YellowGreen">
                    <Columns>
                        <dx:GridViewDataTextColumn FieldName="PSLPC" Caption="PC" Width="60px">
                            <FooterCellStyle BackColor="#F5F5DC" HorizontalAlign="Right" Font-Bold="true" />
                            <EditFormSettings Visible="true"></EditFormSettings>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="PSLEL" Caption="EL" Width="60px">
                            <FooterCellStyle BackColor="#F5F5DC" HorizontalAlign="Right" Font-Bold="true" />
                            <EditFormSettings Visible="true"></EditFormSettings>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="PSLIN" Caption="INS" Width="60px">
                            <FooterCellStyle BackColor="#F5F5DC" HorizontalAlign="Right" Font-Bold="true" />
                            <EditFormSettings Visible="true"></EditFormSettings>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="PSLMEPP" Caption="ME/PP" Width="60px">
                            <FooterCellStyle BackColor="#F5F5DC" HorizontalAlign="Right" Font-Bold="true" />
                            <EditFormSettings Visible="true"></EditFormSettings>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="PSLCV" Caption="CV" Width="60px">
                            <FooterCellStyle BackColor="#F5F5DC" HorizontalAlign="Right" Font-Bold="true" />
                            <EditFormSettings Visible="true"></EditFormSettings>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="PSLSF" Caption="SF" Width="60px">
                            <FooterCellStyle BackColor="#F5F5DC" HorizontalAlign="Right" Font-Bold="true" />
                            <EditFormSettings Visible="true"></EditFormSettings>
                        </dx:GridViewDataTextColumn>
                    </Columns>
                    <HeaderStyle HorizontalAlign="Center" />
                </dx:GridViewBandColumn>
                 <dx:GridViewDataTextColumn  Caption=" " Width="20px" Visible="true" VisibleIndex="10">
                     <FooterCellStyle BackColor="#F5F5DC" HorizontalAlign="Right" Font-Bold="true" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CLIENT" Caption="Client" Width="70px" VisibleIndex="11" >
                    <HeaderStyle BackColor="Aqua" />
                    <FooterCellStyle BackColor="#F5F5DC" HorizontalAlign="Right" Font-Bold="true" />
                    <EditFormSettings Visible="true"></EditFormSettings>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Observation" Caption="Observation" Width="400px" VisibleIndex="12" >
                    <HeaderStyle BackColor="Aqua" />
                    <FooterCellStyle BackColor="#F5F5DC" HorizontalAlign="Right" Font-Bold="true" />
                    <EditFormSettings Visible="true"></EditFormSettings>
                </dx:GridViewDataTextColumn>


                

            </Columns>

            <SettingsPager PageSize="100" EnableAdaptivity="true">
                <PageSizeItemSettings Visible="true" Position="Right" ShowAllItem="true">
                </PageSizeItemSettings>
            </SettingsPager>
            <SettingsBehavior AutoExpandAllGroups="True" AllowFocusedRow="true" />

            <Settings ShowFooter="True" ShowGroupFooter="VisibleIfExpanded"
                VerticalScrollableHeight="450" VerticalScrollBarMode="Visible"
                HorizontalScrollBarMode="Visible" ShowFilterRow="True">
            </Settings>

        </dx:ASPxGridView>


        <asp:sqldatasource id="SqlControleQualiteProj" runat="server"
            connectionstring="<%$ ConnectionStrings:PointeuseConnectionString %>"
            selectcommand="GetControleQualite" selectcommandtype="StoredProcedure">
        </asp:sqldatasource>

           <dx:ASPxPopupControl ID="PupImportQualite" ClientInstanceName="PupImportQualite" runat="server" Theme="Glass" Modal="true" ShowShadow="true" 
    PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" AllowDragging="True" Width="600px">
              <ClientSideEvents Init="function(s, e) {
	                                                    var popup = window.parent;
	                                                    popup.window['PupImportQualite'] = PupImportQualite;}
" />
    <HeaderStyle>
        <Paddings PaddingLeft="10px" PaddingRight="6px" PaddingTop="1px" />
    </HeaderStyle>
    <ContentCollection>
        <dx:PopupControlContentControl ID="PopupControlContentControl1" runat="server">
            <div>
               
                <table style="width: 100%;">
                
                    <tr style="text-align: center;">
                        <td align="center" colspan="7">
                            <div>
                               
                                <table>
                                    <tr>
                                        <td colspan="4">
                                            <br />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:FileUpload ID="FileUpload1" runat="server" />
                                        </td>
                                        <td>
                                            <asp:ImageButton ID="B_ImportPCQ" runat="server" ImageUrl="~/image/save.gif" Visible="False"  OnClick="B_ImportPCQP_Click"  />
                                        </td>
                                        <td>
                                            <asp:ImageButton ID="B_UploadPCQP" runat="server" ImageUrl="~/image/action_up.gif" OnClick="B_UploadPCQP_Click"  />
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                    </tr>
                                </table>
                                <br>
                          </br>
                            </div>
                          
                        </td>
                    </tr>
                </table>

                 <table style="width: 100%; text-align: Left">
                    <tr>
                        <td>
                            <div runat="server" id="lblMessage" style="font-size: 14px;color:Red;">
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        </dx:PopupControlContentControl>
    </ContentCollection>
</dx:ASPxPopupControl>

    </div>

</form>
