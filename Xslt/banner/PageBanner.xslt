<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />
	<xsl:template match="/BannerList">
		<xsl:apply-templates select="Banner"></xsl:apply-templates>
	</xsl:template>
	<xsl:template match="Banner">
		<div class="banner-wrap">
			<div class="img">
				<img>
					<xsl:attribute name="src">
						<xsl:value-of select="ImageUrl" disable-output-escaping="yes"></xsl:value-of>
					</xsl:attribute>
					<xsl:attribute name="alt">
						<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
					</xsl:attribute>
				</img>
			</div>
			<div class="wrap-content">
				<div class="container">
					<div class="content">
						<h1 class="title f-36 fw-700 color-white">
							<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
						</h1>
						<h2 class="sub-title f-18 color-white">
							<xsl:value-of select="Description" disable-output-escaping="yes"></xsl:value-of>
						</h2>
						<a class="btn btn-view-more" href="">
							<xsl:attribute name="href">
								<xsl:value-of select="Url" disable-output-escaping="yes"></xsl:value-of>
							</xsl:attribute>
							<xsl:attribute name="title">
								<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
							</xsl:attribute>
							<xsl:attribute name="target">
								<xsl:value-of select="Target" disable-output-escaping="yes"></xsl:value-of>
							</xsl:attribute>
							<xsl:text disable-output-escaping="yes">xem sản phẩm</xsl:text>
						</a>
					</div>
				</div>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>
