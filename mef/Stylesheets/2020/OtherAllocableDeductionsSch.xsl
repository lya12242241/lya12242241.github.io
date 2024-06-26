<?xml version="1.0" encoding="UTF-8"?>
<!-- 06/01/2021 - Created new dependency file - Jeremy Nichols -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

	<xsl:output method="html" indent="yes" />
	<xsl:strip-space elements="*" /> 

	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>

	<xsl:param name="DependencyData" select="$RtnDoc/OtherAllocableDeductionsSch" />

	<xsl:template name="ShowDependencyData">
		<!-- Add stylesheet dependency code here -->
		<div class="styTopSectionLine">
			<div class="styTopSectionLineLbl" style="float:left">
				Corporation name:
			</div>
			<div class="styExplanationLine" style="float:left">
				<xsl:call-template name="PopulateText">
				<xsl:with-param name="TargetNode" select="$DependencyData/CorporationName/BusinessNameLine1Txt" />
			  </xsl:call-template>
			  <br/>
			  <xsl:call-template name="PopulateText">
				<xsl:with-param name="TargetNode" select="$DependencyData/CorporationName/BusinessNameLine2Txt" />
			  </xsl:call-template>
			</div>
		</div>
		<div class="styTopSectionLine">
			<div class="styTopSectionLineLbl" style="float:left">
				Separate category code:
			</div>
			<div class="styExplanationLine" style="float:left">
				<xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="$DependencyData/SeparateCategoryCd"/>
				</xsl:call-template>
			</div>
		</div>
		<div class="styTopSectionLine">
			<div class="styTopSectionLineLbl" style="float:left">
				Sanctioned country code:
			</div>
			<div class="styExplanationLine" style="float:left">
				<xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="$DependencyData/SanctionedCountryCd"/>
				</xsl:call-template>
			</div>
		</div>
		<div class="styTopSectionLine">
			<div class="styTopSectionLineLbl" style="float:left">
				Treaty country code:
			</div>
			<div class="styExplanationLine" style="float:left">
				<xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="$DependencyData/TreatyCountryCd"/>
				</xsl:call-template>
			</div>
		</div>
		<div class="styTopSectionLine">
			<div class="styTopSectionLineLbl" style="float:left">
				Foreign Corporation EIN:
			</div>
			<div class="styExplanationLine" style="float:left">
				<xsl:choose>
					<xsl:when test="normalize-space($DependencyData/ForeignCorpMissingEINReasonCd) != ''">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$DependencyData/ForeignCorpMissingEINReasonCd"/>
						</xsl:call-template>
					</xsl:when>
					<xsl:otherwise>
						<xsl:call-template name="PopulateEIN">
							<xsl:with-param name="TargetNode" select="$DependencyData/ForeignCorporationEIN"/>
						</xsl:call-template> 
					</xsl:otherwise>
				</xsl:choose>
			</div>
		</div>
		<div class="styTopSectionLine">
			<div class="styTopSectionLineLbl" style="float:left">
				Foreign branch or qualified business unit (QBU) code:
			</div>
			<div class="styExplanationLine" style="float:left"><br/>
				<xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="$DependencyData/ForeignBranchOrQBUCd"/>
				</xsl:call-template>
			</div>
		</div>
		<xsl:choose>
			<xsl:when test="normalize-space($DependencyData/ForeignCorpMissingEINReasonCd) != ''">
				<div class="styTopSectionLine">
					<div class="styTopSectionLineLbl" style="float:left">
						Foreign country or U.S. possession code:
					</div>
					<div class="styExplanationLine" style="float:left"><br/>
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$DependencyData/ForeignCountryOrUSPossessionCd"/>
						</xsl:call-template>
					</div>
				</div>
			</xsl:when>
			<xsl:when test="normalize-space($DependencyData/ForeignCorpMissingEINReasonCd) != ''">
				<div class="styTopSectionLine">
					<div class="styTopSectionLineLbl" style="float:left">
						Foreign country or U.S. possession code:
					</div>
					<div class="styExplanationLine" style="float:left"><br/>
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$DependencyData/ForeignCountryOrUSPossessionCd"/>
						</xsl:call-template>
					</div>
				</div>
			</xsl:when>
			<xsl:when test="normalize-space($DependencyData/ForeignCorpMissingEINReasonCd) != ''">
				<div class="styTopSectionLine">
					<div class="styTopSectionLineLbl" style="float:left">
						Foreign country or U.S. possession code:
					</div>
					<div class="styExplanationLine" style="float:left"><br/>
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$DependencyData/ForeignCountryOrUSPossessionCd"/>
						</xsl:call-template>
					</div>
				</div>
			</xsl:when>
			<xsl:when test="normalize-space($DependencyData/ForeignCorpMissingEINReasonCd) != ''">
				<div class="styTopSectionLine">
					<div class="styTopSectionLineLbl" style="float:left">
						Foreign country or U.S. possession code:
					</div>
					<div class="styExplanationLine" style="float:left"><br/>
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$DependencyData/ForeignCountryOrUSPossessionCd"/>
						</xsl:call-template>
					</div>
				</div>
			</xsl:when>
			<xsl:when test="normalize-space($DependencyData/ForeignCorpMissingEINReasonCd) != ''">
				<div class="styTopSectionLine">
					<div class="styTopSectionLineLbl" style="float:left">
						Foreign country or U.S. possession code:
					</div>
					<div class="styExplanationLine" style="float:left"><br/>
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$DependencyData/ForeignCountryOrUSPossessionCd"/>
						</xsl:call-template>
					</div>
				</div>
			</xsl:when>
			<xsl:when test="normalize-space($DependencyData/ForeignCorpMissingEINReasonCd) != ''">
				<div class="styTopSectionLine">
					<div class="styTopSectionLineLbl" style="float:left">
						Foreign country or U.S. possession code:
					</div>
					<div class="styExplanationLine" style="float:left"><br/>
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$DependencyData/ForeignCountryOrUSPossessionCd"/>
						</xsl:call-template>
					</div>
				</div>
			</xsl:when>
			<xsl:when test="normalize-space($DependencyData/ForeignCorpMissingEINReasonCd) != ''">
				<div class="styTopSectionLine">
					<div class="styTopSectionLineLbl" style="float:left">
						Foreign country or U.S. possession code:
					</div>
					<div class="styExplanationLine" style="float:left"><br/>
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$DependencyData/ForeignCountryOrUSPossessionCd"/>
						</xsl:call-template>
					</div>
				</div>
			</xsl:when>
			<xsl:otherwise>
				<div class="styTopSectionLine">
					<div class="styTopSectionLineLbl" style="float:left">
						Foreign country or U.S. possession code:
					</div>
					<div class="styExplanationLine" style="float:left"><br/>
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$DependencyData/ForeignCountryOrUSPossessionCd"/>
						</xsl:call-template>
					</div>
				</div> 
			</xsl:otherwise>
		</xsl:choose>
		<div class="styTopSectionLine">
			<div class="styTopSectionLineLbl" style="float:left">
				Section 986c loss amount:
			</div>
			<div class="styExplanationLine" style="float:left">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$DependencyData/Section986cLossAmt"/>
				</xsl:call-template>
			</div>
		</div>
		<div class="styTopSectionLine">
			<div class="styTopSectionLineLbl" style="float:left">
				Section 987 loss amount:
			</div>
			<div class="styExplanationLine" style="float:left">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$DependencyData/Section987LossAmt"/>
				</xsl:call-template>
			</div>
		</div>
		<div class="styTopSectionLine">
			<div class="styTopSectionLineLbl" style="float:left">
				Section 988 loss amount:
			</div>
			<div class="styExplanationLine" style="float:left">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$DependencyData/Section988LossAmt"/>
				</xsl:call-template>
			</div>
		</div>
		<div class="styTopSectionLine">
			<div class="styTopSectionLineLbl" style="float:left">
				Other income loss amount:
			</div>
			<div class="styExplanationLine" style="float:left">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$DependencyData/OtherIncomeLossAmt"/>
				</xsl:call-template>
			</div>
		</div>
		<div class="styTopSectionLine">
			<div class="styTopSectionLineLbl" style="float:left">
				Other income loss description:
			</div>
			<div class="styExplanationLine" style="float:left">
				<xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="$DependencyData/OtherIncomeLossAmt/@otherIncomeLossDesc"/>
				</xsl:call-template>
			</div>
		</div>
	</xsl:template>

	<xsl:param name="depDocTitle">
		<xsl:call-template name="PopulateDisplayName"><xsl:with-param name="TargetNode" select="$DependencyData" /></xsl:call-template>
	</xsl:param>

	<!-- Main template -->
	<xsl:template match="/">
		<html>
			<head>
				<title><xsl:value-of select="$depDocTitle" /></title>

				<!-- No Browser Caching -->
				<meta http-equiv="Pragma" content="no-cache" />
				<meta http-equiv="Cache-Control" content="no-cache" />
				<meta http-equiv="Expires" content="0" />
				<!-- No Proxy Caching -->
				<meta http-equiv="Cache-Control" content="private" />
				<!-- Define Character Set -->
				<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
				<meta name="Description" content= "{$depDocTitle}" />

				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"></script>
				<xsl:call-template name="InitJS"></xsl:call-template>

				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="AddOnStyle"></xsl:call-template>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesDep"/>
			</head>
			<body class="styBodyClass" >
				<xsl:call-template name="DocumentHeaderDependency"></xsl:call-template>
				<div class="styDepTitleLine">
					<span class="styDepTitle" style="">
						<xsl:value-of select="$depDocTitle" />
					</span>
				</div>
				<!--Adding template for left over data  -->
				<xsl:call-template name="PopulateDepCommonLeftover"><xsl:with-param name="TargetNode" select="$DependencyData" /></xsl:call-template>
				<xsl:call-template name="ShowDependencyData" />
				<br/>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>