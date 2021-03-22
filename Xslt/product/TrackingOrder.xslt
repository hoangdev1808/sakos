<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes" />

  <xsl:template match="/">
    <section class="user-page">
      <div class="user-order">
        <div class="order-detail">
          <div class="order-info">
            <div class="order-name">
              <xsl:text disable-output-escaping="yes">Mã đơn hàng:</xsl:text>
              <strong>
                <xsl:text disable-output-escaping="yes"> #</xsl:text>
                <xsl:value-of select="/OrderDetail/OrderCode"></xsl:value-of>
              </strong>
            </div>
            <div class="des order-date">
              <xsl:text disable-output-escaping="yes">Ngày mua: </xsl:text>
              <xsl:value-of select="/OrderDetail/CreatedDate"></xsl:value-of>
            </div> 
            <div class="des order-name">
              <xsl:text disable-output-escaping="yes">Tình trạng: </xsl:text>
               <strong>
                <xsl:value-of select="/OrderDetail/OrderStatus"></xsl:value-of>
              </strong>
            </div> 
          </div>
          <div class="order-list">
            <div class="item">
              <div class="order-item">
                <div class="row order-information-wrapper">
                  <div class="col-12 col-md-6 mt-2 mb-2">
                    <div class="order-information">
                      <div class="title">Thông tin đặt mua</div>
                      <ul>
                        <li class="name">
                          <strong>
                            <xsl:value-of select="/OrderDetail/BillingFirstName"></xsl:value-of>
                          </strong>
                        </li>
                        <li>
                          Địa chỉ: <xsl:value-of select="/OrderDetail/BillingAddress"></xsl:value-of>
                          <xsl:if test="/OrderDetail/BillingDistrict!=''">
                            <xsl:text>, </xsl:text>
                            <xsl:value-of select="/OrderDetail/BillingDistrict"></xsl:value-of>
                          </xsl:if>
                          <xsl:if test="/OrderDetail/BillingProvince!=''">
                            <xsl:text>, </xsl:text>
                            <xsl:value-of select="/OrderDetail/BillingProvince"></xsl:value-of>
                          </xsl:if>
                        </li>
                        <li>
                          Email: <xsl:value-of select="/OrderDetail/BillingEmail"></xsl:value-of>
                        </li>
                        <li>
                          Điện thoại: <xsl:value-of select="/OrderDetail/BillingPhone"></xsl:value-of>
                        </li>
                        <!-- <li>
                          Shipping method: <xsl:value-of select="/OrderDetail/ShippingMethod"></xsl:value-of>
                          <xsl:if test="/OrderDetail/TrackingFrameUrl!=''">
                            <a target="_blank" style="color:#2cbde5;font-weight:bold">
                              <xsl:attribute name="href">
                                <xsl:value-of select="/OrderDetail/TrackingFrameUrl"></xsl:value-of>
                              </xsl:attribute>
                              Schedule of orders
                            </a>
                          </xsl:if>
                          <xsl:if test="/OrderDetail/ShippingFee!=''">
                            <p>
                              Shipping fee: <xsl:value-of select="/OrderDetail/ShippingFee"></xsl:value-of>
                            </p>
                          </xsl:if>
                        </li> -->
                        <!-- <li>
                          Payment Method: <xsl:value-of select="/OrderDetail/PaymentMethod"></xsl:value-of>
                          <p class="payment-status">
                            Status: 
                            <xsl:value-of select="/OrderDetail/PaymentStatus"></xsl:value-of>
                          </p>
                          <xsl:choose>
                            <xsl:when test="/OrderDetail/AllowRepaid='true'">
                              <a class="userpanel-btn repaid-order-btn" href="#">Thanh toán lại</a>
                              <div class="popup-tragop">
                                <div class="bank-list">
                                  <div class="content clearfix">
                                    <h3 class="title">Select the payment method again</h3>
                                    <div class="cart-form clearfix">
                                      <xsl:apply-templates select="/OrderDetail/Payment"></xsl:apply-templates>
                                    </div>
                                  </div>
                                  <div class="btn-wrap clearfix">
                                    <a class="userpanel-btn btn-success repaid-button"
                                      onclick="AjaxCheckout.repaidorder(this);return false;" href="#">
                                      <xsl:attribute name="data-orderid">
                                        <xsl:value-of select="/OrderDetail/OrderId"></xsl:value-of>
                                      </xsl:attribute>
                                      Payment
                                    </a>
                                  </div>
                                </div>
                              </div>
                            </xsl:when>
                          </xsl:choose>
                        </li> -->
                      </ul>
                    </div>
                  </div>
                  <div class="col-12 col-md-6 mt-2 mb-2">
                    <div class="order-information">
                      <div class="title">Thông tin giao hàng</div>
                      <ul>
                        <li class="name">
                          <strong>
                            <xsl:choose>
                              <xsl:when test="/OrderDetail/ShippingFirstName != ''">
                                <xsl:value-of select="/OrderDetail/ShippingFirstName"></xsl:value-of>
                              </xsl:when>
                              <xsl:otherwise>
                                <xsl:value-of select="/OrderDetail/BillingFirstName"></xsl:value-of>
                              </xsl:otherwise>
                            </xsl:choose>
                          </strong>
                        </li>
                        <li>
                          Địa chỉ:
                          <xsl:choose>
                            <xsl:when test="/OrderDetail/ShippingAddress != ''">
                              <xsl:value-of select="/OrderDetail/ShippingAddress"></xsl:value-of>
                              <xsl:if test="/OrderDetail/ShippingDistrict!=''">
                                <xsl:text>, </xsl:text>
                                <xsl:value-of select="/OrderDetail/ShippingDistrict"></xsl:value-of>
                              </xsl:if>
                              <xsl:if test="/OrderDetail/ShippingProvince!=''">
                                <xsl:text>, </xsl:text>
                                <xsl:value-of select="/OrderDetail/ShippingProvince"></xsl:value-of>
                              </xsl:if>
                            </xsl:when>
                            <xsl:otherwise>
                              <xsl:value-of select="/OrderDetail/BillingAddress"></xsl:value-of>
                              <xsl:if test="/OrderDetail/BillingDistrict!=''">
                                <xsl:text>, </xsl:text>
                                <xsl:value-of select="/OrderDetail/BillingDistrict"></xsl:value-of>
                              </xsl:if>
                              <xsl:if test="/OrderDetail/BillingProvince!=''">
                                <xsl:text>, </xsl:text>
                                <xsl:value-of select="/OrderDetail/BillingProvince"></xsl:value-of>
                              </xsl:if>
                            </xsl:otherwise>
                          </xsl:choose>
                        </li>
                        <li>
                          Email:
                          <xsl:choose>
                            <xsl:when test="/OrderDetail/ShippingEmail != ''">
                              <xsl:value-of select="/OrderDetail/ShippingEmail"></xsl:value-of>
                            </xsl:when>
                            <xsl:otherwise>
                              <xsl:value-of select="/OrderDetail/BillingEmail"></xsl:value-of>
                            </xsl:otherwise>
                          </xsl:choose>
                        </li>
                        <li>
                          Điện thoại:
                          <xsl:choose>
                            <xsl:when test="/OrderDetail/ShippingPhone != ''">
                              <xsl:value-of select="/OrderDetail/ShippingPhone"></xsl:value-of>
                            </xsl:when>
                            <xsl:otherwise>
                              <xsl:value-of select="/OrderDetail/BillingPhone"></xsl:value-of>
                            </xsl:otherwise>
                          </xsl:choose>
                        </li>
                      </ul>
                    </div>
                  </div>
                  <xsl:if test="/OrderDetail/InvoiceCompanyTaxCode !=''">
                    <div class="col-12">
                      <h3>Billing information</h3>
                      <div class="address-col">
                        <p>
                          <span>Tax code: </span>
                          <xsl:value-of select="/OrderDetail/InvoiceCompanyTaxCode"></xsl:value-of>
                        </p>
                        <p>
                          <span>Company name: </span>
                          <xsl:value-of select="/OrderDetail/InvoiceCompanyName"></xsl:value-of>
                        </p>
                        <p>
                          <span>Address: </span>
                          <xsl:value-of select="/OrderDetail/InvoiceCompanyAddress"></xsl:value-of>
                        </p>
                      </div>
                    </div>
                  </xsl:if>
                </div>
                <div class="order-product">
                  <table>
                    <thead>
                      <tr>
                        <th class="text-left">Sản phẩm</th>
                        <th>Giá</th>
                        <th>Số lượng</th>
                        <th>Tổng cộng</th>
                      </tr>
                    </thead>
                    <tbody>
                      <xsl:apply-templates select="/OrderDetail/Product"></xsl:apply-templates>
                    </tbody>
                  </table>
                </div>
                <div class="order-total">
                  <table>
                    <tr class="group">
                      <td class="label">
                        <xsl:text>Tạm tính</xsl:text>
                      </td>
                      <td class="value">
                        <xsl:value-of select="/OrderDetail/OrderSubTotal"></xsl:value-of>
                      </td>
                    </tr>
                    <tr class="group">
                      <td class="label">
                        <xsl:text>Giảm giá</xsl:text>
                      </td>
                      <td class="value discount-total">
                        <xsl:value-of select="/OrderDetail/OrderDiscount"></xsl:value-of>
                      </td>
                    </tr>
                    <tr class="group">
                      <td class="label">
                        Phí giao hàng
                      </td>
                      <td class="value shipping-total">
                        <xsl:value-of select="/OrderDetail/ShippingFee"></xsl:value-of>
                      </td>
                    </tr>
                    <tr class="group">
                      <td class="label">
                        Phí thanh toán
                      </td>
                      <td class="value shipping-total">
                        <xsl:value-of select="/OrderDetail/PaymentFee"></xsl:value-of>
                      </td>
                    </tr>
                    <tr class="group">
                      <td class="label">
                        Tổng cộng
                      </td>
                      <td class="value total">
                        <xsl:value-of select="/OrderDetail/OrderTotal"></xsl:value-of>
                      </td>
                    </tr>
                    <xsl:if test="/OrderDetail/Link != ''">
                      <tr class="group ">
                        <td class="label">
                          VAT invoice for this order :
                        </td>
                        <td class="value">
                          <a>
                            <xsl:attribute name="href">
                              <xsl:value-of select="/OrderDetail/Link"></xsl:value-of>
                            </xsl:attribute>
                            Link
                          </a>
                        </td>
                      </tr>
                    </xsl:if>
                  </table>

                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
  </xsl:template>

  <xsl:template match="Product">
    <tr>
      <td>
        <a class="product">
          <xsl:attribute name="href">
            <xsl:value-of select="Url"></xsl:value-of>
          </xsl:attribute>
          <div class="img">
            <img>
            <xsl:attribute name="src">
              <xsl:value-of select="ImageUrl"></xsl:value-of>
            </xsl:attribute>
            <xsl:attribute name="alt">
              <xsl:value-of select="Title"></xsl:value-of>
            </xsl:attribute>
            </img>
          </div>
          <div class="caption">
            <xsl:value-of select="Title"></xsl:value-of>
          </div>
        </a>
      </td>
      <td style="white-space: nowrap;">
        <xsl:value-of select="Price"></xsl:value-of>
      </td>
      <td>
        <xsl:value-of select="Quantity"></xsl:value-of>
      </td>
      <td>
        <xsl:value-of select="ItemTotal"></xsl:value-of>
      </td>
    </tr>
    <!-- <a class="product">
      <xsl:attribute name="href">
        <xsl:value-of select="Url"></xsl:value-of>
      </xsl:attribute>
      <div class="img">
        <img>
        <xsl:attribute name="src">
          <xsl:value-of select="ImageUrl"></xsl:value-of>
        </xsl:attribute>
        <xsl:attribute name="alt">
          <xsl:value-of select="Title"></xsl:value-of>
        </xsl:attribute>
        </img>
      </div>
      <div class="caption">
        <div class="name">
          <xsl:value-of select="Title"></xsl:value-of>
          <xsl:if test="Code!=''">
            <div class="serial">
              Serial: <xsl:value-of select="Code"></xsl:value-of>
            </div>
          </xsl:if>
        </div>
        <div class="attribute">

          <xsl:apply-templates select="Attributes"></xsl:apply-templates>
        </div>
        <div class="amount">
          Quantity: <xsl:value-of select="Quantity"></xsl:value-of>
        </div>
        <div class="price">
          Total:
          <div class="new">
            <xsl:value-of select="ItemTotal"></xsl:value-of>
          </div>
        </div>
      </div>
    </a> -->
  </xsl:template>

  <xsl:template match="Payment">
    <div class="payment-method">
      <div class="select-group checkbox">
        <input type="radio" name="PaymentMethod">
        <xsl:attribute name="id">
          <xsl:value-of select="Id"></xsl:value-of>
        </xsl:attribute>
        <xsl:attribute name="value">
          <xsl:value-of select="Id"></xsl:value-of>
        </xsl:attribute>
        <xsl:if test="position()=1">
          <xsl:attribute name="checked">
            <xsl:text>checked</xsl:text>
          </xsl:attribute>
          <xsl:attribute name="value">
            <xsl:value-of select="Id"></xsl:value-of>
          </xsl:attribute>
        </xsl:if>
        </input>
        <label>
          <xsl:attribute name="for">
            <xsl:value-of select="Id"></xsl:value-of>
          </xsl:attribute>
          <div class="method-info">
            <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
          </div>
        </label>
      </div>
    </div>
  </xsl:template>
  <xsl:template match="Attributes">
    <xsl:if test="Options/Title != ''">
      <div class="size">
        <xsl:value-of select="Title"></xsl:value-of>
        <xsl:text>: </xsl:text>
        <xsl:apply-templates select="Options"></xsl:apply-templates>
      </div>
    </xsl:if>
  </xsl:template>
  <xsl:template match="Options">
    <xsl:value-of select="Title"></xsl:value-of>
  </xsl:template>
</xsl:stylesheet>