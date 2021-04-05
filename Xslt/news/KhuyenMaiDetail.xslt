<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />
	<xsl:template match="/NewsDetail">
		<section class="section page-discount-detail">
			<div class="container">
				<div class="row">
					<div class="col-md-10 col-12 mx-auto">
						<div class="wrap-top">
							<h1 class="section-title">
								<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
							</h1>
							<xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
						</div>
						<div class="wrap-bottom">
							<div class="date">
								<div class="color-text">Ngày đăng : </div>
								<time>
									<xsl:value-of select="CreatedDate" disable-output-escaping="yes"></xsl:value-of>
								</time>
							</div>
							<div class="social">
								<div class="color-text">Chia sẻ : </div>
								<a class="face">
									<xsl:attribute name="href">
										<xsl:text>https://www.facebook.com/sharer/sharer.php?u=</xsl:text>
										<xsl:value-of select="FullUrl" />
									</xsl:attribute>
									<img src="/Data/Sites/1/skins/default/img/news/face.png" />
								</a>
								<a class="zalo" href="">
									<img src="/Data/Sites/1/skins/default/img/news/zalo.png" />
								</a>
							</div>
						</div>
						<div class="fullcontent">
							<xsl:value-of select="FullContent" disable-output-escaping="yes"></xsl:value-of>
							<img class="lazyload">
								<xsl:attribute name="data-src">
									<xsl:value-of select="NewsImages[2]/ImageUrl" disable-output-escaping="yes"></xsl:value-of>
								</xsl:attribute>
								<xsl:attribute name="alt">
									<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
								</xsl:attribute>
							</img>
						</div>
					</div>
				</div>
			</div>
		</section>
		<section class="discount-brand">
			<div class="container">
				<div class="brand">
					<div class="brand__header">
						<div class="f-24 fw-700">Danh mục sản phẩm khuyến mãi</div>
					</div>
					<div class="brand__body">
						<div class="row">
							<xsl:apply-templates select="ProductRelated"></xsl:apply-templates>
						</div>
					</div>
					<div class="btn btn-view-all">
						<span>Xem thêm</span>
						<div class="material-icons">keyboard_arrow_down</div>
					</div>
				</div>
			</div>
		</section>
		<section class="section discount-other">
			<div class="container">
				<div class="section-title">Khuyến mãi khác</div>
				<div class="swiper-discount-other button-gray">
					<div class="swiper-container">
						<div class="swiper-wrapper">
							<xsl:apply-templates select="NewsOther"></xsl:apply-templates>
						</div>
					</div>
					<div class="wrap-button">
						<div class="swiper-button-next"></div>
						<div class="swiper-button-prev"></div>
					</div>
				</div>
			</div>
		</section>
	</xsl:template>
	<xsl:template match="ProductRelated">
		<div class="col-lg-3 col-md-6 col-6">
			<div class="brand-item">
				<div class="option red">
					<div class="inner">mới</div>
				</div>
				<div class="option black">
					<div class="inner">-15%</div>
				</div>
				<div class="big-img">
					<a class="img">
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
				<div class="sm-box">
					<div class="sm-img">
						<img class="lazyload" data-src="/Data/Sites/1/skins/default/img/km-ct/22.png" />
					</div>
					<div class="sm-img active">
						<img class="lazyload" data-src="/Data/Sites/1/skins/default/img/km-ct/23.png" />
					</div>
				</div>
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
				<div class="wrap-price">
					<div class="price">
						<div class="priceold">
							<xsl:value-of select="OldPrice" disable-output-escaping="yes"></xsl:value-of>
						</div>
						<div class="pricesale">
							<xsl:value-of select="Price" disable-output-escaping="yes"></xsl:value-of>
						</div>
					</div>
					<div class="order">
						<a class="btn btn-order" href="">Mua ngay</a>
					</div>
				</div>
			</div>
		</div>
	</xsl:template>
	<xsl:template match="NewsOther">
		<div class="swiper-slide">
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
					<time>
						<xsl:value-of select="CreatedDate" disable-output-escaping="yes"></xsl:value-of>
					</time>
					<div class="title">
						<a class="lcl lcl-2">
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
					<a class="item-view-more">
						<xsl:attribute name="href">
							<xsl:value-of select="Url" disable-output-escaping="yes"></xsl:value-of>
						</xsl:attribute>
						<xsl:attribute name="title">
							<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
						</xsl:attribute>
						<xsl:attribute name="target">
							<xsl:value-of select="Target" disable-output-escaping="yes"></xsl:value-of>
						</xsl:attribute>
						<xsl:text disable-output-escaping="yes">Xem thêm</xsl:text>
					</a>
				</div>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>
