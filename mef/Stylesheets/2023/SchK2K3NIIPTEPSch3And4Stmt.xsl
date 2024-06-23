<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:param name="DependencyData" select="$RtnDoc/SchK2K3NIIPTEPSch3And4Stmt"/>
	<xsl:template name="ShowDependencyData">
	
		<!-- Add stylesheet dependency code here -->
		
		<!--Added Header Elements start here-->
		<div class="styTopSectionLine">
			<div class="styTopSectionLineLbl" style="float:left">
				Partnership or Corporation EIN:
			</div>
			<div class="styExplanationLine" style="float:left">
				<xsl:choose>
				<xsl:when test="$DependencyData/PartnershipEIN">
					<xsl:call-template name="PopulateEIN">
						<xsl:with-param name="TargetNode" select="$DependencyData/PartnershipEIN"/>
					</xsl:call-template>
				</xsl:when>
				<xsl:otherwise>
					<xsl:call-template name="PopulateEIN">
						<xsl:with-param name="TargetNode" select="$DependencyData/CorporationEIN"/>
					</xsl:call-template>
				</xsl:otherwise>
			</xsl:choose>
			</div>
		</div>
		<div class="styTopSectionLine">
			<div class="styTopSectionLineLbl" style="float:left">
				Name of Partnership or Corporation:
			</div>
			<div class="styExplanationLine" style="float:left">
				<xsl:choose>
				<xsl:when test="$DependencyData/PartnershipName">
					<xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="$DependencyData/PartnershipName/BusinessNameLine1Txt"/>
				</xsl:call-template>
				<xsl:if test="$DependencyData/PartnershipName/BusinessNameLine2Txt">
					<br />
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$DependencyData/PartnershipName/BusinessNameLine2Txt"/>
					</xsl:call-template>
				</xsl:if>
				</xsl:when>
				<xsl:otherwise>
					<xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="$DependencyData/CorporationName/BusinessNameLine1Txt"/>
				</xsl:call-template>
				<xsl:if test="$DependencyData/CorporationName/BusinessNameLine2Txt">
					<br />
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$DependencyData/CorporationName/BusinessNameLine2Txt"/>
					</xsl:call-template>
				</xsl:if>
				</xsl:otherwise>
			</xsl:choose>
			</div>
		</div>
		
		<div class="styTopSectionLine">
			<div class="styTopSectionLineLbl" style="float:left">
				Partner or Shareholder TIN:
			</div>
			<div class="styExplanationLine" style="float:left">
				<xsl:choose>
				<xsl:when test="$DependencyData/PartnerEIN">
					<xsl:call-template name="PopulateEIN">
						<xsl:with-param name="TargetNode" select="$DependencyData/PartnerEIN"/>
					</xsl:call-template>
				</xsl:when>
				<xsl:when test="$DependencyData/PartnerSSN">
					<xsl:call-template name="PopulateSSN">
						<xsl:with-param name="TargetNode" select="$DependencyData/PartnerSSN"/>
					</xsl:call-template>
				</xsl:when>
				<xsl:when test="$DependencyData/ShareholderEIN">
					<xsl:call-template name="PopulateEIN">
						<xsl:with-param name="TargetNode" select="$DependencyData/ShareholderEIN"/>
					</xsl:call-template>
				</xsl:when>
				<xsl:otherwise>
					<xsl:call-template name="PopulateSSN">
						<xsl:with-param name="TargetNode" select="$DependencyData/ShareholderSSN"/>
					</xsl:call-template>
				</xsl:otherwise>
			</xsl:choose>	
			</div>
		</div>
		
		<div class="styTopSectionLine">
			<div class="styTopSectionLineLbl" style="float:left">
				Name of Partner or Shareholder:
			</div>
			<div class="styExplanationLine" style="float:left">
			<xsl:choose>
				<xsl:when test="$DependencyData/PartnerName">
					<xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="$DependencyData/PartnerName/BusinessNameLine1Txt"/>
				</xsl:call-template>
				<xsl:if test="$DependencyData/PartnerName/BusinessNameLine2Txt">
					<br />
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$DependencyData/PartnerName/BusinessNameLine2Txt"/>
					</xsl:call-template>
				</xsl:if>
				</xsl:when>
				<xsl:when test="$DependencyData/PartnerPersonNm">
					<xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="$DependencyData/PartnerPersonNm"/>
				</xsl:call-template>
				</xsl:when>
				<xsl:when test="$DependencyData/ShareholderName">
					<xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="$DependencyData/ShareholderName/BusinessNameLine1Txt"/>
				</xsl:call-template>
				<xsl:if test="$DependencyData/ShareholderName/BusinessNameLine2Txt">
					<br />
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$DependencyData/ShareholderName/BusinessNameLine2Txt"/>
					</xsl:call-template>
				</xsl:if>
				</xsl:when>
				<xsl:otherwise>
					<xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="$DependencyData/ShareholderPersonNm"/>
				</xsl:call-template>
				</xsl:otherwise>
			</xsl:choose>
			</div>
	
		</div>
		
		<!--End of header-->

		<p style="text-align:left; font-size: 8pt; font-weight: bold" >Schedule 3</p>

		<table id="INOLDTbl" class="styDepTbl" style="font-size:7pt; width:256mm;">
			<thead class="styTableThead">
				<tr class="styDepTblHdr">
					<th class="styDepTblCell" scope="col" style="width:100mm;">(a) Name of distributing foreign corporation</th>
					<th class="styDepTblCell" scope="col" style="width:25mm;">(b) EIN or reference ID number</th>
					<th class="styDepTblCell" scope="col" style="width:25mm;">(c) Date of distribution</th>
					<th class="styDepTblCell" scope="col" style="width:12mm;">(d) Functional currency of distributing foreign corporation</th>
					<th class="styDepTblCell" scope="col" style="width:30mm;">(e) Amount of NII PTEP in functional currency</th>
					<th class="styDepTblCell" scope="col" style="width:32mm;">(f) Spot rate (functional currency to U.S. dollars)</th>
					<th class="styDepTblCell" scope="col" style="width:32mm;">(g) Amount of NII PTEP in U.S. dollars</th>
				</tr>
			</thead>
			<tbody>
				<xsl:for-each select="$DependencyData/SchK2K3NIIPTEPSch3Grp">
					<tr>
						<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
						<td class="styDepTblCell" style="text-align:left;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="DistributingForeignCorpName/BusinessNameLine1Txt"/>
							</xsl:call-template>
							<xsl:if test="DistributingForeignCorpName/BusinessNameLine2Txt">
								<br />
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="DistributingForeignCorpName/BusinessNameLine2Txt"/>
								</xsl:call-template>
							</xsl:if>
						</td>
						<td class="styDepTblCell" style="text-align:center; word-break:break-all;">
							<xsl:choose>
							<xsl:when test="ForeignEntityIdentificationGrp">
								<xsl:for-each select="ForeignEntityIdentificationGrp">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="ForeignEntityReferenceIdNum"/>
									</xsl:call-template>
									<xsl:if test="position() != last()"><br /></xsl:if>
								</xsl:for-each>
							</xsl:when>
							<xsl:otherwise>
								<xsl:call-template name="PopulateEIN">
									<xsl:with-param name="TargetNode" select="DistributingForeignCorpEIN"/>
								</xsl:call-template>
							</xsl:otherwise>
						</xsl:choose>
						</td>
						<td class="styDepTblCell" style="text-align:center;">
							<xsl:call-template name="PopulateMonthDayYear">
								<xsl:with-param name="TargetNode" select="DistributionDt"/>
							</xsl:call-template>
						</td>
						<td class="styDepTblCell" style="text-align:center;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="FunctionalCurrencyCd"/>
							</xsl:call-template>
						</td>
						<td class="styDepTblCell" style="text-align:right;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="DistributionFromEPFuncCurAmt"/>
							</xsl:call-template>
						</td>
						<td class="styDepTblCell" style="text-align:right;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="SpotRateRt"/>
							</xsl:call-template>
						</td>
						<td class="styDepTblCell" style="text-align:right;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="EPDistributionAmt"/>
							</xsl:call-template>
						</td>
					</tr>
				</xsl:for-each>
			</tbody>
		</table>
		<br></br>
		
		
		<!-- code for second table -->
		
		<p style="text-align:left; font-size: 8pt; font-weight: bold" >Schedule 4</p>

		<table id="INOLDTbl" class="styDepTbl" style="font-size:7pt; width:256mm;">
			<thead class="styTableThead">
				<tr class="styDepTblHdr">
					<th class="styDepTblCell" scope="col" style="width:103mm;">(a) Name of distributing foreign corporation</th>
					<th class="styDepTblCell" scope="col" style="width:20mm;">(b) EIN or reference ID number</th>
					<th class="styDepTblCell" scope="col" style="width:25mm;">(c) Date of distribution</th>
					<th class="styDepTblCell" scope="col" style="width:12mm;">(d) Functional currency of distributing foreign corporation</th>
					<th class="styDepTblCell" scope="col" style="width:32mm;">(e) Share of NII PTEP in functional currency</th>
					<th class="styDepTblCell" scope="col" style="width:32mm;">(f) Spot rate (functional currency to U.S. dollars)</th>
					<th class="styDepTblCell" scope="col" style="width:32mm;">(g) Share of NII PTEP in U.S. dollars</th>
				</tr>
			</thead>
			<tbody>
				<xsl:for-each select="$DependencyData/SchK2K3NIIPTEPSch4Grp">
					<tr>
						<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
						<td class="styDepTblCell" style="text-align:left;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="DistributingForeignCorpName/BusinessNameLine1Txt"/>
							</xsl:call-template>
							<xsl:if test="DistributingForeignCorpName/BusinessNameLine2Txt">
								<br />
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="DistributingForeignCorpName/BusinessNameLine2Txt"/>
								</xsl:call-template>
							</xsl:if>
						</td>
						<td class="styDepTblCell" style="text-align:center; word-break:break-all;">
							<xsl:choose>
							<xsl:when test="ForeignEntityIdentificationGrp">
								<xsl:for-each select="ForeignEntityIdentificationGrp">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="ForeignEntityReferenceIdNum"/>
									</xsl:call-template>
									<xsl:if test="position() != last()"><br /></xsl:if>
								</xsl:for-each>
							</xsl:when>
							<xsl:otherwise>
								<xsl:call-template name="PopulateEIN">
									<xsl:with-param name="TargetNode" select="DistributingForeignCorpEIN"/>
								</xsl:call-template>
							</xsl:otherwise>
						</xsl:choose>
						</td>
						<td class="styDepTblCell" style="text-align:center;">
							<xsl:call-template name="PopulateMonthDayYear">
								<xsl:with-param name="TargetNode" select="DistributionDt"/>
							</xsl:call-template>
						</td>
						<td class="styDepTblCell" style="text-align:center;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="FunctionalCurrencyCd"/>
							</xsl:call-template>
						</td>
						<td class="styDepTblCell" style="text-align:right;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="DistributionFromEPFuncCurAmt"/>
							</xsl:call-template>
						</td>
						<td class="styDepTblCell" style="text-align:right;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="SpotRateRt"/>
							</xsl:call-template>
						</td>
						<td class="styDepTblCell" style="text-align:right;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="EPDistributionAmt"/>
							</xsl:call-template>
						</td>
					</tr>
				</xsl:for-each>
			</tbody>
		</table>
		<xsl:text>,</xsl:text>
		
		
		
		
		
	</xsl:template>
	<xsl:param name="depDocTitle">
		<xsl:call-template name="PopulateDisplayName">
			<xsl:with-param name="TargetNode" select="$DependencyData"/>
		</xsl:call-template>
	</xsl:param>
	<!-- Main template -->
	<xsl:template match="/">
		<html>
			<head>
				<title>
					<xsl:value-of select="$depDocTitle"/>
				</title>
				<!-- No Browser Caching -->
				<meta http-equiv="Pragma" content="no-cache"/>
				<meta http-equiv="Cache-Control" content="no-cache"/>
				<meta http-equiv="Expires" content="0"/>
				<!-- No Proxy Caching -->
				<meta http-equiv="Cache-Control" content="private"/>
				<!-- Define Character Set -->
				<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
				<meta name="Description" content="{$depDocTitle}"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<!--<xsl:if test="not($Print) or $Print=''"> -->
					<xsl:call-template name="AddOnStyle"/>
					<!-- </xsl:if> -->
				</style>
				<xsl:call-template name="GlobalStylesDep"/>
			</head>
			<body class="styBodyClass">
				<xsl:call-template name="DocumentHeaderDependency"/>
				<div class="styDepTitleLine">
					<span class="styDepTitle" style="">
						<xsl:value-of select="$depDocTitle"/>
					</span>
				</div>
				<!--Adding template for left over data  -->
				<xsl:call-template name="PopulateDepCommonLeftover">
					<xsl:with-param name="TargetNode" select="$DependencyData"/>
				</xsl:call-template>
				<xsl:call-template name="ShowDependencyData"/>
				<br/>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
