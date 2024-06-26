<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [
  <!ENTITY nbsp "&#160;">
  <!ENTITY ndash "&#8211;">
  <!ENTITY mdash "&#8212;">
]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl" />
	<xsl:include href="AddHeader.xsl" />
	<xsl:include href="CommonPathRef.xsl" />
	<xsl:include href="AddOnTable.xsl" />
	<xsl:include href="IRS8992ScheduleAStyle.xsl" />
	<xsl:output method="html" indent="yes" />
	<xsl:strip-space elements="*" />
	<xsl:param name="FormData" select="$RtnDoc/IRS8992ScheduleA" />
	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html lang="EN-US">
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge" />
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($FormData)" />
					</xsl:call-template>
				</title>
				<!-- No Browser Caching -->
				<meta http-equiv="Pragma" content="no-cache" />
				<meta http-equiv="Cache-Control" content="no-cache" />
				<meta http-equiv="Expires" content="0" />
				<!-- No Proxy Caching -->
				<meta http-equiv="Cache-Control" content="private" />
				<!-- Define Character Set -->
				<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
				<meta name="Description" content="IRS Form 8992 Schedule A" />
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript" />
				<xsl:call-template name="InitJS" />
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS8992ScheduleAStyle" />
						<xsl:call-template name="AddOnStyle" />
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm" />
			</head>
			<body class="styBodyClass">
				<form id="Form8992SchB">
					<xsl:call-template name="DocumentHeaderLandscape" />
					<!-- Page 1 -->
					<!-- Header -->
					<div class="styStdDivLS">
						<div class="styFNBox" style="width:35mm;height:19mm;">
							<span class="styFN" style="font-size:9pt;">SCHEDULE A<br />(Form 8992)</span> 
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData" />
							</xsl:call-template>
							<br />
							(December 2021)<br />
							<span class="styAgency" style="padding-top:1mm;">
								Department of the Treasury
								<br />
								Internal Revenue Service
							</span>
						</div>
						<div class="styFTBox" style="width:186mm;height:19mm;">
							<span class="styFMT" style="font-size:11pt;padding-top:1mm;">
								Schedule of Controlled Foreign Corporation (CFC) Information to Compute Global Intangible Low-Taxed Income (GILTI)
							</span>
							<br /><br />
							<span style="font-weight:bold;padding-top:1mm;">
								&#9658;Go to
								<a style="text-decoration:none;color:black;" href="http://www.irs.gov/Form8992" title="Link to IRS.gov">
					<i>www.irs.gov/Form8992</i>
					</a>
								for instructions and the latest information.
							</span>
						</div>
						<div class="styTYBox" style="width:35mm;height:19mm;">
							<div class="styOMB" style="height:9mm;font-size:6pt;padding-top:3mm;padding-bottom:3mm;">OMB No. 1545-0123</div>
							<div style="margin-left:0mm;text-align:left;font-size:7pt;padding-top:2mm;">
								Attachment<br/>Sequence No. 
								<span class="styBoldText" style="font-size:9pt;">992A</span>
							</div>
						</div>
					</div>
					
					<!-- Filer information section -->
					<div class="styStdDivLS" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styNameBox" style="width:200mm;">
							Name of person filing this schedule<br />
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
							</xsl:call-template>
							<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
							</xsl:call-template>
							<br></br>
						</div>

						<div class="styEINBox" style="width:56mm;padding-left:1mm;font-weight:normal;">
							<strong>A</strong>&nbsp;&nbsp;&nbsp;Identifying Number<br />
							<xsl:call-template name="PopulateReturnHeaderFilerTIN"/>
						</div>
						
					</div>
					<div class="styStdDivLS" style="border-bottom:1px solid black;">
						<div class="styNameBox" style="width:200mm;">
							Name of U.S. shareholder<br />
							
							<xsl:choose>
								<xsl:when test="$FormData/ShareholderBusinessName">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/ShareholderBusinessName/BusinessNameLine1Txt"/>
									</xsl:call-template>
									<xsl:if test="$FormData/ShareholderBusinessName/BusinessNameLine2Txt">
										<br />
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/ShareholderBusinessName/BusinessNameLine2Txt"/>
										</xsl:call-template>
									</xsl:if>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/ShareholderPersonNm"/>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</div>

						<div class="styEINBox" style="width:56mm;padding-left:1mm;font-weight:normal;">
							<strong>B</strong>&nbsp;&nbsp;&nbsp;Identifying Number <br />
							
							<xsl:choose>
								<xsl:when test="$FormData/EIN">
									<xsl:call-template name="PopulateEIN">
										<xsl:with-param name="TargetNode" select="$FormData/EIN"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:when test="$FormData/MissingEINReasonCd">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/MissingEINReasonCd"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="PopulateSSN">
										<xsl:with-param name="TargetNode" select="$FormData/SSN"/>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</div>
						
					</div>
					
					
					
					<div class="styStdDivLS" style="border-bottom:1px solid black;">
						<div style="width:44.2mm;float:left;">&nbsp;</div>
						<div style="width:172.3mm;height:10mm;text-align:center;float:left;border-left:1px solid black;padding-top:1.5mm;">
							<strong>Calculations for Net Tested Income</strong><br />(see instructions)
						</div>
						<div style="width:5mm;height:5mm;float:left;text-align:right;">
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$FormData/USShrCalcGILTIGrp"/>
								<xsl:with-param name="containerID" select=" 'SchATable' "/>
								<xsl:with-param name="headerHeight" select="1"/>
								<xsl:with-param name="containerHeight" select="10"/>
							</xsl:call-template>
						</div>
						<div style="width:34.5mm;height:10mm;text-align:center;font-weight:bold;float:left;border-left:2px solid black;">
							GILTI Allocated to <br /> Tested Income CFCs <br /> <span style="font-weight:normal;">(see instructions)</span>
						</div>
					</div>
					<!-- Table 1, cols (a)-(e) -->
					<xsl:variable name="shouldSeparate" select="($Print = $Separated) and (count($FormData/USShrCalcGILTIGrp) &gt; 10)"/>
					<div class="styStdDivLS" style="" id="SchATable">
						<xsl:call-template name="SetInitialState"/>
						<table style="display:table;border-collapse:collapse;">
							<thead class="styTableThead">
								<tr>
									<th class="styTableCellHeader" scope="col" style="min-width:22mm;width:30.4mm;font-weight:normal;">
										<span style="font-weight:bold;">(a) </span> <br /> Name of CFC
									</th>
									<th class="styTableCellHeader" scope="col" style="width:14mm;font-weight:normal;">
										<span style="font-weight:bold;">(b) </span> <br />
										EIN or <br /> Reference ID
									</th>
									<th class="styTableCellHeader" scope="col" style="width:21.5mm;font-weight:normal;">
										<span style="font-weight:bold;">(c) </span> <br />
										Tested Income
									</th>
									<th class="styTableCellHeader" scope="col" style="width:23.3mm;min-width:23.3mm;font-weight:normal;">
										<span style="font-weight:bold;">(d) </span> <br />
										Tested Loss
									</th>
									<th class="styTableCellHeader" scope="col" style="width:21.5mm;font-weight:normal;">
										<span style="font-weight:bold;">(e) </span> <br />
										Pro Rata Share <br /> of Tested <br /> Income
									</th>
									<th class="styTableCellHeader" scope="col" style="width:23.3mm;min-width:23.3mm;font-weight:normal;">
										<span style="font-weight:bold;">(f) </span> <br />
										Pro Rata Share <br /> of Tested <br /> Loss
									</th>
									<th class="styTableCellHeader" scope="col" style="width:21.4mm;font-weight:normal;">
										<span style="font-weight:bold;">(g) </span> <br />
										Pro Rata Share <br /> of Qualified <br /> Business Asset <br /> Investment <br /> (QBAI)
									</th>
									<th class="styTableCellHeader" scope="col" style="width:23.3mm;min-width:23.3mm;font-weight:normal;">
										<span style="font-weight:bold;">(h) </span> <br />
										Pro Rata Share <br /> of Tested <br /> Loss QBAI <br /> Amount
									</th>
									<th class="styTableCellHeader" scope="col" style="width:21.5mm;font-weight:normal;">
										<span style="font-weight:bold;">(i) </span> <br />
										Pro Rata Share <br /> of Tested <br /> Interest <br /> Income
									</th>
									<th class="styTableCellHeader" scope="col" style="width:21.5mm;font-weight:normal;border-right-width:2px;">
										<span style="font-weight:bold;">(j) </span> <br />
										Pro Rata Share <br /> of Tested <br /> Interest <br /> Expense
									</th>
									<th class="styTableCellHeader" scope="col" style="width:12.5mm;font-weight:normal;">
										<span style="font-weight:bold;">(k) </span> <br /> <span style="font-family:Arial;">
										GILTI <br /> Allocation <br /> Ratio <br /> (Divide <br /> Col. (e) by <br /> Col. (e), <br /> Line 1 <br /> Total)</span>
									</th>
									<th class="styTableCellHeader" scope="col" style="width:21.5mm;font-weight:normal;border-right-width:0px;">
										<span style="font-weight:bold;">(l) </span> <br />
										GILTI Allocated to Tested Income CFCs (Multiply Form 8992, Part II, Line 5, by Col. (k))
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:if test="not($shouldSeparate)">
									<xsl:for-each select="$FormData/USShrCalcGILTIGrp">
										<tr style="vertical-align:top;font-size:6pt;">
											<td class="styTableCellTextInherit" style="">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="CFCName/BusinessNameLine1Txt"/>
												</xsl:call-template>
												<xsl:if test="CFCName/BusinessNameLine2Txt"><br />
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="CFCName/BusinessNameLine2Txt"/>
													</xsl:call-template>
												</xsl:if>
											</td>
											<td class="styTableCellCtrInherit">
												<xsl:choose>
													<xsl:when test="MissingEINReasonCd">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="MissingEINReasonCd"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateEIN">
															<xsl:with-param name="TargetNode" select="EIN"/>
														</xsl:call-template>
													</xsl:otherwise>
												</xsl:choose>
												<xsl:call-template name="LinkToLeftoverDataTableInline">
													<xsl:with-param name="Desc">Schedule A, row <xsl:value-of select="position()"/> - Foreign Entity Reference IDs</xsl:with-param>
													<xsl:with-param name="TargetNode" select="ForeignEntityIdentificationGrp"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="NetTestedIncomeAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateNegativeNumber">
													<xsl:with-param name="TargetNode" select="NetTestedLossAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="ProRataShareCFCTestedIncmAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateNegativeNumber">
													<xsl:with-param name="TargetNode" select="ProRataShrNetTestedLossAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="ProRataShareQBAIAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateNegativeNumber">
													<xsl:with-param name="TargetNode" select="ProRataShrTestedLossQBAIAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="ProRataShrTestedIntIncomeAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="border-right-width:2px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="ProRataShrTestedIntExpenseAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="GILTIAllocationRt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="border-right-width:0px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="GILTIAllocTestedIncmCFCAmt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="$shouldSeparate or count($FormData/USShrCalcGILTIGrp) &lt; 1">
									<tr style="vertical-align:top;">
										<td class="styTableCellTextInherit" style="">
											<xsl:call-template name="PopulateAdditionalDataTableMessage">
												<xsl:with-param name="TargetNode" select="$FormData/USShrCalcGILTIGrp"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtrInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">(<span style="width:20mm;"/>)</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">(<span style="width:20mm;"/>)</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">(<span style="width:20mm;"/>)</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="border-right-width:2px;">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
								<xsl:if test="$shouldSeparate or count($FormData/USShrCalcGILTIGrp) &lt; 10">
									<xsl:call-template name="FillTableCols">
										<xsl:with-param name="LineNumber" select="1 + count($FormData/USShrCalcGILTIGrp)"/>
										<xsl:with-param name="SepMessage" select="$shouldSeparate"/>
									</xsl:call-template>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<xsl:if test="not($shouldSeparate)">
						<xsl:call-template name="SetInitialDynamicTableHeight">
							<xsl:with-param name="TargetNode" select="$FormData/USShrCalcGILTIGrp"/>
							<xsl:with-param name="containerID" select=" 'SchATable' "/>
							<xsl:with-param name="headerHeight" select="1"/>
							<xsl:with-param name="containerHeight" select="10"/>
						</xsl:call-template>
					</xsl:if>
					<div class="styStdDivLS" style="font-size:6pt;">
						<div class="styLNDesc" style="width:44.3mm;font-size:7pt;">
							<strong>1. </strong> Totals (see instructions)
							<span class="sty8992DotLn">..</span>
						</div>
						<div class="styLNAmountBoxNBB" style="width:21.49mm;padding-right:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalNetTestedIncomeAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBoxNBB" style="width:23.3mm;padding-right:1px;">
							<xsl:call-template name="PopulateNegativeNumber">
								<xsl:with-param name="TargetNode" select="$FormData/TotalNetTestedLossAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBoxNBB" style="width:21.50mm;padding-right:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotProRataShrCFCTestedIncmAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBoxNBB" style="width:23.29mm;padding-right:1px;">
							<xsl:call-template name="PopulateNegativeNumber">
								<xsl:with-param name="TargetNode" select="$FormData/TotProRataShrNetTestedLossAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBoxNBB" style="width:21.45mm;padding-right:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalProRataShareQBAIAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBoxNBB" style="width:23.30mm;padding-right:1px;">
							<xsl:call-template name="PopulateNegativeNumber">
								<xsl:with-param name="TargetNode" select="$FormData/TotProRataShrTestedLossQBAIAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBoxNBB" style="width:21.5mm;padding-right:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotProRataShrTestedIntIncmAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBoxNBB" style="width:21.4mm;padding-right:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotProRataShrTestedIntExpnsAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBoxNBB" style="width:12.6mm;padding-right:1px;border-left-width:2px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalGILTIAllocationRt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBoxNBB" style="width:21.5mm;padding-right:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotGILTIAllocTestedIncmCFCAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDivLS" style="font-weight:bold;border-top:1px solid black;">
						Totals on line 1 should include the totals from any continuation sheets.
					</div>
					
					
					<div class="styStdDivLS pageEnd" style="border-top:2px solid black;">
						<span style="float:left;"><strong> For Paperwork Reduction Act Notice, see the Instructions for Form 8992.</strong></span>
						<span style="position:absolute; left:500px;"> Cat. No. 71396P</span>
						<span style="float:right;"><strong>Schedule A (Form 8992) (Rev. 12-2021)</strong></span>
					</div>
					<!-- Additonal Data Title Bar and Button -->
					<div class="styLeftOverTitleLineLandscape" id="LeftoverData">
						<div class="styLeftOverTitle">
						   Additional Data        
						</div>
						<div class="styLeftOverButtonContainerLandscape">
							<input class="styLeftoverTableBtn" type="button" TabIndex="-1" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
					<!-- Additional Data Table -->
					<table class="styLeftOverTbl">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$FormData"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
					</table>
					<!-- Sch A separated table -->
					<xsl:if test="$shouldSeparate">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Schedule A - U.S. Shareholder Calculation of Global Intangible Low-Taxed Income (GILTI)</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;width:256mm;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="min-width:24mm;width:30.4mm;font-weight:normal;">
										<span style="font-weight:bold;">(a) </span> <br /> Name of CFC
									</th>
									<th class="styDepTblCell" scope="col" style="width:14mm;font-weight:normal;">
										<span style="font-weight:bold;">(b) </span> <br />
										EIN or <br /> Reference ID
									</th>
									<th class="styDepTblCell" scope="col" style="width:21.5mm;font-weight:normal;">
										<span style="font-weight:bold;">(c) </span> <br />
										Tested Income
									</th>
									<th class="styDepTblCell" scope="col" style="width:23.3mm;min-width:23.3mm;font-weight:normal;">
										<span style="font-weight:bold;">(d) </span> <br />
										Tested Loss
									</th>
									<th class="styDepTblCell" scope="col" style="width:21.5mm;font-weight:normal;">
										<span style="font-weight:bold;">(e) </span> <br />
										Pro Rata Share <br /> of Tested <br /> Income
									</th>
									<th class="styDepTblCell" scope="col" style="width:23.3mm;min-width:23.3mm;font-weight:normal;">
										<span style="font-weight:bold;">(f) </span> <br />
										Pro Rata Share <br /> of Tested <br /> Loss
									</th>
									<th class="styDepTblCell" scope="col" style="width:21.4mm;font-weight:normal;">
										<span style="font-weight:bold;">(g) </span> <br />
										Pro Rata Share <br /> of Qualified <br /> Business Asset <br /> Investment <br /> (QBAI)
									</th>
									<th class="styDepTblCell" scope="col" style="width:23.3mm;min-width:23.3mm;font-weight:normal;">
										<span style="font-weight:bold;">(h) </span> <br />
										Pro Rata Share <br /> of Tested <br /> Loss QBAI <br /> Amount
									</th>
									<th class="styDepTblCell" scope="col" style="width:21.5mm;font-weight:normal;">
										<span style="font-weight:bold;">(i) </span> <br />
										Pro Rata Share <br /> of Tested <br /> Interest <br /> Income
									</th>
									<th class="styDepTblCell" scope="col" style="width:21.5mm;font-weight:normal;border-right-width:2px;">
										<span style="font-weight:bold;">(j) </span> <br />
										Pro Rata Share <br /> of Tested <br /> Interest <br /> Expense
									</th>
									<th class="styDepTblCell" scope="col" style="width:12.5mm;font-weight:normal;">
										<span style="font-weight:bold;">(k) </span> <br /> <span style="font-family:Arial;">
										GILTI <br /> Allocation <br /> Ratio <br /> (Divide <br /> Col. (e) by <br /> Col. (e), <br /> Line 1 <br /> Total)</span>
									</th>
									<th class="styDepTblCell" scope="col" style="width:21.5mm;font-weight:normal;">
										<span style="font-weight:bold;">(l) </span> <br />
										GILTI Allocated to Tested Income CFCs (Multiply Form 8992, Part II, Line 5, by Col. (k))
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/USShrCalcGILTIGrp">
									<tr style="border-color:black;font-size:6pt;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellTextInherit" style="">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="CFCName/BusinessNameLine1Txt"/>
											</xsl:call-template>
											<xsl:if test="CFCName/BusinessNameLine2Txt"><br />
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="CFCName/BusinessNameLine2Txt"/>
												</xsl:call-template>
											</xsl:if>
										</td>
										<td class="styTableCellCtrInherit">
											<xsl:choose>
												<xsl:when test="MissingEINReasonCd">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="MissingEINReasonCd"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="PopulateEIN">
														<xsl:with-param name="TargetNode" select="EIN"/>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
											<xsl:call-template name="LinkToLeftoverDataTableInline">
												<xsl:with-param name="Desc">Schedule A, row <xsl:value-of select="position()"/> - Foreign Entity Reference IDs</xsl:with-param>
												<xsl:with-param name="TargetNode" select="ForeignEntityIdentificationGrp"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="NetTestedIncomeAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateNegativeNumber">
												<xsl:with-param name="TargetNode" select="NetTestedLossAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ProRataShareCFCTestedIncmAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateNegativeNumber">
												<xsl:with-param name="TargetNode" select="ProRataShrNetTestedLossAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ProRataShareQBAIAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateNegativeNumber">
												<xsl:with-param name="TargetNode" select="ProRataShrTestedLossQBAIAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ProRataShrTestedIntIncomeAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="border-right-width:2px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ProRataShrTestedIntExpenseAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="GILTIAllocationRt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="GILTIAllocTestedIncmCFCAmt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<xsl:for-each select="$FormData/USShrCalcGILTIGrp">
						<xsl:if test="ForeignEntityIdentificationGrp">
							<br /><br />
							<span class="styRepeatingDataTitle">Schedule A, row <xsl:value-of select="position()"/> - Foreign Entity Reference IDs</span><br />
							<table class="styDepTbl" cellspacing="0" style="font-size:7pt;width:100mm;">
								<tbody>
									<xsl:for-each select="ForeignEntityIdentificationGrp">
										<tr style="border-color:black;">
											<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
											<td class="styTableCell" style="text-align:left;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ForeignEntityReferenceIdNum"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</tbody>
							</table>
						</xsl:if>
					</xsl:for-each>
					<br/>
					
					<br/>
				</form>
			</body>
		</html>
	</xsl:template>
	
	<xsl:template name="FillTableCols">
		<xsl:param name="LineNumber"/>
		<xsl:param name="SepMessage" select="false()"/>
		<xsl:param name="MaxLine" select="10"/>
		<tr>
			<td class="styTableCellTextInherit">&nbsp;</td>
			<td class="styTableCellCtrInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit">(<span style="width:20mm;"/>)</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit">(<span style="width:20mm;"/>)</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit">(<span style="width:20mm;"/>)</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit" style="border-right-width:2px;">&nbsp;</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
		</tr>
		<xsl:choose>
			<xsl:when test="$SepMessage">
				<xsl:call-template name="FillTableCols">
					<xsl:with-param name="LineNumber" select="3"/>
					<xsl:with-param name="SepMessage" select="false()"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="$LineNumber &lt; $MaxLine">
				<xsl:call-template name="FillTableCols">
				<xsl:with-param name="LineNumber" select="$LineNumber + 1"/>
					<xsl:with-param name="MaxLine" select="$MaxLine"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise/>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>
