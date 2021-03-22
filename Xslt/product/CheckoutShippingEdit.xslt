<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes" />

  <xsl:template match="/">

    <xsl:if test="count(/CheckoutMethod/Shipping)>0">
      <div class="card-item checkout-shipping-wrap">
        <div class="card-heading">
          <div class="card-title">Phương thức vận chuyển</div>
        </div>
        <div class="card-body">
          <ul class="checkout-check-list">
            <xsl:apply-templates select="/CheckoutMethod/Shipping"></xsl:apply-templates>
          </ul>
        </div>
      </div>
    </xsl:if>
    <xsl:if test="count(/CheckoutMethod/Payment)>0">
      <div class="card-item checkout-payment-wrap">
        <div class="card-heading">
          <div class="card-title">Phương thức thanh toán</div>
        </div>
        <div class="card-body">
          <ul class="checkout-check-list">
            <xsl:apply-templates select="/CheckoutMethod/Payment"></xsl:apply-templates>
          </ul>
        </div>
      </div>
    </xsl:if>

    <div class="button-group cart-group-button">
      <a class="btn btn-white text-light-grey btn-back" href="#">
        <xsl:attribute name="href">
          <xsl:value-of select="/CheckoutMethod/CartUrl" />
        </xsl:attribute>
        <em class="ri-arrow-left-line"></em>
        <span class="ml-1">Tiếp tục mua hàng</span>
      </a>
      <a class="btn btn-next btn-gradient" href="#">
        <xsl:attribute name="onclick">
          <xsl:text>AjaxCheckout.saveorder(true, '</xsl:text>
          <xsl:value-of select="/CheckoutMethod/NextPageUrl" />
          <xsl:text>');return false;</xsl:text>
        </xsl:attribute>
        <span class="mr-1">Tiến hành thanh toán</span>
        <em class="ri-arrow-right-line"></em>
      </a>
    </div>
    
  </xsl:template>

  <xsl:template match="Shipping">
    <li class="checkout-check-item option">
      <label>
        <input type="radio" name="ShippingMethod" onchange="AjaxCheckout.ordercalculator()">
          <xsl:if test="position()=1">
            <xsl:attribute name="checked">
              <xsl:text>checked</xsl:text>
            </xsl:attribute>
          </xsl:if>
          <xsl:attribute name="value">
            <xsl:value-of select="Id"></xsl:value-of>
          </xsl:attribute>
          <xsl:attribute name="provider">
            <xsl:value-of select="ShippingProvider"></xsl:value-of>
          </xsl:attribute>
        </input>
        <span class="fake-radio"></span>
        <div class="content">
          <div class="text">
            <xsl:value-of select="Title"></xsl:value-of>
          </div>
          <!--<xsl:if test="Description!=''">
            <div class="des">
              <xsl:value-of select="Description" disable-output-escaping="yes"></xsl:value-of>
            </div>
          </xsl:if>-->
          <xsl:if test="ShippingProvider = '16' ">
            <div class="services">
              <select name="ShippingService" onchange="AjaxCheckout.ordercalculator()">
                <xsl:apply-templates select="Service"/>
              </select>
            </div>
          </xsl:if>
        </div>
      </label>
    </li>
  </xsl:template>

  <xsl:template match="Payment">
    <li class="checkout-check-item">
      <label>
        <input type="radio" name="PaymentMethod" onchange="AjaxCheckout.ordercalculator()">
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
          </xsl:if>
        </input>
        <span class="fake-radio"></span>
        <div class="content">
          <xsl:value-of disable-output-escaping="yes" select="Description"></xsl:value-of>
          <!-- <div class="img">
            
          </div>
          <div class="text-wrap">
            <div class="text">
              <xsl:value-of select="Title"></xsl:value-of>
            </div>
          </div> -->
        </div>
      </label>
    </li>
  </xsl:template>

</xsl:stylesheet>