<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />
	<xsl:template match="/ProductFilter">
		<div class="section-title">BỘ LỌC</div>
		<xsl:apply-templates select="Group"></xsl:apply-templates>
		<div class="filter-wrap">
			<div class="filter-title">
				Khoảng giá
				<div class="btn-dropdown">
					<em class="material-icons">expand_more</em>
				</div>
			</div>
			<div class="filter-option">
				<div id="slider"></div>
				<div class="filter-label">
					<label for="amount">0</label>
					<label for="amount">15.000.000 VND</label>
				</div>
				<input class="hidden" id="amount" type="text" readonly="" value="" />
			</div>
		</div>
	</xsl:template>
	<xsl:template match="Group">
		<div class="filter-wrap ajaxfilterresponse">
			<div class="filter-title">
				<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
				<div class="btn-dropdown">
					<em class="material-icons">expand_more</em>
				</div>
			</div>
			<div class="filter-option">
				<ul>
					<xsl:apply-templates select="Option"></xsl:apply-templates>
				</ul>
			</div>
		</div>
	</xsl:template>
	<xsl:template match="Option">
		<li>
			<xsl:if test="IsActive = 'true'">
				<xsl:attribute name="class">
					<xsl:text disable-output-escaping="yes">btn btn-filter ajaxlink active</xsl:text>
				</xsl:attribute>
			</xsl:if>
			<a class="btn btn-filter ajaxlink">
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
		</li>
	</xsl:template>
</xsl:stylesheet>
