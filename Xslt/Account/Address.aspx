﻿<%@ Page Language="c#" MaintainScrollPositionOnPostback="true" CodeBehind="Address.aspx.cs"
    MasterPageFile="~/App_MasterPages/layout.Master" AutoEventWireup="false" Inherits="CanhCam.Web.AccountUI.AddressPage" %>


<%@ Register TagPrefix="Site" TagName="AccountMenu" Src="~/Account/AccountMenu.ascx" %>
<asp:Content ContentPlaceHolderID="mainContent" ID="MPContent" runat="server">
  <div class="container profile-container">
  <div class="user-sidemenu">
    <div class="row flex flex-wrap">
      <Site:AccountMenu ID="accountMenu" runat="server" />
      <div class="col-lg-9">
        <div class="user-page clearfix">
          <div class="info-heading">
            <h1 class="postname">
              <asp:Literal ID="litHeading" Text="Sổ địa chỉ" runat="server" />
            </h1>
            <asp:HyperLink ID="lnkInsert" runat="server" CssClass="btn-addaddr link" Text="Thêm địa chỉ"></asp:HyperLink>
          </div>
          <div class="row flex flex-wrap">
            <div class="col-lg-12">
              <section class="address-info clearfix">
                <div class="address-list">
                  <asp:Repeater ID="rptAddress" runat="server">
                    <ItemTemplate>
                      <div class="address-col">
                        <div class="address default clearfix">
                          <div class="type">
                            <%# CanhCam.Web.AccountUI.AccountHelper.GetIsDefaultText(Convert.ToBoolean(Eval("IsDefault")))%>
                          </div>
                          <div class="name"><%#Eval("FirstName")%></div>
                          <div class="addr-detail">
                            <ul>
                              <li>Địa chỉ:
                                <%# FormatAddress(Eval("Address").ToString(), Eval("ProvinceGuid").ToString(), Eval("DistrictGuid").ToString(), Eval("WardGuid").ToString())%>
                              </li>
                              <li>Điện thoại: <%#Eval("Phone")%></li>
                            </ul>
                          </div>
                          <div class="wrapper">
                          
                          
                          <a href='<%# SiteRoot + "/Account/AddressEdit.aspx?id=" + Eval("AddressId").ToString() %>'
                            class="btn-editaddr">Sửa</a>
                          <asp:HiddenField ID="hdfIsDefault" Value='<%# Convert.ToBoolean(Eval("IsDefault")) %>'
                            runat="server" />
                          <asp:LinkButton ID="hplDeleteAddress" Visible="false" CommandName="DeleteAddress"
                            CommandArgument='<%#Eval("AddressId")%>' CssClass="btn-deleteaddr" Text="Xóa"
                            runat="server" />
                          </div>
                        </div>
                      </div>
                    </ItemTemplate>
                  </asp:Repeater>
                </div>
              </section>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  </div>
</asp:Content>
