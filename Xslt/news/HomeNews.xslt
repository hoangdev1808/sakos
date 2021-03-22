<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes" />

  <xsl:template match="/">

    <div class="tip-list-heading flex justify-between items-center">
      <div class="section-title text-blue ml-2">Kinh nghiệm, mẹo vặt hay</div>
      <div class="view-more-desktop hidden-mobile">
        <a class="flex flex-center" href="/tin-tuc/kinh-nghiem">Tất cả bài viết</a>
      </div>
    </div>

    <div class="tip-list">
      <div class="swiper-container">
        <div class="swiper-wrapper">
          <xsl:apply-templates select="/NewsList/News"></xsl:apply-templates>
        </div>
      </div>
    </div>
    <a class="flex flex-center view-more-mobile hidden-desktop">
      <xsl:attribute name="href">
        <xsl:text>/tin-tuc/kinh-nghiem</xsl:text>
      </xsl:attribute>
      <strong class="text-blue">Xem tất cả ></strong>
    </a>


  </xsl:template>

  <xsl:template match="News">
    <div class="swiper-slide">
      <div>
        <xsl:choose>
          <xsl:when test="position()=1">
            <xsl:attribute name="class">
              <xsl:text>tip-item tip-item-big</xsl:text>
            </xsl:attribute>
          </xsl:when>
          <xsl:otherwise>
            <xsl:attribute name="class">
              <xsl:text>tip-item tip-item-small</xsl:text>
            </xsl:attribute>
          </xsl:otherwise>
        </xsl:choose>
        <div class="tip-img object-fit-img">
          <a>
            <xsl:attribute name="href">
              <xsl:value-of select="Url"></xsl:value-of>
            </xsl:attribute>
            <xsl:attribute name="title">
              <xsl:value-of select="Title"></xsl:value-of>
            </xsl:attribute>
            <img class="lazyload" data-src="./img/tip/1.jpg">
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
          </a>
        </div>
        <div class="tip-caption position-absolute left-0 right-0 bottom-0 flex items-center">
          <xsl:if test="SubTitle != ''">
            <a class="icon" data-fancybox=''>
              <xsl:attribute name="href">
                <xsl:value-of select="SubTitle"></xsl:value-of>
              </xsl:attribute>
              <em class="ri-play-circle-line"></em>
            </a>
          </xsl:if>
          <a class="title">
            <xsl:attribute name="href">
              <xsl:value-of select="Url"></xsl:value-of>
            </xsl:attribute>
            <xsl:value-of select="Title"></xsl:value-of>
          </a>
        </div>
      </div>
    </div>
  </xsl:template>

</xsl:stylesheet>