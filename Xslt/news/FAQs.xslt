<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
    <div class="support-faq">
      <h1 class="section-title text-blue mb-3">
        <xsl:value-of select="/NewsList/ZoneTitle"></xsl:value-of>
      </h1>
      <div class="faq-list">
        <xsl:apply-templates select="/NewsList/News"></xsl:apply-templates>
      </div>
    </div>
  </xsl:template>

  <xsl:template match="News">
    <div class="faq-item">
      <a class="collapse-trigger" href="#">
        <strong>
          <xsl:value-of select="position()"></xsl:value-of>
          <xsl:text>. </xsl:text>
          <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
        </strong>
        <em class="ri-arrow-down-s-line"></em>
      </a>
      <div class="collapse-target">
        <div class="article-content">
          <xsl:value-of select="BriefContent" disable-output-escaping="yes"></xsl:value-of>
        </div>
      </div>
      <xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
    </div>
  </xsl:template>
</xsl:stylesheet>