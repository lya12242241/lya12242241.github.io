<?xml version="1.0"?>
<!DOCTYPE xsl:stylesheet [
	<!ENTITY nbsp "&#160;">
]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="IRS8896Style.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:output method="html" indent="yes" encoding="iso-8859-1"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="Form8896Data" select="$RtnDoc/IRS8896"/>
	<xsl:template match="/">
		<html>
			<head>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($Form8896Data)"/>
					</xsl:call-template>
				</title>
				<!-- No Browser Caching -->
				<meta http-equiv="Pragma" content="no-cache"/>
				<meta http-equiv="Cache-Control" content="no-cache"/>
				<meta http-equiv="Expires" content="0"/>
				<!-- No Proxy Caching -->
				<meta http-equiv="Cache-Control" content="private"/>
				<meta name="Description" content="Form IRS 8896"/>
				<meta name="GENERATOR" content="IBM WebSphere Studio"/>
				<xsl:call-template name="GlobalStylesForm"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS8896Style"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
			</head>
			<body class="styBodyClass">
				<form name="Form8896">
					<xsl:call-template name="DocumentHeader"/>
					<!-- Begin Form Number and Name -->
					<div class="styBB" style="width:187mm;">
						<div class="styFNBox" style="width:34mm; height:21mm;">
							<div style="height:13mm;">
            Form<span class="styFormNumber">  8896</span>
								<br/>
								<div class="styAgency">( Rev. December 2010)</div>
							</div>
							<div style="padding-top:.75mm;">
								<span class="styAgency">Department of the Treasury</span>
								<br/>
								<span class="styAgency">Internal Revenue Service</span>
							</div>
						</div>
						<div class="styFTBox" style="width:122mm;height:.21mm;">
							<div class="styMainTitle" style="height:11mm;">
            Low Sulfur Diesel Fuel Production Credit
          </div>
							<div class="styFST" style="height:4mm;font-size:7pt;">
								<img src="{$ImagePath}/3468_Bullet.gif" alt="bullet image"/>
            Attach to your tax return.
          </div>
						</div>
						<div class="styTYBox" style="width:30mm;height:21mm;">
							<div class="styOMB" style="height:2mm;">
            OMB No. 1545-1914
          </div>
							<div class="styTaxYear" style="height:9mm;padding-top:0;"/>
							<div style="text-align:left;padding-left:4mm;">Attachment <br/>Sequence No. <span class="styBoldText" style="font-size:11;">142</span>
							</div>
						</div>
					</div>
					<!-- End Form Number and Name section -->
					<!-- Begin Names and Identifying number section -->
					<div class="styBB" style="width:187mm;family-font:verdana;">
						<div class="styNameBox" style="width:156mm;height:8mm;font-size:7pt;font-weight:normal;">
          Name(s) shown on return<br/>
							<span>
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
								</xsl:call-template>
								<br/>
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
								</xsl:call-template>
							</span>
						</div>
						<div class="styEINBox" style="width:30mm;height:4mm;padding-left:2mm;font-size:7pt;font-weight:bold;">
          Identifying number<br/>
							<br/>
							<span style="width:25mm;text-align:left;font-weight:normal;">
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">EIN</xsl:with-param>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<!-- End Names and Identifying number section -->
					<!-- Begin Part I  -->
					<div class="styBB" style="width:187mm;font-family: verdana;font-size:7pt;">
						<div class="styPartName" style="background-color:black;">Part I</div>
						<!-- Revisit:-->
						<div class="styPartDesc"/>
					</div>
					<!-- line 1 -->
					<div class="styBB" style="width:187mm;">
						<div style="width:187mm;">
							<div class="styLNLeftNumBoxSD" style="height:4mm;">
            1
          </div>
							<div class="styLNDesc" style="width:139mm;height:4mm;">
								<div style="float:left;">
            Low sulfur diesel fuel produced (in gallons)
            </div>
								<!--Dotted Line-->
								<div style="float:right;">
									<span class="styDotLn" style="padding-right:3mm;">....................</span>
								</div>
							</div>
							<div class="styLNRightNumBox" style="height:4mm;">
          1
          </div>
							<div class="styLNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8896Data/LowSulphurDieselFuelProduced"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- line 2 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBoxSD" style="height:4mm;">
            2
          </div>
							<div class="styLNDesc" style="width:139mm;height:4mm;">
								<div style="float:left;">
          Multiply line 1 by $.05
          </div>
								<!--Dotted Line-->
								<div style="float:right;">
									<span class="styDotLn" style="padding-right:3mm;">..........................</span>
								</div>
							</div>
							<div class="styLNRightNumBox" style="height:4mm;">
          2
          </div>
							<div class="styLNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8896Data/AdjDieselFuelProduced"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- line 3 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBoxSD" style="height:4mm;">
            3
          </div>
							<div class="styLNDesc" style="width:139mm;height:4mm;">
								<div style="float:left;">
            Qualified costs limitation (see instructions)
            </div>
								<!--Dotted Line-->
								<div style="float:right;">
									<span class="styDotLn" style="padding-right:3mm;">.................</span>
								</div>
							</div>
							<div class="styLNRightNumBox" style="height:4mm;">
          3
          </div>
							<div class="styLNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8896Data/QlfyCostsLimitation"/>
								</xsl:call-template>
							</div>
						</div>
						<!--line 4 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBoxSD" style="height:4mm;">
            4
          </div>
							<div class="styLNDesc" style="width:139mm;height:4mm;">
								<div style="float:left;">
            Total low sulfur diesel fuel production credits allowed for all prior tax  years
            </div>
								<!--Dotted Line-->
								<div style="float:right;">
									<span class="styDotLn" style="padding-right:3mm;">.........</span>
								</div>
							</div>
							<div class="styLNRightNumBox" style="height:4mm;">
          4
          </div>
							<div class="styLNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8896Data/TotFuelPrdCrAllPrTaxYrs"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- line 5 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBoxSD" style="height:4mm;">
            5
          </div>
							<div class="styLNDesc" style="width:139mm;height:4mm;">
								<div style="float:left;">
              Subtract line 4 from line 3
              </div>
								<!--Dotted Line-->
								<div style="float:right;">
									<span class="styDotLn" style="padding-right:3mm;">.........................</span>
								</div>
							</div>
							<div class="styLNRightNumBox" style="height:4mm;">
          5
          </div>
							<div class="styLNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8896Data/TotPrdCrMnsQlfyCapCosts"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- line 6 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBoxSD" style="height:4mm;">
             6
          </div>
							<div class="styLNDesc" style="width:139mm;height:4mm;">
								<div style="float:left;">
            Enter the smaller of line 5 or line 2
            </div>
								<!--Dotted Line-->
								<div style="float:right;">
									<span class="styDotLn" style="padding-right:3mm;">......................</span>
								</div>
							</div>
							<div class="styLNRightNumBox" style="height:4mm;">
             6
          </div>
							<div class="styLNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8896Data/SmallerAdjDieselOrTotPrdCr"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- line 7 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBoxSD" style="height:4mm;"> 7</div>
							<div class="styLNDesc" style="width:139mm;height:4mm;">
								<div style="float:left;">
            Low sulfur diesel fuel production credit from partnerships, S corporations, and cooperatives
            </div>
								<!--Dotted Line-->
								<div style="float:right;">
									<span class="styDotLn" style="padding-right:3mm;">....</span>
								</div>
							</div>
							<div class="styLNRightNumBox" style="height:4mm;">
             7
          </div>
							<div class="styLNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8896Data/CrFromPassthroughEntities"/>
								</xsl:call-template>
							</div>
						</div>
						<!--Line 8  -->
						<!--****************************************************************   -->
						<div style="width:187mm;float:left;clear:none;">
							<div class="styLNLeftNumBoxSD" style="height:4.5mm;padding-top:1.75mm;">8</div>
							<div class="styLNDesc" style="width:138.9mm;height:4.5mm;padding-top:1.75mm;">
               
                         Add lines 6 and 7. Cooperatives go to line 9; partnerships and S corporations, report this amount
                         on Schedule K; all others, report this amount on the applicable line of Form 3800 (e.g., line 1n
                         of the 2010 Form 3800) 
                  <span class="styBoldText">
									<span style="width:16px;"/>.
                         <span style="width:16px;"/>.
                         <span style="width:16px;"/>.
                        <span style="width:16px;"/>.
                         <span style="width:16px;"/>.
                         <span style="width:16px;"/>.
                         <span style="width:16px;"/>.
                        <span style="width:16px;"/>.
                         <span style="width:16px;"/>.
                         <span style="width:16px;"/>.
                         <span style="width:16px;"/>.
                        <span style="width:16px;"/>.
                       <span style="width:16px;"/>.
                         <span style="width:16px;"/>.
                        <span style="width:16px;"/>.
                         <span style="width:16px;"/>.
                         <span style="width:16px;"/>.
                         <span style="width:16px;"/>.
                        <span style="width:16px;"/>.
                        <span style="width:16px;"/>.
                        <span style="width:16px;"/>.
                  </span>
							</div>
							<div class="styLNRightNumBoxNBB" style="height:7.3mm;background-color:lightgrey;"/>
							<div class="styLNAmountBoxNBB" style="height:7.3mm;"/>
							<div class="styLNRightNumBox" style="height:4.5mm;">8</div>
							<div class="styLNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8896Data/SumOfLines6And7"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 9 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBoxSD" style="height:4mm;">
             9
          </div>
							<div class="styLNDesc" style="width:139mm;height:4mm;">
								<div style="float:left;">
                Amount allocated to the patrons of the cooperative
          </div>
								<!--Dotted Line-->
								<div style="float:right;">
									<span class="styDotLn" style="padding-right:3mm;">..................</span>
								</div>
							</div>
							<div class="styLNRightNumBox" style="height:4mm;">
             9
          </div>
							<div class="styLNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8896Data/AmountAllocatedToPatrons"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- line 10 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:4mm;">10</div>
							<div class="styLNDesc" style="width:138.9mm;height:4mm;">
								<div class="styLNDesc">   Subtract line 9 from line 8. Report this amount on the applicable line of Form 3800 (e.g., line 1n </div>
								<div class="styGenericDiv"> of the 2010 Form 3800)
                      <span class="styBoldText">
										<span style="width:16px;"/>.
                         <span style="width:16px;"/>.
                         <span style="width:16px;"/>.
                         <span style="width:16px;"/>.
                         <span style="width:16px;"/>.
                         <span style="width:16px;"/>.
                         <span style="width:16px;"/>.
                         <span style="width:16px;"/>.
                         <span style="width:16px;"/>.
                         <span style="width:16px;"/>.
                         <span style="width:16px;"/>.
                         <span style="width:16px;"/>.
                         <span style="width:16px;"/>.
                         <span style="width:16px;"/>.
                         <span style="width:16px;"/>.
                         <span style="width:16px;"/>.
                         <span style="width:16px;"/>.
                         <span style="width:16px;"/>.
                     </span>
								</div>
							</div>
							<div class="styLNRightNumBoxNBB" style="height:8.5mm;padding-top:5mm">10</div>
							<div class="styLNAmountBoxNBB" style="height:8.5mm;padding-top:5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8896Data/SubtractLine9FromLine8"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- End Part I -->
					<!--footer -->
					<div style="width:187mm;clear:both;padding-top:1mm;" class="pageend">
						<div style="width:90mm;font-weight:bold;" class="styGenericDiv">For Paperwork Reduction Act Notice, see instructions.</div>
						<div style="width:55mm;text-align:center;" class="styGenericDiv">Cat. No. 37704F</div>
						<div style="float:right;" class="styGenericDiv">Form <span class="styBoldText">8896 </span> (Rev. 12-2010)</div>
					</div>
					<!-- additional data table -->
					<div style="width:187mm"/>
					<div class="styLeftOverTitleLine" id="LeftoverData">
						<div class="styLeftOverTitle">
        Additional Data        
      </div>
						<div class="styLeftOverButtonContainer">
							<input class="styLeftoverTableBtn" tabindex="1" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
					<table class="styLeftOverTbl">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$Form8896Data"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
					</table>
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
