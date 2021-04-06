<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />
	<xsl:template match="/ZoneList">
		<div class="section-title text-center">
			<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
		</div>
		<div class="wrap-top">
			<div class="wrap-left">
				<ul class="color-text f-14">
					<xsl:apply-templates select="Zone"></xsl:apply-templates>
					<li>
						<xsl:if test="CurrentZoneId = 1719">
							<xsl:attribute name="class">
								<xsl:text disable-output-escaping="yes">active</xsl:text>
							</xsl:attribute>
						</xsl:if>
						<a>
							<xsl:attribute name="href">
								<xsl:value-of select="RootUrl"></xsl:value-of>
							</xsl:attribute>
							<xsl:text>Tất cả</xsl:text>
						</a>
					</li>
				</ul>
			</div>
			<div class="wrap-right-main">
				<div class="color-text f-14 fw-700">Đăng ký để nhận khuyến mãi 30% khi mua hàng</div>
			</div>
		</div>
	</xsl:template>
	<xsl:template match="Zone">
		<li>
			<xsl:if test="IsActive = 'true'">
				<xsl:attribute name="class">
					<xsl:text disable-output-escaping="yes">active</xsl:text>
				</xsl:attribute>
			</xsl:if>
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
		</li>
	</xsl:template>
</xsl:stylesheet>
