<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
    <div class="support-policy">
      <h1 class="section-title text-blue mb-3">
        <xsl:value-of select="/NewsDetail/Title"></xsl:value-of>
        <xsl:value-of select="/NewsDetail/EditLink" disable-output-escaping="yes"></xsl:value-of>
      </h1>
      <div class="article-content policy-content">
        <xsl:value-of select="/NewsDetail/FullContent" disable-output-escaping="yes"></xsl:value-of>
      </div>
    </div>
  </xsl:template>
</xsl:stylesheet>