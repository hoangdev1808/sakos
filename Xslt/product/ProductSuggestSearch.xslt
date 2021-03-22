<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes"/>

	<xsl:template match="/">
		<xsl:choose>
			<xsl:when test="count(/SearchResults/Product)>0">
				<div class="row">
					<div class="col-xl-5 col-lg-4">
						<div class="keyword-list">
							<ul>
								<xsl:apply-templates select="/SearchResults/Product" mode="TextOnly"></xsl:apply-templates>
							</ul>
						</div>
					</div>
					<div class="col-xl-7 col-lg-8">
						<div class="product-suggest-list product-list">
							<div class="row row-2 row-md-3">
								<xsl:apply-templates select="/SearchResults/Product"></xsl:apply-templates>
							</div>
							<div class="view-more-wrap">
								<a class="btn btn-white">
									<xsl:attribute name="href">
										<xsl:value-of select="/SearchResults/SearchResultsPage"></xsl:value-of>
									</xsl:attribute>
									Xem tất cả sản phẩm
								</a>
							</div>
						</div>
					</div>
				</div>
			</xsl:when>
			<xsl:otherwise>
				<div class="row">
					<div class="col-xl-12 col-lg-12">
						<xsl:text>Không tìm thấy sản phẩm phù hợp với từ khóa</xsl:text>
					</div>
				</div>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template match="Product" mode="TextOnly">
		<xsl:if test="position()&lt;17">
			<li>
				<a>
					<xsl:attribute name="href">
						<xsl:value-of select="Url"></xsl:value-of>
					</xsl:attribute>
					<xsl:value-of select="TitleHighlight" disable-output-escaping="yes"></xsl:value-of>
				</a>
			</li>
		</xsl:if>
	</xsl:template>

	<xsl:template match="Product">
		<xsl:if test="position()&lt;7">
			<div class="w-100">
				<div class="product-item">
					<a class="product-img">
						<xsl:attribute name="href">
							<xsl:value-of select="Url" />
						</xsl:attribute>
						<img src="data:image/gif;base64,R0lGODlhAQABAAD/ACwAAAAAAQABAAACADs=">
							<xsl:attribute name="src">
								<xsl:value-of select="ImageUrl"></xsl:value-of>
							</xsl:attribute>
							<xsl:attribute name="alt">
								<xsl:value-of select="Title"></xsl:value-of>
							</xsl:attribute>
						</img>
					</a>
					<div class="product-name leading-snug">
						<a>
							<xsl:attribute name="href">
								<xsl:value-of select="Url" />
							</xsl:attribute>
							<xsl:value-of select="Title"></xsl:value-of>
						</a>
					</div>

					<div class="product-price flex items-end">
						<strong class="price text-main">
							<xsl:value-of disable-output-escaping="yes" select="Price"></xsl:value-of>
						</strong>
						<xsl:if test="OldPrice != ''">
							<del class="old-price">
								<xsl:value-of disable-output-escaping="yes" select="OldPrice"></xsl:value-of>
							</del>
						</xsl:if>
					</div>
					<xsl:apply-templates select="Promotion"></xsl:apply-templates>
				</div>
			</div>
		</xsl:if>
	</xsl:template>

	<xsl:template match="Promotion">
		<xsl:if test="floor(Option div 1) mod 2 = 1">
			<xsl:if test="DiscountPrice!=''">
				<div class="product-vnpay-price">
					<strong>Giá VnPay: </strong>
					<strong class="text-main">
						<xsl:value-of select="DiscountPrice"></xsl:value-of>
					</strong>
				</div>
			</xsl:if>
		</xsl:if>
	</xsl:template>

</xsl:stylesheet>