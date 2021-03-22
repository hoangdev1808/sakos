﻿<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes" />

  <xsl:template match="/ManufacturerDetail">
    <section class="product-section manufacturer-detail">
      <div class="container">
        <div class="product-list-wrap">
          <div class="product-list-title flex items-center pt-4">
            <div class="icon flex flex-center">
              <xsl:if test="ImageUrl!=''">
                <img class="lazyload" src="data:image/gif;base64,R0lGODlhAQABAAD/ACwAAAAAAQABAAACADs=">
                <xsl:attribute name="data-src">
                  <xsl:value-of select="ImageUrl"></xsl:value-of>
                </xsl:attribute>
                <xsl:attribute name="alt">
                  <xsl:value-of select="Title"></xsl:value-of>
                </xsl:attribute>
                </img>
              </xsl:if>
            </div>
            <h1 class="section-title text-blue ml-2">
              <xsl:value-of select="Title"></xsl:value-of>
            </h1>
          </div>
          <xsl:if test="Description != ''">
            <div class="product-list-desc">
              <div class="article-content">
                <xsl:value-of disable-output-escaping="yes" select="Description"></xsl:value-of>
              </div>
              <a href="javascript:;" class="view-more-desc">Xem thêm<i class="ri-arrow-down-s-fill"></i>
              </a>
            </div>

          </xsl:if>
          <div class="product-list-body">
            <div class="product-list">
              <div class="row row-2 row-md-4 row-lg-6 ajaxresponse">
                <xsl:apply-templates select="Product"></xsl:apply-templates>
              </div>
            </div>
          </div>
          <div class="product-list-more-desc">
            <div class="article-content">
              <xsl:value-of disable-output-escaping="yes" select="Description"></xsl:value-of>
            </div>
            <a href="javascript:;" class="view-more-desc"><span>Xem thêm</span><i class="ri-arrow-down-s-fill"></i></a>
          </div>
        </div>
      </div>
    </section>
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