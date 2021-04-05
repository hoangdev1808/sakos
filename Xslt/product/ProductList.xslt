<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />
	<xsl:template match="/ProductList">
		<div class="ajaxresponse">
			<div class="block_name_category d-flex">
				<div class="name_category">
					<h2>
						<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
					</h2>
				</div>
				<div class="wrap-left d-flex">
					<div class="option-wrap d-flex">
						<p>Hiển thị:</p>
						<select class="ajaxsort">
							<xsl:apply-templates select="SortBy"></xsl:apply-templates>
						</select>
					</div>
					<div class="sort-wrap d-flex">
						<p>Sắp xếp: </p>
						<select class="ajaxsort">
							<xsl:apply-templates select="PageSize"></xsl:apply-templates>
						</select>
					</div>
				</div>
			</div>
			<div class="row ajaxresponsewrap">
				<xsl:apply-templates select="Product"></xsl:apply-templates>
			</div>
		</div>
	</xsl:template>
	<xsl:template match="Product">
		<div class="col-lg-4 col-md-6 col-sm-6 col-6">
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
							<a class="btn btn-order" href="#" onclick="AjaxCart.addproducttocart_catalog(this);return false;">
								<xsl:attribute name="data-productid">
									<xsl:value-of select="ProductId"></xsl:value-of>
								</xsl:attribute>
								<xsl:text disable-output-escaping="yes">Mua ngay</xsl:text>
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</xsl:template>
	<xsl:template match="SortBy">
		<option>
			<xsl:if test="IsActive='true'">
				<xsl:attribute name="selected">
					<xsl:text>selected</xsl:text>
				</xsl:attribute>
			</xsl:if>
			<xsl:attribute name="value">
				<xsl:value-of select="Url" />
			</xsl:attribute>
			<xsl:value-of select="Title" />
		</option>
	</xsl:template>
	<xsl:template match="PageSize">
		<option>
			<xsl:if test="IsActive='true'">
				<xsl:attribute name="selected">
					<xsl:text>selected</xsl:text>
				</xsl:attribute>
			</xsl:if>
			<xsl:attribute name="value">
				<xsl:value-of select="Url" />
			</xsl:attribute>
			<xsl:value-of select="Title" />
		</option>
	</xsl:template>
</xsl:stylesheet>
