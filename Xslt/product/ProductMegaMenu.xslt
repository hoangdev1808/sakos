<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />
	<xsl:template match="/ZoneList">
		<div class="turn-back">
			<em class="ri-arrow-go-back-line"></em>
		</div>
		<ul>
			<xsl:apply-templates select="Zone[Depth = 1]" mode="LV2"></xsl:apply-templates>
		</ul>
	</xsl:template>
	<xsl:template match="Zone" mode="LV2">
		<li class="mega-item">
			<div class="title">
				<a class="mega-link">
					<xsl:attribute name="href">
						<xsl:value-of select="Url" disable-output-escaping="yes"></xsl:value-of>
					</xsl:attribute>
					<xsl:attribute name="title">
						<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
					</xsl:attribute>
					<xsl:attribute name="target">
						<xsl:value-of select="Target" disable-output-escaping="yes"></xsl:value-of>
					</xsl:attribute>
					<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
				</a>
				<div class="btnsub">
					<em class="material-icons">navigate_next</em>
				</div>
			</div>
			<div class="megasub__dropdown">
				<ul>
					<xsl:apply-templates select="Zone[Depth = 2]" mode="LV3"></xsl:apply-templates>
				</ul>
			</div>
		</li>
	</xsl:template>
	<xsl:template match="Zone" mode="LV3">
		<li>
			<a>
				<xsl:attribute name="href">
					<xsl:value-of select="Url" disable-output-escaping="yes"></xsl:value-of>
				</xsl:attribute>
				<xsl:attribute name="title">
					<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
				</xsl:attribute>
				<xsl:attribute name="target">
					<xsl:value-of select="Target" disable-output-escaping="yes"></xsl:value-of>
				</xsl:attribute>
				<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
			</a>
			<div class="product d-flex">
				<xsl:apply-templates select="Product"></xsl:apply-templates>
			</div>
		</li>
	</xsl:template>
	<xsl:template match="Product">
		<div class="img">
			<a>
				<xsl:attribute name="href">
					<xsl:value-of select="Url" disable-output-escaping="yes"></xsl:value-of>
				</xsl:attribute>
				<xsl:attribute name="title">
					<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
				</xsl:attribute>
				<xsl:attribute name="target">
					<xsl:value-of select="Target" disable-output-escaping="yes"></xsl:value-of>
				</xsl:attribute>
				<img class="lazyload">
					<xsl:attribute name="data-src">
						<xsl:value-of select="ImageUrl" disable-output-escaping="yes"></xsl:value-of>
					</xsl:attribute>
					<xsl:attribute name="alt">
						<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
					</xsl:attribute>
				</img>
			</a>
		</div>
	</xsl:template>
</xsl:stylesheet>
