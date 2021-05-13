<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />
	<xsl:template match="/ProductDetail">
		<section id="product-detail-page">
			<div id="tool-option">
				<em class="ri-list-check-2"></em>
			</div>
			<div class="zone-list"></div>
			<div id="breadcrumb"></div>
			<section class="section detail-1">
				<div class="container">
					<div class="row">
						<div class="col-lg-7">
							<div class="wrap-slide-detail">
								<div class="swiper-container gallery-thumbs">
									<div class="swiper-wrapper">
										<xsl:apply-templates select="ProductImages" mode="Small"></xsl:apply-templates>
									</div>
								</div>
								<div class="swiper-container gallery-top">
									<div class="swiper-wrapper">
										<xsl:apply-templates select="ProductImages" mode="Big"></xsl:apply-templates>
									</div>
									<div class="swiper-button-next"></div>
									<div class="swiper-button-prev"></div>
								</div>
							</div>
						</div>
						<div class="col-lg-5">
							<div class="pro-infor-wrap">
								<div class="block-name">
									<h1 class="title">
										<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
										<xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
									</h1>
									<div class="core-pro">
										Mã:
										<xsl:value-of select="Code" disable-output-escaping="yes"></xsl:value-of>
									</div>
									<div class="pro-price d-flex">
										<div class="old-price">
											<xsl:value-of select="OldPrice" disable-output-escaping="yes"></xsl:value-of>
										</div>
										<div class="net-price">
											<xsl:value-of select="Price" disable-output-escaping="yes"></xsl:value-of>
										</div>
									</div>
									<div class="desc">
										<xsl:value-of select="BriefContent" disable-output-escaping="yes"></xsl:value-of>
									</div>
								</div>
								<div class="block-filter">
									<table>
										<tr>
											<td>Màu sắc</td>
											<td>
												<a href="">
													<div class="img">
														<img class="lazyload" data-src="/Data/Sites/1/skins/default/img/san-pham/opt-1.png" />
													</div>
												</a>
												<a href="">
													<div class="img">
														<img class="lazyload" data-src="/Data/Sites/1/skins/default/img/san-pham/opt-2.png" />
													</div>
												</a>
												<a href="">
													<div class="img">
														<img class="lazyload" data-src="/Data/Sites/1/skins/default/img/san-pham/opt-3.png" />
													</div>
												</a>
											</td>
										</tr>
										<tr>
											<td>Kích thước</td>
											<td>
												<a class="btn btn-filter" href="">14 inch</a>
												<a class="btn btn-filter" href="">15 inch</a>
											</td>
										</tr>
										<tr>
											<td>Tính năng </td>
											<td>Văn phòng</td>
										</tr>
									</table>
								</div>
								<div class="block-card">
									<div class="item-quantity">
										<div class="input-group">
											<div class="input-group-btn">
												<div class="qty-minus btn-number">
													<em class="material-icons">remove</em>
												</div>
											</div>
											<input class="product-details-quantity input-number" type="text" value="1">
												<xsl:attribute name="name">
													<xsl:text>addtocart_</xsl:text>
													<xsl:value-of select="ProductId" disable-output-escaping="yes"></xsl:value-of>
													<xsl:text>.EnteredQuantity</xsl:text>
												</xsl:attribute>
											</input>
											<div class="input-group-btn">
												<div class="qty-plus btn-number">
													<em class="material-icons">add</em>
												</div>
											</div>
										</div>
										<div class="pro-price">
											<div class="old-price">2.500.000 VND</div>
											<div class="net-price">1.990.000 VND</div>
										</div>
									</div>
									<div class="add-shopping-cart">
										<a class="add-card addto-cart" href="#" onclick="AjaxCart.addproducttocart_details(this); return false;">
											<xsl:attribute name="data-productid">
												<xsl:value-of select="ProductId"></xsl:value-of>
											</xsl:attribute>
											<em class="material-icons">shopping_cart</em>
											<xsl:text disable-output-escaping="yes">Thêm vào giỏ hàng</xsl:text>
										</a>
									</div>
								</div>
								<div class="block-share">
									<div class="text">Chia sẻ</div>
									<a href="">
										<xsl:attribute name="href">
											<xsl:text>https://www.facebook.com/sharer/sharer.php?u=</xsl:text>
											<xsl:value-of select="FullUrl" />
										</xsl:attribute>
										<img src="/Data/Sites/1/skins/default/img/news/face.png" />
									</a>
									<a href="">
										<img src="/Data/Sites/1/skins/default/img/icons/zalo-2.png" />
									</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
			<section class="section detail-2">
				<div class="container">
					<xsl:value-of select="ProductAttributes[1]/Content" disable-output-escaping="yes"></xsl:value-of>
				</div>
			</section>
			<section class="section detail-3">
				<div class="container">
					<div class="row">
						<div class="col-lg-5">
							<div class="hero-infor">
								<h2 class="title">
									<xsl:value-of select="ProductAttributes[2]/Title" disable-output-escaping="yes"></xsl:value-of>
								</h2>
								<xsl:value-of select="ProductAttributes[2]/Content" disable-output-escaping="yes"></xsl:value-of>
							</div>
						</div>
						<div class="col-lg-7">
							<div class="hero-img">
								<div class="img">
									<xsl:apply-templates select="ProductVideos"></xsl:apply-templates>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
			<section class="section detail-4">
				<div class="container">
					<div class="section-title text-center">
						<h2>Chi tiết sản phẩm </h2>
					</div>
					<xsl:value-of select="FullContent" disable-output-escaping="yes"></xsl:value-of>
				</div>
			</section>
			<section class="section detail-5" setBackground="/Data/Sites/1/skins/default/img/san-pham/combo-bg.png">
				<div class="container">
					<div class="section-title text-center">Bundle savings</div>
					<div class="wrap-list-bundle d-flex">
						<div class="product-item">
							<div class="option red">
								<div class="inner">mới</div>
							</div>
							<div class="option black">
								<div class="inner">-15%</div>
							</div>
							<div class="pro-img">
								<a href="san-pham-chi-tiet.html">
									<img class="lazyload" data-src="/Data/Sites/1/skins/default/img/san-pham/combo-1.png" />
								</a>
							</div>
							<div class="pro-infor">
								<div class="pro-title">
									<a href="san-pham-chi-tiet.html">Cặp Doanh Nhân Legend 04</a>
								</div>
								<div class="pro-price d-flex">
									<div class="price">
										<div class="priceold">2.500.000 VND</div>
										<div class="pricesale">1.990.000 VND</div>
									</div>
									<div class="order">
										<a class="btn btn-order" href="">Mua ngay</a>
									</div>
								</div>
							</div>
						</div>
						<div class="product-item">
							<div class="option red">
								<div class="inner">mới</div>
							</div>
							<div class="option black">
								<div class="inner">-15%</div>
							</div>
							<div class="pro-img">
								<a href="san-pham-chi-tiet.html">
									<img class="lazyload" data-src="/Data/Sites/1/skins/default/img/san-pham/combo-2.png" />
								</a>
							</div>
							<div class="pro-infor">
								<div class="pro-title">
									<a href="san-pham-chi-tiet.html">Cặp Doanh Nhân Legend 04</a>
								</div>
								<div class="pro-price d-flex">
									<div class="price">
										<div class="priceold">2.500.000 VND</div>
										<div class="pricesale">1.990.000 VND</div>
									</div>
									<div class="order">
										<a class="btn btn-order" href="">Mua ngay</a>
									</div>
								</div>
							</div>
						</div>
						<div class="product-item">
							<div class="option red">
								<div class="inner">mới</div>
							</div>
							<div class="option black">
								<div class="inner">-15%</div>
							</div>
							<div class="pro-img">
								<a href="san-pham-chi-tiet.html">
									<img class="lazyload" data-src="/Data/Sites/1/skins/default/img/san-pham/combo-3.png" />
								</a>
							</div>
							<div class="pro-infor">
								<div class="pro-title">
									<a href="san-pham-chi-tiet.html">Cặp Doanh Nhân Legend 04</a>
								</div>
								<div class="pro-price d-flex">
									<div class="price">
										<div class="priceold">2.500.000 VND</div>
										<div class="pricesale">1.990.000 VND</div>
									</div>
									<div class="order">
										<a class="btn btn-order" href="">Mua ngay</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
			<section class="section detail-6">
				<div class="container">
					<div class="section-title">Bình luận sản phẩm</div>
					<div class="fb-comments" data-width="1230" data-numposts="2">
						<xsl:attribute name="data-href">
							<xsl:value-of select="FullUrl" disable-output-escaping="yes"></xsl:value-of>
						</xsl:attribute>
					</div>
				</div>
			</section>
			<section class="section detail-7">
				<div class="container">
					<div class="section-title text-uppercase">Sản phẩm liên quan</div>
					<div class="hero-slide-pro">
						<div class="swiper-container">
							<div class="swiper-wrapper">
								<xsl:apply-templates select="ProductRelated"></xsl:apply-templates>
							</div>
						</div>
						<div class="swiper-button-next"></div>
						<div class="swiper-button-prev"></div>
					</div>
				</div>
			</section>
		</section>
	</xsl:template>
	<xsl:template match="ProductImages" mode="Small">
		<div class="swiper-slide">
			<div class="swiper-inner">
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
			</div>
		</div>
	</xsl:template>
	<xsl:template match="ProductImages" mode="Big">
		<div class="swiper-slide">
			<div class="swiper-inner">
				<div class="option red">
					<div class="inner">-30%</div>
				</div>
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
			</div>
		</div>
	</xsl:template>
	<xsl:template match="ProductRelated">
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
				</xsl:if>
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
							<a class="btn btn-order" href="">Mua ngay</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</xsl:template>
	<xsl:template match="ProductVideos">
		<a>
			<xsl:attribute name="data-fancybox">
				<xsl:text disable-output-escaping="yes">video</xsl:text>
			</xsl:attribute>
			<xsl:attribute name="href">
				<xsl:value-of select="VideoUrl" disable-output-escaping="yes"></xsl:value-of>
			</xsl:attribute>
			<xsl:attribute name="title">
				<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
			</xsl:attribute>
			<xsl:attribute name="target">
				<xsl:value-of select="Target" disable-output-escaping="yes"></xsl:value-of>
			</xsl:attribute>
			<img class="lazyload">
				<xsl:attribute name="data-src">
					<xsl:value-of select="ThumbnailUrl" disable-output-escaping="yes"></xsl:value-of>
				</xsl:attribute>
				<xsl:attribute name="alt">
					<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
				</xsl:attribute>
			</img>
			<div class="icon">
				<img src="/Data/Sites/1/skins/default/img/icons/video.png" />
			</div>
		</a>
	</xsl:template>
</xsl:stylesheet>
