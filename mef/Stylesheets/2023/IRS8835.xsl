<?xml version="1.0"?>
<!DOCTYPE xsl:stylesheet [
	<!ENTITY nbsp "&#160;">
	<!-- 01/03/2023 - Changes for UWR973191 - AJH -->
]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="IRS8835Style.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:output method="html" indent="yes" encoding="iso-8859-1"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="FormData" select="$RtnDoc/IRS8835"/>
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
				<meta name="Author" content="Michelle Hayden - haydem@us.ibm.com"/>
				<meta name="Description" content="Form IRS 8835"/>
				<meta name="GENERATOR" content="IBM WebSphere Studio"/>
				<link rel="stylesheet" type="text/css" href="{$CSSPath}/header.css"/>
				<link rel="stylesheet" type="text/css" href="{$CSSPath}/body.css"/>
				<link rel="stylesheet" type="text/css" href="{$CSSPath}/general.css"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS8835Style"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
			</head>
			<body class="styBodyClass">
				<form name="Form8835">
					<xsl:call-template name="DocumentHeader"/>
					<!--Title of Form -->
					<div class="styBB" style="width:187mm;height: auto">
						<div class="styFNBox" style="width:31mm;font-size: 7pt;height: auto">
						    Form <span class="styFormNumber">8835</span>
							<br/>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Fiscal Year Taxpayer Code</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/@fiscalYearTaxpayerCd"/>
								<xsl:with-param name="Style">padding-left:3mm;</xsl:with-param>
							</xsl:call-template>
							<br/>
							<div class="styAgency" style="padding-top: 1.5mm">Department of the Treasury</div>
							<span class="styAgency">Internal Revenue Service</span>
						</div>
						<div class="styFTBox" style="height: auto;width:125mm">
							<div class="styMainTitle" style="height:auto; padding-top: 1mm">Renewable Electricity<br/>Production Credit</div>
							<br/>
							<div class="styFST" style="font-size:7pt;font-weight:bold; padding-top: 1mm">
						Attach to your tax return. 
          		   				 </div>
							<div class="styFST" style="font-size:6.5pt;font-weight:bold; padding-top: 1mm">
								 Go to <i>www.irs.gov/Form8835</i> for instructions and the latest information
          		   				 </div>
						</div>
						<div class="styTYBox" style="width:30mm;height:auto; border-left-width: 1px">
							<div class="styOMB" style="height:auto;">OMB No. 1545-1362</div>
							<div class="styTaxYear" style="height:auto">20<span class="styTYColor">23</span>
							</div>
							<div class="stySequence">Attachment<br/>Sequence No. <b>835</b>
							</div>
						</div>
					</div>
					<!--  End title of Form  -->
					<!--  Name and Employer identification number  -->
					<div class="styBB" style="width:187mm">
						<div class="styNameBox" style="width:145.2mm;font-size:7pt;">
						     Name(s) shown on return<br/>
							<xsl:choose>
								<xsl:when test="$RtnHdrData/ReturnTypeCd='1040'">
									<br/>
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">Name</xsl:with-param>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
									</xsl:call-template>
									<br/>
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</div>
						<div class="styEINBox" style=" padding-left:2mm;font-size:7pt;">
							<span class="BoldText">Identifying number</span>
							<br/>
							<div style="text-align:left;font-weight:normal;">
								<br/>
								<xsl:call-template name="PopulateFilerTIN">
									<xsl:with-param name="TargetNode" select="$FormData"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--  End Name and Employer indentification number  -->
					<!-- Part I New -->
					
					<div class="styStdDiv" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styPartName">Part I</div>
						<div class="styPartDesc">Facility Information</div>
					</div>
					<!-- Line 1 -->
					<div class="styStdDiv" style="height:auto;">
						<div class="styLNLeftNumBoxSD">1</div>
						<div class="styLNDesc" style="width:179mm;height:auto;">
							IRS-issued registration number for the facility: 
							<span style="width:119.6mm;border-bottom:1px solid black;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/FacilityIRSIssdRegistrationNum"/>
								</xsl:call-template>
							</span>
						</div>
					</div>

					<!-- Line 2 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">2</div>
						<div class="styLNDesc" style="width:179mm;height:auto;">
							Type of facility you are claiming (see instructions): 
							<!--<span style="width:113mm;border-bottom:1px solid black;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/CodeSectionTxt"/>
								</xsl:call-template>							
							</span>-->
						</div>
					</div>

					<!-- Line 2a -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-left: 4mm">a</div>
						<div class="styLNDesc" style="width:179mm;height:auto;">
							<!--Code section and description of facility: -->
							Description of facility: 
							<!--<span style="width:129mm;border-bottom:1px dashed black;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/CodeSectionTxt"/>
								</xsl:call-template>
							</span>-->
						<!--<div class="styLNDesc" style="width:179mm;height:auto;">-->
						<!--<span style="width:150mm;border-bottom:1px dashed black; vertical-align:top">-->
							<span style="width:150mm;border-bottom:1px dashed black; vertical-align:top">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/FacilityDesc"/>
								</xsl:call-template>
							</span>
						<!--</div>-->
						</div>
					</div>
					<!-- Line 2b -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-left: 4mm">b</div>
						<div class="styLNDesc" style="width:179mm;height:auto;">
							Type of facility (wind, closed-loop biomass, geothermal, solar, open-loop biomass, landfill gas, etc.): 
							<span style="width:52.5mm;border-bottom:1px dashed black; vertical-align:top">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/FacilityTypeDesc"/>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<div class="styStdDiv">
						<div class="styLNDesc" style="width:100%;border-bottom:1px solid black;height:auto;">
						</div>
					</div>
					
					
					<!-- Line 3 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">3</div>
						<div class="styLNDesc" style="width:179mm;height:auto;">
							Location of facility, including coordinates (latitude and longitude). 
						</div>
					</div>
					<!-- Line 3a -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-left: 4mm">a</div>
						<div class="styLNDesc" style="width:179mm;height:auto;">
							Address of facility (if applicable): 
							<span style="width:137mm;border-bottom:1px dashed black;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/FacilityUSAddress"/>
								</xsl:call-template>							
							</span>
						</div>
					</div>
					<div class="styStdDiv">
						<div class="styLNDesc" style="width:100%;border-bottom:1px solid black;height:auto;">
						</div>
					</div>
					<!-- Line 3b -->
						<div class="styStdDiv" style="width:187mm;height:13mm;padding-top:1mm;vertical-align:top;">
							<div class="styLNLeftLtrBox" style="padding-left: 4mm;">b</div>
							<div style="">
								Coordinates (if applicable).
								<span style="width:2mm; vertical-align:top;padding-top:2mm;">&nbsp;</span>
								Latitude:
								<!-- Latitude/Longitutude may begin with a '+' or '-' -->
								<xsl:choose>
									<xsl:when test="substring($FormData/FacilityLatitudeNum/text(),1,1) = '+' or substring($FormData/FacilityLatitudeNum/text(),1,1) = '-'">
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$FormData/FacilityLatitudeNum"/>
												<xsl:with-param name="BoxNum" select="1"/>
												<xsl:with-param name="BoxWidth" select="'5mm'"/>
												<xsl:with-param name="BoxHeight" select="'5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<span style="width:3mm;">&nbsp;</span>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$FormData/FacilityLatitudeNum"/>
												<xsl:with-param name="BoxNum" select="2"/>
												<xsl:with-param name="BoxWidth" select="'5mm'"/>
												<xsl:with-param name="BoxHeight" select="'5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$FormData/FacilityLatitudeNum"/>
												<xsl:with-param name="BoxNum" select="3"/>
												<xsl:with-param name="BoxWidth" select="'5mm'"/>
												<xsl:with-param name="BoxHeight" select="'5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										.
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$FormData/FacilityLatitudeNum"/>
												<xsl:with-param name="BoxNum" select="5"/>
												<xsl:with-param name="BoxWidth" select="'5mm'"/>
												<xsl:with-param name="BoxHeight" select="'5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$FormData/FacilityLatitudeNum"/>
												<xsl:with-param name="BoxNum" select="6"/>
												<xsl:with-param name="BoxWidth" select="'5mm'"/>
												<xsl:with-param name="BoxHeight" select="'5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$FormData/FacilityLatitudeNum"/>
												<xsl:with-param name="BoxNum" select="7"/>
												<xsl:with-param name="BoxWidth" select="'5mm'"/>
												<xsl:with-param name="BoxHeight" select="'5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$FormData/FacilityLatitudeNum"/>
												<xsl:with-param name="BoxNum" select="8"/>
												<xsl:with-param name="BoxWidth" select="'5mm'"/>
												<xsl:with-param name="BoxHeight" select="'5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$FormData/FacilityLatitudeNum"/>
												<xsl:with-param name="BoxNum" select="9"/>
												<xsl:with-param name="BoxWidth" select="'5mm'"/>
												<xsl:with-param name="BoxHeight" select="'5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$FormData/FacilityLatitudeNum"/>
												<xsl:with-param name="BoxNum" select="10"/>
												<xsl:with-param name="BoxWidth" select="'5mm'"/>
												<xsl:with-param name="BoxHeight" select="'5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
									</xsl:when>
									<xsl:otherwise>
										<div class="sty7207EmptyLonLatBox"/>
										<span style="width:3mm">&nbsp;</span>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$FormData/FacilityLatitudeNum"/>
												<xsl:with-param name="BoxNum" select="1"/>
												<xsl:with-param name="BoxWidth" select="'5mm'"/>
												<xsl:with-param name="BoxHeight" select="'5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$FormData/FacilityLatitudeNum"/>
												<xsl:with-param name="BoxNum" select="2"/>
												<xsl:with-param name="BoxWidth" select="'5mm'"/>
												<xsl:with-param name="BoxHeight" select="'5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
								.

								<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$FormData/FacilityLatitudeNum"/>
												<xsl:with-param name="BoxNum" select="4"/>
												<xsl:with-param name="BoxWidth" select="'5mm'"/>
												<xsl:with-param name="BoxHeight" select="'5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$FormData/FacilityLatitudeNum"/>
												<xsl:with-param name="BoxNum" select="5"/>
												<xsl:with-param name="BoxWidth" select="'5mm'"/>
												<xsl:with-param name="BoxHeight" select="'5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$FormData/FacilityLatitudeNum"/>
												<xsl:with-param name="BoxNum" select="6"/>
												<xsl:with-param name="BoxWidth" select="'5mm'"/>
												<xsl:with-param name="BoxHeight" select="'5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$FormData/FacilityLatitudeNum"/>
												<xsl:with-param name="BoxNum" select="7"/>
												<xsl:with-param name="BoxWidth" select="'5mm'"/>
												<xsl:with-param name="BoxHeight" select="'5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$FormData/FacilityLatitudeNum"/>
												<xsl:with-param name="BoxNum" select="8"/>
												<xsl:with-param name="BoxWidth" select="'5mm'"/>
												<xsl:with-param name="BoxHeight" select="'5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$FormData/FacilityLatitudeNum"/>
												<xsl:with-param name="BoxNum" select="9"/>
												<xsl:with-param name="BoxWidth" select="'5mm'"/>
												<xsl:with-param name="BoxHeight" select="'5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
									</xsl:otherwise>
								</xsl:choose>
								<span style="width:3mm; vertical-align:top"/>
								
								Longitude:
								<xsl:choose>
									<xsl:when test="substring($FormData/FacilityLatitudeNum/text(),1,1) = '+' or substring($FormData/FacilityLatitudeNum/text(),1,1) = '-'">
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$FormData/FacilityLongitudeNum"/>
												<xsl:with-param name="BoxNum" select="1"/>
												<xsl:with-param name="BoxWidth" select="'5mm'"/>
												<xsl:with-param name="BoxHeight" select="'5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<span style="width:3mm">&nbsp;</span>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$FormData/FacilityLongitudeNum"/>
												<xsl:with-param name="BoxNum" select="2"/>
												<xsl:with-param name="BoxWidth" select="'5mm'"/>
												<xsl:with-param name="BoxHeight" select="'5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$FormData/FacilityLongitudeNum"/>
												<xsl:with-param name="BoxNum" select="3"/>
												<xsl:with-param name="BoxWidth" select="'5mm'"/>
												<xsl:with-param name="BoxHeight" select="'5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$FormData/FacilityLongitudeNum"/>
												<xsl:with-param name="BoxNum" select="5"/>
												<xsl:with-param name="BoxWidth" select="'5mm'"/>
												<xsl:with-param name="BoxHeight" select="'5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										.
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$FormData/FacilityLongitudeNum"/>
												<xsl:with-param name="BoxNum" select="6"/>
												<xsl:with-param name="BoxWidth" select="'5mm'"/>
												<xsl:with-param name="BoxHeight" select="'5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$FormData/FacilityLongitudeNum"/>
												<xsl:with-param name="BoxNum" select="7"/>
												<xsl:with-param name="BoxWidth" select="'5mm'"/>
												<xsl:with-param name="BoxHeight" select="'5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$FormData/FacilityLongitudeNum"/>
												<xsl:with-param name="BoxNum" select="8"/>
												<xsl:with-param name="BoxWidth" select="'5mm'"/>
												<xsl:with-param name="BoxHeight" select="'5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$FormData/FacilityLongitudeNum"/>
												<xsl:with-param name="BoxNum" select="9"/>
												<xsl:with-param name="BoxWidth" select="'5mm'"/>
												<xsl:with-param name="BoxHeight" select="'5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$FormData/FacilityLongitudeNum"/>
												<xsl:with-param name="BoxNum" select="10"/>
												<xsl:with-param name="BoxWidth" select="'5mm'"/>
												<xsl:with-param name="BoxHeight" select="'5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$FormData/FacilityLongitudeNum"/>
												<xsl:with-param name="BoxNum" select="11"/>
												<xsl:with-param name="BoxWidth" select="'5mm'"/>
												<xsl:with-param name="BoxHeight" select="'5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
									</xsl:when>
									<xsl:otherwise>
										<div class="sty7207EmptyLonLatBox"/>
										<span style="width:3mm">&nbsp;</span>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$FormData/FacilityLongitudeNum"/>
												<xsl:with-param name="BoxNum" select="1"/>
												<xsl:with-param name="BoxWidth" select="'5mm'"/>
												<xsl:with-param name="BoxHeight" select="'5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$FormData/FacilityLongitudeNum"/>
												<xsl:with-param name="BoxNum" select="2"/>
												<xsl:with-param name="BoxWidth" select="'5mm'"/>
												<xsl:with-param name="BoxHeight" select="'5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$FormData/FacilityLongitudeNum"/>
												<xsl:with-param name="BoxNum" select="3"/>
												<xsl:with-param name="BoxWidth" select="'5mm'"/>
												<xsl:with-param name="BoxHeight" select="'5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										.
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$FormData/FacilityLongitudeNum"/>
												<xsl:with-param name="BoxNum" select="5"/>
												<xsl:with-param name="BoxWidth" select="'5mm'"/>
												<xsl:with-param name="BoxHeight" select="'5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$FormData/FacilityLongitudeNum"/>
												<xsl:with-param name="BoxNum" select="6"/>
												<xsl:with-param name="BoxWidth" select="'5mm'"/>
												<xsl:with-param name="BoxHeight" select="'5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$FormData/FacilityLongitudeNum"/>
												<xsl:with-param name="BoxNum" select="7"/>
												<xsl:with-param name="BoxWidth" select="'5mm'"/>
												<xsl:with-param name="BoxHeight" select="'5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$FormData/FacilityLongitudeNum"/>
												<xsl:with-param name="BoxNum" select="8"/>
												<xsl:with-param name="BoxWidth" select="'5mm'"/>
												<xsl:with-param name="BoxHeight" select="'5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$FormData/FacilityLongitudeNum"/>
												<xsl:with-param name="BoxNum" select="9"/>
												<xsl:with-param name="BoxWidth" select="'5mm'"/>
												<xsl:with-param name="BoxHeight" select="'5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$FormData/FacilityLongitudeNum"/>
												<xsl:with-param name="BoxNum" select="10"/>
												<xsl:with-param name="BoxWidth" select="'5mm'"/>
												<xsl:with-param name="BoxHeight" select="'5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
									</xsl:otherwise>
								</xsl:choose>
							</div>
							<div style="margin-left:50mm;font-size:6pt;">
								<span>Enter a "+" (plus) or "-" (minus) sign in the first box.</span>
								<span style="width:17mm">&nbsp;</span>
								<span>Enter a "+" (plus) or "-" (minus) sign in the first box.</span>
							</div>
						</div>
					
					
					
					<!--Line 4 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:2mm">4</div>
							<div class="styLNDesc" style="width:55mm;height:7mm;">
                              Date construction began (MM/DD/YYYY):
							</div>
							<span class="styUnderlineAmount" style="float:left; width:40mm;height:4mm;
							  border-bottom-width:1px; text-align:left;padding-top:0mm">
								<xsl:call-template name="PopulateMonthDayYear">
									<xsl:with-param name="TargetNode" select="$FormData/FacilityConstructionStartDt"/>
								</xsl:call-template>
							</span>
						</div>
						<!-- Line 5 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:2mm">5</div>
							<div class="styLNDesc" style="width:55mm;height:7mm;">
                              Date placed in service (MM/DD/YYYY):
							</div>
							<span class="styUnderlineAmount" style="float:left; width:40mm;height:4mm;
							  border-bottom-width:1px; text-align:left;padding-top:0mm">
								<xsl:call-template name="PopulateMonthDayYear">
									<xsl:with-param name="TargetNode" select="$FormData/FacilityPlacedInServiceDt"/>
								</xsl:call-template>
							</span>
						</div>
					
						<!-- Line 6 -->
						<div style="width:177mm;">
							<div class="styLNLeftNumBox" style="height:5mm;padding-left:2mm;padding-top:2mm">
							 6
							</div>
							<div class="styLNDesc" style="width:155mm;height:8mm;">
							 Is the facility part of an expansion of an existing closed-loop biomass or open-loop biomass
							  facility?
								<input type="checkbox" alt="Expansion of closed or open-loop biomassYes" class="styCkbox">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" 
										 select="$FormData/ExistingFacilityExpansionInd"/>
										<xsl:with-param name="BackupName">ExistingFacilityExpansionInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" 
										 select="$FormData/ExistingFacilityExpansionInd"/>
										<xsl:with-param name="BackupName">ExistingFacilityExpansionInd</xsl:with-param>
									</xsl:call-template>Yes
								</label>
								<span style="width: 4mm"/>
								<input type="checkbox" alt="Expansion of closed or open-loop biomassNo" class="styCkbox">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" 
										 select="$FormData/ExistingFacilityExpansionInd"/>
										<xsl:with-param name="BackupName">ExistingFacilityExpansionInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" 
										 select="$FormData/ExistingFacilityExpansionInd"/>
										<xsl:with-param name="BackupName">ExistingFacilityExpansionInd</xsl:with-param>
									</xsl:call-template>No
								</label>
							</div>
						</div>
						<!-- Line 7 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left:2mm;">7</div>
							<div class="styLNDesc" style="width:170mm;">
								Reserved for future use.
							</div>
						</div>
						<!-- Line 7a -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left:4mm;">a</div>
								<div class="styCkbox" style="background-color:lightgrey;">
								</div>
								<label>
									Yes
								</label>
						</div>
						<!-- Line 7b -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left:4mm;">b</div>
								<div class="styCkbox" style="background-color:lightgrey;">
								</div>
								<label>
									No
								</label>
						</div>
						<!-- Line 8 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left:2mm;">8</div>
							<div class="styLNDesc" style="width:170mm;">
								Does the project satisfy one of the qualified facility requirements? See instructions.
							</div>
						</div>
						<!-- Line 8a -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left:4mm;">a</div>
								<input type="checkbox" 
								   alt="The facility’s maximum net output is less than 1 megawatt" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" 
										 select="$FormData/ProjectNetOutputUnder1MWInd"/>
										<xsl:with-param name="BackupName">ProjectNetOutputUnder1MWInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" 
										 select="$FormData/ProjectNetOutputUnder1MWInd"/>
										<xsl:with-param name="BackupName">ProjectNetOutputUnder1MWInd</xsl:with-param>
									</xsl:call-template>Yes, the facility’s maximum net output is less than 1 megawatt (as measured in alternating current).
								</label>
						</div>
						<!-- Line 8b -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left:4mm;">b</div>
								<input type="checkbox" 
								   alt="The facility’s construction began before specified date" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" 
										 select="$FormData/FcltyConstrBeganBfrSpcfdDtInd"/>
										<xsl:with-param name="BackupName">FcltyConstrBeganBfrSpcfdDtInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" 
										 select="$FormData/FcltyConstrBeganBfrSpcfdDtInd"/>
										<xsl:with-param name="BackupName">FcltyConstrBeganBfrSpcfdDtInd</xsl:with-param>
									</xsl:call-template>Yes, the facility’s construction began before January 29, 2023.
								</label>
						</div>
						<!-- Line 8c -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left:4mm;">c</div>
								<input type="checkbox" alt="The facility meets the prevailing wage requirements of section 45(b)(7)(A) and the apprenticeship requirements of section 45(b)(8)." class="styCkbox">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/FcltyStsfyWgAprntcshpRqrInd"/>
										<xsl:with-param name="BackupName">FcltyStsfyWgAprntcshpRqrInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" 
										 select="$FormData/FcltyStsfyWgAprntcshpRqrInd"/>
										<xsl:with-param name="BackupName">FcltyStsfyWgAprntcshpRqrInd</xsl:with-param>
									</xsl:call-template>Yes, the facility meets the prevailing wage requirements of section 45(b)(7)(A) and the apprenticeship requirements of section
45(b)(8).
								</label>
						</div>
						<!-- Line 8d -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left:4mm;">d</div>
								<input type="checkbox" 
								 alt="The facility does not meet the qualified facility requirements." class="styCkbox">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/FacilityRqrNotStsfdInd"/>
										<xsl:with-param name="BackupName">FacilityRqrNotStsfdInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" 
										 select="$FormData/FacilityRqrNotStsfdInd"/>
										<xsl:with-param name="BackupName">FacilityRqrNotStsfdInd</xsl:with-param>
									</xsl:call-template>No, the facility does not meet the qualified facility requirements.
								</label>
						</div>
						<!-- Line 9 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left:2mm;">9</div>
							<div class="styLNDesc" style="width:170mm;">
								Does the property qualify for the domestic bonus credit?
							</div>
						</div>
						<!-- Line 9a -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left:4mm;">a</div>
								<input type="checkbox" 
								   alt="Does the property qualify for the domestic bonus credit?" class="styCkbox">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" 
										 select="$FormData/PropertyQualifyDomBonusCrInd"/>
										<xsl:with-param name="BackupName">PropertyQualifyDomBonusCrInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" 
										 select="$FormData/PropertyQualifyDomBonusCrInd"/>
										<xsl:with-param name="BackupName">PropertyQualifyDomBonusCrInd</xsl:with-param>
									</xsl:call-template>Yes, and section 45(b)(9)(B) is satisfied (10% bonus). Attach the required information. See instructions.
								</label>
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/PropertyQualifyDomBonusCrInd"/>
									</xsl:call-template>
						</div>
						<!-- Line 9b -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left:4mm;">b</div>
								<input type="checkbox" alt="Does the property qualify for the domestic bonus credit?" class="styCkbox">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/PropertyQualifyDomBonusCrInd"/>
										<xsl:with-param name="BackupName">PropertyQualifyDomBonusCrInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" 
										 select="$FormData/PropertyQualifyDomBonusCrInd"/>
										<xsl:with-param name="BackupName">PropertyQualifyDomBonusCrInd</xsl:with-param>
									</xsl:call-template>No
								</label>
						</div>
						<!-- Line 10 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left:2mm;">10</div>
							<div class="styLNDesc" style="width:170mm;">
								Does the project qualify for an energy community bonus credit?
							</div>
						</div>
						<!-- Line 10a -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left:4mm;">a</div>
								<input type="checkbox" 
								   alt="Does the project qualify for an energy community bonus credit?" class="styCkbox">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" 
										 select="$FormData/QlfyEgyComBonusCrInd"/>
										<xsl:with-param name="BackupName">QlfyEgyComBonusCrInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" 
										 select="$FormData/QlfyEgyComBonusCrInd"/>
										<xsl:with-param name="BackupName">QlfyEgyComBonusCrInd</xsl:with-param>
									</xsl:call-template>Yes, and section 45(b)(11)(B) is satisfied (10% bonus). See instructions.
								</label>
						</div>
						<!-- Line 10b -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left:4mm;">b</div>
								<input type="checkbox" 
								   alt="Does the project qualify for an energy community bonus credit?" 		
								   class="styCkbox">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" 
										 select="$FormData/QlfyEgyComBonusCrInd"/>
										<xsl:with-param name="BackupName">QlfyEgyComBonusCrInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" 
										 select="$FormData/QlfyEgyComBonusCrInd"/>
										<xsl:with-param name="BackupName">QlfyEgyComBonusCrInd</xsl:with-param>
									</xsl:call-template>No.
								</label>
						</div>
						<!-- Line 10c -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left:4mm;">c</div>
								<input type="checkbox" alt="Does the project qualify for an energy community bonus credit? N/A">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/NAQlfyEgyComBonusCrInd"/>
										<xsl:with-param name="BackupName">NAQlfyEgyComBonusCrInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" 
										 select="$FormData/EgyComBonusCrNotQlfyInd"/>
										<xsl:with-param name="BackupName">NAQlfyEgyComBonusCrInd</xsl:with-param>
									</xsl:call-template>Not applicable.
								</label>
						</div>
						<!-- Line 11 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left:2mm;">11</div>
							<div class="styLNDesc" style="width:170mm;">
								Enter the nameplate capacity direct current (dc) in kW for:
							</div>
						</div>
						<!-- Line 11a -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left:4mm;">a</div>
								<input type="checkbox" 
								   alt="low incm community solar or wind facility" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" 
										 select="$FormData/DCSolarEnergyPropCapacityInd"/>
										<xsl:with-param name="BackupName">DCSolarEnergyPropCapacityInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" 
										 select="$FormData/DCSolarEnergyPropCapacityInd"/>
										<xsl:with-param name="BackupName">DCSolarEnergyPropCapacityInd</xsl:with-param>
									</xsl:call-template>Solar energy property facility:
								</label>
								<div>
									<span class="styUnderlineAmount" style="float:left; width:30mm;border-bottom-width:1px; 
									 text-align:left">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" 
											 select="$FormData/DCSolarEnergyPropCapacityInd/@dCSolarEnergyPropCapKWQty"/>
										</xsl:call-template>
									</span>
								</div>
						</div>
						<!-- Line 11b -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left:4mm;">b</div>
								<input type="checkbox" 
								   alt="low incm community solar or wind facility on Indian land" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" 
										 select="$FormData/NANameplateCapacityDCInd"/>
										<xsl:with-param name="BackupName">NANameplateCapacityDCInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" 
										 select="$FormData/NANameplateCapacityDCInd"/>
										<xsl:with-param name="BackupName">NANameplateCapacityDCInd</xsl:with-param>
									</xsl:call-template>Not applicable.
								</label>
						</div>
						<!-- Line 12 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left:2mm;">12</div>
							<div class="styLNDesc" style="width:170mm;">
								Enter the nameplate capacity, alternating current (ac) for all electricity generating energy properties or facilities in kW:
							</div>
						</div>
						<!-- Line 12a -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left:4mm;">a</div>
								<input type="checkbox" 
								   alt="Alternating current (ac) Solar energy property or facility" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" 
										 select="$FormData/ACNameplateCapSolarEgyPropInd"/>
										<xsl:with-param name="BackupName">ACNameplateCapSolarEgyPropInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" 
										 select="$FormData/ACNameplateCapSolarEgyPropInd"/>
										<xsl:with-param name="BackupName">ACNameplateCapSolarEgyPropInd</xsl:with-param>
									</xsl:call-template>Solar energy property or facility:
								</label>
								<div>
									<span class="styUnderlineAmount" style="float:left; width:30mm;border-bottom-width:1px; 
									 text-align:left">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" 
											 select="$FormData/ACNameplateCapSolarEgyPropInd/@aCNameplateCapSolarEgyKWQty"/>
										</xsl:call-template>
									</span>
								</div>
						</div>
						<!-- Line 12b -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left:4mm;">b</div>
								<input type="checkbox" 
								   alt="Alternating current (ac) Wind energy property or facility" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" 
										 select="$FormData/ACNameplateCapWindEgyPropInd"/>
										<xsl:with-param name="BackupName">ACNameplateCapWindEgyPropInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" 
										 select="$FormData/ACNameplateCapWindEgyPropInd"/>
										<xsl:with-param name="BackupName">ACNameplateCapWindEgyPropInd</xsl:with-param>
									</xsl:call-template>Wind energy property or facility:
								</label>
								<div>
									<span class="styUnderlineAmount" style="float:left; width:30mm;border-bottom-width:1px; 
									 text-align:left">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" 
											 select="$FormData/ACNameplateCapWindEgyPropInd/
											  @aCNameplateCapWindEgyPropKWQty"/>
										</xsl:call-template>
									</span>
								</div>
						</div>
						<!-- Line 12c -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left:4mm;">c</div>
								<input type="checkbox" 
								   alt="Alternating current (ac) Other energy property of facility" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" 
										 select="$FormData/ACNameplateCapOthEgyPropInd"/>
										<xsl:with-param name="BackupName">ACNameplateCapOthEgyPropInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" 
										 select="$FormData/ACNameplateCapOthEgyPropInd"/>
										<xsl:with-param name="BackupName">ACNameplateCapOthEgyPropInd</xsl:with-param>
									</xsl:call-template>Other:
								</label>
								<div>
									<span class="styUnderlineAmount" style="float:left; width:30mm;border-bottom-width:1px; 
									 text-align:left">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" 
											 select="$FormData/ACNameplateCapOthEgyPropInd/
											  @aCNameplateCapOthEgyPropKWQty"/>
										</xsl:call-template>
									</span>
								</div>
						</div>
						<!-- Line 12d -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left:4mm;">d</div>
								<input type="checkbox" 
								   alt="Nameplate capacity, alternating current (ac) in kW not applicable" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" 
										 select="$FormData/ACNameplateCapNAInd"/>
										<xsl:with-param name="BackupName">ACNameplateCapNAInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" 
										 select="$FormData/ACNameplateCapNAInd"/>
										<xsl:with-param name="BackupName">F3468DCEnergyStorageCapRatingInd</xsl:with-param>
									</xsl:call-template>Not applicable.
								</label>
								<!--<div>
									<span class="styUnderlineAmount" style="float:left; width:30mm;border-bottom-width:1px; 
									 text-align:left">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" 
											 select="$FormData/ACNameplateCapNAInd"/>
										</xsl:call-template>
									</span>
								</div>-->
						</div>
					<!--  FOOTER-->
					<div style="width:187mm;border-top:2px solid black;">
						<div style="float:left; font-size:8pt">
							<b>For Paperwork Reduction Act Notice, see separate instructions.</b>
							<span style="width:20mm"/>
								Cat. No. 14954R
						</div>
						<span style="float: right">
						  Form <span class="styBoldText">8835</span> (2023)
						</span>
					</div>
					<div class="pageEnd"/>
					<br/>
					<br/>
					<!--END FOOTER-->
					
					
					
					
					<!--Part II New -->
					<div class="styStdDiv" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styPartName">Part II</div>
						<div class="styPartDesc">Renewable Electricity Production</div>
					</div>
					<!-- Line 1 table -->
					<div class="styTableContainer" style="border-top-width: 0px; border-bottom-width:0px; width: 187mm; height: 100%">
						<table class="styTable" style="font-size: 7pt; border-color:black" cellspacing="0">
							<thead>
								<tr>
									<th class="styTableCellHeader" colspan="2" style="text-align:left;width: 48mm; border-bottom-width: 0px;  border-left-width: 0px;
										 border-top-width: 0px;height:auto;" scope="col">
										<!--<span class="styBoldText" style="padding-left:1.5mm;">13 Electricity produced at qualified <br/>facilities using:-->
										<!--<span style="width: 3mm"/>-->
										<span class="styNormalText">
											<span style="padding-left:8mm;"/>Complete lines 1 and 2 with respect<br/>
											<span style="padding-left:8mm;"/>to electricity produced at<br/>
											<span style="padding-left:8mm;"/>qualified facilities using:
											</span>
										<!--</span>-->
										<!--									<span class="styTableCellPad"/>    -->
									</th>
									<th class="styTableCellHeader" style="width: 40mm;" scope="col">
									    (a)<br/>
										<span class="styNormalText">Kilowatt-hours produced and sold (see instructions)</span>
									</th>
									<th class="styTableCellHeader" style="width: 14mm" scope="col">
										(b)<br/>
										<span class="styNormalText">Rate</span>
										<br/>
										<span class="styNormalText">(see inst.)*</span>
									</th>
									<th class="styTableCellHeader" style="width: 36mm;border-right-width:0px;" scope="col">
										(c)<br/>
										<span class="styNormalText">Column (a) x Column (b)</span>
									</th>
									<th class="styTableCellHeader" style="width: 8mm; background-color:lightgrey;color:lightgrey;border-color: black;border-right-width:0px;border-bottom-width:0px;border-left-width:1px;" scope="col">
									</th>
									<th class="styTableCellHeader" scope="col" style="width: 32mm; border-right-width: 0px;border-bottom-width:0px;border-left-width:1px;"/>
								</tr>
							</thead>
							<tfoot/>
							
							<tbody valign="top">
								<!-- 1a Wind -->
								<tr>
									<td class="styTableCell" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 47mm">
										<span class="styBoldText" style="padding-left: 2mm">1a</span>
										<span style="width: 2mm"/>
											Wind<span class="styDotLn" style="float:none;padding-left:2mm; clear:none">.......</span>
									</td>
									<td class="styTableCellSmall" style="width: 8mm;border-top-width: 1px;text-align:center;font-weight:bold;">1a
									</td>
									<td class="styTableCellSmall" style="width: 40mm;">
										<span class="styTableCellPad"/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/KwHrsPrdcdAndSoldWindQty"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="width: 14mm;text-align:center;">$0.0055
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 36mm;border-right-width:0px;">
										<span class="styTableCellPad"/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/KwHrsPrdcdAndSoldWindCrAmt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="width: 8mm; background-color:lightgrey;border-bottom-width:0px;border-right-width:0px;border-left-width:1px;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 32mm; border-right-width:0px;border-bottom-width:0px;border-left-width:1px;">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								
								<!-- 1b Closed loop bio mass -->
								<tr>
									<td class="styTableCell" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 47mm">
										<span class="styBoldText" style="padding-left: 4mm">b</span>
										<span style="width: 1.5mm"/>
											Closed-loop biomass<span class="styDotLn" style="float:none; clear:none;padding-left:3mm;">..</span>
									</td>
									<td class="styTableCellSmall" style="width: 8mm;text-align:center;font-weight:bold;">1b
									</td>
									<td class="styTableCellSmall" style="width: 40mm;">
										<span class="styTableCellPad"/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/KwHrsPrdcdSoldClsLoopBmssQty"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="width: 14mm;border-bottom-width:1px;text-align:center;">$0.0055
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 36mm;border-right-width:0px;">
										<span class="styTableCellPad"/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/KwHrsPrdcdSoldClsLoopBmssCrAmt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="width: 8mm; background-color:lightgrey;border-bottom-width:0px;border-right-width:0px;border-left-width:1px;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 32mm; border-right-width:0px;border-bottom-width:0px;border-left-width:1px;">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<!-- 1c Geothermal -->
								<tr>
									<td class="styTableCell" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 47mm">
										<span class="styBoldText" style="padding-left: 4mm">c</span>
										<span style="width: 1.5mm"/>
											Geothermal<span class="styDotLn" style="float:none;padding-left:2mm; clear:none">.....</span>
									</td>
									<td class="styTableCellSmall" style="width: 8mm;text-align:center;font-weight:bold;">1c
									</td>
									<td class="styTableCellSmall" style="width: 40mm;">
										<span class="styTableCellPad"/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/KwHrsPrdcdAndSoldGthrmlQty"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="width: 14mm; border-bottom-width:1px;text-align:center;">$0.0055
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 36mm;border-right-width:0px;">
										<span class="styTableCellPad"/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/KwHrsPrdcdAndSoldGthrmlAmt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="width: 8mm; background-color:lightgrey;border-bottom-width:0px;border-right-width:0px;border-left-width:1px;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 32mm; border-right-width:0px;border-bottom-width:0px;border-left-width:1px;">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<!-- 1d Solar -->
								<tr>
									<td class="styTableCell" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 47mm">
										<span class="styBoldText" style="padding-left: 4mm">d</span>
										<span style="width: 1.5mm"/>
											Solar<span class="styDotLn" style="float:none;padding-left:2mm; clear:none">.....</span>
									</td>
									<td class="styTableCellSmall" style="width: 8mm;text-align:center;font-weight:bold;">1d
									</td>
									<td class="styTableCellSmall" style="width: 40mm;">
										<span class="styTableCellPad"/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/KwHrsPrdcdAndSoldSolarQty"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="width: 14mm; border-bottom-width:1px;text-align:center;">$0.0055
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 36mm;border-right-width:0px;">
										<span class="styTableCellPad"/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/KwHrsPrdcdAndSoldSolarCrAmt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="width: 8mm; background-color:lightgrey;border-bottom-width:0px;border-right-width:0px;border-left-width:1px;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 32mm; border-right-width:0px;border-bottom-width:0px;border-left-width:1px;">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<!-- 1e Off shore wind -->
								<tr>
									<td class="styTableCell" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 47mm">
										<span class="styBoldText" style="padding-left: 4mm">e</span>
										<span style="width: 1.5mm"/>
											Off-shore wind facility<span class="styDotLn" style="float:none; clear:none">..</span>
									</td>
									<td class="styTableCellSmall" style="width: 8mm;border-top-width: 0px;text-align:center;font-weight:bold;">1e
									</td>
									<td class="styTableCellSmall" style="width: 40mm;border-top-width:0px">
										<span class="styTableCellPad"/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/KwHrsPrdcdSoldOffshrWindQty"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="width: 14mm;border-top-width:0px;text-align:center;">$0.0055
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 36mm;border-top-width:0px;border-right-width:0px;">
										<span class="styTableCellPad"/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/KwHrsPrdcdSoldOffshrWindCrAmt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="width: 8mm; background-color:lightgrey;border-bottom-width:0px;border-right-width:0px;border-left-width:1px;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 32mm; border-right-width:0px;border-bottom-width:0px;border-left-width:1px;">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<!-- 1f Open loop bio mass -->
								<tr>
									<td class="styTableCell" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 47mm">
										<span class="styBoldText" style="padding-left: 4mm">f</span>
										<span style="width: 1.5mm"/>
										 Open-loop biomass<span class="styDotLn" style="float:none; clear:none">..</span>
									</td>
									<td class="styTableCellSmall" style="width: 8mm;text-align:center;font-weight:bold;">1f
									</td>
									<td class="styTableCellSmall" style="width: 40mm;">
										<span class="styTableCellPad"/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/KwHrsPrdcdSoldOpenLoopBmssQty"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="width: 14mm; border-bottom-width:1px;text-align:center;">$0.003
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 36mm;border-right-width:0px;">
										<span class="styTableCellPad"/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/KwHrsPrdcdSoldOpenLopBmssCrAmt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="width: 8mm; background-color:lightgrey;border-bottom-width:0px;border-right-width:0px;border-left-width:1px;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 32mm; border-right-width:0px;border-bottom-width:0px;border-left-width:1px;">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<!-- 1g Landfill gas -->
								<tr>
									<td class="styTableCell" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 47mm">
										<span class="styBoldText" style="padding-left: 4mm">g</span>
										<span style="width: 1.5mm"/>
									Landfill gas<span class="styDotLn" style="float:none; clear:none;padding-left:2mm;">.....</span>
									</td>
									<td class="styTableCellSmall" style="width: 8mm;text-align:center;font-weight:bold;">1g
									</td>
									<td class="styTableCellSmall" style="width: 40mm;">
										<span class="styTableCellPad"/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/KwHrsPrdcdAndSoldLndfllGasQty"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="width: 14mm; border-bottom-width:1px;text-align:center;">$0.003
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 36mm;border-right-width:0px;">
										<span class="styTableCellPad"/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/KwHrsPrdcdAndSoldLndfllGsCrAmt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="width: 8mm; background-color:lightgrey;border-bottom-width:0px;border-right-width:0px;border-left-width:1px;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 32mm; border-right-width:0px;border-bottom-width:0px;border-left-width:1px;">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<!-- 1h Trash -->
								<tr>
									<td class="styTableCell" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 47mm">
										<span class="styBoldText" style="padding-left: 4mm">h</span>
										<span style="width: 1.5mm"/>
									 Trash<span class="styDotLn" style="float:none; clear:none">.......</span>
									</td>
									<td class="styTableCellSmall" style="width: 8mm;text-align:center;font-weight:bold;">1h
									</td>
									<td class="styTableCellSmall" style="width: 40mm;">
										<span class="styTableCellPad"/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/KwHrsPrdcdAndSoldTrashQty"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="width: 14mm;text-align:center;">$0.003
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 36mm;border-right-width:0px;">
										<span class="styTableCellPad"/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/KwHrsPrdcdAndSoldTrashCrAmt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="width: 8mm; background-color:lightgrey;border-bottom-width:0px;border-right-width:0px;border-left-width:1px;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 32mm; border-right-width:0px;border-bottom-width:0px;border-left-width:1px;">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<!-- 1i Hydropower -->
								<tr>
									<td class="styTableCell" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 47mm">
										<span class="styBoldText" style="padding-left: 4mm">i</span>
										<span style="width: 1.5mm"/>
									 Hydropower<span class="styDotLn" style="float:none; clear:none">.....</span>
									</td>
									<td class="styTableCellSmall" style="width: 8mm;text-align:center;font-weight:bold;">1i
									</td>
									<td class="styTableCellSmall" style="width: 40mm;">
										<span class="styTableCellPad"/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/KwHrsPrdcdAndSoldHydropowerQty"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="width: 14mm;text-align:center;">$0.003**
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 36mm;border-right-width:0px;">
										<span class="styTableCellPad"/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/KwHrsPrdcdAndSoldHydropwrCrAmt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="width: 8mm; background-color:lightgrey;border-bottom-width:0px;border-right-width:0px;border-left-width:1px;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 32mm; border-right-width:0px;border-bottom-width:0px;border-left-width:1px;">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<!-- 1j Marine and hydrokinetic renewables -->
								<tr>
									<td class="styTableCell" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 47mm">
										<span class="styBoldText" style="padding-left: 4mm">j</span>
										<span style="width: 1.5mm"/>
											 Marine and hydrokinetic <br/>
										<span style="padding-left:8mm"/>renewables<span class="styDotLn" style="float:none; clear:none">......
										</span>
									</td>
									<td class="styTableCellSmall" style="width: 8mm;text-align:center;font-weight:bold;padding-top:3mm;">1j
									</td>
									<td class="styTableCellSmall" style="width: 40mm;padding-top:3mm;">
										<span class="styTableCellPad"/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/KwHrsPrdcdSoldMarineRnwblQty"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="width: 14mm; text-align:center;padding-top:3mm;">$0.003**
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 36mm;padding-top:3mm;border-right-width:0px;">
										<span class="styTableCellPad"/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/KwHrsPrdcdSoldMarineRnwblCrAmt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="width: 8mm; background-color:lightgrey;border-bottom-width:0px;border-right-width:0px;border-left-width:1px;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 32mm; border-right-width:0px;border-bottom-width:0px;border-left-width:1px;">
										<span class="styTableCellPad"/>
									</td>
								</tr>								
							</tbody>
						</table>
					</div>
					
					<!--End line 1 table-->
					<!--Line 2 -->
					<div style="width: 187mm">
						<div class="styLNLeftNumBox">2</div>
						<span class="styLNDesc" style="width: 137mm">
              Add column (c) of lines 1a through 1j and enter here<span style="width: 7mm">
								<span class="styDotLn" style="float: none">..........</span>
							</span>
						</span>
						<span class="styLNRightNumBox" style="height: 5mm">2</span>
						<span class="styLNAmountBox" style="width: 34mm; height: 5mm">
							<span style="float: left; clear:none"/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalForCreditRtUnder45b4AAmt"/>
							</xsl:call-template>
						</span>
					</div>
					<!-- Line 2 end-->
					<!--  Line 3 -->
					<div style="width: 187mm">
						<div class="styLNLeftNumBox">3</div>
						<span class="styLNDesc" style="width: 137mm">
						  Phaseout adjustment (see instructions)  
							<span style="width: 37mm">
								<span class="styDotLn" style="float: none">  
								  .........
								</span>
							</span>$
							<span style="border-color: black; border-style: solid; border-right-width: 0px; border-left-width: 0px; border-top-width: 0px; border-bottom-width: 
								1px; width: 25mm;text-align:right">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/CreditBfrPhaseoutAdjustmentAmt"/>
								</xsl:call-template>
							</span>
							<span style="width: 22mm">
								<span style="width: 2mm"/> X<span style="width: 2mm"/>
								<span style="border-color: black; border-style: solid; border-right-width: 0px; border-left-width: 0px; border-top-width: 0px; border-bottom-width: 
									1px; width: 10mm;text-align:right">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/PhaseoutAdjustmentRt"/>
									</xsl:call-template>
								</span>
							</span>
						</span>
						<span class="styLNRightNumBox" style="height: 5mm">3</span>
						<span class="styLNAmountBox" style="width: 34mm; height: 5mm">
							<span style="float: left; clear:none"/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalPhaseoutAdjustmentAmt"/>
							</xsl:call-template>
						</span>
					</div>
					<!-- Line 3 end -->
					<!-- Line 4 -->
					<div style="width: 187mm">
						<div class="styLNLeftNumBox">4</div>
						<div style="float:left; padding-top: .5mm">
							  Credit before reduction. Subtract line 3 from line 2 
						</div>
						<div style="float:right">
							<span class="styDotLn" style="padding-top: 0mm">  
								.................
							</span>
							<div class="styLNRightNumBox" style="height: 5mm">4</div>
							<div class="styLNAmountBox" style="width: 34mm; height: 5mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/CreditBeforeReductionAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>

<!-- BEGIN SPACE FOR 		Credit reduction for tax-exempt bonds  SECTION 	5a through 5d    -->		

					<div style="width: 187mm">
							<span class="styLNDesc" style="text-align:left;font-weight:bold;width:145mm;height:5mm;">
						  Credit reduction for tax-exempt bonds  
						</span>
							<div class="styLNRightNumBox" style="height: 5mm;background-color:lightgrey;border-bottom-width: 0px;"></div>
							<div class="styLNAmountBox" style="width: 34mm; height: 5mm;border-bottom-width: 0px;"></div>	
					</div>
					<div style="width: 187mm">
							<span class="styLNDesc" style="text-align:left;width:145mm;height: 8mm;">
						  If you used proceeds of tax-exempt bonds to finance your facility, continue to line 5a; otherwise, enter the  
						  amount from line 4 on line 6.
						</span>
							<div class="styLNRightNumBox" style="height: 8mm;background-color:lightgrey;border-bottom-width: 0px;"></div>
							<div class="styLNAmountBox" style="width: 34mm; height: 8mm;border-bottom-width: 0px;"></div>	
					</div>

<!-- Line 5a -->
					<div style="width: 187mm">
						<div class="styLNLeftNumBox" style="padding-left: 1mm; width:30mm">5a <b>Divide.</b></div>
						<div style="float: left; padding-top: .5mm;padding-left: 8mm;">
						  Sum, for the tax year and all prior tax years, of all proceeds
						</div>
						<div style="float: right">
							<span class="styLNRightNumBox" style="background-color: lightgrey; border-bottom-width: 0px"/>
							<span class="styLNAmountBox" style="width: 34mm; border-bottom-width: 0px"/>
						</div>
					</div>
					<div style="width: 187mm">
						<div class="styLNLeftNumBox"/>
						<div style="float: left; padding-top: .5mm;padding-left: 30mm;  ">
						    of tax-exempt bonds (within the meaning of section 103),
						</div>
						<div style="float: right">
							<span class="styLNRightNumBox" style="background-color: lightgrey; border-bottom-width: 0px"/>
							<span class="styLNAmountBox" style="width: 34mm; border-bottom-width: 0px"/>
						</div>
					</div>
					<div style="width: 187mm">
						<div class="styLNLeftNumBox"/>
						<div style="float: left; padding-top: .5mm;padding-left: 30mm;">
						</div>
							<span style="border-color: black; border-style: solid; border-right-width: 0px; border-left-width: 0px; border-top-width: 0px; border-bottom-width: 
								1px; width: 75mm;padding-left 30mm">
							used to finance the qualified facility
							</span>						
						<div style="float: right">
							<span class="styDotLn" style="padding-top: .5mm">  
								 =......
							</span>
							<div class="styLNRightNumBox" style="height: 5mm">5a</div>
							<div class="styLNAmountBox" style="width: 34mm; height: 5mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/FacilityTaxExemptBondFncAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					
					
					<div style="width: 187mm">
						<!--<div class="styLNLeftNumBox" style="padding-left: 1mm; width:30mm">5a <b>Divide.</b></div>-->
						<div style="float: left; padding-top: 0mm;padding-left: 38mm;">
						  Aggregate amount of additions to the capital account for the
						</div>
						<div style="float: right">
							<span class="styLNRightNumBox" style="background-color: lightgrey; border-bottom-width: 0px"/>
							<span class="styLNAmountBox" style="width: 34mm; border-bottom-width: 0px"/>
						</div>
					</div>
					<div style="width: 187mm">
						<div class="styLNLeftNumBox"/>
						<div style="float: left; padding-top: .5mm;padding-left: 30mm;  ">
						    qualified facility, for the tax year and all prior tax years, as of
						</div>
						<div style="float: right">
							<span class="styLNRightNumBox" style="background-color: lightgrey; border-bottom-width: 0px"/>
							<span class="styLNAmountBox" style="width: 34mm; border-bottom-width: 0px"/>
						</div>
					</div>
					<div style="width: 187mm">
						<div class="styLNLeftNumBox"/>
						<div style="float: left; padding-top: .5mm;padding-left: 30mm;">
						    the close of the tax year
						</div>
						<div style="float: right">
							<div class="styLNRightNumBox" style="height: 5mm;background-color: lightgrey"></div>
							<div class="styLNAmountBox" style="width: 34mm; height: 5mm">
							</div>
						</div>
					</div>
					
<!-- Line 5a End -->
					
					<!-- Line 5b -->
					
					<div style="width: 187mm">
						<div class="styLNLeftNumBox" style="height: 5mm;;padding-left: 3mm">b</div>
						<div style="float:left; padding-top: .5mm">
							  Multiply line 4 by line 5a 
						</div>
						<div style="float:right">
							<span class="styDotLn" style="padding-top: 0mm">  
								........................
							</span>
							<div class="styLNRightNumBox" style="height: 5mm;border-top-width: 0px">5b</div>
							<div class="styLNAmountBox" style="width: 34mm; height: 5mm;border-top-width: 0px">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/CreditBeforeReductionFncAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					
					<!-- Line 5c -->
					
					<div style="width: 187mm">
						<div class="styLNLeftNumBox" style="height: 5mm;;padding-left: 3mm">c</div>
						<div style="float:left; padding-top: .5mm">
							  Multiply line 4 by 15% (0.15) 
						</div>
						<div style="float:right">
							<span class="styDotLn" style="padding-top: 0mm">  
								........................
							</span>
							<div class="styLNRightNumBox" style="height: 5mm">5c</div>
							<div class="styLNAmountBox" style="width: 34mm; height: 5mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/CreditBeforeReductionPctAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>

					<!-- Line 5d -->

					<div style="width: 187mm">
						<div class="styLNLeftNumBox" style="height: 5mm;;padding-left: 3mm">d</div>
						<div style="float:left; padding-top: .5mm">
							  Enter the smaller of line 5b or line 5c 
						</div>
						<div style="float:right">
							<span class="styDotLn" style="padding-top: 0mm">  
								....................
							</span>
							<div class="styLNRightNumBox" style="height: 5mm">5d</div>
							<div class="styLNAmountBox" style="width: 34mm; height: 5mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/SmllrCrBfrReductionFncPctAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
<!-- END SPACE FOR 		Credit reduction for tax-exempt bonds  SECTION 	5a through 5d   -->	
					
					<!--  Line 6-->
					<div style="width: 187mm">
						<div class="styLNLeftNumBox" style="height: 5mm;">6</div>
						<div style="float:left; padding-top: .5mm">
							  Subtract line 5d from line 4 
						</div>
						<div style="float:right">
							<span class="styDotLn" style="padding-top: 0mm">  
								........................
							</span>
							<div class="styLNRightNumBox" style="height: 5mm">6</div>
							<div class="styLNAmountBox" style="width: 34mm; height: 5mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/AdjustedCreditReductionAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					
					
					<!--  Line 7a -->
					<div style="width: 187mm">
						<div class="styLNLeftNumBox">7a</div>
						<span class="styLNDesc" style="width: 95mm;height: 8mm">
						  Enter the amount from line 6 applicable to wind facilities, the construction
of which began during 2017  
							<span style="width: 37mm;height: 8mm">
								<span class="styDotLn" style="float: none">  
								  ...........
								</span>
							</span>
						</span>
						<span class="styLNRightNumBox" style="height: 8mm">7a</span>
						<span class="styLNAmountBox" style="width: 34mm; height: 8mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/WindFacilityAmt"/>
								</xsl:call-template>
						</span>
							<div class="styLNRightNumBox" style="height: 8mm;background-color:lightgrey;border-bottom-width: 0px;"></div>
							<div class="styLNAmountBox" style="width: 34mm; height: 8mm;border-bottom-width: 0px;"></div>						
						</div>
					<!--  Line 7b -->
					<div style="width: 187mm">
						<div class="styLNLeftNumBox" style="height: 5mm;padding-left: 3mm">b</div>
						<span class="styLNDesc" style="width: 137mm;">
							 For facilities placed in service after 2021, enter -0-; otherwise, multiply line 7a by 20% (0.20)
							 	<span style="width:2mm;">
								<span class="styDotLn" style="float: none;padding-left:3mm;">  
							  ...
							</span>
							</span>
							<span style="width: 35mm">
								<span style="width:1mm"/>
							</span>
							<span style="width: 21mm"/>
						</span>
						<span class="styLNRightNumBox" style="height: 5mm">7b</span>
						<span class="styLNAmountBox" style="width: 34mm; height: 5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/WindFacilityPercentageAmt"/>
								</xsl:call-template>
						</span>
					</div>
					
					<!-- Line 7c -->
					<div style="width: 187mm">
						<div class="styLNLeftNumBox" style="height: 5mm;padding-left: 3mm">c</div>
						<span class="styLNDesc" style="width: 95mm;height: 8mm">
						  Enter the amount from line 6 applicable to wind facilities, the construction
of which began during 2018, 2020, or 2021  
							<span style="width: 37mm;height: 8mm">
								<span class="styDotLn" style="float: none">  
								  .......
								</span>
							</span>
						</span>
						<span class="styLNRightNumBox" style="height: 8mm">7c</span>
						<span class="styLNAmountBox" style="width: 34mm; height: 8mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/WindFacilityYr2Amt"/>
								</xsl:call-template>
						</span>
							<div class="styLNRightNumBox" style="height: 8mm;background-color:lightgrey;border-bottom-width: 0px;"></div>
							<div class="styLNAmountBox" style="width: 34mm; height: 8mm;border-bottom-width: 0px;">
							</div>	
					</div>
					<!--  Line 7d -->
					<div style="width: 187mm">
						<div class="styLNLeftNumBox" style="height: 5mm;padding-left: 3mm">d</div>
						<span class="styLNDesc" style="width: 137mm;">
							 For facilities placed in service after 2021, enter -0-; otherwise, multiply line 7c by 40% (0.40)
							 	<span style="width:2mm;">
								<span class="styDotLn" style="float: none;padding-left:3mm;">  
							  ...
							</span>
							</span>
							<span style="width: 35mm">
								<span style="width:1mm"/>
							</span>
							<span style="width: 21mm"/>
						</span>
						<span class="styLNRightNumBox" style="height: 5mm">7d</span>
						<span class="styLNAmountBox" style="width: 34mm; height: 5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/WindFacilityPercentageYr2Amt"/>
								</xsl:call-template>
						</span>
					</div>
					
					<!-- Line 7e -->
					<div style="width: 187mm">
						<div class="styLNLeftNumBox" style="height: 5mm;padding-left: 3mm">e</div>
						<span class="styLNDesc" style="width: 95mm;height: 8mm">
						  Enter the amount from line 6 applicable to wind facilities, the construction of
which began during 2019  
							<span style="width: 37mm;height: 8mm">
								<span class="styDotLn" style="float: none">  
								  ...........
								</span>
							</span>
						</span>
						<span class="styLNRightNumBox" style="height: 8mm">7e</span>
						<span class="styLNAmountBox" style="width: 34mm; height: 8mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/WindFacilityYr3Amt"/>
								</xsl:call-template>
						</span>
							<div class="styLNRightNumBox" style="height: 8mm;background-color:lightgrey;border-bottom-width: 0px;"></div>
							<div class="styLNAmountBox" style="width: 34mm; height: 8mm;border-bottom-width: 0px;">
							</div>	
					</div>
					<!--  Line 7f -->
					<div style="width: 187mm">
						<div class="styLNLeftNumBox" style="height: 5mm;padding-left: 3mm">f</div>
						<span class="styLNDesc" style="width: 137mm;">
							 For facilities placed in service after 2021, enter -0-; otherwise, multiply line 7a by 60% (0.60)
							 	<span style="width:2mm;">
								<span class="styDotLn" style="float: none;padding-left:3mm;">  
							  ...
							</span>
							</span>
							<span style="width: 35mm">
								<span style="width:1mm"/>
							</span>
							<span style="width: 21mm"/>
						</span>
						<span class="styLNRightNumBox" style="height: 5mm">7f</span>
						<span class="styLNAmountBox" style="width: 34mm; height: 5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/WindFcltyConstrPctYr3Amt"/>
								</xsl:call-template>
							<span style="float: left; clear:none"/>
						</span>
					</div>					
					
					<!-- Line 7g -->
					<div style="width: 187mm">
						<div class="styLNLeftNumBox" style="height: 5mm;padding-left: 3mm">g</div>
						<span class="styLNDesc" style="width: 137mm;">
							 Add lines 7b, 7d, and 7f
							 	<span style="width:2mm;">
								<span class="styDotLn" style="float: none;padding-left:3mm;">  
							  ..........................
							</span>
							</span>
							<span style="width: 35mm">
								<span style="width:1mm"/>
							</span>
							<span style="width: 21mm"/>
						</span>
						<span class="styLNRightNumBox" style="height: 5mm">7g</span>
						<span class="styLNAmountBox" style="width: 34mm; height: 5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/WindFcltyConstrPhaseOutCrAmt"/>
								</xsl:call-template>
							<span style="float: left; clear:none"/>
						</span>
					</div>
					
					<!--  Line 8-->
					<div style="width: 187mm">
						<div class="styLNLeftNumBox" style="height: 5mm;">8</div>
						<span class="styLNDesc" style="width: 137mm;">
							 Subtract line 7g from line 6 
							 	<span style="width:2mm;">
								<span class="styDotLn" style="float: none;padding-left:3mm;">  
							  .....................
							</span>
							</span>
							<span style="width: 35mm">
								<span style="width:1mm"/>
							</span>
							<span style="width: 21mm"/>
						</span>
						<span class="styLNRightNumBox" style="height: 5mm">8</span>
						<span class="styLNAmountBox" style="width: 34mm; height: 5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/NetWindFacilityPercentageAmt"/>
								</xsl:call-template>
							<span style="float: left; clear:none"/>
						</span>
					</div>
					
					<!--  Line 9-->
					<div style="width: 187mm">
						<div class="styLNLeftNumBox" style="padding-left: 1mm">9</div>
						<div style="float: left; padding-top: .5mm;  ">
						    Increased credit amount for qualified facilities. Did you check a “Yes” box in Part I, question 8?
						</div>
						<div style="float: right">
							<span class="styLNRightNumBox" style="border-bottom-width: 0px"/>
							<span class="styLNAmountBox" style="width: 34mm; border-bottom-width: 0px"/>
						</div>
					</div>
					<div style="width: 187mm">
						<div class="styLNLeftNumBox"/>
						<div style="float: left; padding-top: .5mm;">
						    If so, multiply the amount in Part II, line 8, by 5.0. If not, enter the amount from Part II, line 8
						</div>
						<div style="float: right">
							<span class="styDotLn" style="padding-top: .5mm">  
								 ...
							</span>
							<div class="styLNRightNumBox" style="height: 5mm">9</div>
							<div class="styLNAmountBox" style="width: 34mm; height: 5mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/QualifiedFacilitiesIncrCrAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					
					<!--  Line 10-->
					<div style="width: 187mm">
						<div class="styLNLeftNumBox" style="padding-left: 1mm">10</div>
						<div style="float: left; padding-top: .5mm;  ">
						    Domestic content bonus credit. See instructions.
						</div>
						<div style="float: right">
							<span class="styLNRightNumBox" style="border-bottom-width: 0px"/>
							<span class="styLNAmountBox" style="width: 34mm; border-bottom-width: 0px"/>
						</div>
					</div>
					<div style="width: 187mm">
						<div class="styLNLeftNumBox"/>
						<div style="float: left; padding-top: .5mm;">
						    If you qualify, multiply the amount on line 9 by 10% (0.10). Otherwise, enter -0-
						</div>
						<div style="float: right">
							<span class="styDotLn" style="padding-top: .5mm">  
								 ........
							</span>
							<div class="styLNRightNumBox" style="height: 5mm">10</div>
							<div class="styLNAmountBox" style="width: 34mm; height: 5mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/DomesticContentBonusCreditAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>					
					
					<!--  Line 11-->
					<div style="width: 187mm">
						<div class="styLNLeftNumBox" style="padding-left: 1mm">11</div>
						<div style="float: left; padding-top: .5mm;  ">
						    Energy community bonus credit. See instructions.
						</div>
						<div style="float: right">
							<span class="styLNRightNumBox" style="border-bottom-width: 0px"/>
							<span class="styLNAmountBox" style="width: 34mm; border-bottom-width: 0px"/>
						</div>
					</div>
					<div style="width: 187mm">
						<div class="styLNLeftNumBox"/>
						<div style="float: left; padding-top: .5mm;">
						    If you qualify, multiply the amount on line 9 by 10% (0.10). Otherwise, enter -0-
						</div>
						<div style="float: right">
							<span class="styDotLn" style="padding-top: .5mm">  
								 ........
							</span>
							<div class="styLNRightNumBox" style="height: 5mm">11</div>
							<div class="styLNAmountBox" style="width: 34mm; height: 5mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/EnergyCommunityBonusCreditAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--  Line 12-->

					<div style="width: 187mm">
						<div class="styLNLeftNumBox" style="padding-left: 1mm">12</div>
						<div style="float: left; padding-top: .5mm;">
						    Add lines 9, 10, and 11
						</div>
						<div style="float: right">
							<span class="styDotLn" style="padding-top: .5mm">  
								 .........................
							</span>
							<div class="styLNRightNumBox" style="height: 5mm">12</div>
							<div class="styLNAmountBox" style="width: 34mm; height: 5mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/QlfyFcltsDomCntntEgyComCrAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>					
					
					<!--  Line 13 -->
					<div style="width: 187mm">
						<div class="styLNLeftNumBox" style="padding-left: 1mm">13</div>
						<div style="float: left; padding-top: .5mm;  ">
						    If you are making an elective payment election for a facility whose construction began in calendar year
						</div>
						<div style="float: right">
							<span class="styLNRightNumBox" style="background-color: lightgrey; border-bottom-width: 0px"/>
							<span class="styLNAmountBox" style="width: 34mm; border-bottom-width: 0px"/>
						</div>
					</div>
					<div style="width: 187mm">
						<div class="styLNLeftNumBox"/>
						<div style="float: left; padding-top: .5mm;  ">
						    2024, and the facility does not conform to section 45(b)(10)(B), or meet an exception under section
						</div>
						<div style="float: right">
							<span class="styLNRightNumBox" style="background-color: lightgrey; border-bottom-width: 0px"/>
							<span class="styLNAmountBox" style="width: 34mm; border-bottom-width: 0px"/>
						</div>
					</div>
					<div style="width: 187mm">
						<div class="styLNLeftNumBox"/>
						<div style="float: left; padding-top: .5mm;">
						    45(b)(10)(D), multiply line 12 by 90% (0.90). All others, enter the amount from line 12
						</div>
						<div style="float: right">
							<span class="styDotLn" style="padding-top: .5mm">  
								 ...
							</span>
							<div class="styLNRightNumBox" style="height: 5mm">13</div>
							<div class="styLNAmountBox" style="width: 34mm; height: 5mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/ElectivePaymentAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					
					


			
					<!--  FOOTER-->
					<div style="width:187mm;border-top:1px solid black;">
						<div style="float:left; font-size:6.5pt">
							*See instructions for rates to use for facilities placed in service before 2022. <br>
							**$0.0055 for qualified facilities related to hydropower, marine and hydrokinetic renewable placed in service after 2022. See instructions.</br>
						</div>
						<span style="float: right">
						  Form <span class="styBoldText">8835</span> (2023)
						</span>
					</div>
					<div class="pageEnd"/>
					<br/>
					<br/>
					<!--END FOOTER-->
					

	<!-- PART II CONT. -->	
	
					<!--Part II New -->
					<div class="styStdDiv" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styPartName">Part II</div>
						<div class="styPartDesc">Renewable Electricity Production <i>(continued)</i></div>
					</div>	
						
					<!--  Line 14  -->
					<div style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4mm;">14</div>
						<div style="float:left; padding-top: .5mm">
							  Renewable electricity production credit from partnerships, S corporations,</div>
						<div style="float: right">
							<div class="styLNRightNumBox" style="height:4.5mm;background-color:lightgrey;border-bottom-width: 0px"/>
							<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width: 0px;width: 34mm"/>
						</div>
					</div>
					<div style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4mm;"/>
						<div style="float:left">
							cooperatives, estates, and trusts (see instructions)
						</div>
						<div style="float: right">
							<!--Dotted Line-->
							<span class="styDotLn">  
              .................
            </span>
							<div class="styLNRightNumBox" style="height:4.5mm;">14</div>
							<div class="styLNAmountBox" style="height:4.5mm;width: 34mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/RenewableElectricityProdCrAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--  Line 14  -->
					
					
					
					<!--  Line 15  -->
					<div style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4mm;">15</div>
						<div style="float:left; padding-top: .5mm">
						    Add lines 13 and 14. Cooperatives, estates, and trusts, go to line 16. Partnerships, and S corporations,
						</div>
						<div style="float: right">
							<div class="styLNRightNumBox" style="height:4.5mm;background-color:lightgrey;border-bottom-width: 0px;"/>
							<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width: 0px;width: 34mm"/>
						</div>
					</div>
					<div style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4mm;"/>
						<div style="float:left">
							stop here and report this amount on Schedule K. All others: For electricity or refined coal produced
						</div>
						<div style="float: right">
							<div class="styLNRightNumBox" style="height:4.5mm;background-color:lightgrey;border-bottom-width: 0px;"/>
							<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width: 0px;width: 34mm"/>
						</div>
					</div>
					<div style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4mm;"/>
						<div style="float:left">
							during the 4-year period beginning on the date the facility was placed in service or Indian coal produced,
						</div>
						<div style="float: right">
							<div class="styLNRightNumBox" style="height:4.5mm;background-color:lightgrey;border-bottom-width: 0px;"/>
							<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width: 0px;width: 34mm"/>
						</div>
					</div>
					<div style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4mm;"/>
						<div style="float:left">
							stop here, and report the applicable part of this amount on Form 3800, Part III, line 4e.
						</div>
						<div style="float: right">
							<div class="styLNRightNumBox" style="height:4.5mm;background-color:lightgrey;border-bottom-width: 0px;"/>
							<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width: 0px;width: 34mm"/>
						</div>
					</div>
					<div style="width: 187mm">
						<div class="styLNLeftNumBox"/>
						<div style="float: left; padding-top: .5mm;">
						    For all other production of electricity or refined coal, stop here and report the applicable part
						</div>
						<div style="float: right">
						<div style="float: right">
							<div class="styLNRightNumBox" style="height:4.5mm;background-color:lightgrey;border-bottom-width: 0px;"/>
							<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width: 0px;width: 34mm"/>
						</div>
						</div>
					</div>
					<div style="width: 187mm">
						<div class="styLNLeftNumBox"/>
						<div style="float: left; padding-top: .5mm;">
						    of this amount on Form 3800, Part III, line 1f. See instructions
						</div>
						<div style="float: right">
							<span class="styDotLn" style="padding-top: .5mm">  
								 .............
							</span>
							<div class="styLNRightNumBox" style="height: 5mm">15</div>
							<div class="styLNAmountBox" style="width: 34mm; height: 5mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalAllowedTaxCreditAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--  Line 15  -->
					<!--  Line 16 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;">16</div>
						<div style="float: left; padding-top: .5mm">
        Amount allocated to patrons of the cooperative or beneficiaries of the estate or trust (see instructions) 
      </div>
						<div style="float:right">
							<span class="styDotLn" style="padding-top: .5mm"/>
							<div class="styLNRightNumBox">16</div>
							<div class="styLNAmountBox" style="width: 34mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/AllocatedToBeneficiariesAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- End Line 16 -->
					
					<!-- Line 17  -->
					<div style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4mm;">17</div>
						<div style="float:left; padding-top: .5mm">
						Cooperatives, estates, and trusts, subtract line 16 from line 15. For electricity or refined coal produced 
						</div>
						<div style="float: right">
							<div class="styLNRightNumBox" style="height:4.5mm;background-color:lightgrey;border-bottom-width: 0px;"/>
							<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width: 0px;width: 34mm"/>
						</div>
					</div>
					<div style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4mm;"/>
						<div style="float:left">
					during the 4-year period beginning on the date the facility was placed in service or Indian coal
						</div>
						<div style="float: right">
							<div class="styLNRightNumBox" style="height:4.5mm;background-color:lightgrey;border-bottom-width: 0px;"/>
							<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width: 0px;width: 34mm"/>
						</div>
					</div>
					<div style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4mm;"/>
						<div style="float:left">
     		    	 	produced, report the applicable part of this amount on Form 3800, Part III, line 4e. For all other production
						</div>
						<div style="float: right">
							<div class="styLNRightNumBox" style="height:4.5mm;background-color:lightgrey;border-bottom-width: 0px;"/>
							<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width: 0px;width: 34mm"/>
						</div>
					</div>
					<div class="styBB" style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4mm;"/>
						<div style="float:left">
     		    	 	of electricity or refined coal, report the applicable part of this amount on Form 3800, Part. III, line 1f
						</div>
						<div style="float: right">
						<span class="styDotLn" style="padding-top: .5mm">  
								 ..
							</span>
							<div class="styLNRightNumBoxNBB" style="height:4.5mm;padding-top:1mm">17</div>
							<div class="styLNAmountBoxNBB" style="height:4.5mm;width: 34mm;padding-top:1mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/EstatesTrustsAndCoopsCreditAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- End Line 17  -->
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
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Fiscal Year Taxpayer Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/@fiscalYearTaxpayerCd"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<!--						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 34 - Form 8884 Indicator</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/CfwdRnwblElecRefinedCoalCr/@form8884Indicator"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 34 - Form 8884 Amount</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/CfwdRnwblElecRefinedCoalCr/@form8884Amount"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 36 - Form 6478 Indicator</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/TotalAllowedTaxCredit/@form6478Indicator"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 36 - Form 6478 Amount</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/TotalAllowedTaxCredit/@form6478Amount"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>  -->
					</table>
					<!-- END Left Over Table -->
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
