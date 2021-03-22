<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes" />

  <xsl:template match="/">
    <xsl:apply-templates select="/ZoneList/Zone"></xsl:apply-templates>
  </xsl:template>

  <xsl:template match="Zone">
    <div class="product-category-list-wrap">
      <div class="container">
        <div class="product-category-list ajax-response-parent">
          <div class="product-category-list-heading flex justify-between items-center">
            <div class="category-title flex items-center">
              <div class="icon flex flex-center">
                <xsl:if test="ImageUrl!=''">
                  <img class="lazyload">
                  <xsl:attribute name="src">
                    <xsl:text>data:image/gif;base64,R0lGODlhAQABAAD/ACwAAAAAAQABAAACADs=</xsl:text>
                  </xsl:attribute>
                  <xsl:attribute name="data-src">
                    <xsl:value-of select="ImageUrl"></xsl:value-of>
                  </xsl:attribute>
                  <xsl:attribute name="alt">
                    <xsl:value-of select="Title"></xsl:value-of>
                  </xsl:attribute>
                  </img>
                </xsl:if>
              </div>
              <div class="section-title text-blue ml-2">
                <a>
                  <xsl:attribute name="href">
                    <xsl:value-of select="Url"></xsl:value-of>
                  </xsl:attribute>
                  <xsl:attribute name="target">
                    <xsl:value-of select="Target"></xsl:value-of>
                  </xsl:attribute>
                  <xsl:value-of select="Title"></xsl:value-of>
                </a>
              </div>
            </div>
            <div class="category-tab hidden-mobile">
              <ul class="flex">
                <li class="active">
                  <a class="flex flex-center ajax-product-link" data-type="1" href="#">
                    <xsl:attribute name="data-zoneId">
                      <xsl:value-of select="ZoneId"></xsl:value-of>
                    </xsl:attribute>
                    <!--<xsl:attribute name="href">
                      <xsl:value-of select="Url"></xsl:value-of>
                    </xsl:attribute>
                    <xsl:attribute name="target">
                      <xsl:value-of select="Target"></xsl:value-of>
                    </xsl:attribute>-->
                    Tất cả
                  </a>
                </li>
                <li>
                  <a class="flex flex-center ajax-product-link" data-type="2" href="#">
                    <xsl:attribute name="data-zoneId">
                      <xsl:value-of select="ZoneId"></xsl:value-of>
                    </xsl:attribute>
                    Sản phẩm mới
                  </a>
                </li>
                <li>
                  <a class="flex flex-center ajax-product-link" data-type="0" href="#">
                    <xsl:attribute name="data-zoneId">
                      <xsl:value-of select="ZoneId"></xsl:value-of>
                    </xsl:attribute>
                    Sản phẩm khuyến mãi
                  </a>
                </li>
                <li>
                  <a class="flex flex-center ajax-product-link" data-type="3" href="#">
                    <xsl:attribute name="data-zoneId">
                      <xsl:value-of select="ZoneId"></xsl:value-of>
                    </xsl:attribute>
                    Sản phẩm ưa thích
                  </a>
                </li>
              </ul>
            </div>
          </div>
          <div class="product-category-list-body">
            <!--Tab body-->
            <div class="product-category-tab show" style="display:block">
              <div class="product-list">
                <div class="row row-2 row-sm-3 row-md-4 row-lg-5 ajax-response">
                  <xsl:apply-templates select="Product" />
                </div>
              </div>
            </div>
            <!--<div class="product-category-tab">
              <div class="product-list">
                <div class="row row-lg-5">
                  <xsl:apply-templates select="Product"/>
                </div>
              </div>
            </div>
            <div class="product-category-tab">
              <div class="product-list">
                <div class="row row-lg-5">
                  <xsl:apply-templates select="Product"/>
                </div>
              </div>
            </div>
            <div class="product-category-tab">
              <div class="product-list">
                <div class="row row-lg-5">
                  <xsl:apply-templates select="Product"/>
                </div>
              </div>
            </div>-->
          </div>
          <!-- <a class="flex flex-center view-more-mobile hidden-desktop" href="#">
            <xsl:attribute name="href">
              <xsl:value-of select="Url"></xsl:value-of>
            </xsl:attribute>
            <xsl:attribute name="target">
              <xsl:value-of select="Target"></xsl:value-of>
            </xsl:attribute>
            <strong class="text-blue">Xem thêm sản phẩm ></strong>
          </a> -->
        </div>
      </div>
    </div>

  </xsl:template>

  <xsl:template match="Product">
    <div class="w-100">
      <div class="product-item">
        <a class="product-img">
          <xsl:attribute name="href">
            <xsl:value-of select="Url" />
          </xsl:attribute>
          <img class="lazyload" src="data:image/gif;base64,R0lGODlhAQABAAD/ACwAAAAAAQABAAACADs=">
          <xsl:attribute name="data-src">
            <xsl:value-of select="ImageUrl"></xsl:value-of>
          </xsl:attribute>
          <xsl:attribute name="alt">
            <xsl:value-of select="Title"></xsl:value-of>
          </xsl:attribute>
          </img>
          <xsl:if test="DiscountPercentage!=''">
            <div class="product-deal-coupon">
              <xsl:text>Giảm </xsl:text>
              <xsl:value-of select="DiscountPercentage"></xsl:value-of>
              <xsl:text>%</xsl:text>
            </div>
          </xsl:if>
          <xsl:if test="ShowOption>0">
            <div class="product-icon">
              <ul>
                <xsl:if test="floor(ShowOption div 1) mod 2 = 1">
                  <li>
                    <span class="icon-brown">new</span>
                  </li>
                </xsl:if>
                <xsl:if test="floor(ShowOption div 2) mod 2 = 1">
                  <li>
                    <span class="icon-blue">Mua 1 tặng 1</span>
                  </li>
                </xsl:if>
                <xsl:if test="GiftDescription2!=''">
                  <li class="gift-icon">
                    <xsl:value-of disable-output-escaping="yes" select="GiftDescription2"></xsl:value-of>
                  </li>
                </xsl:if>
              </ul>
            </div>
          </xsl:if>
        </a>
        <h3 class="product-name leading-snug">
          <a>
            <xsl:attribute name="href">
              <xsl:value-of select="Url" />
            </xsl:attribute>
            <xsl:value-of select="Title"></xsl:value-of>
          </a>
          <xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
        </h3>
        <div class="product-price flex items-end">
          <strong class="price text-main">
            <xsl:value-of disable-output-escaping="yes" select="Price"></xsl:value-of>
          </strong>
          <xsl:if test="OldPrice != ''">
            <del class="old-price">
              <xsl:value-of disable-output-escaping="yes" select="OldPrice"></xsl:value-of>
            </del>
          </xsl:if>
        </div>
        <xsl:apply-templates select="Promotion"></xsl:apply-templates>
        <xsl:if test="StockQuantity > 0">
          <a class="btn-buy background-main" href="#" onclick="AjaxCart.addproducttocart_catalog(this);return false;">
            <xsl:attribute name="data-productid">
              <xsl:value-of select="ProductId" />
            </xsl:attribute>
            <img src="/Data/Sites/1/skins/default/img/cart-white.png" alt="Buy" />
          </a>
        </xsl:if>
        <xsl:if test="StockQuantity = 0">
          <a class="btn-buy background-dark-grey" href="javascript:;">
            Hết hàng
          </a>
        </xsl:if>
      </div>
    </div>
  </xsl:template>

  <xsl:template match="Promotion">
    <xsl:if test="floor(Option div 1) mod 2 = 1">
      <xsl:if test="DiscountPrice!=''">
        <div class="product-vnpay-price">
          <strong>Giá VnPay: </strong>
          <strong class="text-main">
            <xsl:value-of select="DiscountPrice"></xsl:value-of>
          </strong>
        </div>
      </xsl:if>
    </xsl:if>
  </xsl:template>

</xsl:stylesheet>