<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
    <xsl:if test="count(ProductList/Product)>0">
      <div class="product-deal-wrapper">
        <div class="product-deal-heading">
          <h2 class="section-title text-main">Deal online mỗi ngày</h2>
          <a class="view-more hidden-desktop text-blue">
            <xsl:attribute name="href">
              <xsl:text>#</xsl:text>
            </xsl:attribute>
            Xem thêm
          </a>
        </div>
        <div class="product-deal-slider">
          <div class="swiper-container">
            <div class="swiper-wrapper">
              <xsl:apply-templates select="ProductList/Product"></xsl:apply-templates>
            </div>
            <div class="swiper-navigation">
              <div class="swiper-btn swiper-btn-prev"><em class="ri-arrow-left-s-line"></em></div>
              <div class="swiper-btn swiper-btn-next"><em class="ri-arrow-right-s-line"></em></div>
            </div>
          </div>
        </div>
        <!-- <div class="product-deal-deadline flex justify-between">
          <div class="deal-deadline-text">
            <strong>Deal sẽ kết thúc trong vòng:</strong>
          </div>
          <div class="deal-deadline-countdown" data-countdown="30/9/2020 20:00:00"></div>
        </div> -->
        <xsl:if test="ProductList/Product[1]/DealEndDay!=''">
          <div class="product-deal-deadline flex justify-between">
            <div class="deal-deadline-text">
              <strong>Deal sẽ kết thúc trong vòng:</strong>
            </div>
            <div class="deal-deadline-countdown">
              <xsl:attribute name="data-countdown">
                <xsl:value-of select="ProductList/Product[1]/DealEndDay"></xsl:value-of>
                <xsl:text>/</xsl:text>
                <xsl:value-of select="ProductList/Product[1]/DealEndMonth"></xsl:value-of>
                <xsl:text>/</xsl:text>
                <xsl:value-of select="ProductList/Product[1]/DealEndYear"></xsl:value-of>
                <xsl:text> </xsl:text>
                <xsl:value-of select="ProductList/Product[1]/DealEndHour"></xsl:value-of>
                <xsl:text>:</xsl:text>
                <xsl:value-of select="ProductList/Product[1]/DealEndMinute"></xsl:value-of>
                <xsl:text>:</xsl:text>
                <xsl:value-of select="ProductList/Product[1]/DealEndSecond"></xsl:value-of>
              </xsl:attribute>
            </div>
          </div>
        </xsl:if>
        <div class="product-deal-pagination"></div>
      </div>
    </xsl:if>
    <xsl:if test="count(ProductList/Product) =0">
  		<div class="product-deal-wrapper">  
	        <div class="product-deal-image">
	        	<img src="/Data/Sites/1/media/deal_banner.jpg"/> 
	        </div>
    	</div>
    </xsl:if>
  </xsl:template>

  <xsl:template match="Product">
    <div class="swiper-slide">
      <a class="product-deal-item">
        <xsl:attribute name="href">
          <xsl:value-of select="Url"></xsl:value-of>
        </xsl:attribute>
        <div class="product-deal-item-top flex justify-between items-center">
          <div class="product-deal-item-price">
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
          <!--<div class="product-deal-item-vnpay">
            <strong>Giá VnPay: </strong>
            <strong class="vnpay-price">
              54.585 đ
            </strong>
          </div>-->
        </div>
        <div class="product-deal-item-name leading-snug">
          <xsl:value-of select="Title"></xsl:value-of>
        </div>
        <div class="product-deal-item-image">
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
          <xsl:if test="DiscountPercentage!=''">
            <div class="product-deal-coupon">
              <xsl:text>Giảm </xsl:text>
              <xsl:value-of select="DiscountPercentage"></xsl:value-of>
              <xsl:text>%</xsl:text>
            </div>
          </xsl:if>
          <xsl:if test="ShowOption>0">
            <div class="product-deal-icon">
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
        </div>
        <div class="product-deal-progress">
          <div class="deal-progress-bar-text hidden-mobile flex justify-between">
            <xsl:if test="DealRemainingQty!=''">
              <div class="left-deal">
                <span>Còn lại: </span>
                <strong>
                  <xsl:value-of select="DealRemainingQty"></xsl:value-of>
                </strong>
              </div>
            </xsl:if>
            <xsl:if test="DealSoldQty!=''">
              <div class="sold-deal">
                <span>Đã bán: </span>
                <strong>
                  <xsl:value-of select="DealSoldQty"></xsl:value-of>
                </strong>
              </div>
            </xsl:if>
          </div>
          <div class="deal-progress-bar">
            <xsl:if test="DealSoldQty!=''">
              <div class="deal-progress-bar-text hidden-desktop">
                Đã bán: <xsl:value-of select="DealSoldQty"></xsl:value-of>
              </div>
              <xsl:if test="DealSoldPercent!=''">
                <div class="deal-progress-bar-inner">
                  <xsl:attribute name="style">
                    <xsl:text>width:</xsl:text>
                    <xsl:value-of select="DealSoldPercent"></xsl:value-of>
                    <xsl:text>%</xsl:text>
                  </xsl:attribute>
                </div>
              </xsl:if>
            </xsl:if>
          </div>
        </div>
      </a>
     
      
    </div>
  </xsl:template>

  <xsl:template match="Promotion">
    <xsl:if test="floor(Option div 1) mod 2 = 1">
      <xsl:if test="DiscountPrice!=''">
        <div class="product-deal-item-vnpay">
          <strong>Giá VnPay: </strong>
          <strong class="vnpay-price">
            <xsl:value-of select="DiscountPrice"></xsl:value-of>
          </strong>
        </div>
      </xsl:if>
    </xsl:if>
  </xsl:template>

</xsl:stylesheet>