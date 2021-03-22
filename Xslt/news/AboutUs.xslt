<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes" />

  <xsl:template match="/ZoneList">
    <section class="about-1 section">
      <div class="container">
        <div class="row no-gutter background-white">
          <div class="col-lg-6">
            <div class="content">
              <h1 class="section-title text-blue mb-3 hidden-mobile">
                <xsl:value-of disable-output-escaping="yes" select="Zone[1]/News/Title"></xsl:value-of>
                <xsl:value-of disable-output-escaping="yes" select="Zone[1]/News/EditLink"></xsl:value-of>
              </h1>
              <div class="text article-content">
                <xsl:value-of disable-output-escaping="yes" select="Zone[1]/News/FullContent"></xsl:value-of>
              </div>
            </div>
          </div>
          <div class="col-lg-6">
            <h2 class="section-title text-blue mb-3 hidden-desktop">
              <xsl:value-of disable-output-escaping="yes" select="Zone[1]/News/Title"></xsl:value-of>
              <xsl:value-of disable-output-escaping="yes" select="Zone[1]/News/EditLink"></xsl:value-of>
            </h2>
            <div class="swiper-container">
              <div class="swiper-wrapper">
                <xsl:apply-templates select="Zone[1]/News/NewsImages"></xsl:apply-templates>
              </div>
              <div class="swiper-navigation">
                <div class="swiper-btn swiper-btn-prev"><span class="ri-arrow-left-line"></span></div>
                <div class="swiper-btn swiper-btn-next"><span class="ri-arrow-right-line"></span></div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <section class="about-2 section">
      <div class="container">
        <h2 class="section-title text-white text-center mb-5">
          <xsl:value-of disable-output-escaping="yes" select="Zone[2]/Title"></xsl:value-of>
        </h2>
        <div class="row row-2 row-lg-4 equal-height">
          <xsl:apply-templates select="Zone[2]/News" mode="ZoneNews-2"></xsl:apply-templates>
        </div>
      </div>
    </section>
    <section class="about-3 section">
      <div class="container">
        <div class="row no-gutter background-white">
          <div class="col-lg-6">
            <h2 class="section-title text-blue mb-2 hidden-desktop">
              <xsl:value-of select="Zone[3]/News/Title"></xsl:value-of>
              <xsl:value-of select="Zone[3]/News/EditLink" disable-output-escaping="yes"></xsl:value-of>
            </h2>
            <div class="img">
              <img class="lazyload" src="data:image/gif;base64,R0lGODlhAQABAAD/ACwAAAAAAQABAAACADs=">
              <xsl:attribute name="data-src">
                <xsl:value-of select="Zone[3]/News/ImageUrl"></xsl:value-of>
              </xsl:attribute>
              <xsl:attribute name="alt">
                <xsl:value-of select="Zone[3]/News/Title"></xsl:value-of>
              </xsl:attribute>
              </img>
            </div>
          </div>
          <div class="col-lg-6">
            <div class="content">
              <div class="article-content">
                <h2 class="section-title text-blue mb-2 hidden-mobile">
                  <xsl:value-of select="Zone[3]/News/Title"></xsl:value-of>
                  <xsl:value-of select="Zone[3]/News/EditLink" disable-output-escaping="yes"></xsl:value-of>
                </h2>
                <xsl:value-of select="Zone[3]/News/BriefContent" disable-output-escaping="yes"></xsl:value-of>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <section class="about-4 section background-white">
      <div class="container">
        <h2 class="section-title text-blue text-center mb-3">
          <xsl:value-of disable-output-escaping="yes" select="Zone[4]/Title"></xsl:value-of>
        </h2>
        <div class="slider-partner position-relative">
          <div class="swiper-container">
            <div class="swiper-wrapper">
              <xsl:apply-templates select="Zone[4]/News" mode="ZoneNews-4"></xsl:apply-templates>
            </div>
          </div>
          <div class="swiper-navigation">
            <div class="swiper-btn swiper-btn-prev"><span class="ri-arrow-left-line"></span></div>
            <div class="swiper-btn swiper-btn-next"><span class="ri-arrow-right-line"></span></div>
          </div>
        </div>
      </div>
    </section>
  </xsl:template>

  <xsl:template match="News" mode="ZoneNews-2">
    <div class="w-100">
      <div class="item background-white">
        <div class="icon">
          <img>
          <xsl:attribute name="src">
            <xsl:value-of select="ImageUrl"></xsl:value-of>
          </xsl:attribute>
          <xsl:attribute name="alt">
            <xsl:value-of select="Title"></xsl:value-of>
          </xsl:attribute>
          </img>
        </div>
        <div class="text leading-tight">
          <xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
          <xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
        </div>
      </div>
    </div>
  </xsl:template>

  <xsl:template match="News" mode="ZoneNews-4">
    <div class="swiper-slide">
      <div class="img"><img class="swiper-lazy">
        <xsl:attribute name="src">
          <xsl:value-of select="ImageUrl"></xsl:value-of>
        </xsl:attribute>
        <xsl:attribute name="alt">
          <xsl:value-of select="Title"></xsl:value-of>
        </xsl:attribute>
        </img>

      </div>
    </div>
  </xsl:template>

  <xsl:template match="NewsImages">
    <div class="swiper-slide">
      <div class="img">
        <img class='swiper-lazy'>
        <xsl:attribute name="data-src">
          <xsl:value-of select="ImageUrl"></xsl:value-of>
        </xsl:attribute>
        <xsl:attribute name="alt">
          <xsl:value-of select="Title"></xsl:value-of>
        </xsl:attribute>
        </img>
      </div>
    </div>
  </xsl:template>

</xsl:stylesheet>