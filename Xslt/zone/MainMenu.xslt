<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />
	<xsl:template match="/ZoneList">
		<ul class="nav d-flex">
			<xsl:apply-templates select="Zone"></xsl:apply-templates>
		</ul>
	</xsl:template>
	<xsl:template match="Zone">
		<li class="nav-item">
			<xsl:if test="IsActive = 'true'">
				<xsl:attribute name="class">
					<xsl:text disable-output-escaping="yes">nav-item active</xsl:text>
				</xsl:attribute>
			</xsl:if>
			<xsl:if test="ZoneId = 1715">
				<xsl:attribute name="id">
					<xsl:text disable-output-escaping="yes">mega-product</xsl:text>
				</xsl:attribute>
			</xsl:if>
			<xsl:if test="count(Zone) > 0">
				<xsl:attribute name="class">
					<xsl:text disable-output-escaping="yes">nav-item mega</xsl:text>
				</xsl:attribute>
				<xsl:if test="IsActive = 'true'">
					<xsl:attribute name="class">
						<xsl:text disable-output-escaping="yes">nav-item mega active</xsl:text>
					</xsl:attribute>
				</xsl:if>
				<div class="title">
					<a class="nav-link f-16 fw-700 text-uppercase">
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
					<div class="btn-sub">
						<em class="material-icons">navigate_next</em>
					</div>
				</div>
				<xsl:if test="ZoneId = 1716">
					<div class="megasub brand-list d-flex">
						<div class="turn-back">
							<em class="ri-arrow-go-back-line"></em>
						</div>
						<xsl:apply-templates select="Zone" mode="LV2"></xsl:apply-templates>
					</div>
				</xsl:if>
			</xsl:if>
			<xsl:if test="count(Zone) = 0">
				<div class="title">
					<a class="nav-link f-16 fw-700 text-uppercase">
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
				</div>
			</xsl:if>
		</li>
	</xsl:template>
	<xsl:template match="Zone" mode="LV2">
		<div class="brand-item">
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
			<div class="content">
				<div class="title">
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
				</div>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>
