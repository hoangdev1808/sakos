<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />

	<xsl:template match="/ProductDetail">
		<div class="product-detail-wrap">

			<div class="product-detail-info-container">
				<div class="row">
					<div class="col-12">
						<div class="product-detail-heading flex justify-between items-center flex-wrap">
							<h1 class="section-title text-blue">
								<xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
								<xsl:value-of disable-output-escaping="yes" select="EditLink"></xsl:value-of>
							</h1>
							<div class="product-detail-heading-right flex items-center">
								<a class="product-detail-like text-main fz-24 mr-1"
									onclick="AjaxCart.addproducttowishlist(this);return false;">
									<xsl:if test="AddedWishList = 'True'">
										<xsl:attribute name="class">
											<xsl:text>product-detail-like text-main fz-24 mr-1 active</xsl:text>
										</xsl:attribute>
										<xsl:attribute name="onclick">
											<xsl:text>AjaxCart.removefromwishlist(this);return false;</xsl:text>
										</xsl:attribute>
										<xsl:attribute name="data-itemguid">
											<xsl:value-of select="WishItemGuid" />
										</xsl:attribute>
									</xsl:if>
									<xsl:attribute name="data-productid">
										<xsl:value-of select="ProductId"></xsl:value-of>
									</xsl:attribute>
									<xsl:attribute name="href">
										<xsl:text>#</xsl:text>
									</xsl:attribute>
									<em class="ri-heart-3-line"></em>
								</a>
								<div class="fb-like" data-width="150" data-layout="button" data-action="like"
									data-size="small" data-share="true">
									<xsl:attribute name="data-href">
										<xsl:value-of select="FullUrl" />
									</xsl:attribute>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-5 border-right">
						<div class="product-detail-images position-relative">
							<!--Big Image Swiper-->
							<xsl:if test="count(ProductImages)>0">
								<div class="product-detail-images-wrap">
									<div class="swiper-container">
										<div class="swiper-wrapper">
											<xsl:apply-templates select="ProductImages"></xsl:apply-templates>
										</div>
										<div class="swiper-navigation">
											<div class="swiper-btn swiper-btn-prev">
												<span class="ri-arrow-left-line"></span>
											</div>
											<div class="swiper-btn swiper-btn-next">
												<span class="ri-arrow-right-line"></span>
											</div>
										</div>
									</div>
									<div class="swiper-slide-count hidden-desktop background-main text-white"></div>
								</div>
								<div class="move-cursor flex items-center justify-center hidden-mobile">
									<em class="ri-search-line"></em>
									Rê chuột lên hình để phóng to
								</div>
							</xsl:if>
							<!--Icon-->
							<xsl:if test="ShowOption > 0">
								<div class="product-detail-icon">
									<ul>
										<xsl:if test="floor(ShowOption div 1) mod 2 = 1">
											<li>
												<span class="icon-brown">new</span>
											</li>
										</xsl:if>
										<xsl:if test="floor(ShowOption div 2) mod 2 = 1">
											<li>
												<span class="icon-blue">Mua 1 tặng 1</span>
											</li>
										</xsl:if>
										<xsl:if test="/ProductDetail/GiftDescription2!=''">
											<li class="gift-icon">
												<xsl:value-of disable-output-escaping="yes"
													select="/ProductDetail/GiftDescription2">
												</xsl:value-of>
											</li>
										</xsl:if>
									</ul>
								</div>
							</xsl:if>
						</div>

						<!--Thumbnail Image Swiper-->
						<xsl:if test="count(ProductImages)>0">
							<div class="product-detail-thumbnail hidden-mobile">
								<div class="product-detail-thumbnail-wrap">
									<div class="swiper-container">
										<div class="swiper-wrapper">
											<xsl:apply-templates select="ProductImages" mode="thumbnail">
											</xsl:apply-templates>
										</div>
									</div>
								</div>
							</div>
						</xsl:if>

						<!--Videos-->
						<xsl:if test="count(ProductVideos)>0">
							<div class="product-detail-video hidden-mobile">
								<strong class="block text-blue mb-2">Video sản phẩm</strong>
								<ul>
									<xsl:apply-templates select="ProductVideos"></xsl:apply-templates>
								</ul>
							</div>
						</xsl:if>
					</div>

					<div class="col-lg-4">
						<div class="product-detail-info-wrap">
							<xsl:if test="RatingVotes>0">
								<div class="product-detail-rating flex">
									<div class="rating-star">
										<div>
											<xsl:attribute name="style">
												<xsl:text>width:</xsl:text>
												<xsl:value-of select="/ProductDetail/RatingPercent"></xsl:value-of>
												<xsl:text>%</xsl:text>
											</xsl:attribute>
										</div>
									</div>
									<div class="rating-number fz-14">
										<xsl:value-of select="RatingVotes"></xsl:value-of>
										<xsl:text> đánh giá</xsl:text>
									</div>
								</div>
							</xsl:if>

							<div class="flex flex-wrap justify-between mt-2">
								<div class="product-detail-brand fz-14">
									<xsl:if test="ManufacturerTitle!=''">
										<p>
											<span>Thương hiệu: </span>
											<span class="text-main">
												<a>
													<xsl:attribute name="href">
														<xsl:value-of select="ManufacturerUrl"/>
													</xsl:attribute>
													<xsl:attribute name="title">
														<xsl:value-of select="ManufacturerTitle"/>
													</xsl:attribute>
													<xsl:value-of select="ManufacturerTitle"></xsl:value-of>
												</a>
											</span> 
										</p>
									</xsl:if>
									<p>
										<span>Tình trạng: </span>
										<xsl:choose>
											<xsl:when test="StockQuantity > 0">
												<span class="text-green">Còn hàng</span>
											</xsl:when>
											<xsl:otherwise>
												<span class="text-red">Hết hàng</span>
											</xsl:otherwise>
										</xsl:choose>
									</p>
								</div>
								<xsl:if test="Code!=''">
									<div class="product-detail-code fz-14 text-right">
										<p>
											<span>Mã sản phẩm: </span>
											<span class="text-dark-grey">
												<xsl:value-of select="Code"></xsl:value-of>
											</span>
										</p>
									</div>
								</xsl:if>
							</div>
							<div class="product-detail-divider"></div>
							<div class="product-detail-price mb-3">
								<strong class="price fz-30 block text-main leading-snug">
									<xsl:value-of disable-output-escaping="yes" select="Price"></xsl:value-of>
								</strong>
								<div class="flex items-baseline">
									<xsl:if test="OldPrice!=''">
										<span class="fz-14">
											<xsl:if test="DiscountPercentage!=''">
												<span>Tiết kiệm: </span>
												<span class="text-main">
													<xsl:value-of disable-output-escaping="yes"
														select="DiscountPercentage"></xsl:value-of>
													<xsl:text>%</xsl:text>
												</span>
											</xsl:if>
											<span class="text-dark-grey">
												(<xsl:value-of disable-output-escaping="yes" select="OldPrice">
												</xsl:value-of>)
											</span>
										</span>
										<span class="ml-1 mr-1 fz-14">|</span>
									</xsl:if>
									<xsl:if
										test="count(Promotion[floor(Option div 1) mod 2 = 1])>0 and Promotion[floor(Option div 1) mod 2 = 1]/DiscountPrice!=''">
										<span>
											<span class="fz-14">Giá VNPAY: </span>
											<span class="fz-20 text-main">
												<xsl:value-of
													select="Promotion[floor(Option div 1) mod 2 = 1]/DiscountPrice">
												</xsl:value-of>
											</span>
										</span>
									</xsl:if>

								</div>
							</div>

							<!--Deal Timer-->
							<xsl:if test="DealEndDay!=''">
								<div class="product-detail-deal mb-2">
									<p class="deal-deadline-text">
										Deal sẽ kết thúc trong vòng:
										<strong class="text-blue product-detail-countdown">
											<xsl:attribute name="data-countdown">
												<xsl:value-of select="DealEndDay"></xsl:value-of>
												<xsl:text>/</xsl:text>
												<xsl:value-of select="DealEndMonth"></xsl:value-of>
												<xsl:text>/</xsl:text>
												<xsl:value-of select="DealEndYear"></xsl:value-of>
												<xsl:text> </xsl:text>
												<xsl:value-of select="DealEndHour"></xsl:value-of>
												<xsl:text>:</xsl:text>
												<xsl:value-of select="DealEndMinute"></xsl:value-of>
												<xsl:text>:</xsl:text>
												<xsl:value-of select="DealEndSecond"></xsl:value-of>
											</xsl:attribute>
										</strong>
									</p>
								</div>
							</xsl:if>
							<xsl:if test="DealSoldPercent != '' ">
								<!--Deal Progress-->
								<div class="product-detail-deal-progress">

									<xsl:if test="DealSoldPercent!=''">
										<div class="deal-progress-bar mb-1">
											<div class="deal-progress-bar-inner">
												<xsl:attribute name="style">
													<xsl:text>width:</xsl:text>
													<xsl:value-of select="DealSoldPercent"></xsl:value-of>
													<xsl:text>%</xsl:text>
												</xsl:attribute>
											</div>
										</div>
									</xsl:if>

									<div class="deal-progress-bar-text flex justify-between fz-14">
										<xsl:if test="DealRemainingQty!=''">
											<div class="left-deal">
												<span>Còn lại: </span>
												<strong>
													<xsl:value-of select="DealRemainingQty"></xsl:value-of>
												</strong>
											</div>
										</xsl:if>
										<xsl:if test="DealSoldQty!=''">
											<div class="sold-deal">
												<span>Đã bán: </span>
												<strong>
													<xsl:value-of select="DealSoldQty"></xsl:value-of>
												</strong>
											</div>
										</xsl:if>
									</div>
								</div>
							</xsl:if>
							<xsl:if test="BriefContent != ''">
								<div class="product-detail-divider"></div>
								<!--Brief Content-->
								<div class="product-detail-brief fz-14 leading-relaxed list-disc">
									<xsl:value-of select="BriefContent" disable-output-escaping="yes"></xsl:value-of>
								</div>
							</xsl:if>

							<xsl:if test="GiftDescription!=''">
								<div class="product-detail-promo leading-snug">
									<strong class="block text-blue mb-1">Khuyến mãi</strong>
									<div class="fz-14 text-dark-grey mb-1">
										<xsl:value-of select="GiftDescription" disable-output-escaping="yes">
										</xsl:value-of>
									</div>
									<!--<p class="fz-12 text-main">* Chương trình không áp dụng cùng các chương trình khuyến mãi khác</p>-->
								</div>

							</xsl:if>

							<xsl:if test="IsMobileDevice != 'True'">
								<!--Add product-->
								<xsl:if test="StockQuantity > 0">
									<div class="product-detail-divider"></div>
									<div class="product-detail-purchase">
										<span class="block mb-2">Số lượng</span>
										<div class="flex flex-wrap">
											<div class="product-detail-buy-now">
												<div class="spin-input-wrap">
													<div class="spin-btn" data-spin="dec">
														<em class="ri-subtract-fill"></em>
													</div>
													<input type="text" value="1">
													<xsl:attribute name="name">
														<xsl:text>addtocart_</xsl:text>
														<xsl:value-of select="/ProductDetail/ProductId"
															disable-output-escaping="yes" />
														<xsl:text>.EnteredQuantity</xsl:text>
													</xsl:attribute>
													</input>
													<div class="spin-btn" data-spin="inc">
														<em class="ri-add-fill"></em>
													</div>
												</div>
												<div class="mt-2">
													<a class="btn btn-blue" href="#"
														onclick="AjaxCart.addproducttocart_details(this, true); return false;">
														<xsl:attribute name="data-productid">
															<xsl:value-of select="ProductId" />
														</xsl:attribute>
														<xsl:text>Mua ngay</xsl:text>
													</a>
												</div>
											</div>
											<div class="product-detail-addtocart ml-2">
												<a class="btn btn-find-store" href="/tim-cua-hang" target="_blank">
													<span class="ri-map-pin-2-fill"></span> Tìm siêu thị gần nhất
												</a>
												<a class="btn btn-addtocart mt-2" href="#"
													onclick="AjaxCart.addproducttocart_details(this); return false;">
													<xsl:attribute name="data-productid">
														<xsl:value-of select="ProductId" />
													</xsl:attribute>
													<img src="/Data/Sites/1/skins/default/img/cart-white.png"
														alt="Cart"></img>
													<xsl:text>Thêm vào giỏ hàng</xsl:text>
												</a>
											</div>
										</div>
									</div>
								</xsl:if>
								<xsl:if test="StockQuantity  = 0">
									<div class="product-detail-divider"></div>
									<a class="btn-sold-out-letter btn" href="javascript:;">
										<xsl:text>Liên hệ khi có hàng</xsl:text>
									</a>
								</xsl:if>
							</xsl:if>
							<!--Products bought together-->
							<xsl:if test="count(ProductRelated)>0">
								<div class="product-detail-divider"></div>
								<div class="product-detail-frequent">
									<strong class="block text-blue mb-2">Thường được mua cùng</strong>
									<div class="image-list flex items-center">
										<xsl:apply-templates select="ProductRelated"></xsl:apply-templates>
									</div>
									<div class="frequent-product mt-2">
										<xsl:apply-templates select="ProductRelated" mode="checkbox">
										</xsl:apply-templates>
									</div>
									<div class="frequently-sum-price fz-14 mt-2">
										<p>
											Tổng tiền: <span class="text-main" id="btn-together-total">0 đ</span>
										</p>
									</div>
									<a class="btn frequently-button mt-2" id="btn-together-ids" href="#"
										onclick="AjaxCart.addproducttocart_details_multi(this); return false;">
										<xsl:text>Thêm </xsl:text>
										<span>0</span>
										<xsl:text> sản phẩm vào giỏ hàng</xsl:text>
									</a>
								</div>
							</xsl:if>

						</div>
					</div>

					<div class="col-lg-3">
						<xsl:if test="ProductDetailGlobalMessage!=''">
							<div class="product-detail-aside">
								<xsl:value-of disable-output-escaping="yes" select="ProductDetailGlobalMessage">
								</xsl:value-of>
							</div>
						</xsl:if>
					</div>

				</div>
			</div>
		</div>

		<!--Product Other-->
		<xsl:if test="count(ProductOther)>0">
			<div class="product-detail-wrap product-detail-related">
				<div class="product-detail-heading flex justify-between items-center flex-wrap">
					<h2 class="section-title text-blue">Sản phẩm tương tự</h2>
				</div>
				<div class="product-detail-related-slide">
					<div class="product-list product-slider">
						<div class="swiper-container">
							<div class="swiper-wrapper">
								<xsl:apply-templates select="ProductOther"></xsl:apply-templates>
							</div>
							<div class="swiper-navigation">
								<div class="swiper-btn swiper-btn-prev">
									<span class="ri-arrow-left-line"></span>
								</div>
								<div class="swiper-btn swiper-btn-next">
									<span class="ri-arrow-right-line"></span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</xsl:if>

		<div class="row mt-4">
			<div class="col-lg-9">
				<xsl:apply-templates select="ProductAttributes" />


				<!--Detail Article-->
				<xsl:if test="FullContent != ''">
					<div class="product-detail-wrap">
						<div class="product-detail-article"> 
							<h2 class="section-title text-blue">Thông tin sản phẩm</h2>
							<div class="article-content show-hide-content">
								<xsl:value-of disable-output-escaping="yes" select="FullContent"></xsl:value-of>
								<div class="btn-show-content">
									<span>Xem thêm</span>
									<em class="ri-arrow-down-s-fill"></em>
								</div>
							</div>
						</div>
					</div>
				</xsl:if>
				<!--Review Comment-->
				<div class="product-detail-wrap">
					<div class="product-detail-comment">
						<h2 class="section-title text-blue">Đánh giá sản phẩm</h2>
						<div class="detail-comment"></div>
					</div>
				</div>
			</div>
			<div class="col-lg-3">
				<div class="product-detail-promo-product"></div>
			</div>
		</div>


		<!--Product Viewed-->
		<xsl:if test="count(ProductViewed)>0">
			<div class="product-detail-wrap product-detail-viewed">
				<div class="product-detail-heading flex justify-between items-center flex-wrap">
					<h2 class="section-title text-blue">
						Sản phẩm đã xem
					</h2>
				</div>
				<div class="product-detail-related-slide">
					<div class="product-list product-slider">
						<div class="swiper-container">
							<div class="swiper-wrapper">
								<xsl:apply-templates select="ProductViewed"></xsl:apply-templates>
							</div>
							<div class="swiper-navigation">
								<div class="swiper-btn swiper-btn-prev">
									<span class="ri-arrow-left-line">
									</span>
								</div>
								<div class="swiper-btn swiper-btn-next">
									<span class="ri-arrow-right-line">
									</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</xsl:if>

		<!-- Mobile -->
		<xsl:if test="IsMobileDevice = 'True'">


			<div class="product-detail-fixed-nav hidden-desktop">
				<div class="product-detail-buttons">
					<div class="product-detail-nav">
						<xsl:value-of disable-output-escaping="yes" select="ProductDetailHotLineMessage"></xsl:value-of>
						<a class="choose-buy" href="#">
							<xsl:attribute name="data-productid">
								<xsl:value-of select="ProductId" />
							</xsl:attribute>
							Chọn mua
						</a>
					</div>
				</div>
				<div class="product-detail-mobile-purchase hidden">
					<div class="purchase-wrapper">
						<div class="flex product-to-buy">
							<div class="img">
								<img>
								<xsl:attribute name="src">
									<xsl:value-of select="ProductImages[1]/ImageUrl" />
								</xsl:attribute>
								<xsl:attribute name="alt">
									<xsl:value-of select="Title" />
								</xsl:attribute>
								</img>
							</div>
							<div class="caption">
								<div class="name">
									<xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
								</div>
								<div class="price-wrap flex justify-between">
									<strong class="price text-main">
										<xsl:value-of disable-output-escaping="yes" select="Price"></xsl:value-of>
									</strong>
									<xsl:if
										test="count(Promotion[floor(Option div 1) mod 2 = 1])>0 and Promotion[floor(Option div 1) mod 2 = 1]/DiscountPrice!=''">
										<span class="vnpay-price">
											<xsl:text>Giá VNPAY: </xsl:text>
											<strong class="price text-main">
												<xsl:value-of
													select="Promotion[floor(Option div 1) mod 2 = 1]/DiscountPrice">
												</xsl:value-of>
											</strong>
										</span>
									</xsl:if>
								</div>
								<div class="spin-input-wrap mt-1">
									<div class="spin-btn" data-spin="dec">
										<em class="ri-subtract-fill"></em>
									</div>
									<input type="text" value="1">
									<xsl:attribute name="name">
										<xsl:text>addtocart_</xsl:text>
										<xsl:value-of select="/ProductDetail/ProductId" disable-output-escaping="yes" />
										<xsl:text>.EnteredQuantity</xsl:text>
									</xsl:attribute>
									</input>
									<div class="spin-btn" data-spin="inc">
										<em class="ri-add-fill"></em>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="button-group">
						<a class="btn buy-now btn-blue" href="#"
							onclick="AjaxCart.addproducttocart_details(this, true); return false;">
							<xsl:attribute name="data-productid">
								<xsl:value-of select="ProductId" />
							</xsl:attribute>
							<xsl:text>Mua ngay</xsl:text>
						</a>
						<a class="btn add-to-cart" href="#"
							onclick="AjaxCart.addproducttocart_details(this); return false;">
							<xsl:attribute name="data-productid">
								<xsl:value-of select="ProductId" />
							</xsl:attribute>
							<xsl:text>Thêm vào giỏ hàng</xsl:text>
						</a>
					</div>
				</div>
			</div>
		</xsl:if>
	</xsl:template>

	<!--TEMPLATES-->

	<xsl:template match="ProductImages">
		<div class="swiper-slide">
			<div class="img">
				<a data-fancybox="">
					<xsl:attribute name="href">
						<xsl:value-of select="ImageUrl"></xsl:value-of>
					</xsl:attribute>
					<img class="zoom-img swiper-lazy">
					<xsl:attribute name="data-src">
						<xsl:value-of select="ImageUrl"></xsl:value-of>
					</xsl:attribute>
					<xsl:attribute name="data-zoom-image">
						<xsl:value-of select="ImageUrl"></xsl:value-of>
					</xsl:attribute>
					<xsl:attribute name="alt">
						<xsl:value-of select="Title"></xsl:value-of>
					</xsl:attribute>
					</img>
				</a>
			</div>
		</div>
	</xsl:template>

	<xsl:template match="ProductImages" mode="thumbnail">
		<div class="swiper-slide">
			<div class="img">
				<img class="swiper-lazy">
				<xsl:attribute name="data-src">
					<xsl:value-of select="ImageUrl"></xsl:value-of>
				</xsl:attribute>
				<xsl:attribute name="alt">
					<xsl:value-of select="Title"></xsl:value-of>
				</xsl:attribute>
				</img>
			</div>
		</div>
	</xsl:template>

	<xsl:template match="ProductVideos">
		<li>
			<a>
				<xsl:attribute name="href">
					<xsl:value-of select="VideoUrl"></xsl:value-of>
				</xsl:attribute>
				<xsl:attribute name="data-fancybox">
					<xsl:text></xsl:text>
				</xsl:attribute>
				<img class="lazyload">
				<xsl:attribute name="data-src">
					<xsl:value-of select="ThumbnailUrl"></xsl:value-of>
				</xsl:attribute>
				<xsl:attribute name="src">
					<xsl:text>data:image/gif;base64,R0lGODlhAQABAAD/ACwAAAAAAQABAAACADs=</xsl:text>
				</xsl:attribute>
				<xsl:attribute name="alt">
					<xsl:value-of select="Title"></xsl:value-of>
				</xsl:attribute>
				</img>
				<em class="ri-play-circle-line"></em>
			</a>
		</li>
	</xsl:template>

	<xsl:template match="ProductRelated">
		<xsl:if test="position()!=1">
			<span class="plus">+</span>
		</xsl:if>
		<a class="item" target="_blank">
			<xsl:attribute name="title">
				<xsl:value-of select="Title"></xsl:value-of>
			</xsl:attribute>
			<xsl:attribute name="href">
				<xsl:value-of select="Url"></xsl:value-of>
			</xsl:attribute>
			<img class="lazyload" src="data:image/gif;base64,R0lGODlhAQABAAD/ACwAAAAAAQABAAACADs=">
			<xsl:attribute name="data-src">
				<xsl:value-of select="ThumbnailUrl"></xsl:value-of>
			</xsl:attribute>
			<xsl:attribute name="alt">
				<xsl:value-of select="Title"></xsl:value-of>
			</xsl:attribute>
			</img>
		</a>
	</xsl:template>

	<xsl:template match="ProductRelated" mode="checkbox">
		<div class="frequently-product-item">
			<!--active class if checked-->
			<div class="icon" onclick="AjaxCart.getTotalBuyTogether(this); return false;">
				<xsl:attribute name="data-id">
					<xsl:value-of select="ProductId" />
				</xsl:attribute>
			</div>
			<a class="frequently-product-name" href="#" onclick="AjaxCart.getTotalBuyTogether(this); return false;">
				<xsl:attribute name="data-id">
					<xsl:value-of select="ProductId" />
				</xsl:attribute>
				<span>
					<xsl:value-of select="Title"></xsl:value-of>
				</span>
			</a>
			<p class="frequently-product-price">
				<xsl:value-of disable-output-escaping="yes" select="Price"></xsl:value-of>
			</p>
		</div>
	</xsl:template>

	<xsl:template match="ProductOther">
		<div class="swiper-slide">
			<div class="product-item">
				<a class="product-img">
					<xsl:attribute name="href">
						<xsl:value-of select="Url"></xsl:value-of>
					</xsl:attribute>
					<img class="swiper-lazy">
					<xsl:attribute name="data-src">
						<xsl:value-of select="ImageUrl"></xsl:value-of>
					</xsl:attribute>
					</img>
					<xsl:if test="DiscountPercentage!=''">
						<div class="product-deal-coupon">
							<xsl:text>Giảm </xsl:text>
							<xsl:value-of select="DiscountPercentage"></xsl:value-of>
							<xsl:text>%</xsl:text>
						</div>
					</xsl:if>
					<xsl:if test="ShowOption>0">
						<div class="product-icon">
							<ul>
								<xsl:if test="floor(ShowOption div 1) mod 2 = 1">
									<li>
										<span class="icon-brown">new</span>
									</li>
								</xsl:if>
								<xsl:if test="floor(ShowOption div 2) mod 2 = 1">
									<li>
										<span class="icon-blue">Mua 1 tặng 1</span>
									</li>
								</xsl:if>
								<xsl:if test="GiftDescription2!=''">
									<li class="gift-icon">
										<xsl:value-of disable-output-escaping="yes" select="GiftDescription2">
										</xsl:value-of>
									</li>
								</xsl:if>
							</ul>
						</div>
					</xsl:if>
				</a>
				<div class="product-name leading-snug">
					<a>
						<xsl:attribute name="href">
							<xsl:value-of select="Url"></xsl:value-of>
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
				<xsl:if
					test="count(Promotion[floor(Option div 1) mod 2 = 1])>0 and Promotion[floor(Option div 1) mod 2 = 1]/DiscountPrice!=''">
					<div class="product-vnpay-price">
						<strong>Giá VnPay: </strong>
						<strong class="text-main">
							<xsl:value-of select="Promotion[floor(Option div 1) mod 2 = 1]/DiscountPrice">
							</xsl:value-of>
						</strong>
					</div>
				</xsl:if>
				<xsl:if test="StockQuantity > 0">
					<a class="btn-buy background-main" href="#"
						onclick="AjaxCart.addproducttocart_catalog(this);return false;">
						<xsl:attribute name="data-productid">
							<xsl:value-of select="ProductId" />
						</xsl:attribute>
						<img src="/Data/Sites/1/skins/default/img/cart-white.png" alt="Buy" />
					</a>
				</xsl:if>
			</div>
		</div>
	</xsl:template>

	<xsl:template match="ProductImages" mode="image">
		<div class="swiper-slide">
			<a class="img uk-display-block" data-fancybox="product-image">
				<xsl:attribute name="href">
					<xsl:value-of select="ImageUrl"></xsl:value-of>
				</xsl:attribute>
				<xsl:attribute name="title">
					<xsl:value-of select="Title"></xsl:value-of>
				</xsl:attribute>
				<img>
				<xsl:attribute name="src">
					<xsl:value-of select="ImageUrl"></xsl:value-of>
				</xsl:attribute>
				<xsl:attribute name="alt">
					<xsl:value-of select="Title"></xsl:value-of>
				</xsl:attribute>
				</img>
			</a>
		</div>
	</xsl:template>

	<xsl:template match="ProductAttributes">
		<div class="product-detail-wrap">
			<div class="product-detail-data">
				<h2 class="section-title text-blue">
					<xsl:value-of select="Title" /> 
				</h2>
				<xsl:value-of disable-output-escaping="yes" select="Content"></xsl:value-of>
			</div>
		</div>
	</xsl:template>

	<xsl:template match="ProductProperties">
		<tr>
			<td>
				<div class="text">
					<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
				</div>
			</td>
			<td class="product-options">
				<xsl:choose>
					<xsl:when test="FieldType=1">
						<div class="item colour">
							<xsl:apply-templates select="Options" mode="Color"></xsl:apply-templates>
						</div>
					</xsl:when>
					<xsl:when test="Title='Kích cỡ'">
						<div class="item size">
							<xsl:apply-templates select="Options" mode="Size"></xsl:apply-templates>
						</div>
						<div class="size-guide">
							<a href="/huong-dan-chon-size">
								<span>Huong dẫn chọn size</span>
								<em class="mdi mdi-information"></em>
							</a>
						</div>
					</xsl:when>
					<xsl:otherwise>
						<div class="caption">
							<xsl:apply-templates select="Options" mode="Other"></xsl:apply-templates>
						</div>
						<!--<select class="uk-select">
                <xsl:attribute name="name">
                  <xsl:text>product_attribute_</xsl:text>
                  <xsl:value-of select="ProductId" />
                  <xsl:text>_</xsl:text>
                  <xsl:value-of select="FieldId" />
                </xsl:attribute>
                <xsl:apply-templates select="Options" mode="OtherPP"></xsl:apply-templates>
              </select>-->
					</xsl:otherwise>
				</xsl:choose>
				<!--<div class="size-guide">
          <a href="#">
            <span>Huong dạn chọn size</span>
            <em class="mdi mdi-information"></em>
          </a>
        </div>
        <div class="caption">Slim body</div>-->
				<input type="hidden" class="product-option-input">
				<xsl:attribute name="name">
					<xsl:text>product_option_</xsl:text>
					<xsl:value-of select="FieldId"></xsl:value-of>
				</xsl:attribute>
				<xsl:attribute name="value">
					<xsl:value-of select="ActiveOptionId"></xsl:value-of>
				</xsl:attribute>
				</input>
			</td>
		</tr>

		<!--<div class="product-options uk-flex uk-flex-middle">
      <div class="option-title">
        <strong>
          <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
        </strong>
      </div>
      <div class="list ">
        <xsl:choose>
          <xsl:when test="FieldType=1">
            <xsl:apply-templates select="Options" mode="ColorPP"></xsl:apply-templates>
          </xsl:when>
          <xsl:otherwise>
            <select class="uk-select">
              <xsl:attribute name="name">
                <xsl:text>product_attribute_</xsl:text>
                <xsl:value-of select="ProductId" />
                <xsl:text>_</xsl:text>
                <xsl:value-of select="FieldId" />
              </xsl:attribute>
              <xsl:apply-templates select="Options" mode="OtherPP"></xsl:apply-templates>
            </select>
          </xsl:otherwise>
        </xsl:choose>
      </div>
      <input type="hidden" class="product-option-input">
        <xsl:attribute name="name">
          <xsl:text>product_option_</xsl:text>
          <xsl:value-of select="FieldId"></xsl:value-of>
        </xsl:attribute>
        <xsl:attribute name="value">
          <xsl:value-of select="ActiveOptionId"></xsl:value-of>
        </xsl:attribute>
      </input>
    </div>-->
	</xsl:template>

	<xsl:template match="Options" mode="ColorPP">
		<a class="product-option product-option-color" onclick="AjaxCart.selectproductoption(this);return false;">
			<xsl:attribute name="href">#</xsl:attribute>
			<xsl:attribute name="data-name">
				<xsl:value-of select="Title"></xsl:value-of>
			</xsl:attribute>
			<xsl:attribute name="data-id">
				<xsl:value-of select="OptionId" />
			</xsl:attribute>
			<xsl:if test="IsActive='true'">
				<xsl:attribute name="class">
					<xsl:text>product-option product-option-color active</xsl:text>
				</xsl:attribute>
			</xsl:if>
			<xsl:attribute name="style">
				<xsl:text>background-color:</xsl:text>
				<xsl:value-of select="Color"></xsl:value-of>
				<xsl:text>;</xsl:text>
			</xsl:attribute>
			<xsl:attribute name="data-id">
				<xsl:value-of select="OptionId"></xsl:value-of>
			</xsl:attribute>
		</a>
	</xsl:template>

	<xsl:template match="Options" mode="Size">
		<a class="product-option product-option-size" onclick="AjaxCart.selectproductoption(this);return false;">
			<xsl:attribute name="href">#</xsl:attribute>
			<xsl:attribute name="data-name">
				<xsl:value-of select="Title"></xsl:value-of>
			</xsl:attribute>
			<xsl:attribute name="data-id">
				<xsl:value-of select="OptionId"></xsl:value-of>
			</xsl:attribute>
			<xsl:if test="IsActive='true'">
				<xsl:attribute name="class">
					<xsl:text>product-option product-option-size active</xsl:text>
				</xsl:attribute>
			</xsl:if>
			<span>
				<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
			</span>
		</a>
	</xsl:template>

	<xsl:template match="Options" mode="Color">
		<a class="product-option product-option-color" onclick="AjaxCart.selectproductoption(this);return false;">
			<xsl:attribute name="href">#</xsl:attribute>
			<xsl:attribute name="data-name">
				<xsl:value-of select="Title"></xsl:value-of>
			</xsl:attribute>
			<xsl:attribute name="data-id">
				<xsl:value-of select="OptionId"></xsl:value-of>
			</xsl:attribute>
			<xsl:if test="IsActive='true'">
				<xsl:attribute name="class">
					<xsl:text>product-option product-option-color active</xsl:text>
				</xsl:attribute>
			</xsl:if>
			<xsl:attribute name="style">
				<xsl:text>background:</xsl:text>
				<xsl:value-of select="Color"></xsl:value-of>
			</xsl:attribute>
		</a>
	</xsl:template>

	<xsl:template match="Options" mode="Other">
		<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
		<xsl:if test="position()!= last()">
			<xsl:text>, </xsl:text>
		</xsl:if>
	</xsl:template>

	<xsl:template match="Options" mode="OtherPP">
		<option>
			<xsl:attribute name="value">
				<xsl:value-of select="OptionId"></xsl:value-of>
			</xsl:attribute>
			<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
		</option>
	</xsl:template>

	<xsl:template match="Images360">
		<img>
		<xsl:attribute name="src">
			<xsl:value-of select="ImageUrl"></xsl:value-of>
		</xsl:attribute>
		</img>
	</xsl:template>


	<xsl:template match="ProductViewed">
		<div class="swiper-slide">
			<div class="product-item">
				<a class="product-img">
					<xsl:attribute name="href">
						<xsl:value-of select="Url" />
					</xsl:attribute>
					<img class="swiper-lazy" src="data:image/gif;base64,R0lGODlhAQABAAD/ACwAAAAAAQABAAACADs=">
					<xsl:attribute name="data-src">
						<xsl:value-of select="ImageUrl"></xsl:value-of>
					</xsl:attribute>
					<xsl:attribute name="alt">
						<xsl:value-of select="Title"></xsl:value-of>
					</xsl:attribute>
					</img>
					<xsl:if test="DiscountPercentage!=''">
						<div class="product-deal-coupon">
							<xsl:text>Giảm </xsl:text>
							<xsl:value-of select="DiscountPercentage"></xsl:value-of>
							<xsl:text>%</xsl:text>
						</div>
					</xsl:if>
					<xsl:if test="ShowOption>0">
						<div class="product-icon">
							<ul>
								<xsl:if test="floor(ShowOption div 1) mod 2 = 1">
									<li>
										<span class="icon-brown">new</span>
									</li>
								</xsl:if>
								<xsl:if test="floor(ShowOption div 2) mod 2 = 1">
									<li>
										<span class="icon-blue">Mua 1 tặng 1</span>
									</li>
								</xsl:if>
								<xsl:if test="GiftDescription2!=''">
									<li class="gift-icon">
										<xsl:value-of disable-output-escaping="yes" select="GiftDescription2">
										</xsl:value-of>
									</li>
								</xsl:if>
							</ul>
						</div>
					</xsl:if>
				</a>
				<div class="product-name leading-snug">
					<a>
						<xsl:attribute name="href">
							<xsl:value-of select="Url" />
						</xsl:attribute>
						<xsl:value-of select="Title"></xsl:value-of>
					</a>
					<xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
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
				<xsl:if test="StockQuantity > 0">
					<a class="btn-buy background-main" href="#"
						onclick="AjaxCart.addproducttocart_catalog(this);return false;">
						<xsl:attribute name="data-productid">
							<xsl:value-of select="ProductId" />
						</xsl:attribute>
						<img src="/Data/Sites/1/skins/default/img/cart-white.png" alt="Buy" />
					</a>
				</xsl:if>
			</div>
		</div>
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