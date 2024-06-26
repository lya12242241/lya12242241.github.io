<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [
	<!ENTITY nbsp "&#160;">
	<!ENTITY mdash "&#8212;">
]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS9000Style.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="FormData" select="$RtnDoc/IRS9000"/>
	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html lang="EN-US">
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
				<meta name="Description" content="IRS Form 9000"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS9000Style"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form id="Form9000">
					<xsl:call-template name="DocumentHeader"/>
					<!-- Header -->
					<div class="styStdDiv">
						<div class="styFNBox" style="width:30mm;height:17.5mm;">
							Form <span class="styFN" style="font-size:18pt;">9000</span>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData"/>
							</xsl:call-template>
							<br/>
							(November 2021)
							<br/>
							<span class="styAgency">
								Department of the Treasury
								<br/>
								Internal Revenue Service
							</span>
						</div>
						<div class="styFTBox" style="width:127mm;height:17.5mm;">
							<span class="styFMT" style="font-size:13pt;padding-top:2mm;padding-bottom:0.5mm;">Alternative Media Preference</span>
							<br/>
							<span style="font-weight:bold;padding-top:4mm;">
								Go to
								<span style="font-style:italic">www.irs.gov/Form9000</span>
								for the latest information.
							</span>
						</div>
						<div class="styTYBox" style="width:30mm;height:17.5mm;">
							<div class="styOMB" style="height:auto;font-size:6pt;padding-top:2mm;padding-bottom:2mm;">OMB No. 1545-0074</div>
							<div style="margin-left:0mm;text-align:left;font-size:7pt;padding-top:1mm;">
								Attachment<br/>Sequence No. 
								<span class="styBoldText" style="font-size:9pt;">77</span>
							</div>
						</div>
					</div>
					<!-- Filer information section -->
					<div class="styStdDiv" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styNameBox" style="width:135mm;height:7.5mm">
							Name of taxpayer electing to receive written communications in alternative media<br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PersonNm"/>
							</xsl:call-template>
						</div>
						<div class="styEINBox" style="width:52mm;height:7.5mm;padding-left:1mm;font-weight:normal;">
							<span style="font-weight:bold;">Social security number</span>
							<br/>
							<xsl:call-template name="PopulateSSN">
								<xsl:with-param name="TargetNode" select="$FormData/SSN"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDiv">
						<div class="styGenericDiv" style="height:22mm;width:40mm;font-weight:bold;font-size:8pt;padding-top:4.5mm;">
							Fill in Your Address Only<br/>
							if You Are Filing This<br/>
							Form by Itself and Not<br/>
							With Your Tax Return<br/>
						</div>
						<div class="styGenericDiv" style="height:22mm;width:5mm;padding-top:4.5mm;">
							<img src="{$ImagePath}/5329_Bullet_Lg.gif" alt="LargeBullet"/>
						</div>
						<div class="sty9000HeaderDiv" style="width:105mm;">
							Current Address (number and street). If you have a P.O. box, see instructions.<br/>
						</div>
						<div class="sty9000HeaderDiv" style="width:37mm;">Apt. number</div>
						<div class="sty9000HeaderDiv">City or town, state or province, country, and ZIP code. If a foreign address, also complete the spaces below.</div>
						<div class="sty9000HeaderDiv" style="width:47mm;border-bottom-width:0px;">Foreign country name</div>
						<div class="sty9000HeaderDiv" style="width:48mm;border-bottom-width:0px;">Foreign province/state/county</div>
						<div class="sty9000HeaderDiv" style="width:47mm;border-bottom-width:0px;">Foreign postal code</div>
					</div>
					<!-- Line 1 -->
					<div class="styStdDiv" style="border-top:1px solid black;">
						<div class="styLNLeftNumBoxSD">1</div>
						<div class="styLNDesc" style="height:auto;width:179mm;">
							I elect to receive written communications from the IRS in the following accessible format. Check only one. Forms with more than one box 
							checked will not be processed. 
						</div>
					</div>
					<div class="styStdDiv" style="padding-left:8mm;height:auto;margin-bottom:4mm;">
						<xsl:call-template name="PopulateSpan">
							<xsl:with-param name="TargetNode" select="$FormData/AlternativeMediaCd"/>
						</xsl:call-template>
						<input type="checkbox" class="styCkboxNM" style="margin-right:12px;margin-bottom:4px;">
							<xsl:call-template name="PopulateEnumeratedCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/AlternativeMediaCd"/>
								<xsl:with-param name="DisplayedCheckboxValue" select=" '00' "/>
								<xsl:with-param name="BackupName">F9000AlternativeMediaCd00</xsl:with-param>
							</xsl:call-template>
						</input>
						<span style="vertical-align:top;padding-top:1px;">
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/AlternativeMediaCd"/>
									<xsl:with-param name="DisplayedCheckboxValue" select=" '00' "/>
									<xsl:with-param name="BackupName">F9000AlternativeMediaCd00</xsl:with-param>
								</xsl:call-template>00 Standard Print (Cancels prior election)</label>
						</span>
						<br/>
						<input type="checkbox" class="styCkboxNM" style="margin-right:12px;margin-bottom:4px;">
							<xsl:call-template name="PopulateEnumeratedCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/AlternativeMediaCd"/>
								<xsl:with-param name="DisplayedCheckboxValue" select=" '01' "/>
								<xsl:with-param name="BackupName">F9000AlternativeMediaCd01</xsl:with-param>
							</xsl:call-template>
						</input>
						<span style="vertical-align:top;padding-top:1px;">
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/AlternativeMediaCd"/>
									<xsl:with-param name="DisplayedCheckboxValue" select=" '01' "/>
									<xsl:with-param name="BackupName">F9000AlternativeMediaCd01</xsl:with-param>
								</xsl:call-template>01 Large Print</label>
						</span>
						<br/>
						<input type="checkbox" class="styCkboxNM" style="margin-right:12px;margin-bottom:4px;">
							<xsl:call-template name="PopulateEnumeratedCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/AlternativeMediaCd"/>
								<xsl:with-param name="DisplayedCheckboxValue" select=" '02' "/>
								<xsl:with-param name="BackupName">F9000AlternativeMediaCd02</xsl:with-param>
							</xsl:call-template>
						</input>
						<span style="vertical-align:top;padding-top:1px;">
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/AlternativeMediaCd"/>
									<xsl:with-param name="DisplayedCheckboxValue" select=" '02' "/>
									<xsl:with-param name="BackupName">F9000AlternativeMediaCd02</xsl:with-param>
								</xsl:call-template>02 Braille</label>
						</span>
						<br/>
						<input type="checkbox" class="styCkboxNM" style="margin-right:12px;margin-bottom:4px;">
							<xsl:call-template name="PopulateEnumeratedCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/AlternativeMediaCd"/>
								<xsl:with-param name="DisplayedCheckboxValue" select=" '03' "/>
								<xsl:with-param name="BackupName">F9000AlternativeMediaCd03</xsl:with-param>
							</xsl:call-template>
						</input>
						<span style="vertical-align:top;padding-top:1px;">
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/AlternativeMediaCd"/>
									<xsl:with-param name="DisplayedCheckboxValue" select=" '03' "/>
									<xsl:with-param name="BackupName">F9000AlternativeMediaCd03</xsl:with-param>
								</xsl:call-template>03 Audio (MP3)</label>
						</span>
						<br/>
						<input type="checkbox" class="styCkboxNM" style="margin-right:12px;margin-bottom:4px;">
							<xsl:call-template name="PopulateEnumeratedCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/AlternativeMediaCd"/>
								<xsl:with-param name="DisplayedCheckboxValue" select=" '04' "/>
								<xsl:with-param name="BackupName">F9000AlternativeMediaCd04</xsl:with-param>
							</xsl:call-template>
						</input>
						<span style="vertical-align:top;padding-top:1px;">
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/AlternativeMediaCd"/>
									<xsl:with-param name="DisplayedCheckboxValue" select=" '04' "/>
									<xsl:with-param name="BackupName">F9000AlternativeMediaCd04</xsl:with-param>
								</xsl:call-template>04 Plain Text File (TXT)</label>
						</span>
						<br/>
						<input type="checkbox" class="styCkboxNM" style="margin-right:12px;">
							<xsl:call-template name="PopulateEnumeratedCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/AlternativeMediaCd"/>
								<xsl:with-param name="DisplayedCheckboxValue" select=" '05' "/>
								<xsl:with-param name="BackupName">F9000AlternativeMediaCd05</xsl:with-param>
							</xsl:call-template>
						</input>
						<span style="vertical-align:top;padding-top:1px;">
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/AlternativeMediaCd"/>
									<xsl:with-param name="DisplayedCheckboxValue" select=" '05' "/>
									<xsl:with-param name="BackupName">F9000AlternativeMediaCd05</xsl:with-param>
								</xsl:call-template>05 Braille Ready File (BRF)</label>
						</span>
						<br/>
						<strong>Note: </strong> You will also receive a standard print copy.
					</div>
					<!-- Sign Here (blank) -->
					<div class="styStdDiv" style="border-top:1px solid black;">
						<div class="styGenericDiv" style="height:16mm;width:37mm;font-weight:bold;font-size:8pt;padding-top:0.5mm;">
							Sign Here Only if You <br/>
							Are Filing This Form <br/>
							by Itself and Not With <br/>
							Your Tax Return<br/>
						</div>
						<div class="styGenericDiv" style="height:16mm;width:8mm;padding-top:1mm;border-right:1px solid black;padding-left:3px;">
							<img src="{$ImagePath}/5329_Bullet_Lg.gif" alt="LargeBullet"/>
						</div>
						<div class="sty9000HeaderDiv" style="width:105mm;border:none;">
							Your signature<br/>
						</div>
						<div class="sty9000HeaderDiv" style="width:37mm;height:16mm;border-bottom:none;">Date</div>
					</div>
					<div class="styStdDiv" style="border-top:2px solid black;">
						<span style="font-weight:bold;">For Privacy Act and Paperwork Reduction Act Notice, see the instructions.</span>
						<span style="margin-left:15mm;">Cat. No. 37824Y</span>
						<span style="float:right;">Form <strong>9000</strong> (11-2021)</span>
					</div>
					<!-- Additonal Data Title Bar and Button -->
					<div class="styLeftOverTitleLine" id="LeftoverData">
						<div class="styLeftOverTitle">
						   Additional Data        
						</div>
						<div class="styLeftOverButtonContainer">
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
					<br/>
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
