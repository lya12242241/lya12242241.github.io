<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="PopulateTemplate.xsl"/>

<xsl:output method="html" indent="yes"/>
<xsl:strip-space elements="*"/>

<xsl:param name="DependencyData" select="$RtnDoc/IntercompanyDivAdjustmentsSch"/>
<!--Dependency Display Name Intercompany Dividend Adjustments to Reconcile Schedule -->

<xsl:param name="depDocTitle">
  <xsl:call-template name="PopulateDisplayName" ><xsl:with-param name="TargetNode" select="$DependencyData" /></xsl:call-template> 
</xsl:param>  

<!-- Template to display Intercompany Dividend Adjustments to Reconcile Schedule -->
<xsl:template name="IntercompanyDivAdjustmentsSchTemp">
    <table id="IDASTbl" class="styDepTblLandscape" style="font-family:'verdana';text-align:center; ">
      <thead class="styTableThead">
        <tr class="styDepTblHdr" style="text-align:center;">
          <!-- <th class="styDepTblCell" scope="col" style="width:52mm">Corporation Name</th>
           <th class="styDepTblCell"  scope="col" style="width:18mm">Corporation EIN</th>-->
           <th class="styDepTblCell" scope="col" style="width:41mm; text-align:center; ">Name</th>
           <th class="styDepTblCell" scope="col" style="width:25mm; text-align:center;">EIN</th>   
           <th class="styDepTblCell" scope="col" style="width:40mm; text-align:center;">Class of Voting Stock</th>
           <th class="styDepTblCell" scope="col" style="width:30mm; text-align:center;">Net Adjustment Amount</th>
           <th class="styDepTblCell" scope="col" style="width:30mm; text-align:center;">Income (Loss) Per Income Statement Amount</th>
           <th class="styDepTblCell" scope="col" style="width:30mm; text-align:center;">Temporary Difference Amount</th>    
           <th class="styDepTblCell" scope="col" style="width:30mm; text-align:center;">Permanent Difference Amount</th>
           <th class="styDepTblCell" scope="col" style="width:30mm; text-align:center;">Income (Loss) Per Tax Return Amount</th>           
        </tr>
      </thead>
      <xsl:for-each select="$DependencyData/IntercompanyDivAdjRecncl">
        <tr>
          <xsl:attribute name="class">
          <xsl:choose>
             <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
             <xsl:otherwise>styDepTblRow2</xsl:otherwise>
          </xsl:choose>
          </xsl:attribute>
        
           <td class="styDepTblCell" style="text-align:left;width:43mm;font-size:6.5pt;">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine1"/>
            </xsl:call-template>
            <br/>
            <xsl:call-template name="PopulateText">          
              <xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine2"/>
            </xsl:call-template>
          </td>
          <td class="styDepTblCell" style="text-align:center;width:25mm;font-size:6.5pt;">
               <xsl:choose>
                  <xsl:when test="EIN">
                       <xsl:call-template name="PopulateEIN">
                          <xsl:with-param name="TargetNode" select="EIN"/>
                      </xsl:call-template>
               </xsl:when>
             <xsl:otherwise>
                    <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="MissingEINReasonCd"/>
                    </xsl:call-template>
                    </xsl:otherwise>
               </xsl:choose>
          </td>
          <td class="styDepTblCell" style="text-align:left;width:43mm;font-size:6.5pt;">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="ClassOfVotingStockTxt"/>
            </xsl:call-template>
          </td>
           <td class="styDepTblCell" style="text-align:right;width:30mm;font-size:6.5pt;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="NetAdjustmentIncludedAmt"/>
            </xsl:call-template>
          </td>
             <td class="styDepTblCell" style="text-align:right;width: 30mm;font-size:6.5pt;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IncomeLossPerIncomeStmtAmt"/>
            </xsl:call-template>
          </td>
         <td class="styDepTblCell" style="text-align:right;width:30mm;font-size:6.5pt;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="TemporaryDifferenceAmt"/>
            </xsl:call-template>
          </td>
       <td class="styDepTblCell" style="text-align:right;width: 30mm;font-size:6.5pt;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="PermanentDifferenceAmt"/>
            </xsl:call-template>
          </td>
         <td class="styDepTblCell" style="text-align:right;width: 30mm;font-size:6.5pt;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IncomeLossPerTaxReturnAmt"/>
            </xsl:call-template>
          </td>

        </tr>
      </xsl:for-each>
    </table>
  </xsl:template>


  
<!-- Main template -->
<xsl:template match="/">
  <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
    <head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
       <title><xsl:value-of select="$depDocTitle"/></title>
       <!-- No Browser Caching -->
       <meta http-equiv="Pragma" content="no-cache"/>
       <meta http-equiv="Cache-Control" content="no-cache"/>
       <meta http-equiv="Expires" content="0"/>
       <!-- No Proxy Caching -->
       <meta http-equiv="Cache-Control" content="private"/>
       <!-- Define Character Set -->
       <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
       <meta name="Author" content="Polina Zhuravlev: zhuravle@us.ibm.com"/>
       <meta name="Description" content="{$depDocTitle}"/>
       
      <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
      <xsl:call-template name="InitJS"/>
      <style type="text/css">
        <xsl:if test="not($Print) or $Print=''">
          <xsl:call-template name="AddOnStyle"/>
        </xsl:if>
      </style>      
    <xsl:call-template name="GlobalStylesDep"/>
</head>    
    <body class="styBodyClass">  

      <xsl:call-template name="DocumentHeaderDependencyLandscape"/>
      
      <div class="styDepTitleLineLandscape">
        <span class="styDepTitle">
          <span style="width:122mm;">        
            <xsl:value-of select="$depDocTitle"/>
          </span>        
        </span>
      </div>
        
      <xsl:call-template name="PopulateDepCommonLeftoverLandscape">
        <xsl:with-param name="TargetNode" select="$DependencyData"/>
      </xsl:call-template>
        
      <xsl:call-template name="IntercompanyDivAdjustmentsSchTemp"/>
      <br/>                      
    </body>
  </html>
</xsl:template>
</xsl:stylesheet>