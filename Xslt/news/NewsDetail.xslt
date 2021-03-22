<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes" />

  <xsl:template match="/NewsDetail">
    <div class="news-detail-wrap">
      <h1 class="news-detail-title fz-20 text-blue font-bold mb-2 leading-snug">
        <xsl:value-of select="Title" />
        <xsl:value-of select="EditLink" disable-output-escaping="yes" />
      </h1>
      <div class="news-detail-meta flex justify-between items-center">
        <div class="news-detail-date text-dark-grey fz-14">
          <em class="ri-calendar-line fz-16"></em>
          <time>
            <xsl:value-of select="CreatedDate" />
          </time>
        </div>
        <div class="news-detail-social">
          <div class="fb-like" data-href="https://developers.facebook.com/docs/plugins/" data-width=""
            data-layout="button" data-action="like" data-size="small" data-share="true">
            <xsl:attribute name="data-href">
              <xsl:value-of disable-output-escaping="yes" select="FullUrl"></xsl:value-of>
            </xsl:attribute>
          </div>
        </div>
      </div>
      <xsl:if test="floor(ShowOption div 1) mod 2 = 1">
        <div class="news-detail-toc mt-4">
          <ol data-toc="div.news-detail-content" data-toc-headings="h2,h3,h4"></ol>
        </div>
      </xsl:if>
      <div class="news-detail-content article-content pt-2">
        <xsl:choose>
          <xsl:when test="count(ProductRelated) > 0 or count(ProductRelated2) > 0">
            <xsl:value-of select="BriefContent" disable-output-escaping="yes" />
            <xsl:if test="count(ProductRelated) > 0">
              <div class="news-detail-middle-product-slider">
                <div class="swiper-container">
                  <div class="swiper-wrapper">
                    <xsl:apply-templates select="ProductRelated" />
                  </div>
                  <div class="swiper-navigation">
                    <div class="swiper-btn swiper-btn-prev"><span class="ri-arrow-left-line"></span></div>
                    <div class="swiper-btn swiper-btn-next"><span class="ri-arrow-right-line"></span></div>
                  </div>
                </div>
              </div>
            </xsl:if>
            <xsl:value-of select="FullContent" disable-output-escaping="yes" />
            <xsl:if test="count(ProductRelated2) > 0">
              <div class="news-detail-promo-product mt-2">
                <h2 class="section-title text-blue">Sản phẩm ưu đãi trong chương trình </h2>
                <div class="product-list product-slider" data-slides="4">
                  <div class="swiper-container">
                    <div class="swiper-wrapper">
                      <xsl:apply-templates select="ProductRelated2" />
                    </div>
                    <div class="swiper-navigation">
                      <div class="swiper-btn swiper-btn-prev"><span class="ri-arrow-left-line"></span></div>
                      <div class="swiper-btn swiper-btn-next"><span class="ri-arrow-right-line"></span></div>
                    </div>
                  </div>
                </div>
              </div>
            </xsl:if>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="FullContent" disable-output-escaping="yes" />
          </xsl:otherwise>
        </xsl:choose>
        <xsl:if test="count(Tags) > 0">
          <div class="news-tags">
            <span class="text-blue font-bold fz-18 block mb-1">Tag: </span>
            <ul>
              <xsl:apply-templates select="Tags" />
            </ul>
          </div>
        </xsl:if>
      </div>
    </div>
              <div class="fb-comments-section">
                <div class="fb-comments" data-width="" data-numposts="5">
                    <xsl:attribute name='data-href'>
                      <xsl:value-of select='/NewsDetail/FullUrl'></xsl:value-of>
                    </xsl:attribute> 
                </div> 
              </div> 
    <div class="news-detail-comment-section news-detail-wrap mt-4">
      <h2 class="section-title text-blue mb-2">Bình luận</h2>
      <p class="text-dark-grey">Chia sẻ bình luận của bạn về bài viết này</p>
    </div>
    <xsl:if test="count(NewsOther)>0">
      <div class="news-detail-other position-relative">
        <div class="news-detail-other-heading mb-3 flex items-center">
          <h2 class="other-title text-main fz-18 font-bold text-uppercase">
            <xsl:value-of select="NewsOtherText" />
          </h2>
        </div>
        <div class="news-slider news-list">
          <div class="swiper-container">
            <div class="swiper-wrapper">
              <xsl:apply-templates select="NewsOther" />
            </div>
          </div>
          <div class="swiper-navigation">
            <div class="swiper-btn swiper-btn-prev news-slider-prev"><span class="ri-arrow-left-line"></span></div>
            <div class="swiper-btn swiper-btn-next news-slider-next"><span class="ri-arrow-right-line"></span></div>
          </div>
        </div>
      </div>
    </xsl:if>
  </xsl:template>


  <xsl:template match="Tags">
    <li>
      <a>
        <xsl:attribute name="href">
          <xsl:value-of select="Url"></xsl:value-of>
        </xsl:attribute>
        <xsl:attribute name="title">
          <xsl:value-of select="Tag"></xsl:value-of>
        </xsl:attribute>
        <xsl:value-of select="Tag"></xsl:value-of>
      </a>
    </li>
  </xsl:template>

  <xsl:template match="ProductRelated2">

    <div class="swiper-slide">
      <div class="product-item">
        <a class="product-img" href="#">
          <xsl:attribute name="href">
            <xsl:value-of select="Url"></xsl:value-of>
          </xsl:attribute>
          <xsl:attribute name="title">
            <xsl:value-of select="Title"></xsl:value-of>
          </xsl:attribute>
          <img class="swiper-lazy" data-src="./img/product/1.png">
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
              <xsl:value-of select="Promotion[floor(Option div 1) mod 2 = 1]/DiscountPrice"></xsl:value-of>
            </strong>
          </div>
        </xsl:if>
        <xsl:if test="StockQuantity > 0">
          <a class="btn-buy background-main" href="#" onclick="AjaxCart.addproducttocart_catalog(this);return false;">
            <xsl:attribute name="data-productid">
              <xsl:value-of select="ProductId" />
            </xsl:attribute>
            <img src="/Data/Sites/1/skins/default/img/cart-white.png" alt="Buy" />
          </a>
        </xsl:if>
      </div>
    </div>
  </xsl:template>
  <xsl:template match="ProductRelated">
    <div class="swiper-slide">
      <div class="news-detail-product flex items-center">
        <div class="img">
          <a>
            <xsl:attribute name="href">
              <xsl:value-of select="Url"></xsl:value-of>
            </xsl:attribute>
            <xsl:attribute name="title">
              <xsl:value-of select="Title"></xsl:value-of>
            </xsl:attribute>
            <img class="swiper-lazy">
            <xsl:attribute name="data-src">
              <xsl:value-of select="ImageUrl"></xsl:value-of>
            </xsl:attribute>
            </img>
          </a>
        </div>
        <div class="caption leading-snug">
          <div class="title font-bold">
            <a href="#">
              <xsl:attribute name="href">
                <xsl:value-of select="Url"></xsl:value-of>
              </xsl:attribute>
              <xsl:attribute name="title">
                <xsl:value-of select="Title"></xsl:value-of>
              </xsl:attribute>
              <xsl:value-of select="Title"></xsl:value-of>
            </a>
          </div>
          <div class="price text-main fz-18 font-bold">210.000 đ</div>
          <xsl:if
            test="count(Promotion[floor(Option div 1) mod 2 = 1])>0 and Promotion[floor(Option div 1) mod 2 = 1]/DiscountPrice!=''">
            <div class="vn-price fz-14 font-bold mb-1">
              Giá VnPay:
              <span class="text-main">
                <xsl:value-of select="Promotion[floor(Option div 1) mod 2 = 1]/DiscountPrice"></xsl:value-of>
              </span>
            </div>
          </xsl:if>
          <div class="text fz-14">
            <xsl:value-of select="BriefContent" disable-output-escaping="yes" />
          </div>
        </div>
      </div>
    </div>
  </xsl:template>
  <xsl:template match="NewsOther">
    <div class="swiper-slide">
      <div class="news-item small-news">
        <div class="news-image">
          <a>
            <xsl:attribute name="target">
              <xsl:value-of select="Target" />
            </xsl:attribute>
            <xsl:attribute name="href">
              <xsl:value-of select="Url" />
            </xsl:attribute>
            <img class="swiper-lazy" src="data:image/gif;base64,R0lGODlhAQABAAD/ACwAAAAAAQABAAACADs=">
            <xsl:attribute name="data-src">
              <xsl:value-of select="ImageUrl" />
            </xsl:attribute>
            <xsl:attribute name="alt">
              <xsl:value-of select="Title" disable-output-escaping="yes" />
            </xsl:attribute>
            </img>
          </a>
        </div>
        <div class="news-caption leading-snug">
          <div class="news-title fz-18 font-bold mb-1">
            <a>
              <xsl:attribute name="target">
                <xsl:value-of select="Target" />
              </xsl:attribute>
              <xsl:attribute name="href">
                <xsl:value-of select="Url" />
              </xsl:attribute>
              <xsl:value-of select="Title" />
            </a>
          </div>
          <div class="news-brief text-dark-grey mb-1">
            <xsl:value-of select="BriefContent" disable-output-escaping="yes" />
          </div>
          <a class="news-view-more font-bold fz-14 text-blue" href="#">
            <xsl:attribute name="target">
              <xsl:value-of select="Target" />
            </xsl:attribute>
            <xsl:attribute name="href">
              <xsl:value-of select="Url" />
            </xsl:attribute>
            <xsl:text>Xem thêm</xsl:text>
          </a>
        </div>
      </div>
    </div>
  </xsl:template>

  <!--<xsl:template match="NewsAttributes" mode="tabs">
    <li>
      <a>
        <xsl:attribute name="href">
          <xsl:text>#tab</xsl:text>
          <xsl:value-of select="position()"/> 
        </xsl:attribute>
        <xsl:value-of select="Title"/> 
      </a>
    </li>
  </xsl:template>
  <xsl:template match="NewsAttributes" mode="tabcontent">
    <div class="tab-content">
      <xsl:attribute name="id">
        <xsl:text>tab</xsl:text>
        <xsl:value-of select="position()"/> 
      </xsl:attribute>
      <xsl:value-of select="Content" disable-output-escaping="yes"/> 
    </div>
  </xsl:template>
  <xsl:template match="NewsImages">
    <li>
      <a>
        <xsl:attribute name="href">
          <xsl:value-of select="ImageUrl"/> 
        </xsl:attribute>
        <xsl:attribute name="title">
          <xsl:value-of select="Title"/> 
        </xsl:attribute>
        <img width="80" height="71">
          <xsl:attribute name="src">
            <xsl:value-of select="ImageUrl"/> 
          </xsl:attribute>
          <xsl:attribute name="alt">
            <xsl:value-of select="Title"/> 
          </xsl:attribute>
        </img>
      </a>
    </li>
  </xsl:template>-->
</xsl:stylesheet>