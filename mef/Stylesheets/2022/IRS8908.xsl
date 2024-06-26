<?xml version="1.0" encoding="UTF-8"?>
<!-- Last Modified by Iskilu Lawal on 9/13/2021 drop 1 UWR # 243365 -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:include href="CommonPathRef.xsl"/>
<xsl:include href="PopulateTemplate.xsl"/>
<xsl:include href="AddHeader.xsl"/>
<xsl:include href="AddOnTable.xsl"/>
<xsl:include href="IRS8908Style.xsl"/>

<xsl:output method="html" indent="yes"/>
<xsl:strip-space elements="*"/>

<xsl:param name="Form8908" select="$RtnDoc/IRS8908"/>

<xsl:template match="/">

<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
  <head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
  <title><xsl:call-template name="FormTitle"><xsl:with-param name="RootElement" select="local-name($Form8908)"/></xsl:call-template></title>
  <!-- No Browser Caching -->
  <meta http-equiv="Pragma" content="no-cache"/>
  <meta http-equiv="Cache-Control" content="no-cache"/>
  <meta http-equiv="Expires" content="0"/>
  <!-- No Proxy Caching -->
  <meta http-equiv="Cache-Control" content="private"/>
  <!-- Define Character Set -->
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
  <meta name="Description" content="IRS Form 8908"/>
  
  <xsl:call-template name="InitJS"/>
  <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
  
  <style type="text/css">
   <xsl:if test="not($Print) or $Print=''">
       <xsl:call-template name="IRS8908Style"/>  
      <xsl:call-template name="AddOnStyle"/>
    </xsl:if>
  </style>
  <xsl:call-template name="GlobalStylesForm"/>
</head>
  <body class="styBodyClass">
    <form name="Form8908">
      <xsl:call-template name="DocumentHeader"/>

    <!--Title of Form -->    
  <div class="styBB" style="height: 21.5mm;width:187mm;">
    <div class="styFNBox" style="height: 21.5mm;width:26mm;font-size: 7pt;">
      Form <span class="styFormNumber">8908</span>      
      <br/>
      <span>
        <xsl:call-template name="SetFormLinkInline">
          <xsl:with-param name="TargetNode" select="$Form8908"/>
        </xsl:call-template>  
      </span>  
       <br/>
      <span class="styAgency">(Rev. January 2023)</span>
      <span class="styAgency">Department of the Treasury</span><br/><span class="styAgency">Internal Revenue Service</span>
    </div>
    <div class="styFTBox" style="height: 21.5mm;width:130mm;padding-top:4mm;">
      <div class="styMainTitle" style="height: 8mm">Energy Efficient Home Credit</div>
      <div class="styFST" style="width:130mm;font-size:7pt;">
        <img src="{$ImagePath}/8908_Bullet_Md.gif" alt="Medium Right Arrow Image"/>  
        Attach to your tax return. <br/><br/>
        <span style="text-align:left">
			<img src="{$ImagePath}/8908_Bullet_Md.gif" alt="Medium Right Arrow Image"/>
           Go to <a href="http://www.irs.gov/Form8908" title="Link to IRS.gov"><i>www.irs.gov/Form8908</i></a> for instructions and the latest information.
		 </span>
        <br/>
      </div>
    </div>
    <div class="styTYBox" style="width:31mm;height:21.5mm;border-left-width:1.5px;">
							<div class="styOMB" style="height:10mm;padding-top:3mm;padding-left:2mm;text-align:left;">
								OMB No. 1545-1979</div>
      <div style="height:10mm;width:30mm;padding-top:2mm;padding-left:2mm;font-size:7pt;text-align:left;">
Attachment<br/>Sequence No. <b>153</b></div>
    </div>
  </div>
  <!--  End title of Form  -->

    <div style="width:187mm;">
        <div class="styNameAddr" style="width:140mm;height:12mm;border-left-width:1px;padding-left:1px;border-left-width:0;font-size:7pt">
            Name(s) shown on return<br/>
        <div style="margin-left:2mm;padding-top:1mm;font-size:7pt;">
            <xsl:call-template name="PopulateReturnHeaderFiler">
                <xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
            </xsl:call-template><br/>
            <xsl:call-template name="PopulateReturnHeaderFiler">
                <xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
           </xsl:call-template>
        </div>
    </div>
    <div class="styNameAddr" style="font-size:7pt;width:46mm;height:12mm;border-left-width:1px;padding-left:1px;">
        <span style="width:8px"/>Identifying number
        <br/><span style="width:12px;padding-top:4.5mm;"/>
         <xsl:call-template name="PopulateReturnHeaderFiler">
          <xsl:with-param name="EINChanged">true</xsl:with-param>
          <xsl:with-param name="TargetNode">EIN</xsl:with-param>
         </xsl:call-template> 
         <xsl:call-template name="PopulateReturnHeaderFiler">
           <xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param>
         </xsl:call-template> 
      </div>
    </div>
    


<div class="styGenericDiv" style="width:187mm;padding-top:0.5mm;font-style:italic;clear:all;border-bottom-width:1px;border-bottom-style:solid;">
						<b>Note:</b> A contractor must own and have a basis in the qualified energy efficient home during its
						construction to qualify as an eligible contractor with respect to the home and claim the credit. See instructions
					</div>

    
    <div style="width:187mm; ">
        <div class="styLNLeftNumBox" style="height:4.5mm;">1a</div>
        <div class="styLNDesc" style="width:92mm;height:4.5mm;">Enter the total number of qualified energy efficient homes including<br/>
		 																					   qualified energy efficient manufactured homes meeting the 50% <br/>
																							   standard that were sold or leased before 2023 to another person for use as a
																							   residence during the tax year (see instructions)
        <!--Dotted Line-->
		<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">......</span>
        </div>
        <div class="styLNRightNumBox" style="height:13mm;padding-top:9.5mm;">1a</div>
        <div class="styLNAmountBox" style="height:13mm;padding-top:9.5mm;">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8908/TotalHomesMeetingStandardQty"/></xsl:call-template>
        </div>
        <div class="styLNRightNumBox" style="background-color:lightgrey;height:13mm;border-bottom-width:0px"/>
        <div class="styLNAmountBoxNBB" style="height:13mm;"/>
    </div>
    <div style="width:187mm;">
        <div class="styLNLeftNumBox" style="height:4.5mm;"><span style="width:6px"/>b</div>
        <div class="styLNDesc" style="width:132mm;height:4.5mm;">
			<span style="float:left;clear:none;">  
				  Multiply line 1a by $2,000
			</span>   
        <!--Dotted Line-->
        <span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">........................</span>
        </div>
        <div class="styLNRightNumBox" style="height:4.5mm;">1b</div>
        <div class="styLNAmountBox" style="width:39mm;height:4.5mm;">
           <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8908/TotalHomesStandardAmt"/></xsl:call-template>
       </div>
    </div>

    <div style="width:187mm;">
        <div class="styLNLeftNumBox" style="height:4.5mm;">2a</div>
        <div class="styLNDesc" style="width:92mm;height:4.5mm;">Enter the total number of qualified energy efficient manufactured<br/>
            homes meeting the 30% standard that were sold or leased before 2023 to another 
            person for use as a residence during the tax year (see instructions)
       
        <!--Dotted Line-->
			<span class="styDotLn" style="float:right;clear:none;padding-right:1mm;">..................</span>
        </div>
        <div class="styLNRightNumBox" style="height:13mm;padding-top:9.5mm;">2a</div>
        <div class="styLNAmountBox" style="height:13mm;padding-top:9.5mm;">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8908/TotalMfrHmMeetingStdQty"/></xsl:call-template>
        </div>
        <div class="styLNRightNumBox" style="background-color:lightgrey;height:13mm;border-bottom-width:0px"/>
        <div class="styLNAmountBoxNBB" style="height:13mm;"/>
    </div>
    
    <div style="width:187mm;">
        <div class="styLNLeftNumBox" style="height:4.5mm;"><span style="width:6px"/>b</div>
        <div class="styLNDesc" style="width:132mm;height:4.5mm;">
			<span style="float:left;clear:none;">Multiply line 2a by $1,000</span>   
        <!--Dotted Line-->
        <span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">........................</span>
        </div>
        <div class="styLNRightNumBox" style="height:4.5mm;">2b</div>
        <div class="styLNAmountBox" style="width:39mm;height:4.5mm;">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8908/TotalManufactureHomesAmt"/></xsl:call-template>
        </div>
    </div>

		<!-- Line 3a -->
       <div style="width:187mm;">
        <div class="styLNLeftNumBox" style="height:4.5mm;">3a</div>
        <div class="styLNDesc" style="width:92mm;height:4.5mm;">Enter the total number of qualified energy efficient homes eligible to participate in the Energy Star Residential New Construction Program or the Energy Star Manufactured New Homes Program (or the Energy Star Multifamily New Construction Program if the prevailing wage requirements are met) meeting the single or multifamily home requirements but not certified as a Zero Energy Ready Home that were sold or leased after 2022 to another person for use as a residence during the tax year (see instructions)
       
        <!--Dotted Line-->
			<span class="styDotLn" style="float:right;clear:none;padding-right:1mm;">.............</span>
        </div>
        <div class="styLNRightNumBox" style="height:26mm;padding-top:22.5mm;">3a</div>
        <div class="styLNAmountBox" style="height:26mm;padding-top:22.5mm;">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8908/TotQlfyEgyStarProgNotCertQty"/></xsl:call-template>
        </div>
        <div class="styLNRightNumBox" style="background-color:lightgrey;height:26mm;border-bottom-width:0px"/>
        <div class="styLNAmountBoxNBB" style="height:26mm;"/>
    </div>
    
    <!-- Line 3b -->
    <div style="width:187mm;">
        <div class="styLNLeftNumBox" style="height:4.5mm;"><span style="width:6px"/>b</div>
        <div class="styLNDesc" style="width:132mm;height:4.5mm;">
			<span style="float:left;clear:none;">Multiply line 3a by $2,500</span>   
        <!--Dotted Line-->
        <span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">........................</span>
        </div>
        <div class="styLNRightNumBox" style="height:4.5mm;">3b</div>
        <div class="styLNAmountBox" style="width:39mm;height:4.5mm;">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8908/TotQlfyEgyStarProgNotCertAmt"/></xsl:call-template>
        </div>
    </div>
    
      <!-- Line 4a -->
      <div style="width:187mm;">
        <div class="styLNLeftNumBox" style="height:4.5mm;">4a</div>
        <div class="styLNDesc" style="width:92mm;height:4.5mm;">Enter the total number of qualified energy efficient homes eligible to participate in the Energy Star Residential New Construction Program or the Energy Star Manufactured New Homes Program (or the Energy Star Multifamily New Construction Program if the prevailing wage requirements are met) and certified as a Zero Energy Ready Home that were sold or leased after 2022 to another person for use as a residence during the tax year(see instructions)
       
        <!--Dotted Line-->
			<span class="styDotLn" style="float:right;clear:none;padding-right:1mm;">...........</span>
        </div>
        <div class="styLNRightNumBox" style="height:22mm;padding-top:18.5mm;">4a</div>
        <div class="styLNAmountBox" style="height:22mm;padding-top:18.5mm;">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8908/TotQlfyEgyStarProgCertQty"/></xsl:call-template>
        </div>
        <div class="styLNRightNumBox" style="background-color:lightgrey;height:22mm;border-bottom-width:0px"/>
        <div class="styLNAmountBoxNBB" style="height:22mm;"/>
    </div>
    
    <!-- Line 4b -->
    <div style="width:187mm;">
        <div class="styLNLeftNumBox" style="height:4.5mm;"><span style="width:6px"/>b</div>
        <div class="styLNDesc" style="width:132mm;height:4.5mm;">
			<span style="float:left;clear:none;">Multiply line 4a by $5,000</span>   
        <!--Dotted Line-->
        <span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">........................</span>
        </div>
        <div class="styLNRightNumBox" style="height:4.5mm;">4b</div>
        <div class="styLNAmountBox" style="width:39mm;height:4.5mm;">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8908/TotQlfyEgyStarProgCertAmt"/></xsl:call-template>
        </div>
    </div>    
    
         <!-- Line 5a -->
      <div style="width:187mm;">
        <div class="styLNLeftNumBox" style="height:4.5mm;">5a</div>
        <div class="styLNDesc" style="width:92mm;height:4.5mm;">Enter the total number of qualified energy efficient homes eligible to participate in the Energy Star Multifamily New Construction Program meeting the multifamily home requirements but not meeting the prevailing wage requirements and not certified as a Zero Energy Ready Home that were sold or leased after 2022 to another person for use as a residence during the tax year (see instructions)
       
        <!--Dotted Line-->
			<span class="styDotLn" style="float:right;clear:none;padding-right:1mm;">.......</span>
        </div>
        <div class="styLNRightNumBox" style="height:19mm;padding-top:15.5mm;">5a</div>
        <div class="styLNAmountBox" style="height:19mm;padding-top:15.5mm;">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8908/TotQlfyEgyStarNotMetNotCertQty"/></xsl:call-template>
        </div>
        <div class="styLNRightNumBox" style="background-color:lightgrey;height:19mm;border-bottom-width:0px"/>
        <div class="styLNAmountBoxNBB" style="height:19mm;"/>
    </div>
    
    <!-- Line 5b -->
    <div style="width:187mm;">
        <div class="styLNLeftNumBox" style="height:4.5mm;"><span style="width:6px"/>b</div>
        <div class="styLNDesc" style="width:132mm;height:4.5mm;">
			<span style="float:left;clear:none;">Multiply line 5a by $500</span>   
        <!--Dotted Line-->
        <span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">........................</span>
        </div>
        <div class="styLNRightNumBox" style="height:4.5mm;">5b</div>
        <div class="styLNAmountBox" style="width:39mm;height:4.5mm;">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8908/TotQlfyEgyStarNotMetNotCertAmt"/></xsl:call-template>
        </div>
    </div>   
    

	       <!-- Line 6a -->
      <div style="width:187mm;">
        <div class="styLNLeftNumBox" style="height:4.5mm;">6a</div>
        <div class="styLNDesc" style="width:92mm;height:4.5mm;">Enter the total number of qualified energy efficient homes eligible to participate in the Energy Star Multifamily New Construction Program not meeting the prevailing wage requirements but certified as a Zero Energy Ready Home that were sold or leased after 2022 to another person for use as a residence during the tax year (see instructions)
       
        <!--Dotted Line-->
			<span class="styDotLn" style="float:right;clear:none;padding-right:1mm;">.....</span>
        </div>
        <div class="styLNRightNumBox" style="height:16mm;padding-top:12.5mm;">6a</div>
        <div class="styLNAmountBox" style="height:16mm;padding-top:12.5mm;">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8908/TotQlfyEgyStarNotMetCertQty"/></xsl:call-template>
        </div>
        <div class="styLNRightNumBox" style="background-color:lightgrey;height:16mm;border-bottom-width:0px"/>
        <div class="styLNAmountBoxNBB" style="height:16mm;"/>
    </div>
    
    <!-- Line 6b -->
    <div style="width:187mm;">
        <div class="styLNLeftNumBox" style="height:4.5mm;"><span style="width:6px"/>b</div>
        <div class="styLNDesc" style="width:132mm;height:4.5mm;">
			<span style="float:left;clear:none;">Multiply line 6a by $1,000</span>   
        <!--Dotted Line-->
        <span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">........................</span>
        </div>
        <div class="styLNRightNumBox" style="height:4.5mm;">6b</div>
        <div class="styLNAmountBox" style="width:39mm;height:4.5mm;">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8908/TotQlfyEgyStarNotMetCertAmt"/></xsl:call-template>
        </div>
    </div>   
    
    

   <div style="width:187mm;">
        <div class="styLNLeftNumBox" style="height:4.5mm;">7</div>
        <div class="styLNDesc" style="width:132mm;height:4.5mm;">
		   <span style="float:left;clear:none;">Energy efficient home credit from partnerships and S corporations (see instructions)</span>
         <!--Dotted Line-->
        <span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">......</span>
        </div>
        <div class="styLNRightNumBox" style="height:4.5mm;">7</div>
        <div class="styLNAmountBox" style="width:39mm;height:4.5mm;">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8908/EnergyEfficientHomeCreditAmt"/></xsl:call-template>
        </div>
    </div>
    
    <div class="styBB" style="width:187mm;">
        <div class="styLNLeftNumBox" style="height:7mm;">8</div>
        <div class="styLNDesc" style="width:132mm;height:7mm;">Add lines 1b, 2b, 3b, 4b, 5b, 6b, and 7. Partnerships and S corporations, report this amount on Schedule K. All others, report this amount on Form 3800, Part III, line 1p
        <!--Dotted Line-->
        <span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">............</span>
        </div>
        <div class="styLNRightNumBox" style="height:7mm;padding-top:4mm;border-bottom-width:0px">8</div>
        <div class="styLNAmountBox" style="width:39mm;height:7mm;padding-top:4mm;border-bottom-width:0px">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8908/TotalCreditAmt"/></xsl:call-template>
        </div>
    </div>
    
    <div style="width:187mm"> 
        <span class="styBoldText" style="width:100mm">For Paperwork Reduction Act Notice, see separate instructions.</span>
          Cat. No. 37718T
        <span style="width:64.5mm;text-align:right;">Form 
			<span style="font-size:8pt"><b>8908</b></span> (Rev. 1-2023)
        </span>
    </div>
    <br class="pageEnd"/>
          <div class="styLeftOverTitleLine" id="LeftoverData">
        <div class="styLeftOverTitle">Additional Data</div>
        <div class="styLeftOverButtonContainer">
          <input class="styLeftoverTableBtn" TabIndex="1" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
        </div>      
    </div>
      
    <table class="styLeftOverTbl">
        <xsl:call-template name="PopulateCommonLeftover">
          <xsl:with-param name="TargetNode" select="$Form8908"/>
          <xsl:with-param name="DescWidth" select="100"/>
        </xsl:call-template>
    </table>    
    </form>
  </body>
</html>

</xsl:template>

</xsl:stylesheet>