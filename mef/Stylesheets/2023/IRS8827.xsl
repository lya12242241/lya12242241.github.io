<?xml version="1.0" encoding="UTF-8"?>
  <xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:include href="PopulateTemplate.xsl"/>
    <xsl:include href="AddHeader.xsl"/>
    <xsl:include href="CommonPathRef.xsl"/>
    <xsl:include href="AddOnTable.xsl"/>
    <xsl:include href="IRS8827Style.xsl"/>
    <xsl:output method="html" indent="yes"/>
    <xsl:strip-space elements="*"/>
    <xsl:param name="Form8827Data" select="$RtnDoc/IRS8827"/>
    <xsl:template match="/">
      <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
	  <html lang="EN-US">
        <head>
		  <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
          <title>
            <xsl:call-template name="FormTitle">
              <xsl:with-param name="RootElement" select="local-name($Form8827Data)"/>
            </xsl:call-template>
          </title>
          <!-- No Browser Caching  -->
          <meta http-equiv="Pragma" content="no-cache"/>
          <meta http-equiv="Cache-Control" content="no-cache"/>
          <meta http-equiv="Expires" content="0"/>
          <!-- No Proxy Caching -->
          <meta http-equiv="Cache-Control" content="private"/>
          <!-- Define Character Set -->
          <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
          <meta name="Description" content="IRS Form 8827"/>
          <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
          <xsl:call-template name="InitJS"/>
          <style type="text/css">
            <xsl:if test="not($Print) or $Print=''">
              <!--HINTS:  Form 8827 CSS Styles are located in the template called below    
			                   Work sheet (Page 2 of PDF) Do not need to be display per customer-->
              <xsl:call-template name="IRS8827Style"/>
              <xsl:call-template name="AddOnStyle"/>
            </xsl:if>
          </style>
          <xsl:call-template name="GlobalStylesForm"/>
        </head>
        <body class="styBodyClass" style="width:187mm;">
          <form name="Form8827">
            <xsl:call-template name="DocumentHeader"/>
            <!-- Begin Form Number and Name -->
            <div class="styBB" style="width:187mm;">
              <div class="styFNBox" style="width:31mm; height:21mm;">
                Form <span class="styFormNumber">8827</span><br/>(Rev. December 2022)
                <!--General Dependency Push Pin --> 
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form8827Data"/>
                </xsl:call-template>
                <br/>
                <br/>
                <span class="styAgency">Department of the Treasury</span>
                <br/>
                <span class="styAgency">Internal Revenue Service</span>
              </div>
              <div class="styFTBox" style="width:123mm; height:18mm;">
                <div class="styMainTitle" style="height:8mm; padding-top:1mm;">
                  Credit for Prior Year Minimum Tax-Corporations
                </div>
                <div class="styFST" style="height:5mm; font-size:7pt; padding-top:2mm;">
                  
                  Attach to the corporation's tax return.
                </div>
                <div class="styFST" style="height:5mm; font-size:7pt; padding-top:2mm; font-size:6.5pt;">
                  
                  Go to 
			      <a style="text-decoration:none; color:black;" href="http://www.irs.gov/form8827" title="Link to IRS.gov">
					<i>www.irs.gov/Form8827</i>
				  </a> for the latest information.             
                </div>
              </div>
              <div class="styTYBox" style="width:32mm; height:21mm;">
                <div  style="height:4mm; width:32mm;padding-top:9mm">
                  OMB No. 1545-0123
                </div>
                </div>
            </div>
            <!-- End Form Number and Name section -->
            <!-- Begin Names and Identifying number section -->
            <div class="styBB" style="width:187mm;">
              <div class="styNameBox" style="width:140.75mm; height:10mm; font-size:7pt;">
                Name<br/>
                <span style="font-size: 7pt; font-weight:normal;">
				  <xsl:call-template name="PopulateFilerName">
			        <xsl:with-param name="TargetNode" select="$Form8827Data"/>
				  </xsl:call-template> 				
			    </span>
              </div>
              <!--EIN-->
              <div class="styEINBox" style="width:46mm; height:4mm; font-size:7pt; float:left; padding-left:1mm;">
                Employer identification number
                <br/>
                <br/>
                <span style="font-weight:normal">
				  <xsl:call-template name="PopulateFilerTIN">
				    <xsl:with-param name="TargetNode" select="$Form8827Data"/>
				  </xsl:call-template>
			    </span>
              </div>
            </div>
            <!-- End Names and Identifying number section -->
            <!--Blank Line-->
            <div class="styBB" style="width:187mm;">
            <!--L1-->
                <div style="width:187mm;">
              <div class="styLNLeftNumBox">1</div>
              <div class="styLNDesc" style="width:138.75mm;"> Minimum tax credit carryforward from the prior tax year.  
				Enter the amount from line 4 of the prior tax year Form 8827  
                <!--Dotted Line-->
                <div class="styDotLn" style="float:right;padding-right:1mm;">..............................</div>
              </div>
                 <div class="styLNRightNumBox" style="height:8mm; padding-top:4mm; padding-right:0mm;" >1</div>
                  <div class="styLNAmountBox" style="height:8mm; padding-top:1mm;">
                <br/>
                <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form8827Data/PriorYearMinimumTaxCreditAmt"/>
                  </xsl:call-template>
              </div>
            </div>
            <!--L2-->
            <div style="width:187mm">
              <div class="styLNLeftNumBox">2</div>
              <div class="styLNDesc" style="width:138.75mm;">
                Enter the corporation's current year regular income tax liability minus allowable tax credits (see instructions)  
              </div>
              <div class="styLNRightNumBox">2</div>
              <div class="styLNAmountBox">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8827Data/CYRegTaxLiabiMinusAllwblCrAmt"/>
                </xsl:call-template>
              </div>
            </div>
            <!--L3-->
            <div style="width:187mm">
			 <div class="styLNLeftNumBox">3</div>
              <div class="styLNDesc" style="width:138.75mm;">
                <b>Current year minimum tax credit.</b> Enter the smaller of line 1 or line 2 here and on Form 1120, Schedule J, 
				Part I, line 5d (or the applicable line of your return). 
				  <!--Push Pin-->
                  <xsl:call-template name="SetFormLinkInline">
				    <xsl:with-param name="TargetNode" select="$Form8827Data/CurrentYearMinimumTaxCreditAmt"/>
				  </xsl:call-template>    
				  
                  <!-- Adding pen image -->
                  <!-- Removed per UWR 863136
                    <span style="width:1px;"/>
                    
                     <xsl:call-template name="LinkToLeftoverDataTableInline">
                    <xsl:with-param name="Desc">Line 3 - section 383 Or 384 Indicator Cd</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$Form8827Data/CurrentYearMinimumTaxCreditAmt/@section383Or384IndicatorCd"/>
                  </xsl:call-template> 
-->
                  <span style="width:1px;"/>     
                <!--Dotted Line-->
                <div class="styDotLn" style="float:right; padding-right:1mm;">................</div>
                <!--Dotted Line-->
              </div>
              <div class="styLNRightNumBox" style="height:10mm; padding-top:6mm;">3</div>
              <div class="styLNAmountBox" style="height:10mm; padding-top:6mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8827Data/CurrentYearMinimumTaxCreditAmt"/>
                </xsl:call-template>
              </div>
            </div>
            <!--L4-->
            <div style="width:187mm;">
              <div class="styLNLeftNumBox">4</div>
              <div class="styLNDesc" style="width:138.75mm;">
                <span class="styBoldText">Minimum tax credit carryforward. </span> 
				Subtract line 3 from line 1.  Keep a record of this amount to carry
				<span style="float:left;">forward and use in future years </span>
                <!--Dotted Line-->
                <div class="styDotLn" style="float:right;padding-right:1mm;">........................</div>
              </div>
              <div class="styLNRightNumBoxNBB" style="height:8mm; padding-top:4mm; padding-right:1mm;">4</div>
              <div class="styLNAmountBoxNBB" style="height:8mm; padding-top:1mm;">
                <br/>
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8827Data/MinimumTaxCreditCarryfowardAmt"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!--Page Footer -->
  		  <div style="width:110mm; font-weight:bold;" class="styGenericDiv">For Paperwork Reduction Act Notice, see instructions.</div>
          <div style="width:77mm; text-align:left;">                            
            Cat. No. 13008K        
            <span style="width:75px;"/>  
            Form <span class="styBoldText">8827</span>
           (Rev. 12-2022) 
          </div>
          <br/>
          <!--Page break -->
          <div class="pageEnd" style="width:187mm; padding-top:1mm;">
						<div style="float:right;">
							<span style="width:80px;"/>  
							<!--  Form <span class="styBoldText" style="font-size:8pt;">1120&#8211;S</span> (2020)-->
						</div>
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
          	<!-- ****************************Additional Data Table **********************************-->
					<table class="styLeftOverTbl">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS8827"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<!-- Removed per UWR 863136
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 3 section 383 Or 384 Indicator Code </xsl:with-param>
							<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS8827/CurrentYearMinimumTaxCreditAmt /@section383Or384IndicatorCd"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
-->
			</table>
					<!-- ****************************END Left Over Table *******************************-->
           </form>
      </body>
    </html>
  </xsl:template> 
</xsl:stylesheet>