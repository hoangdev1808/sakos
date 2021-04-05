<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />
	<xsl:template match="/ShoppingCart">
		<div class="icon">
			<img src="/Data/Sites/1/skins/default/img/icons/shop2.png" alt="" />
		</div>
		<span class="quilt total-cart-items">
			<xsl:value-of select="TotalProducts" disable-output-escaping="yes"></xsl:value-of>
		</span>
		<div class="shopping-cart-wrapper">
			<div class="head">
				<!-- <div class="cart-quantity">
					<span class="material-icons">shopping_cart</span>
					<div class="cart-number total-cart-items">
						<span class="item-quantity">
							<xsl:value-of select="TotalProducts" disable-output-escaping="yes"></xsl:value-of>
						</span>
					</div>
				</div> -->
				<div class="cart-number">
					<p>
						Tổng cộng:
						<span>
							<xsl:value-of select="Total"></xsl:value-of>
						</span>
					</p>
				</div>
			</div>
			<div class="body">
				<div class="scroll-wrapper cartpanel">
					<xsl:apply-templates select="/ShoppingCart/CartItem"></xsl:apply-templates>
				</div>
			</div>
			<div class="btn-center">
				<a class="btn btn-primary">
					<xsl:attribute name="href">
						<xsl:value-of select="/ShoppingCart/CartPageUrl"></xsl:value-of>
					</xsl:attribute>
					<span>Thanh toán </span>
					<em class="lnr lnr-arrow-right"></em>
				</a>
			</div>
		</div>
	</xsl:template>
	<xsl:template match="CartItem">
		<div class="cart-item">
			<div class="image">
				<a href="">
					<xsl:attribute name="href">
						<xsl:value-of select="Url"></xsl:value-of>
					</xsl:attribute>
					<xsl:attribute name="target">
						<xsl:value-of select="Target"></xsl:value-of>
					</xsl:attribute>
					<xsl:attribute name="title">
						<xsl:value-of select="Title"></xsl:value-of>
					</xsl:attribute>
					<img>
						<xsl:attribute name="src">
							<xsl:value-of select="ThumbnailUrl"></xsl:value-of>
						</xsl:attribute>
						<xsl:attribute name="alt">
							<xsl:value-of select="Title"></xsl:value-of>
						</xsl:attribute>
					</img>
				</a>
			</div>
			<div class="caption">
				<div class="title">
					<a href="">
						<xsl:attribute name="href">
							<xsl:value-of select="Url"></xsl:value-of>
						</xsl:attribute>
						<xsl:attribute name="target">
							<xsl:value-of select="Target"></xsl:value-of>
						</xsl:attribute>
						<xsl:attribute name="title">
							<xsl:value-of select="Title"></xsl:value-of>
						</xsl:attribute>
						<xsl:value-of select="Title"></xsl:value-of>
					</a>
					<div class="price">
						<xsl:value-of select="Price"></xsl:value-of>
					</div>
				</div>
				<div class="quantity">
					Số lượng:
					<span class="number">
						<xsl:value-of select="Quantity"></xsl:value-of>
					</span>
				</div>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>
