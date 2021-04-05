<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />
	<xsl:template match="/ShoppingCart">
		<div class="cart-wrapper">
			<div class="admin-title">
				<div class="text">
					<p>Giỏ hàng của bạn</p>
					(
					<span>
						<xsl:value-of select="TotalProducts"></xsl:value-of>
					</span>
					<xsl:text>sản phẩm)</xsl:text>
				</div>
			</div>
			<div class="wrapper">
				<table class="carttable" cellspacing="0" cellpadding="0">
					<thead>
						<tr>
							<th>Sản phẩm</th>
							<th>giá</th>
							<th>số lượng</th>
							<th>tổng tiền</th>
						</tr>
					</thead>
					<tbody>
						<xsl:apply-templates select="CartItem"></xsl:apply-templates>
					</tbody>
				</table>
			</div>
			<div class="total-wrapper">
				<table class="total-table">
					<tbody>
						<tr>
							<td>Tạm tính</td>
							<td align="right" />
							<td align="right">
								<xsl:value-of select="SubTotal"></xsl:value-of>
							</td>
						</tr>
						<tr>
							<td>Giảm giá</td>
							<td align="right" />
							<td align="right">
								<xsl:value-of select="DiscountTotal"></xsl:value-of>
							</td>
						</tr>
						<tr>
							<td>Tổng tiền</td>
							<td align="right" />
							<td align="right">
								<xsl:value-of select="Total"></xsl:value-of>
							</td>
						</tr>
					</tbody>
				</table>
				<div class="btn-right">
					<a class="btn btn-primary gray" href="/">
						<xsl:attribute name="href">
							<xsl:value-of select="ContinueShoppingUrl"></xsl:value-of>
						</xsl:attribute>
						<em class="lnr lnr-arrow-left"></em>
						<span>Tiếp tục mua hàng</span>
					</a>
					<a class="btn btn-primary red" href="">
						<xsl:attribute name="onclick">
							<xsl:text>setLocation('</xsl:text>
							<xsl:value-of select="CheckoutUrl" disable-output-escaping="yes"></xsl:value-of>
							<xsl:text>');return false;</xsl:text>
						</xsl:attribute>
						<span>Tiến hành thanh toán</span>
						<em class="lnr lnr-arrow-right"></em>
					</a>
				</div>
			</div>
		</div>
	</xsl:template>
	<xsl:template match="CartItem">
		<tr>
			<td>
				<div class="product-item">
					<div class="image">
						<a href="">
							<xsl:attribute name="href">
								<xsl:value-of select="Url"></xsl:value-of>
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
								<xsl:value-of select="Title"></xsl:value-of>
							</a>
						</div>
						<a class="remove-item" href="" onclick="AjaxCart.removefromcart(this);return false;">
							<xsl:attribute name="data-itemguid">
								<xsl:value-of select="ItemGuid"></xsl:value-of>
							</xsl:attribute>
							<em class="lnr lnr-cross-circle"></em>
							<span>Bỏ sản phẩm</span>
						</a>
					</div>
				</div>
			</td>
			<td>
				<div class="price">
					<div class="current">
						<xsl:value-of select="Price"></xsl:value-of>
					</div>
					<div class="old-wrap">
						<div class="old-price">
							<xsl:value-of select="OldPrice"></xsl:value-of>
						</div>
						<div class="discount">-20%</div>
						<!-- <xsl:if test="DiscountPercentage != ''">
							<div class="discount">
								<xsl:value-of select="DiscountPercentage" disable-output-escaping="yes" />
								<xsl:text>%</xsl:text>
							</div>
						</xsl:if> -->
					</div>
				</div>
			</td>
			<td>
				<div class="quantity-wrapper">
					<div class="item-quantity">
						<div class="input-amount input-group">
							<div class="btn-dec qty-minus">-</div>
							<input class="amount" type="text" maxlength="10" value="4" onchange="AjaxCart.updatecart();return false;">
								<xsl:attribute name="name">
									<xsl:text>itemquantity</xsl:text>
									<xsl:value-of select="ItemGuid"></xsl:value-of>
								</xsl:attribute>
								<xsl:attribute name="value">
									<xsl:value-of select="Quantity"></xsl:value-of>
								</xsl:attribute>
							</input>
							<div class="btn-inc qty-plus">+</div>
						</div>
					</div>
				</div>
			</td>
			<td>
				<div class="total">
					<xsl:value-of select="ItemTotal"></xsl:value-of>
				</div>
			</td>
		</tr>
	</xsl:template>
	<xsl:template match="Quantities">
		<option>
			<xsl:attribute name="value">
				<xsl:value-of select="Quantity"></xsl:value-of>
			</xsl:attribute>
			<xsl:value-of select="Quantity"></xsl:value-of>
		</option>
	</xsl:template>
	<xsl:template match="Attributes">
		<div class="productsize">
			<xsl:value-of select="Title"></xsl:value-of>
			<xsl:text>: </xsl:text>
			<strong>
				<xsl:apply-templates select="Options"></xsl:apply-templates>
			</strong>
		</div>
	</xsl:template>
	<xsl:template match="Options">
		<xsl:if test="IsActive='true'">
			<xsl:value-of select="Title"></xsl:value-of>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
