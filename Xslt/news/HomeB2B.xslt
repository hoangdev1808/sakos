<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />
	<xsl:template match="/NewsList">
		<div class="row">
			<div class="col-lg-6 col-md-6">
				<div class="img">
					<a>
						<xsl:attribute name="href">
							<xsl:text disable-output-escaping="yes">/b2b</xsl:text>
						</xsl:attribute>
						<xsl:attribute name="title">
							<xsl:value-of select="News/Title" disable-output-escaping="yes"></xsl:value-of>
						</xsl:attribute>
						<xsl:attribute name="target">
							<xsl:value-of select="Target" disable-output-escaping="yes"></xsl:value-of>
						</xsl:attribute>
						<img class="lazyload">
							<xsl:attribute name="data-src">
								<xsl:value-of select="News/ThumbnailUrl" disable-output-escaping="yes"></xsl:value-of>
							</xsl:attribute>
							<xsl:attribute name="alt">
								<xsl:value-of select="News/Title" disable-output-escaping="yes"></xsl:value-of>
							</xsl:attribute>
						</img>
					</a>
				</div>
			</div>
			<div class="col-lg-6 col-md-6">
				<div class="content">
					<div class="subtitle f-24 text-uppercase">b2b</div>
					<div class="section-title">
						<xsl:value-of select="News/Title" disable-output-escaping="yes"></xsl:value-of>
					</div>
					<div class="desc lcl lcl-3 f-16">
						<xsl:value-of select="News/BriefContent" disable-output-escaping="yes"></xsl:value-of>
					</div>
					<div class="wrap-button d-flex">
						<a class="btn btn-download">
							<xsl:attribute name="href">
								<xsl:value-of select="Url" disable-output-escaping="yes"></xsl:value-of>
							</xsl:attribute>
							<xsl:attribute name="title">
								<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
							</xsl:attribute>
							<xsl:attribute name="target">
								<xsl:value-of select="Target" disable-output-escaping="yes"></xsl:value-of>
							</xsl:attribute>
							<span class="lnr lnr-download"></span>
							catalogue
						</a>
						<a class="btn btn-view-more">
							<xsl:attribute name="href">
								<xsl:text disable-output-escaping="yes">/b2b</xsl:text>
							</xsl:attribute>
							<xsl:attribute name="title">
								<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
							</xsl:attribute>
							<xsl:attribute name="target">
								<xsl:value-of select="Target" disable-output-escaping="yes"></xsl:value-of>
							</xsl:attribute>
							<xsl:text disable-output-escaping="yes">xem thêm</xsl:text>
						</a>
					</div>
				</div>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>
