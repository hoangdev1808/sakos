<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />
	<xsl:template match="/BannerList">
		<div class="section-title">
			<xsl:value-of select="ModuleTitle" disable-output-escaping="yes"></xsl:value-of>
		</div>
		<div class="row">
			<div class="col-lg-4 col-md-4 col-sm-6">
				<div class="col-inner">
					<xsl:apply-templates select="Banner[position()&gt;0 and position()&lt;3]" mode="Col-1"></xsl:apply-templates>
				</div>
			</div>
			<div class="col-lg-4 col-md-4 col-sm-6">
				<div class="col-inner">
					<xsl:apply-templates select="Banner[position()&gt;2 and position()&lt;5]" mode="Col-2"></xsl:apply-templates>
				</div>
			</div>
			<div class="col-lg-4 col-md-4">
				<div class="col-inner">
					<xsl:apply-templates select="Banner[position()=5]" mode="Col-3"></xsl:apply-templates>
				</div>
			</div>
		</div>
	</xsl:template>
	<xsl:template match="Banner" mode="Col-1">
		<div class="item zoom-img">
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
	</xsl:template>
	<xsl:template match="Banner" mode="Col-2">
		<div class="item zoom-img">
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
	</xsl:template>
	<xsl:template match="Banner" mode="Col-3">
		<div class="item zoom-img">
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
	</xsl:template>
</xsl:stylesheet>
