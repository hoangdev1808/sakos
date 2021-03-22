<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
    <div class="product-category dropdown">
      <div class="product-category-toggle flex items-center" data-url="/danh-muc-san-pham">
        <em class="ri-align-left"></em>
        <strong>Danh mục sản phẩm</strong>
        <em class="ri-arrow-drop-down-fill"></em>
      </div>
      <div class="dropdown-content product-category-dropdown">
        <div class="product-category-list">
          <ul>
            <xsl:apply-templates select="/ZoneList/Zone"></xsl:apply-templates>
          </ul>
        </div>
      </div>
    </div>
  </xsl:template>

  <xsl:template match="Zone">
    <li>
      <a class="product-category-link flex items-center justify-between">
        <xsl:if test="IsActive='true'">
          <xsl:attribute name="class">
            <xsl:text>product-category-link flex items-center justify-between active</xsl:text>
          </xsl:attribute>
        </xsl:if>
        <xsl:attribute name="href">
          <xsl:value-of select="Url"></xsl:value-of>
        </xsl:attribute>
        <xsl:attribute name="target">
          <xsl:value-of select="Target"></xsl:value-of>
        </xsl:attribute>
        <div class="text flex items-center">
          <div class="icon">
            <img class="lazyload">
              <xsl:attribute name="data-src">
                <xsl:value-of select="ImageUrl"></xsl:value-of>
              </xsl:attribute>
              <xsl:attribute name="data-src-small">
                <xsl:value-of select="SecondImageUrl"></xsl:value-of>
              </xsl:attribute>
              <xsl:attribute name="data-src-medium">
                <xsl:value-of select="SecondImageUrl"></xsl:value-of>
              </xsl:attribute>
              <xsl:attribute name="alt">
                <xsl:value-of select="Title"></xsl:value-of>
              </xsl:attribute>
              <xsl:attribute name="src">
                <xsl:text>data:image/gif;base64,R0lGODlhAQABAAD/ACwAAAAAAQABAAACADs=</xsl:text>
              </xsl:attribute>
            </img>
          </div>
          <span>
            <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
          </span>
        </div>
        <xsl:if test="count(Zone)>0">
          <div class="arrow">
            <em class="ri-arrow-right-s-line"></em>
          </div>
        </xsl:if>
      </a>
      <xsl:if test="count(Zone)>0">
        <div class="product-category-subnav-container">
          <div class="product-category-subnav-row">
            <div class="product-category-subnav-groups">
              <xsl:apply-templates select="Zone" mode="Child"></xsl:apply-templates>
            </div>
            <div class="product-category-brand">
              <!--<ul>
              <li>
                <a href="#">
                  <img class="lazyload lazyloaded" src="./img/cate/brand.png" />
                </a>
              </li>
            </ul>-->
            </div>
          </div>
        </div>
      </xsl:if>
    </li>
  </xsl:template>

  <xsl:template match="Zone" mode="Child">
    <div class="product-category-subnav">
      <div class="product-category-lv-2">
        <a>
          <xsl:attribute name="href">
            <xsl:value-of select="Url"></xsl:value-of>
          </xsl:attribute>
          <xsl:attribute name="target">
            <xsl:value-of select="Target"></xsl:value-of>
          </xsl:attribute>
          <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
        </a>
      </div>
      <xsl:if test="count(Zone)>0">
        <div class="product-category-lv-3">
          <ul>
            <xsl:apply-templates select="Zone" mode="ChildSub"></xsl:apply-templates>
          </ul>
        </div>
      </xsl:if>
    </div>
  </xsl:template>

  <xsl:template match="Zone" mode="ChildSub">
    <li>
      <a>
        <xsl:attribute name="href">
          <xsl:value-of select="Url"></xsl:value-of>
        </xsl:attribute>
        <xsl:attribute name="target">
          <xsl:value-of select="Target"></xsl:value-of>
        </xsl:attribute>
        <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
      </a>
    </li>
  </xsl:template>

</xsl:stylesheet>