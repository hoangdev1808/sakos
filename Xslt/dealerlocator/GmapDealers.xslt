<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" version="1.0" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />
	<xsl:template match="/DealerList">
		<input type="hidden" id="hdnDealerLocatorSiteId">
			<xsl:attribute name="value">
				<xsl:value-of select="/DealerList/SiteId" />
			</xsl:attribute>
		</input>
		<input type="hidden" id="hdnDealerLocatorLanguageId">
			<xsl:attribute name="value">
				<xsl:value-of select="/DealerList/LanguageId" />
			</xsl:attribute>
		</input>
		<input type="hidden" id="hdnDealerLocatorZoneGuid" value="">
			<xsl:attribute name="value">
				<xsl:value-of select="/DealerList/ZoneGuid" />
			</xsl:attribute>
		</input>
		<input type="hidden" id="hdfDealerLocatorSelectCountry">
			<xsl:attribute name="value">
				<xsl:value-of select="/DealerList/SelectCountryText" />
			</xsl:attribute>
		</input>
		<input type="hidden" id="hdfDealerLocatorSelectProvince">
			<xsl:attribute name="value">
				<xsl:value-of select="/DealerList/SelectProvinceText" />
			</xsl:attribute>
		</input>
		<input type="hidden" id="hdfDealerLocatorSelectDistrict">
			<xsl:attribute name="value">
				<xsl:value-of select="/DealerList/SelectDistrictText" />
			</xsl:attribute>
		</input>
		<input type="hidden" id="hdfDealerLocatorSelectZone">
			<xsl:attribute name="value">
				<xsl:value-of select="/DealerList/SelectZoneText" />
			</xsl:attribute>
		</input>
		<input type="hidden" id="hdfDealerLocatorCulture">
			<xsl:attribute name="value">
				<xsl:value-of select="/DealerList/Culture" />
			</xsl:attribute>
		</input>
		<div class="hero-network d-flex">
			<div class="wrap-left">
				<div class="wrap-select">
					<div class="select-item">
						<div class="field form_desc" style="display:none;">
							<select class="form-select" id="ddlCountry" />
						</div>
						<select class="form-select" id="ddlProvince">
							<option value="">
								<xsl:value-of select="/DealerList/SelectProvinceText" />
							</option>
						</select>
					</div>
					<div class="select-item">
						<select class="form-select" id="ddlDistrict">
							<option value="">
								<xsl:value-of select="/DealerList/SelectDistrictText" />
							</option>
						</select>
					</div>
					<div class="button">
						<a class="btn btn-search-2" id="edit-submit">
							<xsl:attribute name="href">
								<xsl:text disable-output-escaping="yes">javascript: ;</xsl:text>
							</xsl:attribute>
							<xsl:attribute name="title">
								<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
							</xsl:attribute>
							<xsl:attribute name="target">
								<xsl:value-of select="Target" disable-output-escaping="yes"></xsl:value-of>
							</xsl:attribute>
							<xsl:text disable-output-escaping="yes">Tìm kiếm</xsl:text>
						</a>
						<!-- <button type="submit" id="edit-submit" class="btn-searchmap btn btn-about_us">
							<xsl:attribute name="value">
								<xsl:value-of select="/DealerList/SearchText"></xsl:value-of>
							</xsl:attribute>
							<xsl:text>Tìm kiếm</xsl:text>
						</button> -->
						<div class="mt-3 hidden">
							<input type="submit" id="edit-submit" class="btn-searchmap">
								<xsl:attribute name="value">
									<xsl:value-of select="/DealerList/SearchText" />
								</xsl:attribute>
							</input>
						</div>
						<div class="hidden">
							<div class="search-text">
								<label>
									<xsl:value-of select="/DealerList/OrText" />
								</label>
								<input type="text" maxlength="128" name="address" id="address" size="60" value="" class="form-text" autocomplete="off">
									<xsl:attribute name="placeholder">
										<xsl:value-of select="/DealerList/EnterLocationText" />
									</xsl:attribute>
								</input>
								<input type="submit" id="edit-submit" class="btn btn-large btn-primary">
									<xsl:attribute name="value">
										<xsl:value-of select="/DealerList/SearchText" />
									</xsl:attribute>
								</input>
							</div>
						</div>
						<div id="direction" class="find_address" style="display:none;">
							<div class="row mrb10">
								<div class="col-sm-2">
									<strong>
										<xsl:value-of select="/DealerList/FromText" />
									</strong>
								</div>
								<div class="col-sm-10">
									<input id="origin-direction" name="origin-direction" class="orides-txt" type="text" />
								</div>
							</div>
							<div class="row mrb20">
								<div class="col-sm-2">
									<strong>
										<xsl:value-of select="/DealerList/ToText" />
									</strong>
								</div>
								<div class="col-sm-10">
									<input id="dest-direction" name="dest-direction" class="orides-txt" type="text" />
								</div>
							</div>
							<div id="get-dir-button" class="get-dir-button">
								<input type="submit" id="get-direction" class="btn">
									<xsl:attribute name="value">
										<xsl:value-of select="/DealerList/FindText" />
									</xsl:attribute>
								</input>
								<a href="javascript:directionBack()">
									<xsl:value-of select="/DealerList/BackText" />
								</a>
							</div>
						</div>
					</div>
				</div>
				<div class="wrap-contact">
					<div id="ajax_msg" class="locate mrb15 hidden"></div>
					<ul class="result-list" id="list"></ul>
				</div>
			</div>
			<div class="wrap-right">
				<div class="wrap-map">
					<iframe id="mapiframe" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3919.259628736664!2d106.6855233152602!3d10.79141626186661!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x317528d29932a5d5%3A0x87ded78c0fd2786c!2zNDE4IEhhaSBCw6AgVHLGsG5nLCBUw6JuIMSQ4buLbmgsIFF14bqtbiAxLCBUaMOgbmggcGjhu5EgSOG7kyBDaMOtIE1pbmgsIFZpZXRuYW0!5e0!3m2!1sen!2s!4v1616646809077!5m2!1sen!2s" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
				</div>
			</div>
			<div id="results" class="hidden" style="display:none;">
				<div id="ajax_msg" class="locate mrb15 hidden"></div>
			</div>
		</div>
		<div id="map" class="hidden" style="display:none;">
			<input type="hidden" id="distance" name="distance" value="1" />
			<div id="map_canvas" class="map_system"></div>
		</div>
	</xsl:template>
</xsl:stylesheet>
