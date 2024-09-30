<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ListeDocumentRevs.aspx.cs" Inherits="ListeDocumentRevs" %>

<%@ Register Assembly="DevExpress.Web.v20.1, Version=20.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>




    <form id="form1" runat="server">
    <div>
       

        <dx:ASPxGridView ID="GridDCR" ClientInstanceName="GridDCR" runat="server" 
        AutoGenerateColumns="False" KeyFieldName="id" DataSourceID="SqlDCR" Width="100%" EnableTheming="True">
            <ClientSideEvents Init="function(s, e) {
	                                                    var popup = window.parent;
	                                                    popup.window['GridDCR'] = GridDCR;}
" />
            <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
            <SettingsSearchPanel Visible="True" />

        <Columns>
            
            <dx:GridViewCommandColumn SelectAllCheckboxMode="Page" ShowClearFilterButton="True" ShowSelectCheckbox="True" Width="50px" VisibleIndex="0">
                  <FooterCellStyle BackColor="#F5F5DC" ForeColor="Maroon" HorizontalAlign="Center" Font-Bold="true" />
            </dx:GridViewCommandColumn>
            
            <dx:GridViewDataTextColumn FieldName="id" Visible="false" VisibleIndex="1">
            </dx:GridViewDataTextColumn>
            
            <dx:GridViewDataTextColumn Caption="Discpline" FieldName="Discpline" ShowInCustomizationForm="True" GroupIndex="0" SortIndex="0" SortOrder="Ascending"  VisibleIndex="3" Width="50px">
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
            <dx:GridViewDataTextColumn FieldName="TitreDocument" Caption="Titre du document"  Width="50%" VisibleIndex="1">
                <HeaderStyle HorizontalAlign="Center" BackColor="DodgerBlue"></HeaderStyle>
                <GroupFooterCellStyle ForeColor="Brown" HorizontalAlign="Right" Font-Bold="true"></GroupFooterCellStyle>
                <FooterCellStyle BackColor="#F5F5DC" HorizontalAlign="Right" Font-Bold="true" />
                <EditFormSettings Visible="true"></EditFormSettings>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Reference"  Caption="Affaire"  Width="90px" Visible="true" VisibleIndex="2" PropertiesTextEdit-Height="5px">
                  <FooterCellStyle BackColor="#F5F5DC" ForeColor="Maroon" HorizontalAlign="Center" Font-Bold="true" />
            </dx:GridViewDataTextColumn>
            
            <dx:GridViewDataTextColumn FieldName="CodeDocument" Caption="Réf EPPM" Width="200px" VisibleIndex="3">
                  <FooterCellStyle BackColor="#F5F5DC" ForeColor="Maroon" HorizontalAlign="Center" Font-Bold="true" />
            </dx:GridViewDataTextColumn>
            
            

            <dx:GridViewDataTextColumn FieldName="Rev" Caption="Rev" Width="80px" VisibleIndex="4">
                <HeaderStyle HorizontalAlign="Center" BackColor="Violet"></HeaderStyle>
                <FooterCellStyle BackColor="#F5F5DC" ForeColor="Maroon" HorizontalAlign="Center" Font-Bold="true" />
                <GroupFooterCellStyle ForeColor="Black" HorizontalAlign="Right" Font-Bold="true"></GroupFooterCellStyle>
                <EditFormSettings Visible="true"></EditFormSettings>
            </dx:GridViewDataTextColumn>
            
              <dx:GridViewDataProgressBarColumn FieldName="Avancement" VisibleIndex="5">
                <HeaderStyle HorizontalAlign="Center" BackColor="Violet"></HeaderStyle>
                <FooterCellStyle BackColor="#F5F5DC" HorizontalAlign="Right" Font-Bold="true" />
                <EditFormSettings Visible="true"></EditFormSettings>
            </dx:GridViewDataProgressBarColumn>
            
              
            
             <dx:GridViewBandColumn Caption="Période Planifiée" Name="ListeDoc" VisibleIndex="6" HeaderStyle-BackColor="Orange">
                <Columns>

                     <dx:GridViewDataDateColumn Caption="Emission" FieldName="EmissionPlanifiee" Width="170px" VisibleIndex="9" PropertiesDateEdit-DisplayFormatString="dd-MM-yyyy">
                <PropertiesDateEdit DisplayFormatString="dd-MM-yyyy">
                </PropertiesDateEdit>
                <Settings GroupInterval="Date"></Settings>
                  <FooterCellStyle BackColor="#F5F5DC" ForeColor="Maroon" HorizontalAlign="Center" Font-Bold="true" />
            </dx:GridViewDataDateColumn>
            
               <dx:GridViewDataDateColumn Caption="Approbation" FieldName="ApprobationPanifiee" Width="170px" VisibleIndex="10"  PropertiesDateEdit-DisplayFormatString="dd-MM-yyyy">
                <PropertiesDateEdit DisplayFormatString="dd-MM-yyyy">
                </PropertiesDateEdit>
                <Settings GroupInterval="Date"></Settings>
                  <FooterCellStyle BackColor="#F5F5DC" ForeColor="Maroon" HorizontalAlign="Center" Font-Bold="true" />
            </dx:GridViewDataDateColumn>
                    

                </Columns>
                <HeaderStyle HorizontalAlign="Center" />
               
            </dx:GridViewBandColumn>
            
            <dx:GridViewBandColumn Caption="Selon client" Name="ListeDoc" VisibleIndex="7" HeaderStyle-BackColor="YellowGreen">
                <Columns>

                     <dx:GridViewDataProgressBarColumn FieldName="Poids"  Caption="Poids" Width="160px" >
                <FooterCellStyle BackColor="#F5F5DC" HorizontalAlign="Right" Font-Bold="true" />
                <EditFormSettings Visible="true"></EditFormSettings>
            </dx:GridViewDataProgressBarColumn>

             <dx:GridViewDataProgressBarColumn FieldName="Ponderation"  Caption="Ponderation" Width="200px">
                <FooterCellStyle BackColor="#F5F5DC" HorizontalAlign="Right" Font-Bold="true" />
                <EditFormSettings Visible="true"></EditFormSettings>
            </dx:GridViewDataProgressBarColumn>
                    

                </Columns>
                <HeaderStyle HorizontalAlign="Center" />
            </dx:GridViewBandColumn>

             
            
          
            <dx:GridViewBandColumn Caption="Budge horaire Consommées" Name="ListeDoc" VisibleIndex="8"  HeaderStyle-BackColor="Tomato">
                <Columns>
                    <dx:GridViewDataTextColumn FieldName="NBHProjeteur" Caption="Projeteurs" Width="100px">
                          <FooterCellStyle BackColor="#F5F5DC" ForeColor="Maroon" HorizontalAlign="Center" Font-Bold="true" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="NBHIngenieur" Caption="Ingénieurs" Width="100px">
                          <FooterCellStyle BackColor="#F5F5DC" ForeColor="Maroon" HorizontalAlign="Center" Font-Bold="true" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Total" Caption="Total(h)" Width="80px">
                        
                        <CellStyle BackColor="#dedcdc"></CellStyle>
                        <HeaderStyle ForeColor="Maroon" />
                        <FooterCellStyle BackColor="#F5F5DC" ForeColor="Maroon" HorizontalAlign="Center" Font-Bold="true" />


                    </dx:GridViewDataTextColumn>
                </Columns>
                <HeaderStyle HorizontalAlign="Center" />
            </dx:GridViewBandColumn>
          
        
         <dx:GridViewDataTextColumn FieldName="Etat" Visible="false" VisibleIndex="9">
            </dx:GridViewDataTextColumn>
           
            
            
        </Columns>


        
        
        <SettingsPager PageSize="100" EnableAdaptivity="true">
            <PageSizeItemSettings Visible="true" Position="Right" ShowAllItem="true">
            </PageSizeItemSettings>
        </SettingsPager>
        <SettingsBehavior AutoExpandAllGroups="True" AllowFocusedRow="true"  />

        <Settings ShowFooter="True" ShowGroupFooter="VisibleIfExpanded" 
            VerticalScrollableHeight="450" VerticalScrollBarMode="Visible"
            HorizontalScrollBarMode="Visible" ShowFilterRow="True"></Settings>
          
    </dx:ASPxGridView>

        
         <asp:SqlDataSource ID="SqlDCR" runat="server"
        ConnectionString="<%$ ConnectionStrings:PointeuseConnectionString %>"
        SelectCommand="GetDocumentEtude" SelectCommandType="StoredProcedure"></asp:SqlDataSource>

    </div>
      <dx:ASPxPopupControl ID="PupImportPDoc" ClientInstanceName="PupImportPDoc" runat="server" Theme="Glass" Modal="true" ShowShadow="true" 
    PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" AllowDragging="True" Width="800px" >
              <ClientSideEvents Init="function(s, e) {
	                                                    var popup = window.parent;
	                                                    popup.window['PupImportPDoc'] = PupImportPDoc;}
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
                              <%--  <asp:FileUpload ID="FileUpload1" runat="server" />  
  
<asp:Button ID="btnUpload" runat="server" Text="Upload" OnClick="btnUpload_Click" />  
  
<br />  
  
<asp:Label ID="Label1" runat="server" Text="Has Header ?" />  
  
<asp:RadioButtonList ID="rbHDR" runat="server">  
  
    <asp:ListItem Text="Yes" Value="Yes" Selected="True">  
  
    </asp:ListItem>  
  
    <asp:ListItem Text="No" Value="No"></asp:ListItem>  
  
</asp:RadioButtonList>  
  
<asp:GridView ID="GridView1" runat="server" OnPageIndexChanging="PageIndexChanging" AllowPaging="true">  
  
</asp:GridView> --%> 
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
    </form>

