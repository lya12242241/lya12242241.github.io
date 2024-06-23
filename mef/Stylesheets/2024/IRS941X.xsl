<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [
	<!ENTITY nbsp "&#160;"> 
	<!ENTITY mdash "&#8211;"> 
]>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS941XStyle.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<!-- Defines the stage of the data, e.g. original or latest -->
	<xsl:param name="FormData" select="$RtnDoc/IRS941X"/>
	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($FormData)"/>
					</xsl:call-template>
				</title>
				<!-- No Browser Caching -->
				<meta http-equiv="Pragma" content="no-cache"/>
				<meta http-equiv="Cache-Control" content="no-cache"/>
				<meta http-equiv="Expires" content="0"/>
				<!-- No Proxy Caching -->
				<meta http-equiv="Cache-Control" content="private"/>
				<!-- Define Character Set -->
				<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
				<meta name="Description" content="IRS Form 941-X"/>
				
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS941XStyle"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<xsl:variable name="Date">
				<xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="$RtnHdrData/QuarterEndingDt"/>
				</xsl:call-template>
			</xsl:variable>
			<body class="styBodyClass" style="width:187mm">
				<form name="IRS941X">
					<xsl:call-template name="DocumentHeader"/>
					<!-- BEGIN FORM HEADER -->
					<div class="" style="width:187mm;">
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData"/>
						</xsl:call-template>
						<br/>
						<div class="styFNBox" style="width:30mm;height:10mm;border:0px;">
							Form
							<span class="styFormNumber" style="font-size:15pt;">941-X:</span>
							<br />
							<div class="styFST" style="height:4mm;">
								<span class="styAgency" style="font-weight:normal">(Rev. April 2023)</span>
							</div>
						</div>
						<div class="styFTBox" style="width:156mm;text-align:left;height:10mm;">
							<div class="styMainTitle" style="font-size:12pt;padding-top:1mm;">
								Adjusted Employer's QUARTERLY Federal Tax Return or Claim for Refund
							</div>
							<div class="styFST" style="height:3mm;padding-left:18mm;">
								<span class="styAgency" style="font-weight:normal">Department of the Treasury &mdash; Internal Revenue Service</span>
							</div>
							<div class="" style="width:30mm;height:3mm;font-size:7pt;text-align:right;float:right;">OMB No. 1545-0029</div>
						</div>
						<div style="float:left;width:128mm;height:auto;">
							<div class="styBB" style="width:128mm;height:auto;float:left;border:black solid 1px;padding-top:2mm;padding-left:2mm;padding-right:2mm;padding-bottom:1mm;">
								<div style="width:124mm;padding-top:0mm;">
									<span style="float:left;padding-top:2mm;">
										<b>Employer identification number</b> (EIN)</span>
									<span class="styLNCtrNumBox" style="width:72mm;border-top-width:1px;padding-top:1mm;float:right;height:6mm;">
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">EIN</xsl:with-param>
											<xsl:with-param name="EINChanged">true</xsl:with-param>
										</xsl:call-template>
									</span>
								</div>
								<div style="width:124mm;height:16mm;padding-bottom:2mm;padding-top:2mm;">
									<span style="float:left;padding-top:4mm;">
										<b>Name</b>
										<i> (not your trade name)</i>
									</span>
									<span class="styLNCtrNumBox" style="width:86mm;border-top-width:1px;padding-left:1mm;float:right;text-align:left;height:auto;font-size:6pt;">
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
										</xsl:call-template>
										<br/>
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
										</xsl:call-template>
									</span>
								</div>
								<div style="width:124mm;min-height:9mm;">
									<span style="float:left;padding-top:4mm;">
										<b>Trade name</b>
										<i> (if any)</i>
									</span>
									<span class="styLNCtrNumBox" style="width:96mm;border-top-width:1px;padding-left:1mm;text-align:left;float:right;height:auto;font-size:6pt;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/TradeName/BusinessNameLine1Txt"/>
										</xsl:call-template>
										<br/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/TradeName/BusinessNameLine2Txt"/>
										</xsl:call-template>
									</span>
								</div>
								<div style="width:124mm;padding-bottom:0mm;padding-top:2mm;">
									<span style="width:14mm;height:28mm;float:left;padding-top:2mm;font-weight:bold;">Address</span>
									<span class="styLNCtrNumBox" style="width:110mm;height:7mm;float:right;border-top-width:1px;padding-top:.5mm;padding-left:1mm;text-align:left;">
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">AddressLine1Txt</xsl:with-param>
										</xsl:call-template>
										<br />
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">AddressLine2Txt</xsl:with-param>
										</xsl:call-template>
									</span>
									<span style="width:108mm;font-size:6pt;padding-left:3mm;">
										Number<span style="width:16mm"/>Street<span style="width:50mm;"/>Suite or room number
									</span>
									<span class="styLNCtrNumBox" style="width:66mm;border-top-width:1px;padding-top:1mm;height:6mm;text-align:left;padding-left:1mm;">
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">CityNm</xsl:with-param>
										</xsl:call-template>
									</span>
									<span class="styLNCtrNumBox" style="width:2.5mm;float:left;border:none"/>
									<span class="styLNCtrNumBox" style="width:13mm;border-top-width:1px;padding-top:1mm;height:6mm;">
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">StateAbbreviationCd</xsl:with-param>
										</xsl:call-template>
									</span>
									<span class="styLNCtrNumBox" style="width:2.5mm;float:left;border:none"/>
									<span class="styLNCtrNumBox" style="width:26mm;border-top-width:1px;padding-top:1mm;height:6mm;">
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">ZIPCd</xsl:with-param>
										</xsl:call-template>
									</span>
									<div style="width:110mm;font-size:6pt;padding-left:3mm;">
										<span style="width:66mm;">City</span>
										<span style="width:13mm;text-align:center;">State</span>
										<span style="width:24mm;text-align:center;">ZIP code</span>
									</div>
									<div style="width:110mm;">
										<span class="styLNCtrNumBox" style="width:52mm;height:6.5mm;border-top-width:1px;padding-top:1mm;text-align:left;padding-left:1mm;word-wrap:break-word;">
											<xsl:call-template name="PopulateReturnHeaderFiler">
												<xsl:with-param name="TargetNode">CountryCd</xsl:with-param>
											</xsl:call-template>
										</span>
										<span class="styLNCtrNumBox" style="width:2.5mm;float:left;border:none"/>
										<span class="styLNCtrNumBox" style="width:29mm;border-top-width:1px;padding-top:1mm;height:6.5mm;word-wrap:break-word;">
											<xsl:call-template name="PopulateReturnHeaderFiler">
												<xsl:with-param name="TargetNode">ProvinceOrStateNm</xsl:with-param>
											</xsl:call-template>
										</span>
										<span class="styLNCtrNumBox" style="width:2.5mm;float:left;border:none"/>
										<span class="styLNCtrNumBox" style="width:24mm;border-top-width:1px;height:6.5mm;word-wrap:break-word;">
											<xsl:call-template name="PopulateReturnHeaderFiler">
												<xsl:with-param name="TargetNode">ForeignPostalCd</xsl:with-param>
											</xsl:call-template>
										</span>
									</div>
									<div style="width:110mm;font-size:6pt;">
										<span style="width:53mm;padding-left:3mm;">Foreign country name</span>
										<span style="width:31mm;text-align:center;">Foreign province/county</span>
										<span style="width:26mm;text-align:center;padding-left:0mm;">Foreign postal code</span>
									</div>
								</div>
							</div>
							<div style="width:100%;height:auto;padding-top:0.5mm;padding-bottom:0.5mm;text-align:justify;">
								Read the separate instructions before completing this form. Use this form to correct errors you 
								made on Form 941 or 941-SS. Use a separate Form 941-X for each quarter that needs 
								correction. Type or print within the boxes. You MUST complete all five pages. Don't attach this 
								form to Form 941 or 941-SS unless you're reclassifying workers; see the instructions for line 42.
							</div>
							<div class="styBB" style="width:100%;border-top-width:1px;float:none;">
								<div class="styPartName" style="width:13mm;text-align:center;height:4mm;padding-top:0mm;">Part 1:</div>
								<div class="styPartDesc" style="width:111mm;text-align:left;height:auto;padding-top:0mm;padding-left:2mm;font-family:Arial Narrow;font-size:9pt;">
									Select ONLY one process. See page 6 for additional guidance, including information on how to treat employment tax credits and social security tax deferrals.
								</div>
							</div>
							<!-- Line 1 -->
							<div class="styStdDiv" style="width:100%;">
								<div class="styLNLeftNumBox" style="text-align:center;">
									<input type="checkbox" class="styCkboxNM" style="" alt="Adjusted Employment Tax Return">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/AdjustedEmploymentTaxRetInd"/>
											<xsl:with-param name="BackupName">F941XAdjustedEmploymentTaxRetInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</div>
								<div class="styLNLeftNumBox">1.</div>
								<div class="styLNDesc" style="width:111.5mm;height:auto;">
									<strong>Adjusted employment tax return. </strong> Check this box if you underreported tax amounts. 
									Also check this box if you overreported tax amounts and you would like to use the 
									adjustment process to correct the errors. You must check this box if you're correcting 
									both underreported and overreported tax amounts on this form. The amount shown on 
									line 27, if less than zero, may only be applied as a credit to your Form 941, Form 941-SS, 
									or Form 944 for the tax period in which you're filing this form.
								</div>
							</div>
							<!-- Line 2 -->
							<div class="styStdDiv" style="width:100%;">
								<div class="styLNLeftNumBox" style="text-align:center;">
									<input type="checkbox" class="styCkboxNM" style="" alt="Claim">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/ClaimInd"/>
											<xsl:with-param name="BackupName">F941XClaimInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</div>
								<div class="styLNLeftNumBox">2.</div>
								<div class="styLNDesc" style="width:111.5mm;height:auto;">
									<strong>Claim. </strong> Check this box if you overreported tax amounts only and you would like to use 
									the claim process to ask for a refund or abatement of the amount shown on line 27. 
									Don't check this box if you're correcting ANY underreported tax amounts on this form.
								</div>
							</div>
 						</div>
						<div style="width:56mm;float:right;padding-right:2mm;">
							<div class="styBB" style="width:54mm;height:auto;border-left-width:1px;border-right-width:1px;border-top-width:1px;padding-left:2mm;padding-top:2mm;">
								<div class="styPartName" style="width:49mm;height:auto;text-align:left;padding-left:1mm;padding-top:0.4mm;padding-bottom:0.4mm;font-family:Arial;font-size:10pt;">
									Return You're Correcting...<br/>
								</div>
								<div style="width:49mm;float:none;clear:both;font-weight:bold;border-bottom:1px solid black;padding-top:0.5mm;padding-bottom:1.5mm;">
									<span style="font-family:Arial Narrow;font-size:8pt;">Check the type of return you're correcting.</span>
									<div style="width:49mm;padding-top:0.5mm;float:none;clear:both;">
										<input type="checkbox" alt="941 Correction" class="styCkbox">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$FormData/Form941CorrectionInd"/>
												<xsl:with-param name="BackupName">IRS941Form941CorrectionInd</xsl:with-param>
											</xsl:call-template>
										</input>
										<b>941</b>
									</div>
									<div style="width:49mm;">
										<div style="float:left;clear:none;padding-top:0.5mm;">
											<input type="checkbox" alt="941 SS Correction" class="styCkbox">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="$FormData/Form941SSCorrectionInd"/>
													<xsl:with-param name="BackupName">IRS941Form941SSCorrectionInd</xsl:with-param>
												</xsl:call-template>
											</input>
											<b>941-SS</b>
										</div>
									</div>
								</div>
								<div style="width:49mm;float:none;clear:both;border-bottom:1px solid black;padding-top:0.5mm;padding-bottom:1.5mm;">
									<span style="font-family:Arial Narrow;font-size:8pt;font-weight:bold;">Check the ONE quarter you're correcting.</span>
									<div style="width:49mm;padding-top:0.5mm;float:none;clear:both;">
										<input type="checkbox" alt="First Quarter" class="styCkbox">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$FormData/Qtr1CorrectionInd"/>
												<xsl:with-param name="BackupName">IRS941Qtr1CorrectionInd</xsl:with-param>
											</xsl:call-template>
										</input>
										<b>1:</b> January, February, March 
									</div>
									<div style="width:49mm;">
										<div style="float:left;clear:none;padding-top:0.5mm;">
											<input type="checkbox" alt="Second Quarter" class="styCkbox">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="$FormData/Qtr2CorrectionInd"/>
													<xsl:with-param name="BackupName">IRS941Qtr2CorrectionInd</xsl:with-param>
												</xsl:call-template>
											</input>
											<b>2:</b> April, May, June
										</div>
									</div>
									<div style="width:49mm;">
										<div style="float:left;clear:none;padding-top:0.5mm;">
											<input type="checkbox" alt="Third Quarter" class="styCkbox">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="$FormData/Qtr3CorrectionInd"/>
													<xsl:with-param name="BackupName">IRS941Qtr3CorrectionInd</xsl:with-param>
												</xsl:call-template>
											</input>
											<b>3:</b> July, August, September
										</div>
									</div>
									<div style="width:49mm;">
										<div style="float:left;clear:none;padding-top:0.5mm;">
											<input type="checkbox" alt="Fourth Quarter" class="styCkbox">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="$FormData/Qtr4CorrectionInd"/>
													<xsl:with-param name="BackupName">IRS941Qtr4CorrectionInd</xsl:with-param>
												</xsl:call-template>
											</input>
											<b>4:</b> October, November, December
										</div>
									</div>
								</div>
								<div style="width:49mm;float:none;clear:both;padding-top:0.5mm;padding-bottom:1.5mm;">
									<span style="font-weight:bold;">Enter the calendar year of the quarter you're correcting.</span><br />
									<span style="height:4mm;width:24mm;border:1px solid black;padding:0.5mm;text-align:center;margin-right:2mm;margin-top:0.5mm;">
										<xsl:call-template name="PopulateYear">
											<xsl:with-param name="TargetNode" select="$FormData/CorrectingReturnCalendarYrCd"/>
										</xsl:call-template>
									</span>
									(YYYY)
								</div>
							</div>
							<div class="styBB" style="width:54mm;height:auto;border-width:1px;padding-left:1mm;padding-top:2mm;padding-bottom:2mm;margin-top:4mm;">
								<div class="styPartName" style="width:52mm;height:auto;text-align:left;padding-left:1mm;padding-top:0.4mm;padding-bottom:0.4mm;font-family:Arial;font-size:8pt;">
									Enter the date you discovered errors.
								</div>
								<span style="height:4mm;width:28mm;border:1px solid black;padding:0.5mm;text-align:center;margin-right:2mm;margin-top:1.5mm;">
									<xsl:call-template name="PopulateMonthDayYear">
										<xsl:with-param name="TargetNode" select="$FormData/ErrorsDiscoveredDt"/>
									</xsl:call-template>
								</span><br />
								(MM / DD / YYYY)
							</div>
						</div>
					</div>
					<div class="styBB" style="width:187mm;border-top-width:1px;float:none;">
						<div class="styPartName" style="width:13mm;padding-top:0mm;">Part 2:</div>
						<div class="styPartDesc" style="width:173.9mm;padding-top:0mm;padding-left:2mm;">Complete the certifications.</div>
					</div>
					<!-- Line 3 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox" style="text-align:center;">
							<input type="checkbox" class="styCkboxNM" style="" alt="Filed W2 or W2C">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/FiledW2W2cCorrWageTaxCertInd"/>
									<xsl:with-param name="BackupName">F941XFiledW2W2cCorrWageTaxCertInd</xsl:with-param>
								</xsl:call-template>
							</input>
						</div>
						<div class="styLNLeftNumBox">3.</div>
						<div class="styLNDesc" style="width:170mm;height:auto;font-weight:bold;">
							I certify that I've filed or will file Forms W-2, Wage and Tax Statement, or Forms W-2c, Corrected Wage and Tax Statement, as required.
						</div>
					</div>
					<div class="styStdDiv">
						<div class="styLNLeftNumBox" style="text-align:center;">&nbsp;</div>
						<div class="styLNDesc" style="width:178mm;height:auto;">
							<strong>Note: </strong> If you're correcting underreported tax amounts only, go to Part 3 on page 2 and skip lines 4 and 5. If you're correcting overreported 
							tax amounts, for purposes of the certifications on lines 4 and 5, Medicare tax doesn't include Additional Medicare Tax. Form 941-X can't be 
							used to correct overreported amounts of Additional Medicare Tax unless the amounts weren't withheld from employee wages or an 
							adjustment is being made for the current year.
						</div>
					</div>
					<!-- Line 4 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox" style="text-align:center;">&nbsp;</div>
						<div class="styLNLeftNumBox">4.</div>
						<div class="styLNDesc" style="width:170mm;height:auto;">
							<strong>If you checked line 1 because you're adjusting overreported federal income tax, social security tax, Medicare tax, or Additional 
							Medicare Tax, check all that apply.</strong> You must check at least one box.
							<br /> I certify that:
						</div>
					</div>
					<!-- Line 4a -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">&nbsp;</div>
						<div class="styLNLeftNumBox" style="text-align:center;">
							<input type="checkbox" class="styCkboxNM" style="" alt="Repaid or Reimbursed employees overcollected taxes">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/RpdOrReimbEmplShrTxsCYPYInd"/>
									<xsl:with-param name="BackupName">F941XRpdOrReimbEmplShrTxsCYPYInd</xsl:with-param>
								</xsl:call-template>
							</input>
						</div>
						<div class="styLNLeftNumBox">a.</div>
						<div class="styLNDesc" style="width:162mm;height:auto;">
							I repaid or reimbursed each affected employee for the overcollected federal income tax or Additional Medicare Tax for the current 
							year and the overcollected social security tax and Medicare tax for current and prior years. For adjustments of employee social 
							security tax and Medicare tax overcollected in prior years, I have a written statement from each affected employee stating that they haven't 
							claimed (or the claim was rejected) and won't claim a refund or credit for the overcollection.
						</div>
					</div>
					<!-- Line 4b -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">&nbsp;</div>
						<div class="styLNLeftNumBox" style="text-align:center;">
							<input type="checkbox" class="styCkboxNM" style="" alt="Adjusted Social Security / Medicare Taxes for Employer's Share Only">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/AdjSSTMedcrTxEmplrShrInd"/>
									<xsl:with-param name="BackupName">F941XAdjSSTMedcrTxEmplrShrInd</xsl:with-param>
								</xsl:call-template>
							</input>
						</div>
						<div class="styLNLeftNumBox">b.</div>
						<div class="styLNDesc" style="width:162mm;height:auto;">
							The adjustments of social security tax and Medicare tax are for the employer's share only. I couldn't find the affected employees or 
							each affected employee didn't give me a written statement that they haven't claimed (or the claim was rejected) and won't 
							claim a refund or credit for the overcollection.
						</div>
					</div>
					<!-- Line 4c -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">&nbsp;</div>
						<div class="styLNLeftNumBox" style="text-align:center;">
							<input type="checkbox" class="styCkboxNM" style="" alt="Adjusted Non withheld taxes">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/AdjNotWthldFedSSMedcrTaxInd"/>
									<xsl:with-param name="BackupName">F941XAdjNotWthldFedSSMedcrTaxInd</xsl:with-param>
								</xsl:call-template>
							</input>
						</div>
						<div class="styLNLeftNumBox">c.</div>
						<div class="styLNDesc" style="width:162mm;height:auto;">
							The adjustment is for federal income tax, social security tax, Medicare tax, or Additional Medicare Tax that I didn't withhold from employee wages.
						</div>
					</div>
					<!-- Line 5 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox" style="text-align:center;">&nbsp;</div>
						<div class="styLNLeftNumBox">5.</div>
						<div class="styLNDesc" style="width:170mm;height:auto;">
							<strong>If you checked line 2 because you're claiming a refund or abatement of overreported federal income tax, social security tax, 
							Medicare tax, or Additional Medicare Tax, check all that apply.</strong> You must check at least one box.
							<br /> I certify that:
						</div>
					</div>
					<!-- Line 5a -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">&nbsp;</div>
						<div class="styLNLeftNumBox" style="text-align:center;">
							<input type="checkbox" class="styCkboxNM" style="" alt="Claim Repaid or Reimbursed employees overcollected taxes">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/RpdReimbSSTMedcrTxPYNotClmInd"/>
									<xsl:with-param name="BackupName">F941XRpdReimbSSTMedcrTxPYNotClmInd</xsl:with-param>
								</xsl:call-template>
							</input>
						</div>
						<div class="styLNLeftNumBox">a.</div>
						<div class="styLNDesc" style="width:162mm;height:auto;">
							I repaid or reimbursed each affected employee for the overcollected social security tax and Medicare tax. For claims of employee 
							social security tax and Medicare tax overcollected in prior years, I have a written statement from each affected employee stating 
							they haven't claimed (or the claim was rejected) and won't claim a refund or credit for the overcollection.
						</div>
					</div>
					<!-- Line 5b -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">&nbsp;</div>
						<div class="styLNLeftNumBox" style="text-align:center;">
							<input type="checkbox" class="styCkboxNM" style="" alt="Written Consent from Employees for Claim">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/WrttnCnsntSSTMedcrEmpNotClmInd"/>
									<xsl:with-param name="BackupName">F941XWrttnCnsntSSTMedcrEmpNotClmInd</xsl:with-param>
								</xsl:call-template>
							</input>
						</div>
						<div class="styLNLeftNumBox">b.</div>
						<div class="styLNDesc" style="width:162mm;height:auto;">
							I have a written consent from each affected employee stating that I may file this claim for the employee's share of social security 
							tax and Medicare tax. For refunds of employee social security tax and Medicare tax overcollected in prior years, I also have a 
							written statement from each affected employee stating that they haven't claimed (or the claim was rejected) and won't claim a 
							refund or credit for the overcollection.
						</div>
					</div>
					<!-- Line 5c -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">&nbsp;</div>
						<div class="styLNLeftNumBox" style="text-align:center;">
							<input type="checkbox" class="styCkboxNM" style="" alt="Claim Social Security / Medicare Taxes for Employer's Share Only">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/SSTMedcrTxEmplrShrNotClmInd"/>
									<xsl:with-param name="BackupName">F941XSSTMedcrTxEmplrShrNotClmInd</xsl:with-param>
								</xsl:call-template>
							</input>
						</div>
						<div class="styLNLeftNumBox">c.</div>
						<div class="styLNDesc" style="width:162mm;height:auto;">
							The claim for social security tax and Medicare tax is for the employer's share only. I couldn't find the affected employees, or each 
							affected employee didn't give me a written consent to file a claim for the employee's share of social security tax and Medicare tax, 
							or each affected employee didn't give me a written statement that they haven't claimed (or the claim was rejected) and won't 
							claim a refund or credit for the overcollection.
						</div>
					</div>
					<!-- Line 5d -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">&nbsp;</div>
						<div class="styLNLeftNumBox" style="text-align:center;">
							<input type="checkbox" class="styCkboxNM" style="" alt="Claim Non withheld taxes">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/NotWthldFedSSMedcrTaxClmInd"/>
									<xsl:with-param name="BackupName">F941XNotWthldFedSSMedcrTaxClmInd</xsl:with-param>
								</xsl:call-template>
							</input>
						</div>
						<div class="styLNLeftNumBox">d.</div>
						<div class="styLNDesc" style="width:162mm;height:auto;">
							The claim is for federal income tax, social security tax, Medicare tax, or Additional Medicare Tax that I didn't withhold from employee wages.
						</div>
					</div>
					<div class="pageEnd" style="width:187mm;border-top:2px solid black;">
						<span style="float:left;clear:none;font-weight:bold;">For Paperwork Reduction Act Notice, see the separate instructions.</span>
						<span style="float:left;clear:none;margin-left:3mm;font-style:italic;">www.irs.gov/Form941X</span>
						<span style="float:left;clear:none;margin-left:3mm;">Cat. No. 17025J</span>
						<span style="float:right;clear:none;">Form <span class="styBoldText" style="font-size:8pt;">941-X</span> (Rev. 4-2023)</span>
					</div>
					<xsl:call-template name="F941XPageHeader"/>
					<div class="styBB" style="width:187mm;border-top-width:1px;float:none;">
						<div class="styPartName" style="width:13mm;padding-top:0mm;">Part 3:</div>
						<div class="styPartDesc" style="width:173.9mm;padding-top:0mm;padding-left:2mm;">Enter the corrections for this quarter. If any line doesn't apply, leave it blank.</div>
					</div>
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">&nbsp;</div>
						<div class="sty941XDesc">&nbsp;</div>
						<div class="sty941XHeaderBox" style="">
							<span style="font-size:8pt;font-weight:normal;width:100%;text-align:center;margin-bottom:1mm;">Column 1</span><br />
							Total corrected amount (for ALL employees)
						</div>
						<div class="styLNDesc" style="width:3mm;text-align:center;margin-top:10mm;">&mdash;</div>
						<div class="sty941XHeaderBox" style="">
							<span style="font-size:8pt;font-weight:normal;width:100%;text-align:center;margin-bottom:1mm;">Column 2</span><br />
							Amount originally reported or as previously corrected (for ALL employees)
						</div>
						<div class="styLNDesc" style="width:3mm;text-align:center;margin-top:10mm;">=</div>
						<div class="sty941XHeaderBox" style="padding-left:3mm;">
							<span style="font-size:8pt;font-weight:normal;width:100%;text-align:center;margin-bottom:1mm;">Column 3</span><br />
							Difference <br /> (If this amount is a negative number, use a minus sign.)
						</div>
						<div class="sty941XHeaderBox" style="text-align:right;width:20mm;margin-left:20mm;">
							<span style="font-size:8pt;font-weight:normal;width:100%;text-align:center;margin-bottom:1mm;">Column 4</span><br /><br /><br />
							Tax correction
						</div>
					</div>
					<!-- Line 6 -->
					<div class="styStdIBDiv" style="margin-bottom:2mm;">
						<div class="styLNLeftNumBoxSD">6. </div>
						<div class="sty941XDesc" style="">
							<strong>Wages, tips, and other compensation </strong> (Form 941, line 2)
						</div>
						<div class="sty941XAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalCorrectedAmount941XGrp/WagesAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:3mm;text-align:center;margin-top:1mm;">&mdash;</div>
						<div class="sty941XAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/OriginallyRptOrPrevCorr941XGrp/WagesAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:3mm;text-align:center;margin-top:1mm;">=</div>
						<div class="sty941XAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CorrRptDifference941XGrp/WagesAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty941XSmallDesc" style="width:42mm;font-size:6pt;font-family:Arial;">
							Use the amount in Column 1 when you prepare your Forms W-2 or Forms W-2c.
						</div>
					</div>
					<!-- Line 7 -->
					<div class="styStdIBDiv" style="margin-bottom:2mm;">
						<div class="styLNLeftNumBoxSD">7. </div>
						<div class="sty941XDesc" style="">
							<strong>Federal income tax withheld from wages, tips, and other compensation </strong> (Form 941, line 3)
						</div>
						<div class="sty941XAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalCorrectedAmount941XGrp/FederalIncomeTaxWithheldAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:3mm;text-align:center;margin-top:1mm;">&mdash;</div>
						<div class="sty941XAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/OriginallyRptOrPrevCorr941XGrp/FederalIncomeTaxWithheldAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:3mm;text-align:center;margin-top:1mm;">=</div>
						<div class="sty941XAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CorrRptDifference941XGrp/FederalIncomeTaxWithheldAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty941XSmallDesc" style="">Copy Column 3 here</div>
						<div class="sty941XAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CorrRptDifference941XGrp/FederalIncomeTaxWithheldAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 8 -->
					<div class="styStdIBDiv" style="margin-bottom:2mm;">
						<div class="styLNLeftNumBoxSD">8. </div>
						<div class="sty941XDesc" style="">
							<strong>Taxable social security wages </strong> ((Form 941 or 941-SS, line 5a, Column 1))
						</div>
						<div class="sty941XAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalCorrectedAmount941XGrp/SocialSecurityTaxCashWagesAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:3mm;text-align:center;margin-top:1mm;">&mdash;</div>
						<div class="sty941XAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/OriginallyRptOrPrevCorr941XGrp/SocialSecurityTaxCashWagesAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:3mm;text-align:center;margin-top:1mm;">=</div>
						<div class="sty941XAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CorrRptDifference941XGrp/SocialSecurityTaxCashWagesAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty941XSmallDesc" style="font-family:Verdana;margin-top:1mm;">× 0.124* =</div>
						<div class="sty941XAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TaxCorrection941XGrp/SocialSecurityTaxCashWagesAmt"/>
							</xsl:call-template>
						</div>
						<div class="styGenericDiv" style="float:right;width:60%;text-align:right;font-family:Arial;font-size:6pt;">
							* If you're correcting your employer share only, use 0.062. See instructions.
						</div>
					</div>
					<!-- Line 9 -->
					<div class="styStdIBDiv" style="margin-bottom:2mm;">
						<div class="styLNLeftNumBoxSD">9. </div>
						<div class="sty941XDesc" style="">
							<strong>Qualified sick leave wages* </strong> <br /> (Form 941 or 941-SS, line 5a(i), Column 1)
						</div>
						<div class="sty941XAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalCorrectedAmount941XGrp/Reserved"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:3mm;text-align:center;margin-top:1mm;">&mdash;</div>
						<div class="sty941XAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/OriginallyRptOrPrevCorr941XGrp/Reserved"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:3mm;text-align:center;margin-top:1mm;">=</div>
						<div class="sty941XAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CorrRptDifference941XGrp/Reserved"/>
							</xsl:call-template>
						</div>
						<div class="sty941XSmallDesc" style="font-family:Verdana;margin-top:1mm;">× 0.062 =</div>
						<div class="sty941XAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TaxCorrection941XGrp/Reserved"/>
							</xsl:call-template>
						</div>
						<div class="styGenericDiv" style="width:60%;font-family:Arial;font-size:6pt;">
							* Use line 9 only for qualified sick leave wages paid after March 31, 2020, for leave taken before April 1, 2021.
						</div>
					</div>
					<!-- Line 10 -->
					<div class="styStdIBDiv" style="margin-bottom:2mm;">
						<div class="styLNLeftNumBox">10. </div>
						<div class="sty941XDesc" style="">
							<strong>Qualified family leave wages* </strong> <br /> (Form 941 or 941-SS, line 5a(ii), Column 1)
						</div>
						<div class="sty941XAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalCorrectedAmount941XGrp/Reserved"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:3mm;text-align:center;margin-top:1mm;">&mdash;</div>
						<div class="sty941XAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/OriginallyRptOrPrevCorr941XGrp/Reserved"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:3mm;text-align:center;margin-top:1mm;">=</div>
						<div class="sty941XAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CorrRptDifference941XGrp/Reserved"/>
							</xsl:call-template>
						</div>
						<div class="sty941XSmallDesc" style="font-family:Verdana;margin-top:1mm;">× 0.062 =</div>
						<div class="sty941XAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TaxCorrection941XGrp/Reserved"/>
							</xsl:call-template>
						</div>
						<div class="styGenericDiv" style="width:60%;font-family:Arial;font-size:6pt;">
							* Use line 10 only for qualified family leave wages paid after March 31, 2020, for leave taken before April 1, 2021.
						</div>
					</div>
					<!-- Line 11 -->
					<div class="styStdIBDiv" style="margin-bottom:2mm;">
						<div class="styLNLeftNumBox">11. </div>
						<div class="sty941XDesc" style="">
							<strong>Taxable social security tips </strong> ((Form 941 or 941-SS, line 5b, Column 1))
						</div>
						<div class="sty941XAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalCorrectedAmount941XGrp/TaxableSocSecTipsAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:3mm;text-align:center;margin-top:1mm;">&mdash;</div>
						<div class="sty941XAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/OriginallyRptOrPrevCorr941XGrp/TaxableSocSecTipsAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:3mm;text-align:center;margin-top:1mm;">=</div>
						<div class="sty941XAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CorrRptDifference941XGrp/TaxableSocSecTipsAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty941XSmallDesc" style="font-family:Verdana;margin-top:1mm;">× 0.124* =</div>
						<div class="sty941XAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TaxCorrection941XGrp/TaxableSocSecTipsAmt"/>
							</xsl:call-template>
						</div>
						<div class="styGenericDiv" style="float:right;width:60%;text-align:right;font-family:Arial;font-size:6pt;">
							* If you're correcting your employer share only, use 0.062. See instructions.
						</div>
					</div>
					<!-- Line 12 -->
					<div class="styStdIBDiv" style="margin-bottom:2mm;">
						<div class="styLNLeftNumBox">12. </div>
						<div class="sty941XDesc" style="font-family:Arial Narrow;">
							<strong>Taxable Medicare wages &amp; tips </strong> ((Form 941 or 941-SS, line 5b, Column 1))
						</div>
						<div class="sty941XAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalCorrectedAmount941XGrp/TaxableMedicareWagesTipsAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:3mm;text-align:center;margin-top:1mm;">&mdash;</div>
						<div class="sty941XAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/OriginallyRptOrPrevCorr941XGrp/TaxableMedicareWagesTipsAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:3mm;text-align:center;margin-top:1mm;">=</div>
						<div class="sty941XAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CorrRptDifference941XGrp/TaxableMedicareWagesTipsAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty941XSmallDesc" style="font-family:Verdana;margin-top:1mm;">× 0.029* =</div>
						<div class="sty941XAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TaxCorrection941XGrp/TaxableMedicareWagesTipsAmt"/>
							</xsl:call-template>
						</div>
						<div class="styGenericDiv" style="float:right;width:60%;text-align:right;font-family:Arial;font-size:6pt;">
							* If you're correcting your employer share only, use 0.0145. See instructions.
						</div>
					</div>
					<!-- Line 13 -->
					<div class="styStdIBDiv" style="margin-bottom:2mm;">
						<div class="styLNLeftNumBox">13. </div>
						<div class="sty941XDesc" style="">
							<strong>Taxable wages &amp; tips subject to Additional Medicare Tax withholding </strong> 
							((Form 941 or <br /> 941-SS, line 5d))
						</div>
						<div class="sty941XAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalCorrectedAmount941XGrp/TxblWageTipsSubjAddnlMedcrAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:3mm;text-align:center;margin-top:1mm;">&mdash;</div>
						<div class="sty941XAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/OriginallyRptOrPrevCorr941XGrp/TxblWageTipsSubjAddnlMedcrAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:3mm;text-align:center;margin-top:1mm;">=</div>
						<div class="sty941XAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CorrRptDifference941XGrp/TxblWageTipsSubjAddnlMedcrAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty941XSmallDesc" style="font-family:Verdana;margin-top:1mm;">× 0.009* =</div>
						<div class="sty941XAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TaxCorrection941XGrp/TxblWageTipsSubjAddnlMedcrAmt"/>
							</xsl:call-template>
						</div>
						<div class="styGenericDiv" style="float:right;width:60%;text-align:right;font-family:Arial;font-size:6pt;">
							* Certain wages and tips reported in Column 3 shouldn't be multiplied by 0.009. See instructions.
						</div>
					</div>
					<!-- Line 14 -->
					<div class="styStdIBDiv" style="margin-bottom:2mm;">
						<div class="styLNLeftNumBox">14. </div>
						<div class="sty941XDesc" style="">
							<strong>Section 3121(q) Notice and Demand &mdash; Tax due on unreported tips </strong> (Form 941, line 5f)
						</div>
						<div class="sty941XAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalCorrectedAmount941XGrp/TaxOnUnreportedTips3121qAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:3mm;text-align:center;margin-top:1mm;">&mdash;</div>
						<div class="sty941XAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/OriginallyRptOrPrevCorr941XGrp/TaxOnUnreportedTips3121qAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:3mm;text-align:center;margin-top:1mm;">=</div>
						<div class="sty941XAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CorrRptDifference941XGrp/TaxOnUnreportedTips3121qAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty941XSmallDesc" style="">Copy Column 3 here</div>
						<div class="sty941XAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CorrRptDifference941XGrp/TaxOnUnreportedTips3121qAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 15 -->
					<div class="styStdIBDiv" style="margin-bottom:2mm;">
						<div class="styLNLeftNumBox">15. </div>
						<div class="sty941XDesc" style="">
							<strong>Tax adjustments </strong> (Form 941 or 941-SS, lines 7 through 9)
						</div>
						<div class="sty941XAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalCorrectedAmount941XGrp/TaxAdjustmentsAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:3mm;text-align:center;margin-top:1mm;">&mdash;</div>
						<div class="sty941XAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/OriginallyRptOrPrevCorr941XGrp/TaxAdjustmentsAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:3mm;text-align:center;margin-top:1mm;">=</div>
						<div class="sty941XAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CorrRptDifference941XGrp/TaxAdjustmentsAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty941XSmallDesc" style="">Copy Column 3 here</div>
						<div class="sty941XAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CorrRptDifference941XGrp/TaxAdjustmentsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 16 -->
					<div class="styStdIBDiv" style="margin-bottom:2mm;">
						<div class="styLNLeftNumBox">16. </div>
						<div class="sty941XDesc" style="">
							<strong>Qualified small business payroll tax credit for increasing research activities </strong> 
							(Form 941 or 941-SS, line 11a; you must attach Form 8974)
						</div>
						<div class="sty941XAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalCorrectedAmount941XGrp/PayrollTaxCreditAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:3mm;text-align:center;margin-top:1mm;">&mdash;</div>
						<div class="sty941XAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/OriginallyRptOrPrevCorr941XGrp/PayrollTaxCreditAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:3mm;text-align:center;margin-top:1mm;">=</div>
						<div class="sty941XAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CorrRptDifference941XGrp/PayrollTaxCreditAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty941XSmallDesc" style="">See instructions</div>
						<div class="sty941XAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TaxCorrection941XGrp/PayrollTaxCreditAmt"/>
							</xsl:call-template>
						</div>
						<div style="float:left;width:31mm;height:4mm;text-align:center;">
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/TotalCorrectedAmount941XGrp/PayrollTaxCreditAmt"/>
							</xsl:call-template>
						</div>
						<div style="float:left;width:31mm;height:4mm;text-align:center;">
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/OriginallyRptOrPrevCorr941XGrp/PayrollTaxCreditAmt"/>
							</xsl:call-template>
						</div>
						<div style="float:left;width:31mm;height:4mm;text-align:center;">
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/CorrRptDifference941XGrp/PayrollTaxCreditAmt"/>
							</xsl:call-template>
						</div>
						<div style="float:left;width:27mm;height:4mm;text-align:center;margin-left:18mm;">
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/TaxCorrection941XGrp/PayrollTaxCreditAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 17 -->
					<div class="styStdIBDiv" style="margin-bottom:2mm;">
						<div class="styLNLeftNumBox">17. </div>
						<div class="sty941XDesc" style="">
							<strong>Nonrefundable portion of credit for qualified sick and family leave wages for leave taken before April 1, 2021 </strong> 
							(Form 941 or 941-SS, line 11b)
						</div>
						<div class="sty941XAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalCorrectedAmount941XGrp/NrfdblCrQlfySLFMLWagesAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:3mm;text-align:center;margin-top:1mm;">&mdash;</div>
						<div class="sty941XAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/OriginallyRptOrPrevCorr941XGrp/NrfdblCrQlfySLFMLWagesAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:3mm;text-align:center;margin-top:1mm;">=</div>
						<div class="sty941XAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CorrRptDifference941XGrp/NrfdblCrQlfySLFMLWagesAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty941XSmallDesc" style="">See instructions</div>
						<div class="sty941XAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TaxCorrection941XGrp/NrfdblCrQlfySLFMLWagesAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 18a -->
					<div class="styStdIBDiv" style="margin-bottom:2mm;">
						<div class="styLNLeftNumBox">18a. </div>
						<div class="sty941XDesc" style="">
							<strong>Nonrefundable portion of employee retention credit* </strong> <br />
							(Form 941 or 941-SS, line 11c)
						</div>
						<div class="sty941XAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalCorrectedAmount941XGrp/Reserved"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:3mm;text-align:center;margin-top:1mm;">&mdash;</div>
						<div class="sty941XAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/OriginallyRptOrPrevCorr941XGrp/Reserved"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:3mm;text-align:center;margin-top:1mm;">=</div>
						<div class="sty941XAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CorrRptDifference941XGrp/Reserved"/>
							</xsl:call-template>
						</div>
						<div class="sty941XSmallDesc" style="">See instructions</div>
						<div class="sty941XAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TaxCorrection941XGrp/Reserved"/>
							</xsl:call-template>
						</div>
						<div class="styGenericDiv" style="font-family:Arial;font-size:6pt;">
							* Use line 18a only for corrections to quarters beginning after March 31, 2020, and before January 1, 2022.
						</div>
					</div>
					<!-- Line 18b -->
					<div class="styStdIBDiv" style="margin-bottom:2mm;">
						<div class="styLNLeftNumBox">18b. </div>
						<div class="sty941XDesc" style="font-family:Arial Narrow;font-size:8pt;">
							<strong>Nonrefundable portion of credit for qualified sick and family leave wages for leave taken after March 31, 2021, 
							and before October 1, 2021 </strong> (Form 941 or 941-SS, line 11d)
						</div>
						<div class="sty941XAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalCorrectedAmount941XGrp/NrfdblCrQlfySLFMLWagesAftrAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:3mm;text-align:center;margin-top:1mm;">&mdash;</div>
						<div class="sty941XAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/OriginallyRptOrPrevCorr941XGrp/NrfdblCrQlfySLFMLWagesAftrAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:3mm;text-align:center;margin-top:1mm;">=</div>
						<div class="sty941XAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CorrRptDifference941XGrp/NrfdblCrQlfySLFMLWagesAftrAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty941XSmallDesc" style="">See instructions</div>
						<div class="sty941XAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TaxCorrection941XGrp/NrfdblCrQlfySLFMLWagesAftrAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 18c -->
					<div class="styStdIBDiv" style="margin-bottom:2mm;">
						<div class="styLNLeftNumBox">18c. </div>
						<div class="sty941XDesc" style="">
							<strong>Nonrefundable portion of COBRA premium assistance credit </strong> <br />
							(Form 941 or 941-SS, line 11e)
						</div>
						<div class="sty941XAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalCorrectedAmount941XGrp/NrfdblCOBRAPremiumSubsidyAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:3mm;text-align:center;margin-top:1mm;">&mdash;</div>
						<div class="sty941XAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/OriginallyRptOrPrevCorr941XGrp/NrfdblCOBRAPremiumSubsidyAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:3mm;text-align:center;margin-top:1mm;">=</div>
						<div class="sty941XAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CorrRptDifference941XGrp/NrfdblCOBRAPremiumSubsidyAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty941XSmallDesc" style="">See instructions</div>
						<div class="sty941XAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TaxCorrection941XGrp/NrfdblCOBRAPremiumSubsidyAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 18d -->
					<div class="styStdIBDiv" style="margin-bottom:2mm;">
						<div class="styLNLeftNumBox">18d. </div>
						<div class="sty941XDesc" style="">
							<strong>Number of individuals provided COBRA premium assistance </strong> <br />
							(Form 941 or 941-SS, line 11f)
						</div>
						<div class="sty941XAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalCorrectedAmount941XGrp/COBRAPremiumSubsidyRcpntCnt"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:3mm;text-align:center;margin-top:1mm;">&mdash;</div>
						<div class="sty941XAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/OriginallyRptOrPrevCorr941XGrp/COBRAPremiumSubsidyRcpntCnt"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:3mm;text-align:center;margin-top:1mm;">=</div>
						<div class="sty941XAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CorrRptDifference941XGrp/COBRAPremiumSubsidyRcpntCnt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 19 -->
					<div class="styStdIBDiv" style="margin-bottom:2mm;">
						<div class="styLNLeftNumBox">19. </div>
						<div class="sty941XDesc" style="">
							<strong>Special addition to wages for federal income tax </strong>
						</div>
						<div class="sty941XAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalCorrectedAmount941XGrp/SpclAddnWgsFedIncmTaxAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:3mm;text-align:center;margin-top:1mm;">&mdash;</div>
						<div class="sty941XAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/OriginallyRptOrPrevCorr941XGrp/SpclAddnWgsFedIncmTaxAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:3mm;text-align:center;margin-top:1mm;">=</div>
						<div class="sty941XAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CorrRptDifference941XGrp/SpclAddnWgsFedIncmTaxAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty941XSmallDesc" style="">See instructions</div>
						<div class="sty941XAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TaxCorrection941XGrp/SpclAddnWgsFedIncmTaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 20 -->
					<div class="styStdIBDiv" style="margin-bottom:2mm;">
						<div class="styLNLeftNumBox">20. </div>
						<div class="sty941XDesc" style="">
							<strong>Special addition to wages for social security taxes </strong>
						</div>
						<div class="sty941XAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalCorrectedAmount941XGrp/SpclAddnWgsSSTAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:3mm;text-align:center;margin-top:1mm;">&mdash;</div>
						<div class="sty941XAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/OriginallyRptOrPrevCorr941XGrp/SpclAddnWgsSSTAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:3mm;text-align:center;margin-top:1mm;">=</div>
						<div class="sty941XAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CorrRptDifference941XGrp/SpclAddnWgsSSTAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty941XSmallDesc" style="">See instructions</div>
						<div class="sty941XAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TaxCorrection941XGrp/SpclAddnWgsSSTAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 21 -->
					<div class="styStdIBDiv" style="margin-bottom:2mm;">
						<div class="styLNLeftNumBox">21. </div>
						<div class="sty941XDesc" style="">
							<strong>Special addition to wages for Medicare taxes </strong>
						</div>
						<div class="sty941XAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalCorrectedAmount941XGrp/SpclAddnWgsMedcrTaxAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:3mm;text-align:center;margin-top:1mm;">&mdash;</div>
						<div class="sty941XAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/OriginallyRptOrPrevCorr941XGrp/SpclAddnWgsMedcrTaxAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:3mm;text-align:center;margin-top:1mm;">=</div>
						<div class="sty941XAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CorrRptDifference941XGrp/SpclAddnWgsMedcrTaxAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty941XSmallDesc" style="">See instructions</div>
						<div class="sty941XAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TaxCorrection941XGrp/SpclAddnWgsMedcrTaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--Page Footer-->
					<div class="pageEnd styStdDiv" style="border-top:1px solid black;">
						<span style="float:left;clear:none;">Page <span class="styBoldText" style="font-size:8pt;">2</span>
						</span>
						<span style="float:right;clear:none;">Form <span class="styBoldText" style="font-size:8pt;">941-X</span> (Rev. 4-2023)</span>
					</div>
					<xsl:call-template name="F941XPageHeader"/>
					<div class="styBB" style="width:187mm;border-top-width:1px;float:none;">
						<div class="styPartName" style="width:13mm;padding-top:0mm;">Part 3:</div>
						<div class="styPartDesc" style="width:173.9mm;padding-top:0mm;padding-left:2mm;">
							Enter the corrections for this quarter. If any line doesn't apply, leave it blank.
							<span style="font-style:italic;font-weight:normal;">(continued)</span>
						</div>
					</div>
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">&nbsp;</div>
						<div class="sty941XDesc">&nbsp;</div>
						<div class="sty941XHeaderBox" style="">
							<span style="font-size:8pt;font-weight:normal;width:100%;text-align:center;margin-bottom:1mm;">Column 1</span><br />
							Total corrected amount (for ALL employees)
						</div>
						<div class="styLNDesc" style="width:3mm;text-align:center;margin-top:10mm;">&mdash;</div>
						<div class="sty941XHeaderBox" style="">
							<span style="font-size:8pt;font-weight:normal;width:100%;text-align:center;margin-bottom:1mm;">Column 2</span><br />
							Amount originally reported or as previously corrected (for ALL employees)
						</div>
						<div class="styLNDesc" style="width:3mm;text-align:center;margin-top:10mm;">=</div>
						<div class="sty941XHeaderBox" style="padding-left:3mm;">
							<span style="font-size:8pt;font-weight:normal;width:100%;text-align:center;margin-bottom:1mm;">Column 3</span><br />
							Difference <br /> (If this amount is a negative number, use a minus sign.)
						</div>
						<div class="sty941XHeaderBox" style="text-align:right;width:20mm;margin-left:20mm;">
							<span style="font-size:8pt;font-weight:normal;width:100%;text-align:center;margin-bottom:1mm;">Column 4</span><br /><br /><br />
							Tax correction
						</div>
					</div>
					<!-- Line 22 -->
					<div class="styStdIBDiv" style="margin-bottom:2mm;">
						<div class="styLNLeftNumBox">22. </div>
						<div class="sty941XDesc" style="">
							<strong>Special addition to wages for Additional Medicare Tax </strong>
						</div>
						<div class="sty941XAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalCorrectedAmount941XGrp/SpclAddnWgsAddnlMedcrTaxAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:3mm;text-align:center;margin-top:1mm;">&mdash;</div>
						<div class="sty941XAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/OriginallyRptOrPrevCorr941XGrp/SpclAddnWgsAddnlMedcrTaxAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:3mm;text-align:center;margin-top:1mm;">=</div>
						<div class="sty941XAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CorrRptDifference941XGrp/SpclAddnWgsAddnlMedcrTaxAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty941XSmallDesc" style="">See instructions</div>
						<div class="sty941XAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TaxCorrection941XGrp/SpclAddnWgsAddnlMedcrTaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 23 -->
					<div class="styStdIBDiv" style="margin-bottom:2mm;">
						<div class="styLNLeftNumBox" style="padding-top:2.5mm;">23. </div>
						<div class="sty941XDesc" style="width:150mm;padding-top:2.5mm;">
							Combine the amounts on lines 7 through 22 of Column 4
							<span class="sty941XDotLn">......................</span>
						</div>
						<div class="sty941XAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TaxCorrection941XGrp/CombinedTaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 24 -->
					<div class="styStdIBDiv" style="margin-bottom:2mm;">
						<div class="styLNLeftNumBox">24. </div>
						<div class="sty941XDesc" style="">
							<strong>Deferred amount of social security tax* </strong> 
							(Form 941 or 941-SS, line 13b)
						</div>
						<div class="sty941XAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalCorrectedAmount941XGrp/Reserved"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:3mm;text-align:center;margin-top:1mm;">&mdash;</div>
						<div class="sty941XAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/OriginallyRptOrPrevCorr941XGrp/Reserved"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:3mm;text-align:center;margin-top:1mm;">=</div>
						<div class="sty941XAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CorrRptDifference941XGrp/Reserved"/>
							</xsl:call-template>
						</div>
						<div class="sty941XSmallDesc" style="">See instructions</div>
						<div class="sty941XAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TaxCorrection941XGrp/Reserved"/>
							</xsl:call-template>
						</div>
						<div class="styGenericDiv" style="font-family:Arial Narrow;font-size:6pt;">
							* Use line 24 to correct the employer deferral for the second quarter of 2020 and the employer and employee deferral for the third and fourth quarters of 2020.
						</div>
					</div>
					<!-- Line 25 -->
					<div class="styStdIBDiv" style="margin-bottom:2mm;">
						<div class="styLNLeftNumBox">25. </div>
						<div class="sty941XDesc" style="">
							<strong>Refundable portion of credit for qualified sick and family leave wages for leave taken before April 1, 2021 </strong> 
							(Form 941 or 941-SS, line 13c)
						</div>
						<div class="sty941XAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalCorrectedAmount941XGrp/RfdblCrQlfySLFMLWagesAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:3mm;text-align:center;margin-top:1mm;">&mdash;</div>
						<div class="sty941XAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/OriginallyRptOrPrevCorr941XGrp/RfdblCrQlfySLFMLWagesAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:3mm;text-align:center;margin-top:1mm;">=</div>
						<div class="sty941XAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CorrRptDifference941XGrp/RfdblCrQlfySLFMLWagesAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty941XSmallDesc" style="">See instructions</div>
						<div class="sty941XAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TaxCorrection941XGrp/RfdblCrQlfySLFMLWagesAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 26a -->
					<div class="styStdIBDiv" style="margin-bottom:2mm;">
						<div class="styLNLeftNumBox">26a. </div>
						<div class="sty941XDesc" style="">
							<strong>Refundable portion of employee retention credit* </strong> <br />
							(Form 941 or 941-SS, line 13d)
						</div>
						<div class="sty941XAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalCorrectedAmount941XGrp/Reserved"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:3mm;text-align:center;margin-top:1mm;">&mdash;</div>
						<div class="sty941XAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/OriginallyRptOrPrevCorr941XGrp/Reserved"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:3mm;text-align:center;margin-top:1mm;">=</div>
						<div class="sty941XAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CorrRptDifference941XGrp/Reserved"/>
							</xsl:call-template>
						</div>
						<div class="sty941XSmallDesc" style="">See instructions</div>
						<div class="sty941XAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TaxCorrection941XGrp/Reserved"/>
							</xsl:call-template>
						</div>
						<div class="styGenericDiv" style="font-family:Arial;font-size:6pt;">
							* Use line 26a only for corrections to quarters beginning after March 31, 2020, and before January 1, 2022.
						</div>
					</div>
					<!-- Line 26b -->
					<div class="styStdIBDiv" style="margin-bottom:2mm;">
						<div class="styLNLeftNumBox">26b. </div>
						<div class="sty941XDesc" style="font-family:Arial Narrow;font-size:8pt;">
							<strong>Refundable portion of credit for qualified sick and family leave wages for leave taken 
							after March 31, 2021, and before October 1, 2021 </strong> 
							(Form 941 or 941-SS, line 13e)
						</div>
						<div class="sty941XAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalCorrectedAmount941XGrp/RfdblCrQlfySLFMLWagesAftrAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:3mm;text-align:center;margin-top:1mm;">&mdash;</div>
						<div class="sty941XAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/OriginallyRptOrPrevCorr941XGrp/RfdblCrQlfySLFMLWagesAftrAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:3mm;text-align:center;margin-top:1mm;">=</div>
						<div class="sty941XAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CorrRptDifference941XGrp/RfdblCrQlfySLFMLWagesAftrAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty941XSmallDesc" style="">See instructions</div>
						<div class="sty941XAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TaxCorrection941XGrp/RfdblCrQlfySLFMLWagesAftrAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 26c -->
					<div class="styStdIBDiv" style="margin-bottom:2mm;">
						<div class="styLNLeftNumBox">26c. </div>
						<div class="sty941XDesc" style="">
							<strong>Refundable portion of COBRA premium assistance credit </strong> <br />
							(Form 941 or 941-SS, line 13f)
						</div>
						<div class="sty941XAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalCorrectedAmount941XGrp/RfdblCOBRAPremiumSubsidyAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:3mm;text-align:center;margin-top:1mm;">&mdash;</div>
						<div class="sty941XAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/OriginallyRptOrPrevCorr941XGrp/RfdblCOBRAPremiumSubsidyAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:3mm;text-align:center;margin-top:1mm;">=</div>
						<div class="sty941XAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CorrRptDifference941XGrp/RfdblCOBRAPremiumSubsidyAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty941XSmallDesc" style="">See instructions</div>
						<div class="sty941XAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TaxCorrection941XGrp/RfdblCOBRAPremiumSubsidyAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 27 -->
					<div class="styStdIBDiv" style="margin-bottom:2mm;">
						<div class="styLNLeftNumBox" style="padding-top:2.5mm;">27. </div>
						<div class="sty941XDesc" style="width:150mm;padding-top:2.5mm;">
							<strong>Total. </strong> Combine the amounts on lines 23 through 26c of Column 4
							<span class="sty941XDotLn">...................</span>
						</div>
						<div class="sty941XAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TaxCorrection941XGrp/TotalAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDiv">
						<div class="styLNDesc" style="height:auto;width:100%;padding-left:12mm;padding-right:4mm;">
							<strong>If line 27 is less than zero:</strong> <br />
							<ul style="padding-left:12px;margin-top:1px;">
								<li>If you checked line 1, this is the amount you want applied as a credit to your Form 941 or 941-SS for the tax period 
								in which you're filing this form. (If you're currently filing a Form 944, Employer's ANNUAL Federal Tax Return, see the instructions.)</li>
								<li>If you checked line 2, this is the amount you want refunded or abated.</li>
							</ul>
							<strong>If line 27 is more than zero, this is the amount you owe. </strong> 
							Pay this amount by the time you file this return. For information on how to pay, see 
							<span style="font-style:italic;">Amount you owe</span> in the instructions.
						</div>
					</div>
					<!-- Line 28 -->
					<div class="styStdIBDiv" style="margin-bottom:2mm;">
						<div class="styLNLeftNumBox">28. </div>
						<div class="sty941XDesc" style="">
							<strong>Qualified health plan expenses allocable to qualified sick leave wages for leave taken before April 1, 2021 </strong> 
							(Form 941 or <br />941-SS, line 19)
						</div>
						<div class="sty941XAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalCorrectedAmount941XGrp/QHPExpnssSSQlfyPdSLWageAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:3mm;text-align:center;margin-top:1mm;">&mdash;</div>
						<div class="sty941XAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/OriginallyRptOrPrevCorr941XGrp/QHPExpnssSSQlfyPdSLWageAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:3mm;text-align:center;margin-top:1mm;">=</div>
						<div class="sty941XAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CorrRptDifference941XGrp/QHPExpnssSSQlfyPdSLWageAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 29 -->
					<div class="styStdIBDiv" style="margin-bottom:2mm;">
						<div class="styLNLeftNumBox">29. </div>
						<div class="sty941XDesc" style="">
							<strong>Qualified health plan expenses allocable to qualified family leave wages for leave taken before April 1, 2021 </strong> 
							(Form 941 or <br />941-SS, line 20)
						</div>
						<div class="sty941XAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalCorrectedAmount941XGrp/QHPExpnssSSQlfyPdFMLWageAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:3mm;text-align:center;margin-top:1mm;">&mdash;</div>
						<div class="sty941XAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/OriginallyRptOrPrevCorr941XGrp/QHPExpnssSSQlfyPdFMLWageAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:3mm;text-align:center;margin-top:1mm;">=</div>
						<div class="sty941XAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CorrRptDifference941XGrp/QHPExpnssSSQlfyPdFMLWageAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 30 -->
					<div class="styStdIBDiv" style="margin-bottom:2mm;">
						<div class="styLNLeftNumBox">30. </div>
						<div class="sty941XDesc" style="">
							<strong>Qualified wages for the <br /> employee retention credit* </strong> <br />
							(Form 941 or 941-SS, line 21)
						</div>
						<div class="sty941XAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalCorrectedAmount941XGrp/Reserved"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:3mm;text-align:center;margin-top:1mm;">&mdash;</div>
						<div class="sty941XAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/OriginallyRptOrPrevCorr941XGrp/Reserved"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:3mm;text-align:center;margin-top:1mm;">=</div>
						<div class="sty941XAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CorrRptDifference941XGrp/Reserved"/>
							</xsl:call-template>
						</div>
						<div class="styGenericDiv" style="font-family:Arial;font-size:6pt;">
							* Use line 30 only for corrections to quarters beginning after March 31, 2020, and before January 1, 2022.
						</div>
					</div>
					<!-- Line 31a -->
					<div class="styStdIBDiv" style="margin-bottom:2mm;">
						<div class="styLNLeftNumBox">31a. </div>
						<div class="sty941XDesc" style="">
							<strong>Qualified health plan expenses for the employee retention credit* </strong> <br />
							(Form 941 or 941-SS, line 22)
						</div>
						<div class="sty941XAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalCorrectedAmount941XGrp/Reserved"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:3mm;text-align:center;margin-top:1mm;">&mdash;</div>
						<div class="sty941XAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/OriginallyRptOrPrevCorr941XGrp/Reserved"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:3mm;text-align:center;margin-top:1mm;">=</div>
						<div class="sty941XAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CorrRptDifference941XGrp/Reserved"/>
							</xsl:call-template>
						</div>
						<div class="styGenericDiv" style="font-family:Arial;font-size:6pt;">
							* Use line 31a only for corrections to quarters beginning after March 31, 2020, and before January 1, 2022.
						</div>
					</div>
					<!-- Line 31b -->
					<div class="styStdIBDiv" style="margin-bottom:2mm;">
						<div class="styLNLeftNumBox">31b. </div>
						<div class="sty941XDesc" style="width:132mm;">
							<strong>Check here if you're eligible for the employee retention credit in the third or fourth quarter of 2021 
							solely because your business is a recovery startup business </strong> 
							<span class="sty941XDotLn">
								................
								<input type="checkbox" class="styCkboxNM" style="margin-left:-12px;" alt="Eligible For Employee Retention Credit as Recovery Start-up">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/EligEmplRtntnCrRcvryStartUpInd"/>
										<xsl:with-param name="BackupName">F941XEligEmplRtntnCrRcvryStartUpInd</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>
						</div>
					</div>
					<!-- Line 32 -->
					<div class="styStdIBDiv" style="margin-bottom:2mm;">
						<div class="styLNLeftNumBox">32. </div>
						<div class="sty941XDesc" style="">
							<strong>Credit from Form 5884-C, line 11, for this quarter* </strong> 
							(Form 941 or <br />941-SS, line 23)
						</div>
						<div class="sty941XAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalCorrectedAmount941XGrp/Reserved"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:3mm;text-align:center;margin-top:1mm;">&mdash;</div>
						<div class="sty941XAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/OriginallyRptOrPrevCorr941XGrp/Reserved"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:3mm;text-align:center;margin-top:1mm;">=</div>
						<div class="sty941XAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CorrRptDifference941XGrp/Reserved"/>
							</xsl:call-template>
						</div>
						<div class="styGenericDiv" style="font-family:Arial;font-size:6pt;">
							* Use line 32 only for corrections to quarters beginning after March 31, 2020, and before January 1, 2022.
						</div>
					</div>
					<!--Page Footer-->
					<div class="pageEnd styStdDiv" style="border-top:1px solid black;">
						<span style="float:left;clear:none;">Page <span class="styBoldText" style="font-size:8pt;">3</span>
						</span>
						<span style="float:right;clear:none;">Form <span class="styBoldText" style="font-size:8pt;">941-X</span> (Rev. 4-2023)</span>
					</div>
					<xsl:call-template name="F941XPageHeader"/>
					<div class="styBB" style="width:187mm;border-top-width:1px;float:none;">
						<div class="styPartName" style="width:13mm;padding-top:0mm;">Part 3:</div>
						<div class="styPartDesc" style="width:173.9mm;padding-top:0mm;padding-left:2mm;">
							Enter the corrections for this quarter. If any line doesn't apply, leave it blank.
							<span style="font-style:italic;font-weight:normal;">(continued)</span>
						</div>
					</div>
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">&nbsp;</div>
						<div class="sty941XDesc">&nbsp;</div>
						<div class="sty941XHeaderBox" style="">
							<span style="font-size:8pt;font-weight:normal;width:100%;text-align:center;margin-bottom:1mm;">Column 1</span><br />
							Total corrected amount (for ALL employees)
						</div>
						<div class="styLNDesc" style="width:3mm;text-align:center;margin-top:10mm;">&mdash;</div>
						<div class="sty941XHeaderBox" style="">
							<span style="font-size:8pt;font-weight:normal;width:100%;text-align:center;margin-bottom:1mm;">Column 2</span><br />
							Amount originally reported or as previously corrected (for ALL employees)
						</div>
						<div class="styLNDesc" style="width:3mm;text-align:center;margin-top:10mm;">=</div>
						<div class="sty941XHeaderBox" style="padding-left:3mm;">
							<span style="font-size:8pt;font-weight:normal;width:100%;text-align:center;margin-bottom:1mm;">Column 3</span><br />
							Difference <br /> (If this amount is a negative number, use a minus sign.)
						</div>
					</div>
					<!-- Line 33a -->
					<div class="styStdIBDiv" style="margin-bottom:2mm;">
						<div class="styLNLeftNumBox">33a. </div>
						<div class="sty941XDesc" style="">
							<strong>Qualified wages paid March 13 through March 31, 2020, for the employee retention credit* </strong> 
							<br /> (Form 941 or 941-SS, line 24)
						</div>
						<div class="sty941XAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalCorrectedAmount941XGrp/Reserved"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:3mm;text-align:center;margin-top:1mm;">&mdash;</div>
						<div class="sty941XAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/OriginallyRptOrPrevCorr941XGrp/Reserved"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:3mm;text-align:center;margin-top:1mm;">=</div>
						<div class="sty941XAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CorrRptDifference941XGrp/Reserved"/>
							</xsl:call-template>
						</div>
						<div class="styGenericDiv" style="font-family:Arial;font-size:6pt;">
							* Use line 33a only for corrections to the second quarter of 2020.
						</div>
					</div>
					<!-- Line 33b -->
					<div class="styStdIBDiv" style="margin-bottom:2mm;">
						<div class="styLNLeftNumBox">33b. </div>
						<div class="sty941XDesc" style="">
							<strong>Deferred amount of the <br />employee share of social <br />security tax included on Form <br />941 or 941-SS, line 13b* </strong> 
							<br /> (Form 941 or 941-SS, line 24)
						</div>
						<div class="sty941XAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalCorrectedAmount941XGrp/Reserved"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:3mm;text-align:center;margin-top:1mm;">&mdash;</div>
						<div class="sty941XAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/OriginallyRptOrPrevCorr941XGrp/Reserved"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:3mm;text-align:center;margin-top:1mm;">=</div>
						<div class="sty941XAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CorrRptDifference941XGrp/Reserved"/>
							</xsl:call-template>
						</div>
						<div class="styGenericDiv" style="font-family:Arial;font-size:6pt;">
							* Use line 33b only for corrections to the third and fourth quarters of 2020.
						</div>
					</div>
					<!-- Line 34 -->
					<div class="styStdIBDiv" style="margin-bottom:2mm;">
						<div class="styLNLeftNumBox">34. </div>
						<div class="sty941XDesc" style="">
							<strong>Qualified health plan expenses allocable to wages reported on Form 941 or 941-SS, line 24* </strong> 
							<br /> (Form 941 or 941-SS, line 25)
						</div>
						<div class="sty941XAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalCorrectedAmount941XGrp/Reserved"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:3mm;text-align:center;margin-top:1mm;">&mdash;</div>
						<div class="sty941XAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/OriginallyRptOrPrevCorr941XGrp/Reserved"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:3mm;text-align:center;margin-top:1mm;">=</div>
						<div class="sty941XAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CorrRptDifference941XGrp/Reserved"/>
							</xsl:call-template>
						</div>
						<div class="styGenericDiv" style="font-family:Arial;font-size:6pt;">
							* Use line 34 only for corrections to the second quarter of 2020.
						</div>
					</div>
					<div class="styStdDiv" style="padding-top:0.5mm;padding-bottom:0.5mm;margin-bottom:1mm;">
						<strong>Caution: </strong> Lines 35-40 apply only to quarters beginning after March 31, 2021.
					</div>
					<!-- Line 35 -->
					<div class="styStdIBDiv" style="margin-bottom:2mm;">
						<div class="styLNLeftNumBox">35. </div>
						<div class="sty941XDesc" style="">
							<strong>Qualified sick leave wages for leave taken after March 31, 2021, and before October 1, 2021 </strong> 
							(Form 941 or 941-SS, line 23)
						</div>
						<div class="sty941XAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalCorrectedAmount941XGrp/QlfySLWgsAftrAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:3mm;text-align:center;margin-top:1mm;">&mdash;</div>
						<div class="sty941XAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/OriginallyRptOrPrevCorr941XGrp/QlfySLWgsAftrAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:3mm;text-align:center;margin-top:1mm;">=</div>
						<div class="sty941XAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CorrRptDifference941XGrp/QlfySLWgsAftrAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 36 -->
					<div class="styStdIBDiv" style="margin-bottom:2mm;">
						<div class="styLNLeftNumBox">36. </div>
						<div class="sty941XDesc" style="">
							<strong>Qualified health plan expenses allocable to qualified sick leave wages for leave taken after March 31, 2021, and before October 1, 2021 </strong> 
							(Form 941 or 941-SS, line 24)
						</div>
						<div class="sty941XAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalCorrectedAmount941XGrp/QHPExpnssQlfySLWgsAftrAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:3mm;text-align:center;margin-top:1mm;">&mdash;</div>
						<div class="sty941XAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/OriginallyRptOrPrevCorr941XGrp/QHPExpnssQlfySLWgsAftrAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:3mm;text-align:center;margin-top:1mm;">=</div>
						<div class="sty941XAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CorrRptDifference941XGrp/QHPExpnssQlfySLWgsAftrAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 37 -->
					<div class="styStdIBDiv" style="margin-bottom:2mm;">
						<div class="styLNLeftNumBox">37. </div>
						<div class="sty941XDesc" style="">
							<strong>Amounts under certain collectively bargained agreements allocable to qualified sick leave wages for leave taken after March 31, 2021, and before October 1, 2021 </strong> 
							(Form 941 or 941-SS, line 25)
						</div>
						<div class="sty941XAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalCorrectedAmount941XGrp/CrtnBrgnAgrmtQlfySLWgsAftrAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:3mm;text-align:center;margin-top:1mm;">&mdash;</div>
						<div class="sty941XAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/OriginallyRptOrPrevCorr941XGrp/CrtnBrgnAgrmtQlfySLWgsAftrAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:3mm;text-align:center;margin-top:1mm;">=</div>
						<div class="sty941XAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CorrRptDifference941XGrp/CrtnBrgnAgrmtQlfySLWgsAftrAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 38 -->
					<div class="styStdIBDiv" style="margin-bottom:2mm;">
						<div class="styLNLeftNumBox">38. </div>
						<div class="sty941XDesc" style="">
							<strong>Qualified family leave wages for leave taken after March 31, 2021, and before October 1, 2021 </strong> 
							(Form 941 or 941-SS, line 26)
						</div>
						<div class="sty941XAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalCorrectedAmount941XGrp/QlfyFMLWgsAftrAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:3mm;text-align:center;margin-top:1mm;">&mdash;</div>
						<div class="sty941XAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/OriginallyRptOrPrevCorr941XGrp/QlfyFMLWgsAftrAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:3mm;text-align:center;margin-top:1mm;">=</div>
						<div class="sty941XAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CorrRptDifference941XGrp/QlfyFMLWgsAftrAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 39 -->
					<div class="styStdIBDiv" style="margin-bottom:2mm;">
						<div class="styLNLeftNumBox">39. </div>
						<div class="sty941XDesc" style="">
							<strong>Qualified health plan expenses allocable to qualified family leave wages for leave taken after March 31, 2021, and before October 1, 2021 </strong> 
							(Form 941 or 941-SS, line 27)
						</div>
						<div class="sty941XAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalCorrectedAmount941XGrp/QHPExpnssQlfyFMLWgsAftrAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:3mm;text-align:center;margin-top:1mm;">&mdash;</div>
						<div class="sty941XAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/OriginallyRptOrPrevCorr941XGrp/QHPExpnssQlfyFMLWgsAftrAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:3mm;text-align:center;margin-top:1mm;">=</div>
						<div class="sty941XAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CorrRptDifference941XGrp/QHPExpnssQlfyFMLWgsAftrAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 40 -->
					<div class="styStdIBDiv" style="margin-bottom:2mm;">
						<div class="styLNLeftNumBox">40. </div>
						<div class="sty941XDesc" style="">
							<strong>Amounts under certain collectively bargained agreements allocable to qualified family leave wages for leave taken after March 31, 2021, and before October 1, 2021 </strong> 
							(Form 941 or 941-SS, line 28)
						</div>
						<div class="sty941XAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalCorrectedAmount941XGrp/CrtnBrgnAgrmtQlfyFMLWgsAftrAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:3mm;text-align:center;margin-top:1mm;">&mdash;</div>
						<div class="sty941XAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/OriginallyRptOrPrevCorr941XGrp/CrtnBrgnAgrmtQlfyFMLWgsAftrAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:3mm;text-align:center;margin-top:1mm;">=</div>
						<div class="sty941XAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CorrRptDifference941XGrp/CrtnBrgnAgrmtQlfyFMLWgsAftrAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--Page Footer-->
					<div class="pageEnd styStdDiv" style="border-top:1px solid black;">
						<span style="float:left;clear:none;">Page <span class="styBoldText" style="font-size:8pt;">4</span>
						</span>
						<span style="float:right;clear:none;">Form <span class="styBoldText" style="font-size:8pt;">941-X</span> (Rev. 4-2023)</span>
					</div>
					<xsl:call-template name="F941XPageHeader"/>
					<div class="styBB" style="width:187mm;border-top-width:1px;float:none;">
						<div class="styPartName" style="width:13mm;padding-top:0mm;">Part 4:</div>
						<div class="styPartDesc" style="width:173.9mm;padding-top:0mm;padding-left:2mm;">Explain your corrections for this quarter.</div>
					</div>
					<!-- Line 41 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox" style="text-align:center;height:auto;">
							<input type="checkbox" class="styCkboxNM" style="" alt="Correction Both Underreported and Overreported">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/CorrUndrptOverreportedAmtInd"/>
									<xsl:with-param name="BackupName">F941XCorrUndrptOverreportedAmtInd</xsl:with-param>
								</xsl:call-template>
							</input>
						</div>
						<div class="styLNLeftNumBox">41.</div>
						<div class="styLNDesc" style="width:169mm;height:auto;">
							<strong>Check here if any corrections you entered on a line include both underreported and overreported amounts. </strong> 
							Explain both your underreported and overreported amounts on line 43.
						</div>
					</div>
					<!-- Line 42 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox" style="text-align:center;height:auto;">
							<input type="checkbox" class="styCkboxNM" style="" alt="Correction Involved Unclassified Worker">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/CorrReclassifiedWorkersInd"/>
									<xsl:with-param name="BackupName">F941XCorrReclassifiedWorkersInd</xsl:with-param>
								</xsl:call-template>
							</input>
						</div>
						<div class="styLNLeftNumBox">42.</div>
						<div class="styLNDesc" style="width:169mm;height:auto;">
							<strong>Check here if any corrections involve reclassified workers. </strong> 
							Explain on line 43.
						</div>
					</div>
					<!-- Line 43 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox" style="text-align:center;">&nbsp;</div>
						<div class="styLNLeftNumBox">43.</div>
						<div class="styLNDesc" style="width:169mm;height:auto;">
							<strong>You must give us a detailed explanation of how you determined your corrections. </strong> 
							See the instructions.
						</div>
					</div>
					<div class="styStdDiv" style="margin-bottom:2mm;">
						<div class="" style="width:173mm;margin-left:7mm;border:1px solid black;min-height:100mm;padding:1mm;line-height:1.3;display:block;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/CorrectionsExplanationTxt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--Part 5-->
					<div class="styBB" style="width:187mm;border-top-width:1px;float:none;">
						<div class="styPartName" style="width:13mm;padding-top:0mm;">Part 5:</div>
						<div class="styPartDesc" style="width:173.9mm;padding-top:0mm;padding-left:2mm;">Sign here. You must complete all five pages of this form and sign it.</div>
					</div>
					<div class="styLNDesc" style="width:187mm;height:auto;padding-left:2mm;font-size:6pt;">
						Under penalties of perjury, I declare that I have filed an original Form 941 or Form 941-SS and that I have examined this adjusted return or claim, including 
						accompanying schedules and statements, and to the best of my knowledge and belief, it is true, correct, and complete. Declaration of preparer (other than 
						taxpayer) is based on all information of which preparer has any knowledge.
					</div>
					<div style="width:187mm;float:none;clear:both;">
						<div style="width:22mm;height:15mm;padding-top:3mm;font-weight:bold;font-size:9pt;float:left;">
							Sign your name here
						</div>
						<div class="styLNCtrNumBox" style="width:75mm;border-top-width:1px;height:15mm;float:left;word-wrap:break-word;text-align:left;padding-left:1mm;padding-right:1mm;">
							<xsl:if test="$RtnHdrData/ReportingAgentPINGrp/PIN">
								<xsl:call-template name="PopulatePin">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/ReportingAgentPINGrp/PIN"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="$RtnHdrData/PractitionerPINGrp/TaxpayerPIN">
								<xsl:call-template name="PopulatePin">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/PractitionerPINGrp/TaxpayerPIN"/>
								</xsl:call-template>
							</xsl:if>
						</div>
						<div style="width:72.5mm;height:15mm;float:left;padding-left:4mm;padding-top:0mm;">
							<div style="height:10mm;">
								<div style="width:17mm;float:left;">Print your name here</div>
								<div style="height:5mm;padding-top:1mm;float:right;padding-right:2mm;">
									<div class="styLNCtrNumBox" style="width:48mm;border-top-width:1px;height:8mm;text-align:left;padding-left:1mm;">
										<xsl:if test="$RtnHdrData/SignatureDocumentGrp/PersonNm">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/SignatureDocumentGrp/PersonNm"/>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="$RtnHdrData/PractitionerPINGrp/TaxpayerNm">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/PractitionerPINGrp/TaxpayerNm"/>
											</xsl:call-template>
										</xsl:if>
									</div>
								</div>
							</div>
							<div style="height:7mm;">
								<div style="width:17mm;float:left;">Print your title here</div>
								<div style="padding-top:1mm;float:right;padding-right:2mm;">
									<div class="styLNCtrNumBox" style="width:48mm;border-top-width:1px;height:7mm;text-align:left;padding-left:1mm;">
										<xsl:if test="$RtnHdrData/SignatureDocumentGrp/PartnershipAuthorizationCd">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/SignatureDocumentGrp/PartnershipAuthorizationCd"/>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="$RtnHdrData/SignatureDocumentGrp/CorporationAuthorizationCd">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/SignatureDocumentGrp/CorporationAuthorizationCd"/>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="$RtnHdrData/SignatureDocumentGrp/ExemptOrgAuthorizationCd">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/SignatureDocumentGrp/ExemptOrgAuthorizationCd"/>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="$RtnHdrData/SignatureDocumentGrp/EstateAuthorizationCd">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/SignatureDocumentGrp/EstateAuthorizationCd"/>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="$RtnHdrData/SignatureDocumentGrp/IndividualAuthorizationCd">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/SignatureDocumentGrp/IndividualAuthorizationCd"/>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="$RtnHdrData/PractitionerPINGrp/Title">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/PractitionerPINGrp/Title"/>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="$RtnHdrData/ReportingAgentPINGrp/RAPINEnteredByCd">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/ReportingAgentPINGrp/RAPINEnteredByCd"/>
											</xsl:call-template>
										</xsl:if>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="styBB" style="width:187mm;padding-bottom:2mm;padding-top:4mm;float:none;">
						<div class="styLNDesc" style="width:39.4mm;text-align:right;padding-right:3mm;">
							Date
						</div>
						<div class="styLNCtrNumBox" style="width:40mm;border-top-width:1px;height:5mm;">
							<xsl:if test="$RtnHdrData/SignatureDocumentGrp/SignatureDt">
								<xsl:call-template name="PopulateMonthDayYear">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/SignatureDocumentGrp/SignatureDt"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="$RtnHdrData/PractitionerPINGrp/TaxpayerSignatureDt">
								<xsl:call-template name="PopulateMonthDayYear">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/PractitionerPINGrp/TaxpayerSignatureDt"/>
								</xsl:call-template>
							</xsl:if>
						</div>
						<div class="styLNDesc" style="width:67mm;padding-left:39mm;">
							Best daytime phone
						</div>
						<div class="styLNCtrNumBox" style="width:38.4mm;border-top-width:1px;height:7mm;word-wrap:break-word;">
							<xsl:if test="$RtnHdrData/SignatureDocumentGrp/DaytimePhoneNum">
								<xsl:call-template name="PopulatePhoneNumber">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/SignatureDocumentGrp/DaytimePhoneNum"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="$RtnHdrData/SignatureDocumentGrp/DaytimeForeignPhoneNum">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/SignatureDocumentGrp/DaytimeForeignPhoneNum"/>
								</xsl:call-template>
							</xsl:if>
						</div>
					</div>
					<div style="width:187mm;padding-bottom:2mm;">
						<div class="styLNDesc" style="width:48mm;font-size:9pt;font-weight:bold;float:left;padding-left:5mm;">
							Paid Preparer Use Only
						</div>
						<div class="styLNDesc" style="width:63mm;float:right;">
							Check if you're self-employed
							<span style="width:2px;"/>
							<span class="styBoldText">
								<span style="width:10px"/>.
								<span style="width:10px"/>.
								<span style="width:10px"/>.
							</span>
							<div class="styLNDesc" style="width:5mm;float:right;">
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/SelfEmployedInd"/>
							</xsl:call-template>
							<input type="checkbox" alt="SelfEmployed" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/SelfEmployedInd"/>
									<xsl:with-param name="BackupName">941SelfEmployedInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/SelfEmployedInd"/>
									<xsl:with-param name="BackupName">941SelfEmployedInd</xsl:with-param>
								</xsl:call-template>
							</label>
						</div>		
						</div>		
					</div>
					<div style="width:187mm;padding-bottom:2mm;">
						<div class="styLNDesc" style="width:32mm;padding-left:2mm;padding-right:1mm;">Preparer's name </div>
						<div class="styLNCtrNumBox" style="width:94mm;border-top-width:1px;height:5mm;text-align:left;padding-left:1mm;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerPersonNm"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:23mm;padding-left:7mm;">PTIN </div>
						<div class="styLNCtrNumBox" style="width:38mm;border-top-width:1px;height:5mm;">
							<xsl:choose>
								<xsl:when test="$RtnHdrData/PaidPreparerInformationGrp/PTIN">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PTIN"/>
										</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="PopulateSSN">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerSSN"/>
										</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</div>
					</div>
					<div style="width:187mm;padding-bottom:2mm;">
						<div class="styLNDesc" style="width:32mm;padding-left:2mm;padding-right:1mm;">Preparer's signature </div>
						<div class="styLNCtrNumBox" style="width:94mm;border-top-width:1px;height:5mm;word-wrap:break-word;text-align:left;padding-right:1mm;padding-left:1mm;">
					</div>
					<div class="styLNDesc" style="width:23mm;padding-left:7mm;">Date </div>
					<div class="styLNCtrNumBox" style="width:30mm;border-top-width:1px;height:5mm;">
						<xsl:call-template name="PopulateMonthDayYear">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/SignatureDt"/>
						</xsl:call-template>
					</div>
				</div>
					<div style="width:187mm;padding-bottom:2mm;">
						<div class="styLNDesc" style="width:32mm;padding-left:2mm;padding-right:1mm;padding-top:0mm;padding-bottom:0mm;">
							Firm's name (or yours if self-employed)
						</div>
						<div class="styLNCtrNumBox" style="width:94mm;border-top-width:1px;height:auto;text-align:left;padding-left:1mm;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerFirmName/BusinessNameLine1Txt"/>
							</xsl:call-template><br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerFirmName/BusinessNameLine2Txt"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:23mm;padding-left:7mm;">EIN </div>
						<div class="styLNCtrNumBox" style="width:38mm;border-top-width:1px;height:5mm;">
							<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PreparerFirmEIN">
								<xsl:call-template name="PopulateEIN">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerFirmEIN"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/MissingEINReasonCd">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/MissingEINReasonCd"/>
								</xsl:call-template>
							</xsl:if>
						</div>
					</div>
					<div style="width:187mm;padding-bottom:2mm;">
						<div class="styLNDesc" style="width:32mm;padding-left:2mm;padding-right:1mm;">Address </div>
						<div class="styLNCtrNumBox" style="width:94mm;border-top-width:1px;height:8mm;text-align:left;padding-left:1mm;">
							<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PreparerUSAddress">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerUSAddress/AddressLine1Txt"/>
								</xsl:call-template><br/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerUSAddress/AddressLine2Txt"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PreparerForeignAddress">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerForeignAddress/AddressLine1Txt"/>
								</xsl:call-template><br/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerForeignAddress/AddressLine2Txt"/>
								</xsl:call-template>
							</xsl:if>
						</div>
						<div class="styLNDesc" style="width:23mm;padding-left:7mm;">Phone </div>
						<div class="styLNCtrNumBox" style="width:38mm;border-top-width:1px;height:7mm;word-wrap:break-word;">
							<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PhoneNum">
								<xsl:call-template name="PopulatePhoneNumber">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PhoneNum"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/ForeignPhoneNum">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/ForeignPhoneNum"/>
								</xsl:call-template>
							</xsl:if>
						</div>
					</div>
					<div class="styBB" style="width:187mm;padding-bottom:2mm;border-bottom-width:2px;float:none;">
						<xsl:choose>
							<xsl:when test="$RtnHdrData/PaidPreparerInformationGrp/PreparerForeignAddress">
								<div class="styLNDesc" style="width:32mm;padding-left:2mm;padding-right:1mm;">City </div>
								<div class="styLNCtrNumBox" style="width:44mm;border-top-width:1px;height:7mm;text-align:left;padding-left:1mm;word-wrap:break-word;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerForeignAddress/CityNm"/>
									</xsl:call-template>
								</div>
								<div class="styLNDesc" style="width:13mm;text-align:center;">Prov./St. </div>
								<div class="styLNCtrNumBox" style="width:16mm;border-top-width:1px;height:7mm;word-wrap:break-word;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerForeignAddress/ProvinceOrStateNm"/>
									</xsl:call-template>
								</div>
								<div class="styLNDesc" style="width:11mm;text-align:center;">Country </div>
								<div class="styLNCtrNumBox" style="width:10mm;border-top-width:1px;height:5mm;word-wrap:break-word;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerForeignAddress/CountryCd"/>
									</xsl:call-template>
								</div>
								<div class="styLNDesc" style="width:23mm;padding-left:7mm;">Postal Code </div>
								<div style="float:right;padding-right:1mm;">
									<div class="styLNCtrNumBox" style="width:37mm;border-top-width:1px;height:5mm;word-wrap:break-word;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerForeignAddress/ForeignPostalCd"/>
										</xsl:call-template>
									</div>
								</div>
							</xsl:when>
							<xsl:otherwise>
								<div class="styLNDesc" style="width:32mm;padding-left:2mm;padding-right:1mm;">City </div>
								<div class="styLNCtrNumBox" style="width:65mm;border-top-width:1px;height:5mm;text-align:left;padding-left:1mm;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerUSAddress/CityNm"/>
									</xsl:call-template>					
								</div>
								<div class="styLNDesc" style="width:15mm;padding-left:5mm;">State </div>
								<div class="styLNCtrNumBox" style="width:10mm;border-top-width:1px;height:5mm;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerUSAddress/StateAbbreviationCd"/>
									</xsl:call-template>
								</div>
								<div class="styLNDesc" style="width:27mm;padding-left:11mm;">ZIP code </div>
								<div class="styLNCtrNumBox" style="width:38mm;border-top-width:1px;height:5mm;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerUSAddress/ZIPCd"/>
									</xsl:call-template>
								</div>
							</xsl:otherwise>
						</xsl:choose>
					</div>				
					<!--Page Footer-->
					<div class="pageEnd styStdDiv" style="border-top:1px solid black;">
						<span style="float:left;clear:none;">Page <span class="styBoldText" style="font-size:8pt;">5</span>
						</span>
						<span style="float:right;clear:none;">Form <span class="styBoldText" style="font-size:8pt;">941-X</span> (Rev. 4-2023)</span>
					</div>
					<!-- BEGIN Left Over Table -->
					<!-- Additonal Data Title Bar and Button -->
					<div class="styLeftOverTitleLine" id="LeftoverData">
						<div class="styLeftOverTitle">
							Additional Data        
						</div>
						<div class="styLeftOverButtonContainer">
							<input class="styLeftoverTableBtn" TabIndex="1" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
					<!-- Additional Data Table -->
					<table class="styLeftOverTbl">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$FormData"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
					</table>
				</form>
			</body>
		</html>
	</xsl:template>
	<xsl:template name="F941XPageHeader">
		<div class="styStdDiv" style="border-top:1px solid black;border-bottom:1px solid black;">
			<div class="styNameBox" style="width:99mm;height:10mm;">
				<strong>Name </strong> <span style="font-style:italic;">(not your trade name)</span><br />
				<xsl:call-template name="PopulateReturnHeaderFiler">
					<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param> 
				</xsl:call-template><br/>
				<xsl:call-template name="PopulateReturnHeaderFiler">
					<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param> 
				</xsl:call-template>
			</div>
			<div class="styNameBox" style="width:47mm;height:10mm;padding-left:0.5mm;">
				<strong>Employer identification number </strong> (EIN) <br /><br />
				<span style="width:100%;text-align:center;">
					<xsl:call-template name="PopulateReturnHeaderFilerTIN"/>
				</span>
			</div>
			<div class="styNameBox" style="width:40.5mm;height:4mm;padding:0.5mm;border-width:0px 0px 1px 0px;">
				<strong>Correcting Quarter </strong>
				<span style="float:right;">
					<xsl:choose>
						<xsl:when test="$FormData/Qtr1CorrectionInd">1</xsl:when>
						<xsl:when test="$FormData/Qtr2CorrectionInd">2</xsl:when>
						<xsl:when test="$FormData/Qtr3CorrectionInd">3</xsl:when>
						<xsl:when test="$FormData/Qtr4CorrectionInd">4</xsl:when>
					</xsl:choose>
				</span>
			</div>
			<div class="styNameBox" style="width:40.5mm;height:6mm;padding:0.5mm;border-width:0px;">
				<strong>Correcting Calendar Year </strong> (YYYY) <br />
				<span style="width:100%;text-align:center;">
					<xsl:call-template name="PopulateYear">
						<xsl:with-param name="TargetNode" select="$FormData/CorrectingReturnCalendarYrCd"/>
					</xsl:call-template>
				</span>
			</div>
		</div>	
	</xsl:template>
</xsl:stylesheet>