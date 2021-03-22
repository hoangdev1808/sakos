<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes" />

  <xsl:template match="/">
    <div class="product-filter-wrap ">
      <div class="product-filter-heading hidden-desktop background-main text-white">
        <div class="flex items-center justify-between">
          <div class="filter-close">
            <em class="ri-close-line"></em>
          </div>
          <div class="filter-title flex items-center">
            <em class="ri-filter-fill"></em><strong>
              <xsl:value-of disable-output-escaping="yes" select="/ProductFilter/ModuleTitle"></xsl:value-of>
            </strong>
          </div>
          <div class="filter-reset"><a>
              <xsl:attribute name="href">
                <xsl:value-of select="/ProductFilter/UrlWithoutPrice" />
              </xsl:attribute>
              <xsl:attribute name="title">
                <xsl:value-of select="Title"></xsl:value-of>
              </xsl:attribute>
              <xsl:text disable-output-escaping="yes">Bỏ chọn</xsl:text>
            </a>
          </div>
        </div>
      </div>
      <!--Giá-->
      <div class="product-filter-item product-filter-price">
        <div>
          <xsl:attribute name="class">
            <xsl:text>product-filter-title flex items-center justify-between active</xsl:text>
            <xsl:if test="/ProductFilter/PriceMin!='' or /ProductFilter/PriceMax!=''">
              <xsl:text> active</xsl:text>
            </xsl:if>
          </xsl:attribute>
          <strong class="text">Giá</strong>
          <div class="arrow">
            <em class="ri-arrow-down-s-fill"></em>
          </div>
        </div>
        <div class="product-filter-body" style="display: block;">
          <xsl:if test="/ProductFilter/PriceMin!='' or /ProductFilter/PriceMax!=''">
            <xsl:attribute name="style">
              <xsl:text>display:block</xsl:text>
            </xsl:attribute>
          </xsl:if>
          <div class="price-price-slider price-slider" data-max="10000000">
            <xsl:attribute name="data-url-price">
              <xsl:value-of select="/ProductFilter/UrlWithPrice" />
            </xsl:attribute>
            <xsl:attribute name="data-url-noprice">
              <xsl:value-of select="/ProductFilter/UrlWithoutPrice" />
            </xsl:attribute>
            <xsl:attribute name="data-minprice">
              <xsl:value-of select="/ProductFilter/PriceMin" />
            </xsl:attribute>
            <xsl:attribute name="data-maxprice">
              <xsl:value-of select="/ProductFilter/PriceMax" />
            </xsl:attribute>
            <!--<xsl:attribute name="data-max">
              <xsl:value-of select="/ProductFilter/PriceMax"/>
            </xsl:attribute>-->
          </div>
          <div class="price-filter-text-wrap flex justify-between">
            <div class="price-filter-text-min-wrap">
              <span>Giá từ </span>
              <span class="price-filter-text-min">
                <xsl:value-of select="/ProductFilter/PriceMin" />
              </span>
            </div>
            <div class="price-filter-text-max">
              <xsl:value-of select="/ProductFilter/PriceMax" />
            </div>
          </div>
          <div class="price-filter-input-wrap">
            <input class="price-filter-input-min" type="text" placeholder="Giá từ" />
            <input class="price-filter-input-max" type="text" placeholder="Giá đến" />
            <a class="price-filter-input-btn" href="#">Đồng ý</a>
          </div>
        </div>
      </div>
      <div class=" ajaxfilterresponse" style="margin-top: 10px;">
        <!--Filter khác-->
        <xsl:apply-templates select="/ProductFilter/Group" />
      </div>
    </div>


  </xsl:template>

  <xsl:template match="Group">
    <xsl:choose>
      <xsl:when test="FieldType = '1'">
      </xsl:when>
      <xsl:otherwise>
        <!--Thương hiệu-->
        <div class="product-filter-item">
          <div>
            <xsl:attribute name="class">
              <xsl:text>product-filter-title flex items-center justify-between active</xsl:text>
              <xsl:if test="count(Option[IsActive='true'])>0">
                <xsl:text> active</xsl:text>
              </xsl:if>
            </xsl:attribute>
            <strong class="text">
              <xsl:value-of select="Title" />
            </strong>
            <div class="arrow">
              <em class="ri-arrow-down-s-fill"></em>
            </div>
          </div>
          <div class="product-filter-body">
            <xsl:if test="position() = 1">
              <xsl:attribute name="style">
                <xsl:text disable-output-escaping="yes">display: block;</xsl:text>
              </xsl:attribute>
            </xsl:if>
            <xsl:if test="count(Option[IsActive='true'])>0">
              <xsl:attribute name="style">
                <xsl:text>display:block</xsl:text>
              </xsl:attribute>
            </xsl:if>
            <div class="product-filter-group">
              <ul>
                <xsl:apply-templates select="Option" mode="SelectBox" />
              </ul>
            </div>
          </div>
        </div>

      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="Option" mode="Color">

  </xsl:template>

  <xsl:template match="Option" mode="SelectBox">
    <li>
      <a class="filter-link ajaxlink">
        <xsl:choose>
          <xsl:when test="IsActive='true'">
            <xsl:attribute name="class">
              <xsl:text>filter-link ajaxlink active</xsl:text>
            </xsl:attribute>
            <xsl:attribute name="href">
              <xsl:value-of select="ClearUrl" />
            </xsl:attribute>
          </xsl:when>
          <xsl:otherwise>
            <xsl:attribute name="href">
              <xsl:value-of select="Url" />
            </xsl:attribute>
          </xsl:otherwise>
        </xsl:choose>
        <div class="check-box"></div>
        <div class="text">
          <xsl:value-of select="Title" />
        </div>
      </a>
    </li>
  </xsl:template>

</xsl:stylesheet>