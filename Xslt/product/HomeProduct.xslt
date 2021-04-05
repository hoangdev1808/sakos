<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />
	<xsl:template match="/ProductList">
		<div class="wrap-slide">
			<div class="swiper-container">
				<div class="swiper-wrapper">
					<xsl:apply-templates select="Product"></xsl:apply-templates>
				</div>
			</div>
			<div class="swiper-button-next"></div>
			<div class="swiper-button-prev"></div>
			<a class="btn btn-view-all">
				<xsl:attribute name="href">
					<xsl:text disable-output-escaping="yes">/san-pham</xsl:text>
				</xsl:attribute>
				<xsl:attribute name="title">
					<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
				</xsl:attribute>
				<xsl:attribute name="target">
					<xsl:value-of select="Target" disable-output-escaping="yes"></xsl:value-of>
				</xsl:attribute>
				<xsl:text disable-output-escaping="yes">xem tất cả</xsl:text>
			</a>
		</div>
	</xsl:template>
	<xsl:template match="Product">
		<div class="swiper-slide">
			<div class="product-item">
				<xsl:if test="ShowOption > 0">
					<xsl:if test="floor(ShowOption div 1) mod 2 = 1">
						<div class="option red">
							<div class="inner">
								<xsl:text disable-output-escaping="yes">Mới</xsl:text>
							</div>
						</div>
					</xsl:if>
					<xsl:if test="floor(ShowOption div 2) mod 2 = 1">
						<div class="option red">
							<div class="inner">
								<xsl:text disable-output-escaping="yes">Hot</xsl:text>
							</div>
						</div>
					</xsl:if>
					<xsl:if test="floor(ShowOption div 4) mod 2 = 1">
						<div class="option red">
							<div class="inner">
								<img src="/Data/Sites/1/skins/default/img/icons/free-ship.png" />
							</div>
						</div>
					</xsl:if>
					<xsl:if test="floor(ShowOption div 8) mod 2 = 1">
						<div class="option red">
							<div class="inner">
								<img src="/Data/Sites/1/skins/default/img/icons/option-1.png" />
							</div>
						</div>
					</xsl:if>
					<xsl:if test="floor(ShowOption div 16) mod 2 = 1">
						<div class="option red">
							<div class="inner">
								<img src="/Data/Sites/1/skins/default/img/icons/option-2.png" />
							</div>
						</div>
					</xsl:if>
				</xsl:if>
				<div class="option black">
					<div class="inner">-15%</div>
				</div>
				<div class="pro-img">
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
				<ul>
					<li>
						<a href="">
							<img class="lazyload" data-src="/Data/Sites/1/skins/default/img/km-ct/22.png" />
						</a>
					</li>
					<li class="active">
						<a href="">
							<img class="lazyload" data-src="/Data/Sites/1/skins/default/img/km-ct/23.png" />
						</a>
					</li>
				</ul>
				<div class="pro-infor">
					<div class="pro-title">
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
						<xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
					</div>
					<div class="pro-price d-flex">
						<div class="price">
							<div class="priceold">
								<xsl:value-of select="OldPrice" disable-output-escaping="yes"></xsl:value-of>
							</div>
							<div class="pricesale">
								<xsl:value-of select="Price" disable-output-escaping="yes"></xsl:value-of>
							</div>
						</div>
						<div class="order">
							<a class="btn btn-order" href="javascript: ;">Mua ngay</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>
