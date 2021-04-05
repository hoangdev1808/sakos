<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />
	<xsl:template match="/ZoneList">
		<section class="section support-page">
			<div class="container">
				<div class="row no-gutters">
					<div class="col-md-6 col-sm-12">
						<div class="wrap-left">
							<div class="img">
								<img class="lazyload">
									<xsl:attribute name="data-src">
										<xsl:value-of select="ImageUrl" disable-output-escaping="yes"></xsl:value-of>
									</xsl:attribute>
									<xsl:attribute name="alt">
										<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
									</xsl:attribute>
								</img>
							</div>
							<h1 class="content f-36 color-white">
								<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
							</h1>
						</div>
					</div>
					<div class="col-md-6 col-sm-12">
						<div class="wrap-right">
							<ul>
								<xsl:apply-templates select="Zone"></xsl:apply-templates>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</section>
	</xsl:template>
	<xsl:template match="Zone">
		<li>
			<xsl:attribute name="id">
				<xsl:text disable-output-escaping="yes">list-</xsl:text>
				<xsl:value-of select="position()" disable-output-escaping="yes"></xsl:value-of>
			</xsl:attribute>
			<xsl:if test="IsActive = 'true'">
				<xsl:attribute name="class">
					<xsl:text disable-output-escaping="yes">active</xsl:text>
				</xsl:attribute>
			</xsl:if>
			<h2 class="title f-16 fw-700">
				<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
			</h2>
			<xsl:apply-templates select="News"></xsl:apply-templates>
		</li>
	</xsl:template>
	<xsl:template match="News">
		<div class="content">
			<xsl:value-of select="FullContent" disable-output-escaping="yes"></xsl:value-of>
		</div>
	</xsl:template>
</xsl:stylesheet>
