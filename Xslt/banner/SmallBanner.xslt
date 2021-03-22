<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
	<div class="small-banner-promo">
		<ul>
			<xsl:apply-templates select="/BannerList/Banner"></xsl:apply-templates>
		</ul>
	</div>	
  </xsl:template>

  <xsl:template match="Banner">
	<li>
		<a class="object-fit-img img" href="#">
			<xsl:attribute name="href">
			  <xsl:value-of select="Url"></xsl:value-of>
			</xsl:attribute>	
			<img class="lazyload" src="data:image/gif;base64,R0lGODlhAQABAAD/ACwAAAAAAQABAAACADs=">
			  <xsl:attribute name="data-src">
				<xsl:value-of select="ImageUrl"></xsl:value-of>
			  </xsl:attribute>		
			</img>	
		</a>
	</li>
  </xsl:template>

</xsl:stylesheet>