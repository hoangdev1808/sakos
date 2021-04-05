<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />
	<xsl:template match="/NewsDetail">
		<section class="section detail-page">
			<div class="container">
				<div class="row">
					<div class="col-lg-8 col-md-12">
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
								<a class="zalo">
									<img src="/Data/Sites/1/skins/default/img/news/zalo.png" />
								</a>
							</div>
						</div>
						<div class="wrap-content">
							<p>
								<xsl:value-of select="BriefContent" disable-output-escaping="yes"></xsl:value-of>
							</p>
							<xsl:value-of select="FullContent" disable-output-escaping="yes"></xsl:value-of>
						</div>
						<div class="wrap-comment">
							<div class="section-title">Bình luận</div>
							<div class="fb-comments" data-width="1000" data-numposts="2">
								<xsl:attribute name="data-href">
									<xsl:value-of select="FullUrl" disable-output-escaping="yes"></xsl:value-of>
								</xsl:attribute>
							</div>
						</div>
					</div>
					<div class="col-lg-4 col-md-12">
						<div class="wrap-right-main">
							<div class="color-text f-14 fw-700">Đăng ký để nhận khuyến mãi 30% khi mua hàng</div>
						</div>
						<div class="news-other">
							<div class="section-title">Tin tức - Sự kiện khác</div>
							<xsl:apply-templates select="NewsOther"></xsl:apply-templates>
						</div>
					</div>
				</div>
			</div>
		</section>
	</xsl:template>
	<xsl:template match="NewsOther">
		<div class="wrap-item">
			<div class="item">
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
				<div class="wrap-item__content">
					<time>
						<xsl:value-of select="CreatedDate" disable-output-escaping="yes"></xsl:value-of>
					</time>
					<a class="title">
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
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>
