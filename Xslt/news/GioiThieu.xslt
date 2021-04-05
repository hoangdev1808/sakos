<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />
	<xsl:template match="/ZoneList">
		<xsl:apply-templates select="Zone"></xsl:apply-templates>
	</xsl:template>
	<xsl:template match="Zone">
		<xsl:if test="position() = 1">
			<section class="section about-1">
				<xsl:attribute name="id">
					<xsl:text disable-output-escaping="yes">about-</xsl:text>
					<xsl:value-of select="position()" disable-output-escaping="yes"></xsl:value-of>
				</xsl:attribute>
				<xsl:attribute name="setBackground">
					<xsl:value-of select="ImageUrl" disable-output-escaping="yes"></xsl:value-of>
				</xsl:attribute>
				<div id="tool-option">
					<em class="ri-settings-5-line"></em>
				</div>
				<div class="catelogry"></div>
				<div id="breadcrumb"></div>
				<div class="container">
					<xsl:apply-templates select="News" mode="Sec1"></xsl:apply-templates>
				</div>
			</section>
		</xsl:if>
		<xsl:if test="position() = 2">
			<section class="section about-2">
				<xsl:attribute name="id">
					<xsl:text disable-output-escaping="yes">about-</xsl:text>
					<xsl:value-of select="position()" disable-output-escaping="yes"></xsl:value-of>
				</xsl:attribute>
				<div class="container">
					<div class="wrapper-history">
						<div class="swiper-container">
							<div class="swiper-wrapper">
								<xsl:apply-templates select="News" mode="Sec2"></xsl:apply-templates>
							</div>
						</div>
						<div class="swiper-button-next"></div>
						<div class="swiper-button-prev"></div>
					</div>
				</div>
			</section>
		</xsl:if>
		<xsl:if test="position() = 3">
			<section class="section about-3">
				<xsl:attribute name="id">
					<xsl:text disable-output-escaping="yes">about-</xsl:text>
					<xsl:value-of select="position()" disable-output-escaping="yes"></xsl:value-of>
				</xsl:attribute>
				<div class="hero-wrap d-flex">
					<xsl:apply-templates select="News" mode="Sec3"></xsl:apply-templates>
				</div>
			</section>
		</xsl:if>
		<xsl:if test="position() = 4">
			<section class="section about-4">
				<xsl:attribute name="id">
					<xsl:text disable-output-escaping="yes">about-</xsl:text>
					<xsl:value-of select="position()" disable-output-escaping="yes"></xsl:value-of>
				</xsl:attribute>
				<div class="container">
					<div class="hero-wrap mx-auto">
						<img class="lazyload">
							<xsl:attribute name="data-src">
								<xsl:value-of select="News/ImageUrl" disable-output-escaping="yes"></xsl:value-of>
							</xsl:attribute>
							<xsl:attribute name="alt">
								<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
							</xsl:attribute>
						</img>
					</div>
				</div>
			</section>
		</xsl:if>
		<xsl:if test="position() = 5">
			<section class="section about-5" id="about-5">
				<div class="container">
					<div class="section-title text-center">Tuyển dụng</div>
					<div class="hero-table">
						<table>
							<thead>
								<tr>
									<th colspan="2">vị trí tuyển dụng</th>
									<th>phòng ban</th>
									<th>nơi làm việc</th>
									<th>hạn nộp hồ sơ</th>
								</tr>
							</thead>
							<tbody>
								<xsl:apply-templates select="News" mode="Sec5"></xsl:apply-templates>
							</tbody>
						</table>
					</div>
					<div class="hero-list">
						<div class="row">
							<xsl:apply-templates select="News" mode="Mobile"></xsl:apply-templates>
						</div>
					</div>
				</div>
			</section>
		</xsl:if>
	</xsl:template>
	<xsl:template match="News" mode="Sec1">
		<div class="section-title">
			<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
		</div>
		<div class="wrap-content">
			<div class="desc">
				<xsl:value-of select="FullContent" disable-output-escaping="yes"></xsl:value-of>
			</div>
		</div>
		<div class="wrap-img">
			<a>
				<xsl:attribute name="href">
					<xsl:value-of select="BriefContent" disable-output-escaping="yes"></xsl:value-of>
				</xsl:attribute>
				<xsl:attribute name="data-fancybox">
					<xsl:text disable-output-escaping="yes">video</xsl:text>
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
				<div class="icon">
					<img src="/Data/Sites/1/skins/default/img/icons/video.png" />
				</div>
			</a>
		</div>
	</xsl:template>
	<xsl:template match="News" mode="Sec2">
		<div class="swiper-slide">
			<div class="swiper-inner">
				<div class="item-box">
					<div class="title">
						<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
					</div>
					<div class="wrap-content">
						<div class="subtitle">
							<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
						</div>
						<div class="content">
							<p>
								<xsl:value-of select="BriefContent" disable-output-escaping="yes"></xsl:value-of>
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</xsl:template>
	<xsl:template match="News" mode="Sec3">
		<div class="item">
			<div class="img">
				<img class="lazyload">
					<xsl:attribute name="data-src">
						<xsl:value-of select="ImageUrl" disable-output-escaping="yes"></xsl:value-of>
					</xsl:attribute>
					<xsl:attribute name="alt">
						<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
					</xsl:attribute>
				</img>
			</div>
			<a class="btn btn-catelog">
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
	</xsl:template>
	<xsl:template match="News" mode="Sec5">
		<tr class="toggle">
			<td colspan="2">
				<div class="title">
					<em class="material-icons">expand_more</em>
					<span>
						<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
					</span>
				</div>
			</td>
			<td>
				<xsl:value-of select="SubTitle" disable-output-escaping="yes"></xsl:value-of>
			</td>
			<td>
				<xsl:value-of select="BriefContent" disable-output-escaping="yes"></xsl:value-of>
			</td>
			<td>
				<xsl:value-of select="EndDate" disable-output-escaping="yes"></xsl:value-of>
			</td>
		</tr>
		<tr id="hiddenRow">
			<td colspan="6">
				<div class="wrap-content">
					<xsl:value-of select="FullContent" disable-output-escaping="yes"></xsl:value-of>
				</div>
			</td>
		</tr>
	</xsl:template>
	<xsl:template match="News" mode="Mobile">
		<div class="col-sm-6 col-md-6 col-lg-6">
			<div class="item">
				<div class="title">
					<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
				</div>
				<p>
					<em class="mdi mdi-account-group"></em>
					<span>
						Phòng ban:
						<xsl:value-of select="SubTitle" disable-output-escaping="yes"></xsl:value-of>
					</span>
				</p>
				<p>
					<em class="mdi mdi-clock-start"></em>
					<span>
						Nơi làm việc:
						<xsl:value-of select="BriefContent" disable-output-escaping="yes"></xsl:value-of>
					</span>
				</p>
				<p>
					<em class="mdi mdi-clock-end"></em>
					<span>
						Ngày hết hạn:
						<xsl:value-of select="Enđate" disable-output-escaping="yes"></xsl:value-of>
					</span>
				</p>
				<a class="btn-apply" href="">
					<span>Ứng Tuyển</span>
				</a>
				<a class="btn-view" href="javascript: ;">
					<span>Xem chi tiết</span>
				</a>
				<div class="wrap-content">
					<xsl:value-of select="FullContent" disable-output-escaping="yes"></xsl:value-of>
				</div>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>
