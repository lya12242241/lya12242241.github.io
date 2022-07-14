<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS8863Style.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="Form8863Data" select="$RtnDoc/IRS8863"/>
	<xsl:param name="PartIData" select="$Form8863Data/RefundableAmerOppCreditGroup"/>
	<xsl:param name="PartIIData" select="$Form8863Data/NonrefundableEducationCrGroup"/>
	<xsl:param name="PartIIIData" select="$Form8863Data/StudentAndEducationalInstnGrp"/>
	<xsl:template name="Form8863Page2">
	<xsl:param name="NodeData" select="/.."/>
		<!-- Page Header -->
					<div style="width:187mm;padding-top:.5mm;border-bottom:1px solid black">
						Form 8863 (2012)<span style="width:148mm;"/>
						
						Page <span style="font-weight:bold;font-size:8pt;">2</span>
						
					</div>
					
					<!-- Name(s) shown on return -->
					<div style="width:187mm;border-bottom:1px solid black;">
						<div class="styFNBox" style="width:140mm; height:9mm;">
                    Name(s) shown on return<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">Name</xsl:with-param>
							</xsl:call-template>
							<br/>
						</div>
						<b>Your social security number</b>
						<br/>
						<div style="width:100%;text-align:center">
						<xsl:call-template name="PopulateSSN">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/PrimarySSN"/>
						</xsl:call-template>
						</div>
					</div>
					<!-- Part III -->
					<!-- Part III - Header -->
					<div style="width:187mm; border-bottom:1px solid black">
						<div class="styGenericDiv" style="width:18mm;padding-top:2mm;padding-bottom:2mm">
							<img alt="Caution" src="{$ImagePath}/8863_Caution.gif" width="50" height="50"/>
						</div>
						<div class="styGenericDiv" style="width:169mm;padding-top:2mm;font-size:8pt;font-weight:bold">
							<i>Complete Part III for each student for whom you are claiming either the American
							opportunity credit or lifetime learning credit. Use additional copies of Page 2 as needed for
							each student.</i>
		</div>
					</div>
					<div style="width:187mm;border-style:solid; border-bottom-width:1px;border-top-width:0px;
          border-right-width:0px;border-left-width:0px;float:left;">
						<span class="styPartName" style="width:15mm;font-size:13;">Part III</span>
						<span style="width:172mm;font-weight:normal;font-size:8pt;" class="styPartDesc">
							<span style="font-size:12.5;">
								<b>Student and Educational Institution Information </b>
							</span>
							<br/>See instructions. 
						</span>
					</div>
					
						<table cellspacing="0" style="width:187mm">
							<tbody>
								<tr style="height:13mm" valign="top">
									<td class="styTableCell" style="font-size:7pt;width:50%;border-color:black;text-align:left;">
										<div class="styLNLeftNumBox">20</div>
										Student name (as shown on page 1 of your tax return)<br/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="StudentName/PersonFirstName"/>
										</xsl:call-template>
										<span style="width:5px"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="StudentName/PersonLastName"/>
										</xsl:call-template>
										<span style="width:5px"/>
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Part III Line 20  -  Student <xsl:number value="position()"/> Name Control</xsl:with-param>
											<xsl:with-param name="TargetNode" select="StudentNameControl"/>
										</xsl:call-template>
									</td>
									<td class="styTableCell" style="font-size:7pt;width:50%;border-color:black;text-align:left;border-right-width:0px">
										<div class="styLNLeftNumBox">21</div>
										Student social security number (as shown on page 1 of your tax return)<br/>
										<span style="padding-left:8.5mm">
											<xsl:call-template name="PopulateSSN">
												<xsl:with-param name="TargetNode" select="StudentSSN"/>
											</xsl:call-template>
										</span>
									</td>
								</tr>
								<tr style="height:8.5mm" valign="top">
									<td class="styTableCell" style="font-size:7pt;width:50%;border-right-width:0px;border-color:black;text-align:left;">
										<div class="styLNLeftNumBox">22</div>
										Educational institution information (see instructions)
									</td>
									<td class="styTableCell" style="font-size:7pt;width:50%;border-color:black;text-align:center;border-right-width:0px">&#160;</td>
								</tr>
								</tbody>
								</table>
								<xsl:variable name="studentPos" select="position()"/>
								<xsl:for-each select="$NodeData/EducationalInstitutionGroup">
								<xsl:variable name="pos" select="position()"/>
								<xsl:if test="$pos mod 2 = 1">
								<table cellspacing="0" style="width:187mm;">
									<tbody>
								<!-- Lines a and b -->
								<tr style="height:auto" valign="top">
									<td class="styTableCell" style="font-size:7pt;width:93.5mm;border-color:black;text-align:left;word-wrap:break-word;">
										<div class="styLNLeftNumBox" style="padding-left:5mm;height:13mm">a.</div>
										Name of first educational institution <br/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="InstitutionNm/BusinessNameLine1"/>
										</xsl:call-template><br/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="InstitutionNm/BusinessNameLine2"/>
										</xsl:call-template>
									</td>
									<td class="styTableCell" style="font-size:7pt;width:93.5mm;border-color:black;text-align:left;border-right-width:0px;word-wrap:break-word;">
										<div class="styLNLeftNumBox" style="padding-left:5mm;height:13mm">b.</div>
										Name of second educational institution (if any)<br/>
										<xsl:if test="$NodeData/EducationalInstitutionGroup[$pos+1]/InstitutionNm">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$NodeData/EducationalInstitutionGroup[$pos+1]/InstitutionNm/BusinessNameLine1"/>
											</xsl:call-template><br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$NodeData/EducationalInstitutionGroup[$pos+1]/InstitutionNm/BusinessNameLine2"/>
											</xsl:call-template>
										</xsl:if>
									</td>
								</tr>
								<!-- Lines a(1) and b(1) -->
								<tr style="height:13mm" valign="top">
									<td class="styTableCell" style="font-size:7pt;width:50%;border-color:black;text-align:left;">
										<div class="styLNLeftNumBox" style="height:100%;padding-left:5mm;padding-right:1mm">(1)</div>
										Address. Number and street (or P.O. box). City, town or
										post office, state, and ZIP code. If a foreign address, see
										instructions.<br/>
										<xsl:if test="USAddress">
											<xsl:call-template name="PopulateUSAddressTemplate">
												<xsl:with-param name="TargetNode" select="USAddress"/>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="ForeignAddress">
											<xsl:call-template name="PopulateForeignAddressTemplate">
												<xsl:with-param name="TargetNode" select="ForeignAddress"/>
											</xsl:call-template>
										</xsl:if>
									</td>
									<td class="styTableCell" style="font-size:7pt;width:50%;border-color:black;text-align:left;border-right-width:0px">
										<div class="styLNLeftNumBox" style="height:100%;padding-left:5mm;padding-right:1mm">(1)</div>
										Address. Number and street (or P.O. box). City, town or
										post office, state, and ZIP code. If a foreign address, see
										instructions.<br/>
										<xsl:if test="$NodeData/EducationalInstitutionGroup[$pos+1]/InstitutionNm">
											<xsl:if test="$NodeData/EducationalInstitutionGroup[$pos+1]/USAddress">
												<xsl:call-template name="PopulateUSAddressTemplate">
													<xsl:with-param name="TargetNode" select="$NodeData/EducationalInstitutionGroup[$pos+1]/USAddress"/>
												</xsl:call-template>
											</xsl:if>
										
											<xsl:if test="$NodeData/EducationalInstitutionGroup[$pos+1]/ForeignAddress">
												<xsl:call-template name="PopulateForeignAddressTemplate">
													<xsl:with-param name="TargetNode" select="$NodeData/EducationalInstitutionGroup[$pos+1]/ForeignAddress"/>
												</xsl:call-template>
											</xsl:if>
										</xsl:if>
									</td>
								</tr>
								<!-- Lines a(2) and b(2) -->
								<tr style="height:13mm" valign="top">
									<td class="styTableCell" style="font-size:7pt;width:92mm;border-color:black;text-align:left;">
										<div class="styLNLeftNumBox" style="height:100%;padding-left:5mm;padding-right:1mm">(2)</div>
										<div class="styGenericDiv" style="width:63%; padding-left:0.5mm;">
											Did the student receive Form 1098-T
											from this institution for 2012?
										</div>
										<span>
											<xsl:call-template name="PopulateSpan">
												<xsl:with-param name="TargetNode" select="CurrentYear1098TReceivedInd"/>
											</xsl:call-template>
											<div class="styGenericDiv" style="width:13%; height:13mm;padding-top:3.5mm; padding-left:0mm">
												<input type="checkbox" class="styCkbox" name="Checkbox">
													<xsl:call-template name="PopulateYesCheckbox">
														<xsl:with-param name="TargetNode" select="CurrentYear1098TReceivedInd"/>
														<xsl:with-param name="BackupName">IRS8863CY1098TReceivedInd<xsl:value-of select="$studentPos"/>-<xsl:number value="position()"/></xsl:with-param>
													</xsl:call-template>
												</input>
												<label>
													<xsl:call-template name="PopulateLabelYes">
														<xsl:with-param name="TargetNode" select="CurrentYear1098TReceivedInd"/>
														<xsl:with-param name="BackupName">IRS8863CY1098TReceivedInd<xsl:value-of select="$studentPos"/>-<xsl:number value="position()"/></xsl:with-param>
													</xsl:call-template>
													Yes
												</label>
											</div>
											<div class="styGenericDiv" style="width:12%;padding-top:3.5mm; padding-left:0mm">
												<input type="checkbox" class="styCkbox" name="Checkbox">
													<xsl:call-template name="PopulateNoCheckbox">
														<xsl:with-param name="TargetNode" select="CurrentYear1098TReceivedInd"/>
														<xsl:with-param name="BackupName">IRS8863CY1098TReceivedInd<xsl:value-of select="$studentPos"/>-<xsl:number value="position()"/></xsl:with-param>
													</xsl:call-template>
												</input>
												<label>
													<xsl:call-template name="PopulateLabelNo">
														<xsl:with-param name="TargetNode" select="CurrentYear1098TReceivedInd"/>
														<xsl:with-param name="BackupName">IRS8863CY1098TReceivedInd<xsl:value-of select="$studentPos"/>-<xsl:number value="position()"/></xsl:with-param>
													</xsl:call-template>
													No
												</label>
											</div>
										</span>
									</td>
									<td class="styTableCell" style="font-size:7pt;width:94mm;border-color:black;text-align:left;border-right-width:0px">
										<div class="styLNLeftNumBox" style="height:100%;padding-left:5mm;padding-right:1mm">(2)</div>
										<div class="styGenericDiv" style="width:63%; padding-left:0.5mm">
											Did the student receive Form 1098-T
											from this institution for 2012?
										</div>
										<span>
											<xsl:call-template name="PopulateSpan">
												<xsl:with-param name="TargetNode" select="$NodeData/EducationalInstitutionGroup[$pos+1]/CurrentYear1098TReceivedInd"/>
											</xsl:call-template>
											<div class="styGenericDiv" style="width:13%; height:13mm;padding-top:3.5mm; padding-left:0mm">
												<input type="checkbox" class="styCkbox" name="Checkbox">
													<xsl:call-template name="PopulateYesCheckbox">
														<xsl:with-param name="TargetNode" select="$NodeData/EducationalInstitutionGroup[$pos+1]/CurrentYear1098TReceivedInd"/>
														<xsl:with-param name="BackupName">IRS8863CY1098TReceivedInd<xsl:value-of select="$studentPos"/>-<xsl:number value="position() + 1"/></xsl:with-param>
													</xsl:call-template>
												</input>
												<label>
													<xsl:call-template name="PopulateLabelYes">
														<xsl:with-param name="TargetNode" select="$NodeData/EducationalInstitutionGroup[$pos+1]/CurrentYear1098TReceivedInd"/>
														<xsl:with-param name="BackupName">IRS8863CY1098TReceivedInd<xsl:value-of select="$studentPos"/>-<xsl:number value="position() + 1"/></xsl:with-param>
													</xsl:call-template>
													Yes
												</label>
											</div>
											<div class="styGenericDiv" style="width:13%;padding-top:3.5mm; padding-left:0mm">
												<input type="checkbox" class="styCkbox" name="Checkbox">
													<xsl:call-template name="PopulateNoCheckbox">
														<xsl:with-param name="TargetNode" select="$NodeData/EducationalInstitutionGroup[$pos+1]/CurrentYear1098TReceivedInd"/>
														<xsl:with-param name="BackupName">IRS8863CY1098TReceivedInd<xsl:value-of select="$studentPos"/>-<xsl:number value="position() + 1"/></xsl:with-param>
													</xsl:call-template>
												</input>
												<label>
													<xsl:call-template name="PopulateLabelNo">
														<xsl:with-param name="TargetNode" select="$NodeData/EducationalInstitutionGroup[$pos+1]/CurrentYear1098TReceivedInd"/>
														<xsl:with-param name="BackupName">IRS8863CY1098TReceivedInd<xsl:value-of select="$studentPos"/>-<xsl:number value="position() + 1"/></xsl:with-param>
													</xsl:call-template>
													No
												</label>
											</div>
										</span>
									</td>
								</tr>
								<!-- Lines a(3) and b(3) -->
								<tr style="height:13mm" valign="top">
									<td class="styTableCell" style="font-size:7pt;width:92mm;border-color:black;text-align:left;">
										<div class="styLNLeftNumBox" style="height:100%;padding-left:5mm;padding-right:1mm">(3)</div>
										<div class="styGenericDiv" style="width:63%;padding-left:0.5mm;">
											Did the student receive Form 1098-T from this institution for 2011 with Box
											2 filed in and Box 7 checked?
										</div>
										<span>
											<xsl:call-template name="PopulateSpan">
												<xsl:with-param name="TargetNode" select="PriorYear1098TReceivedInd"/>
											</xsl:call-template>
											<div class="styGenericDiv" style="width:13%; height:13mm;padding-top:3.5mm; padding-left:0mm">
												<input type="checkbox" class="styCkbox" name="Checkbox">
													<xsl:call-template name="PopulateYesCheckbox">
														<xsl:with-param name="TargetNode" select="PriorYear1098TReceivedInd"/>
														<xsl:with-param name="BackupName">IRS8863PY1098TReceivedInd<xsl:value-of select="$studentPos"/>-<xsl:number value="position()"/></xsl:with-param>
													</xsl:call-template>
												</input>
												<label>
													<xsl:call-template name="PopulateLabelYes">
														<xsl:with-param name="TargetNode" select="PriorYear1098TReceivedInd"/>
														<xsl:with-param name="BackupName">IRS8863PY1098TReceivedInd<xsl:value-of select="$studentPos"/>-<xsl:number value="position()"/></xsl:with-param>
													</xsl:call-template>
													Yes
												</label>
											</div>
											<div class="styGenericDiv" style="width:12%;padding-top:3.5mm; padding-left:0mm">
												<input type="checkbox" class="styCkbox" name="Checkbox">
													<xsl:call-template name="PopulateNoCheckbox">
														<xsl:with-param name="TargetNode" select="PriorYear1098TReceivedInd"/>
														<xsl:with-param name="BackupName">IRS8863PY1098TReceivedInd<xsl:value-of select="$studentPos"/>-<xsl:number value="position()"/></xsl:with-param>
													</xsl:call-template>
												</input>
												<label>
													<xsl:call-template name="PopulateLabelNo">
														<xsl:with-param name="TargetNode" select="PriorYear1098TReceivedInd"/>
														<xsl:with-param name="BackupName">IRS8863PY1098TReceivedInd<xsl:value-of select="$studentPos"/>-<xsl:number value="position()"/></xsl:with-param>
													</xsl:call-template>
													No
												</label>
											</div>
										</span>
									</td>
									<td class="styTableCell" style="font-size:7pt;width:94mm;border-color:black;text-align:left;border-right-width:0px">
										<div class="styLNLeftNumBox" style="height:100%;padding-left:5mm;padding-right:1mm">(3)</div>
										<div class="styGenericDiv" style="width:63%; padding-left:0.5mm;">
											Did the student receive Form 1098-T from this institution for 2011 with Box
											2 filed in and Box 7 checked?
										</div>
										<span>
											<xsl:call-template name="PopulateSpan">
												<xsl:with-param name="TargetNode" select="$NodeData/EducationalInstitutionGroup[$pos+1]/PriorYear1098TReceivedInd"/>
											</xsl:call-template>
											<div class="styGenericDiv" style="width:13%; height:13mm;padding-top:3.5mm; padding-left:0mm">
												<input type="checkbox" class="styCkbox" name="Checkbox">
													<xsl:call-template name="PopulateYesCheckbox">
														<xsl:with-param name="TargetNode" select="$NodeData/EducationalInstitutionGroup[$pos+1]/PriorYear1098TReceivedInd"/>
														<xsl:with-param name="BackupName">IRS8863PY1098TReceivedInd<xsl:value-of select="$studentPos"/>-<xsl:number value="position() + 1"/></xsl:with-param>
													</xsl:call-template>
												</input>
												<label>
													<xsl:call-template name="PopulateLabelYes">
														<xsl:with-param name="TargetNode" select="$NodeData/EducationalInstitutionGroup[$pos+1]/PriorYear1098TReceivedInd"/>
														<xsl:with-param name="BackupName">IRS8863PY1098TReceivedInd<xsl:value-of select="$studentPos"/>-<xsl:number value="position() + 1"/></xsl:with-param>
													</xsl:call-template>
													Yes
												</label>
											</div>
											<div class="styGenericDiv" style="width:13%;padding-top:3.5mm; padding-left:0mm">
												<input type="checkbox" class="styCkbox" name="Checkbox">
													<xsl:call-template name="PopulateNoCheckbox">
														<xsl:with-param name="TargetNode" select="$NodeData/EducationalInstitutionGroup[$pos+1]/PriorYear1098TReceivedInd"/>
														<xsl:with-param name="BackupName">IRS8863PY1098TReceivedInd<xsl:value-of select="$studentPos"/>-<xsl:number value="position() + 1"/></xsl:with-param>
													</xsl:call-template>
												</input>
												<label>
													<xsl:call-template name="PopulateLabelNo">
														<xsl:with-param name="TargetNode" select="$NodeData/EducationalInstitutionGroup[$pos+1]/PriorYear1098TReceivedInd"/>
														<xsl:with-param name="BackupName">IRS8863PY1098TReceivedInd<xsl:value-of select="$studentPos"/>-<xsl:number value="position() + 1"/></xsl:with-param>
													</xsl:call-template>
													No
												</label>
											</div>
										</span>
									</td>
								</tr>
								<tr style="height:8mm" valign="top">
									<td class="styTableCell" style="font-size:7pt;width:50%;border-color:black;text-align:left;">
										If you checked “No” in <b>both (2) and (3)</b>, skip <b>(4)</b>.
									</td>
									<td class="styTableCell" style="font-size:7pt;width:50%;border-color:black;text-align:left;border-right-width:0px">
										If you checked “No” in <b>both (2) and (3)</b>, skip <b>(4)</b>.
									</td>
								</tr>
								<!-- Lines a(4) and b(4) -->
								<tr style="height:13mm" valign="top">
									<td class="styTableCell" style="font-size:7pt;width:50%;border-color:black;text-align:left;">
										<div class="styLNLeftNumBox" style="height:100%;padding-left:5mm;padding-right:1mm">(4)</div>
										If you checked “Yes” in either <b>(2) or (3)</b>, enter the institution's federal identification number (from Form
										1098-T).<br/>
																
										<xsl:call-template name="PopulateEIN">
											<xsl:with-param name="TargetNode" select="EIN"/>
										</xsl:call-template>
										<xsl:if test= "not(EIN)">
											_ _ - _ _ _ _ _ _ _
										</xsl:if>
									</td>
									<td class="styTableCell" style="font-size:7pt;width:50%;border-color:black;text-align:left;border-right-width:0px">
										<div class="styLNLeftNumBox" style="height:100%;padding-left:5mm;padding-right:1mm">(4)</div>
										If you checked “Yes” in either <b>(2) or (3)</b>, enter the institution's federal identification number (from Form
										1098-T).<br/>
										<xsl:call-template name="PopulateEIN">
											<xsl:with-param name="TargetNode" select="$NodeData/EducationalInstitutionGroup[$pos+1]/EIN"/>
										</xsl:call-template>
										<xsl:if test="not($NodeData/EducationalInstitutionGroup[$pos+1]/EIN)">
											_ _ - _ _ _ _ _ _ _
										</xsl:if>
									</td>
								</tr>
								</tbody>
								</table>
								</xsl:if>
								</xsl:for-each>
								<table cellspacing="0" style="width:187mm;page-break-after:always;">
								<tbody>
								<!-- Line 23 -->
								<tr style="height:13mm" valign="top">
									<td class="styTableCell" style="font-size:7pt;width:50%;border-color:black;text-align:left;border-right-width:0px">
										<div class="styLNLeftNumBox">23</div>
											Has the Hope Scholarship Credit or American opportunity
											credit been claimed for this student for any prior 4 tax
											years?
									</td>
									<td class="styTableCell" style="font-size:7pt;width:50%;border-color:black;text-align:left;border-right-width:0px">
										<xsl:call-template name="PopulateSpan">
											<xsl:with-param name="TargetNode" select="PriorYearCreditClaimedInd"/>
										</xsl:call-template>
										<div class="styGenericDiv" style="width:5%;height:100%;padding-top:3.5mm; padding-left:2mm">
											<input type="checkbox" class="styCkbox" name="Checkbox">
												<xsl:call-template name="PopulateYesCheckbox">
													<xsl:with-param name="TargetNode" select="PriorYearCreditClaimedInd"/>
													<xsl:with-param name="BackupName">IRS8863PYCreditClaimedInd<xsl:number value="position()"/></xsl:with-param>
												</xsl:call-template>
											</input>
										</div>
										<div class="styGenericDiv" style="width:45%;padding-top:0.75mm;padding-left:1mm;height:100%;">
											<label>
												<xsl:call-template name="PopulateLabelYes">
													<xsl:with-param name="TargetNode" select="PriorYearCreditClaimedInd"/>
													<xsl:with-param name="BackupName">IRS8863PYCreditClaimedInd<xsl:number value="position()"/></xsl:with-param>
												</xsl:call-template>
												Yes 
											</label>
											&#8213; <b>Stop!</b>
											<br/> Go to line 31 for this student.
										</div>
										<div class="styGenericDiv" style="width:5%;padding-top:3.5mm; padding-left:2mm;height:100%;">
											<input type="checkbox" class="styCkbox" name="Checkbox">
												<xsl:call-template name="PopulateNoCheckbox">
													<xsl:with-param name="TargetNode" select="PriorYearCreditClaimedInd"/>
													<xsl:with-param name="BackupName">IRS8863PYCreditClaimedInd<xsl:number value="position()"/></xsl:with-param>
												</xsl:call-template>
											</input>
										</div>
										<div class="styGenericDiv" style="padding-top:1.5mm;width:44%;padding-left:1mm;height:100%;">
											<label>
												<xsl:call-template name="PopulateLabelNo">
													<xsl:with-param name="TargetNode" select="PriorYearCreditClaimedInd"/>
													<xsl:with-param name="BackupName">IRS8863PYCreditClaimedInd<xsl:number value="position()"/></xsl:with-param>
												</xsl:call-template>
												No 
											</label>
											&#8213; Go to line 24.
										</div>
									</td>
								</tr>
								<!-- Line 24 -->
								<tr style="height:13mm" valign="top">
									<td class="styTableCell" style="font-size:7pt;width:50%;border-color:black;text-align:left;border-right-width:0px">
										<div class="styLNLeftNumBox" style="height:100%">24</div>
											Was the student enrolled at least half-time for at least one
											academic period that began in 2012 at an eligible
											educational institution in a program leading towards a
											postsecondary degree, certificate, or other recognized
											postsecondary educational credential? (see instructions)
									</td>
									<td class="styTableCell" style="font-size:7pt;width:50%;border-color:black;text-align:left;border-right-width:0px">
										<xsl:call-template name="PopulateSpan">
											<xsl:with-param name="TargetNode" select="AcademicPdEligibleStudentInd"/>
										</xsl:call-template>
										<div class="styGenericDiv" style="width:5%;height:100%;padding-top:3.5mm; padding-left:2mm">
											<input type="checkbox" class="styCkbox" name="Checkbox">
												<xsl:call-template name="PopulateYesCheckbox">
													<xsl:with-param name="TargetNode" select="AcademicPdEligibleStudentInd"/>
													<xsl:with-param name="BackupName">IRS8863AcademicPdEligStudentInd<xsl:number value="position()"/></xsl:with-param>
												</xsl:call-template>
											</input>
										</div>
										<div class="styGenericDiv" style="width:45%;padding-top:0.75mm;padding-left:1mm;height:100%;">
											<label>
												<xsl:call-template name="PopulateLabelYes">
													<xsl:with-param name="TargetNode" select="AcademicPdEligibleStudentInd"/>
													<xsl:with-param name="BackupName">IRS8863AcademicPdEligStudentInd<xsl:number value="position()"/></xsl:with-param>
												</xsl:call-template>
												Yes 
											</label>
											&#8213; Go to line 25.
										</div>
										<div class="styGenericDiv" style="width:5%;padding-top:3.5mm; padding-left:2mm;height:100%;">
											<input type="checkbox" class="styCkbox" name="Checkbox">
												<xsl:call-template name="PopulateNoCheckbox">
													<xsl:with-param name="TargetNode" select="AcademicPdEligibleStudentInd"/>
													<xsl:with-param name="BackupName">IRS8863AcademicPdEligStudentInd<xsl:number value="position()"/></xsl:with-param>
												</xsl:call-template>
											</input>
										</div>
										<div class="styGenericDiv" style="padding-top:1.5mm;width:44%;padding-left:1mm;height:100%;">
											<label>
												<xsl:call-template name="PopulateLabelNo">
													<xsl:with-param name="TargetNode" select="AcademicPdEligibleStudentInd"/>
													<xsl:with-param name="BackupName">IRS8863AcademicPdEligStudentInd<xsl:number value="position()"/></xsl:with-param>
												</xsl:call-template>
												No 
											</label>
											&#8213; <b>Stop!</b><br/> Go to line 31 for this student.
										</div>
									</td>
								</tr>
								<!-- Line 25 -->
								<tr style="height:13mm" valign="top">
									<td class="styTableCell" style="font-size:7pt;width:50%;border-color:black;text-align:left;border-right-width:0px">
										<div class="styLNLeftNumBox">25</div>
											Did the student complete the first 4 years of post-secondary
											education before 2012?
									</td>
									<td class="styTableCell" style="font-size:7pt;width:50%;border-color:black;text-align:left;border-right-width:0px">
										<xsl:call-template name="PopulateSpan">
											<xsl:with-param name="TargetNode" select="PostSecondaryEducationInd"/>
										</xsl:call-template>
										<div class="styGenericDiv" style="width:5%;height:100%;padding-top:3.5mm; padding-left:2mm">
											<input type="checkbox" class="styCkbox" name="Checkbox">
												<xsl:call-template name="PopulateYesCheckbox">
													<xsl:with-param name="TargetNode" select="PostSecondaryEducationInd"/>
													<xsl:with-param name="BackupName">IRS8863PostSecondaryEducationInd<xsl:number value="position()"/></xsl:with-param>
												</xsl:call-template>
											</input>
										</div>
										<div class="styGenericDiv" style="width:45%;padding-top:0.75mm;padding-left:1mm;height:100%;">
											<label>
												<xsl:call-template name="PopulateLabelYes">
													<xsl:with-param name="TargetNode" select="PostSecondaryEducationInd"/>
													<xsl:with-param name="BackupName">IRS8863PostSecondaryEducationInd<xsl:number value="position()"/></xsl:with-param>
												</xsl:call-template>
												Yes 
											</label>
											&#8213; <b>Stop!</b><br/> Go to line 31 for this student.
										</div>
										<div class="styGenericDiv" style="width:5%;padding-top:3.5mm; padding-left:2mm;height:100%;">
											<input type="checkbox" class="styCkbox" name="Checkbox">
												<xsl:call-template name="PopulateNoCheckbox">
													<xsl:with-param name="TargetNode" select="PostSecondaryEducationInd"/>
													<xsl:with-param name="BackupName">IRS8863PostSecondaryEducationInd<xsl:number value="position()"/></xsl:with-param>
												</xsl:call-template>
											</input>
										</div>
										<div class="styGenericDiv" style="padding-top:1.5mm;width:44%;padding-left:1mm;height:100%;">
											<label>
												<xsl:call-template name="PopulateLabelNo">
													<xsl:with-param name="TargetNode" select="PostSecondaryEducationInd"/>
													<xsl:with-param name="BackupName">IRS8863PostSecondaryEducationInd<xsl:number value="position()"/></xsl:with-param>
												</xsl:call-template>
												No 
											</label>
											&#8213; Go to line 26.
										</div>
									</td>
								</tr>
								<!-- Line 26 -->
								<tr style="height:13mm" valign="top">
									<td class="styTableCell" style="font-size:7pt;width:50%;border-color:black;text-align:left;border-right-width:0px">
										<div class="styLNLeftNumBox">26</div>
											Was the student convicted, before the end of 2012, of a
											felony for possession or distribution of a controlled
											substance?
									</td>
									<td class="styTableCell" style="font-size:7pt;width:50%;border-color:black;text-align:left;border-right-width:0px">
										<xsl:call-template name="PopulateSpan">
											<xsl:with-param name="TargetNode" select="DrugFelonyConvictionInd"/>
										</xsl:call-template>
										<div class="styGenericDiv" style="width:5%;height:100%;padding-top:3.5mm; padding-left:2mm">
											<input type="checkbox" class="styCkbox" name="Checkbox">
												<xsl:call-template name="PopulateYesCheckbox">
													<xsl:with-param name="TargetNode" select="DrugFelonyConvictionInd"/>
													<xsl:with-param name="BackupName">IRS8863DrugFelonyConvictionInd<xsl:number value="position()"/></xsl:with-param>
												</xsl:call-template>
											</input>
										</div>
										<div class="styGenericDiv" style="width:45%;padding-top:0.75mm;padding-left:1mm;height:100%;">
											<label>
												<xsl:call-template name="PopulateLabelYes">
													<xsl:with-param name="TargetNode" select="DrugFelonyConvictionInd"/>
													<xsl:with-param name="BackupName">IRS8863DrugFelonyConvictionInd<xsl:number value="position()"/></xsl:with-param>
												</xsl:call-template>
												Yes 
											</label>
											&#8213; <b>Stop!</b>
											<br/> Go to line 31 for this student.
										</div>
										<div class="styGenericDiv" style="width:5%;padding-top:3.5mm; padding-left:2mm;height:100%;">
											<input type="checkbox" class="styCkbox" name="Checkbox">
												<xsl:call-template name="PopulateNoCheckbox">
													<xsl:with-param name="TargetNode" select="DrugFelonyConvictionInd"/>
													<xsl:with-param name="BackupName">IRS8863DrugFelonyConvictionInd<xsl:number value="position()"/></xsl:with-param>
												</xsl:call-template>
											</input>
										</div>
										<div class="styGenericDiv" style="padding-top:1.5mm;width:44%;padding-left:1mm;height:100%;">
											<label>
												<xsl:call-template name="PopulateLabelNo">
													<xsl:with-param name="TargetNode" select="DrugFelonyConvictionInd"/>
													<xsl:with-param name="BackupName">IRS8863DrugFelonyConvictionInd<xsl:number value="position()"/></xsl:with-param>
												</xsl:call-template>
												No 
											</label>
											&#8213; See <i>Tip</i> below and complete <b>either</b> lines 27-30 <b>or</b> line 31 for this student.
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					<div style="width:187mm;border-style:solid; border-bottom-width:1px;border-top-width:0px;
          border-right-width:0px;border-left-width:0px;float:left;">
          <!-- Tip -->
					<div style="width:187mm;border-bottom:1px solid black;">
						<div class="styGenericDiv" style="width:18mm;">
							<img alt="Caution" src="{$ImagePath}/8863_Tip.gif" width="57" height="57"/>
						</div>
						<div class="styGenericDiv" style="width:169mm;padding-top:0.5mm;font-size:8pt;">
							When you figure your taxes, you may want to compare the American opportunity credit and lifetime learning credits, and choose the credit for each student that gives you the lower tax liability. You <i><b>cannot</b> take the American opportunity credit and the lifetime learning credit for the <b>same student</b> in the
							same year.</i> If you complete lines 27 through 30 for this student, do not complete line 31.
						</div>
					</div>
						<span style="width:172mm;font-weight:normal;font-size:8pt;" class="styPartDesc">
							<span style="font-size:12.5;">
								<b>American Opportunity Credit</b>
							</span>
						</span>
					</div>
					<!-- Line 27 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:5mm;padding-top:1mm;padding-left: 2.25mm">27
        </div>
						<div class="styLNDesc" style="width:142mm;height:5mm;padding-top:1mm;">
        Adjusted qualified education expenses (see instructions). <b> Do not enter more than $4,000</b>
        <!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:16px"/>.
								<span style="width:16px"/>.
								<span style="width:16px"/>.
								<span style="width:16px"/>.
            </span>
						</div>
						<div class="styLNRightNumBox" style="height:5mm;width:7.1mm;padding-top:0mm;">27</div>
						<div class="styLNAmountBox" style="width:29.8mm;height:5mm;padding-top:0mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="AmerOppQualifiedExpensesAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 28 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:5mm;padding-top:1mm;padding-left: 2.25mm">28
        </div>
						<div class="styLNDesc" style="width:142mm;height:5mm;padding-top:1mm;">
        Subtract $2,000 from line 27. If zero or less enter -0-
        <!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:16px"/>.
								<span style="width:16px"/>.
								<span style="width:16px"/>.
								<span style="width:16px"/>.
								<span style="width:16px"/>.
								<span style="width:16px"/>.
								<span style="width:16px"/>.
								<span style="width:16px"/>.
								<span style="width:16px"/>.
								<span style="width:16px"/>.
								<span style="width:16px"/>.
								
            </span>
						</div>
						<div class="styLNRightNumBox" style="height:5mm;width:7.1mm;padding-top:0mm;">28</div>
						<div class="styLNAmountBox" style="width:29.8mm;height:5mm;padding-top:0mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="AmerOppQlfyExpnssLessAllwblAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 29 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:5mm;padding-top:1mm;padding-left: 2.25mm">29
        </div>
						<div class="styLNDesc" style="width:142mm;height:5mm;padding-top:1mm;">
        Multiply line 28 by 25% (.25)
        <!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:16px"/>.
								<span style="width:16px"/>.
								<span style="width:16px"/>.
								<span style="width:16px"/>.
								<span style="width:16px"/>.
								<span style="width:16px"/>.
								<span style="width:16px"/>.
								<span style="width:16px"/>.
								<span style="width:16px"/>.
								<span style="width:16px"/>.
								<span style="width:16px"/>.
								<span style="width:16px"/>.
								<span style="width:16px"/>.
								<span style="width:16px"/>.
								<span style="width:16px"/>.
								<span style="width:16px"/>.
								<span style="width:16px"/>.
            </span>
						</div>
						<div class="styLNRightNumBox" style="height:5mm;width:7.1mm;padding-top:0mm;">29</div>
						<div class="styLNAmountBox" style="width:29.8mm;height:5mm;padding-top:0mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="AmerOppAllwblExpnssTimesPctAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 30 -->
					<div style="width:187mm;border-bottom:1px solid black">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-top:0mm;padding-left: 2.25mm">30
        </div>
						<div class="styLNDesc" style="font-size:7pt;width:142mm;height:4mm;padding-top:0mm;">
							If line 28 is zero, enter the amount from line 27. Otherwise, add $2,000 to the amount on line 29 and
enter<br/>the result. Skip line 31. Include the total of all amounts from all Parts III, line 30 on Part I, line 1
        <!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:16px"/>.
                 <span style="width:16px"/>.
            </span>
						</div>
						<div class="styLNRightNumBox" style="height:7mm;width:7.1mm;padding-top:2mm;border-bottom-width:0px;">30</div>
						<div class="styLNAmountBox" style="width:29.8mm;height:7mm;padding-top:2mm;border-bottom-width:0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="AmerOppCreditNetCalcExpnssAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;border-style:solid; border-bottom-width:1px;border-top-width:0px;
          border-right-width:0px;border-left-width:0px;float:left;">
						<span style="width:172mm;font-weight:normal;font-size:8pt;" class="styPartDesc">
							<span style="font-size:12.5;">
								<b>Lifetime Learning Credit</b>
							</span>
							<span style="width:9px"/>
						</span>
					</div>
					<!-- Line 31 -->
					<div style="width:187mm;border-bottom:1px solid black">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:5mm;padding-top:1mm;padding-left: 2.25mm">31
        </div>
						<div class="styLNDesc" style="width:142mm;height:5mm;padding-top:1mm;">
        Adjusted qualified education expenses (see instructions). Include the total of all amounts from all Parts III, line 31, on Part II, line 10
        <!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:16px"/>.
								<span style="width:16px"/>.
								<span style="width:16px"/>.
								<span style="width:16px"/>.
								<span style="width:16px"/>.
								<span style="width:16px"/>.
								<span style="width:16px"/>.
								<span style="width:16px"/>.
								<span style="width:16px"/>.
								<span style="width:16px"/>.
								<span style="width:16px"/>.
								<span style="width:16px"/>.
								<span style="width:16px"/>.
								<span style="width:16px"/>.
								<span style="width:16px"/>.
								<span style="width:16px"/>.
								<span style="width:16px"/>.
            </span>
						</div>
						<div class="styLNRightNumBox" style="height:8mm;width:7.1mm;padding-top:4mm;border-bottom-width:0px">31</div>
						<div class="styLNAmountBox" style="width:29.8mm;height:8mm;padding-top:4mm;border-bottom-width:0px">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="LifetimeQualifiedExpensesAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Page Break and Footer-->
					<div style="width:187mm;padding-top:0mm;border-top-width:1px;">
						<div style="width:100%;text-align:right">
							Form <span class="styBoldText" style="font-size:8pt;">8863</span> (2012) 
						</div>
					</div>
	</xsl:template>
	<xsl:template match="/">
		<html lang="EN-US">
			<head>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($Form8863Data)"/>
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
				<meta name="Description" content="IRS Form 8863"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS8863Style"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form name="Form8863">
					
					<xsl:call-template name="DocumentHeader"/>
					<div class="styBB" style="width:187mm;height:23.5mm;">
						<div class="styFNBox" style="width:31mm;height:100%;">
      Form 
            <span class="styFormNumber">8863</span>
							<br/>
							<br/>
							<span class="styAgency">Department of the Treasury</span>
							<br/>
							<span class="styAgency">Internal Revenue Service (99)</span>
						</div>
						<div class="styFTBox" style="width:125mm;height:100%;">
							<div class="styMainTitle" style="height:7mm;padding-top:1mm;">Education Credits<br/>
								<span style="font-weight:normal">(American Opportunity and Lifetime Learning Credits)</span>
							</div>
							<div class="styFBT" stype="font-size:7pt;height:6mm;padding-top:0mm;">
								<img src="{$ImagePath}/8863_Bullet.gif" alt="MediumBullet"/>  Information on Form 8863 and its separate instructions is at <i>www.irs.gov/form8863</i>.<br/>
								<img src="{$ImagePath}/8863_Bullet.gif" alt="MediumBullet"/> Attach to Form 1040 or 1040A.<br/>
							</div>
						</div>
						<div class="styTYBox" style="width:31mm; height:100%">
							<div style="padding-top:1mm;border-bottom:1 solid black">OMB No. 1545-0074</div>
							<div class="styTaxYear" style="font-size:21pt;">20<span class="styTYColor" style="font-size:21pt">12</span>
							</div>
							<div class="stySequence">Attachment<br/>Sequence No. <b style="font-size:8pt">50</b>
							</div>
						</div>
					</div>
					<!-- Name(s) shown on return -->
					<div class="styBB" style="width:187mm;">
						<div class="styFNBox" style="width:140mm; height:9mm;">
                    Name(s) shown on return<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">Name</xsl:with-param>
							</xsl:call-template>
							<br/>
						</div>
						<b>Your social security number</b>
						<br/>
						<div style="width:100%;text-align:center">
						<xsl:call-template name="PopulateSSN">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/PrimarySSN"/>
						</xsl:call-template>
						</div>
					</div>
					<!-- Part l -->
					<!-- Part I - Header -->
					<div class="styBB" style="width:187mm;">
						<div class="styGenericDiv" style="width:18mm;padding-top:2mm;padding-bottom:2mm">
							<img alt="Caution" src="{$ImagePath}/8863_Caution.gif" width="50" height="50"/>
						</div>
						<div class="styGenericDiv" style="width:169mm;padding-top:4mm;font-size:8pt;font-style:italic">
							Complete a separate Part III on page 2 for each student for whom you are claiming either
							credit before you complete Parts I and II.
		</div>
					</div>
					<div class="styBB" style="width:187mm;height:0mm;border-style:solid; border-bottom-width:1px;border-top-width:0px;
			  border-right-width:0px;border-left-width:0px;float:left;">
						<span class="styPartName" style="width:15mm;font-size:13;">Part I</span>
						<span style="width:170mm;font-weight:normal;" class="styPartDesc">
							<span style="width:3mm;font-size:10pt;vertical-align:bottom;"/>
							<b>Refundable American Opportunity Credit</b>
						</span>
					</div>
					<!--Line 1-->
					<div style="width:187mm;">
					<span style="float:left;">
						<div class="styLNLeftNumBoxSD" style="font-size:7pt;height:4mm;padding-top:1mm;padding-left: 2.25mm">1
        </div>
						<div class="styLNDesc" style="font-size:7pt;width:142mm;height:4mm;padding-top:1mm;">
         After completing Part III for each student, enter the total of all amounts from all Parts III, line 30
        <!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:16px"/>.
                <span style="width:16px"/>.
            </span>
						</div>
						</span>
						<span style="float:right;">
						<div class="styLNRightNumBox" style="font-size:7pt;height:5mm;width:7.1mm; text-align:center; ">1</div>
						<div class="styLNAmountBox" style="width:29.8mm;height:5mm;">
							<xsl:if test="$Form8863Data/RefundableAmerOppCreditGroup">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$PartIData/TentativeAmerOppCreditAmt"/>
								</xsl:call-template>
							</xsl:if>
						</div>
						</span>
					</div>
					<!--Line 2-->
					<div style="width:187mm;">
						<span style="float:left">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-top:1mm;padding-left: 2.25mm">2
        </div>
						<div class="styLNDesc" style="font-size:7pt;width:104.98mm;height:4mm;padding-top:1mm;">
         Enter: $180,000 if married filing jointly; $90,000 if single, head of <br/>household,
         or qualifying widow(er)
        <!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
            </span>
						</div>
						</span>
						<span style="float:right;">
						<div class="styLNRightNumBox" style="font-size:7pt;height:8mm;padding-top:3mm; width:7.1mm; text-align:center; ">2</div>
						<div class="styLNAmountBox" style="width:29.8mm;height:8mm;padding-top:3mm; ">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$PartIData/EnterSpecifiedAmountForFSAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="width:7.1mm;background-color:lightgrey;border-bottom-width:0px;height:8mm;"/>
							<div class="styLNAmountBox" style="width:29.8mm;border-bottom-width:0px;height:8mm;"/>
						</span>
					</div>
					<!--Line 3-->
					<div style="width:187mm;">
					<span style="float:left;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-top:1mm;padding-left: 2.25mm">3
        </div>
						<div class="styLNDesc" style="font-size:7pt;width:104.98mm;height:4mm;padding-top:1mm;">
         Enter the amount from Form 1040, line 38, or Form 1040A, line 22. If you
		are filing Form 2555, 2555-EZ, or 4563, or you are excluding income from
		Puerto Rico, see Pub. 970 for the amount to enter
        <!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
         </span>
						</div>
						</span>
						<span style="float:right;">
						<div class="styLNRightNumBox" style="font-size:7pt;height:11mm;padding-top:7mm; width:7.1mm; text-align:center; ">3</div>
						<div class="styLNAmountBox" style="width:29.8mm;height:11mm;padding-top:7mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$PartIData/ModifiedAGIAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="width:7.1mm;background-color:lightgrey;border-bottom-width:0px;height:11mm;"/>
							<div class="styLNAmountBox" style="width:29.8mm;border-bottom-width:0px;height:11mm;"/>
						</span>
					</div>
					<!--Line 4-->
					<div style="width:187mm;">
						<span style="float:left;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-top:1mm;padding-left: 2.25mm">4
			</div>
						<div class="styLNDesc" style="font-size:7pt;width:104.98mm;height:4mm;padding-top:1mm;">
			 Subtract line 3 from line 2. If zero or less, <b>stop;</b> you cannot take any
			education credit
        <!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
            </span>
						</div>
						</span>
						<span style="float:right;">
						<div class="styLNRightNumBox" style="font-size:7pt;height:8mm;padding-top:3mm; width:7.1mm; text-align:center; ">4</div>
						<div class="styLNAmountBox" style="width:29.8mm;height:8mm;padding-top:3mm; font-size:7pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$PartIData/SubtractAGIFromAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="width:7.1mm;background-color:lightgrey;border-bottom-width:0px;height:8mm;"/>
							<div class="styLNAmountBox" style="width:29.8mm;border-bottom-width:0px;height:8mm;"/>
						</span>
					</div>
					<!--Line 5-->
					<div style="width:187mm;">
						<span style="float:left;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-top:1mm;padding-left: 2.25mm">5
        </div>
						<div class="styLNDesc" style="font-size:7pt;width:104.98mm;height:4mm;padding-top:1mm;">
         Enter: $20,000 if married filing jointly; $10,000 if single, head of household,<br/>
         or qualifying widow(er)
        <!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
            </span>
						</div>
						</span>
						<span style="float:right;">
						<div class="styLNRightNumBox" style="font-size:7pt;height:8mm;padding-top:3mm; width:7.1mm; text-align:center; ">5</div>
						<div class="styLNAmountBox" style="width:29.8mm;height:8mm;padding-top:3mm; ">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$PartIData/SpecifiedAmtPerFSAmt"/>
							</xsl:call-template>
						</div>
						<!--<div class="styLNRightNumBox" style="height:8mm; width:7.3mm; background-color:lightgrey; border-bottom-width:0px; border-right-width:1px;"/>-->
						<div class="styLNRightNumBox" style="width:7.1mm;background-color:lightgrey;border-bottom-width:0px;height:8mm;"/>
							<div class="styLNAmountBox" style="width:29.8mm;border-bottom-width:0px;height:8mm;"/>
							</span>
					</div>
					<!--LINE 6 -->
					<div class="styGenericDiv " style="width:187mm;">
					<span style="float:left;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-left: 2.25mm">6
        </div>
						<div class="styLNDesc" style="width:142mm;"> If line 4 is:
          </div>
          </span>
          <span style="float:right;">
						<div class="styLNRightNumBox" style=" width:7.1mm;background-color:lightgrey;border-bottom-width:0px;height:5mm"/>
						<div class="styLNAmountBox" style="width:29.8mm;border-bottom-width:0px;height:5mm"/>
						</span>
						<br/>
						<div class="styGenericDiv " style="width:187mm;">
						<span style="float:left;">
							<div class="styLNLeftNumBox" style="width:6mm;"/>
							<div class="styLNDesc" style="width:453px;height:8mm;padding-left: 2.25mm;">
								<img src="{$ImagePath}/8863_Bullet_Round.gif" alt="bullet image"/>
                Equal to or more than line 5, enter 1.000 on line 6
                 <span class="styBoldText">
									<span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                    <span style="width:8px"/>.
            </span>
								<br/>
								<img src="{$ImagePath}/8863_Bullet_Round.gif" alt="bullet image"/>
                  Less than line 5, divide line 4 by line 5. Enter the result as a decimal (rounded to 
                  <br/>
								<span style="width:2mm;"/>at least three places)
                   <span class="styBoldText">
									<span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                    <span style="width:8px"/>.
                    <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
            </span>
							</div>
							<div class="styLNDesc" style="width:10px;height:8mm;">
								<img src="{$ImagePath}/8863_Bracket.gif" height="37mm" alt="bracket image"/>
							</div>
							<div class="styLNDesc" style="width:81px;height:8mm;padding-top:2mm;">
								<span class="styBoldText">
									<span style="width:16px;"/>.
                    <span style="width:16px"/>.
                     <span style="width:16px"/>.
                   </span>
							</div>
							</span>
							<span style="float:right;">
							<div class="styLNRightNumBox" style="width:7.1mm;height:6mm;padding-left:0px;">6</div>
							<div class="styLNAmountBox" style="width: 29.8mm;height:6mm">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$PartIData/CalcTentativeEducationRatio"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="width:7.1mm;background-color:lightgrey;border-bottom-width:0px;height:6mm;"/>
							<div class="styLNAmountBox" style="width:29.8mm;border-bottom-width:0px;height:6mm;"/>
							</span>
						</div>
					</div>
					<!-- END LINE 6 -->
					<!--Line 7-->
					<div style="width:187mm;">
					<span style="float:left;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-top:1mm;padding-left: 2.25mm">7
        </div>
						<div class="styLNDesc" style="font-size:7pt;width:137mm;height:4mm;padding-top:1mm;">
							Multiply line 1 by line 6. 
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$PartIData/RefundableAmerOppCrUnder24Ind"/>
									<xsl:with-param name="BackupName">PartIDataRefundableAmerOppCrUnder24Ind</xsl:with-param>
								</xsl:call-template>
								<b>Caution:</b> If you were under age 24 at the end of the year <b>and</b> meet<br/>
								the conditions described in the instructions, you <b>cannot</b> take the refundable American opportunity<br/>
								credit; skip line 8, enter the amount from line 7 on line 9, and check this box
			<!--Dotted Line-->
								<span class="styBoldText">
									<span style="width:16px"/>.
									<span style="width:16px"/>.
									<span style="width:16px"/>.
									<span style="width:16px"/>.
									<span style="width:16px"/>.
								</span>
								<img src="{$ImagePath}/8863_Bullet.gif" alt="MediumBullet"/>
							</label>
						</div>
						<div class="styLNDesc" style="font-size:7pt;width:5mm;height:11mm;padding-top:7mm;">
							<input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$PartIData/RefundableAmerOppCrUnder24Ind"/>
									<xsl:with-param name="BackupName">PartIDataRefundableAmerOppCrUnder24Ind</xsl:with-param>
								</xsl:call-template>
							</input>
						</div>
						</span>
						<span style="float:right;">
						<div class="styLNRightNumBox" style=" width:7.1mm;background-color:lightgrey;border-bottom-width:0px;height:5mm"/>
						<div class="styLNAmountBox" style="width:29.8mm;border-bottom-width:0px;height:5mm;"/>
						<div class="styLNRightNumBox" style="font-size:7pt;height:6mm;padding-top:1mm; width:7.1mm; text-align:center; ">7</div>
						<div class="styLNAmountBox" style="width:29.8mm;height:6mm;padding-top:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$PartIData/CalcTentativeEducationCrAmt"/>
							</xsl:call-template>
						</div>
						</span>
					</div>
					<!--Line 8-->
					<div style="width:187mm;">
						<span style="float:left;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-top:0mm;padding-left: 2.25mm">8
        </div>
						<div class="styLNDesc" style="font-size:7pt;width:142mm;height:4mm;padding-top:0mm;">
							<b>Refundable American opportunity credit.</b> Multiply line 7 by 40% (.40). Enter the amount here and on Form 1040, line 66, or Form 1040A, line 40. Then go to line 9 below.
        <!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                 <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
            </span>
						</div>
						</span>
						<span style="float:right;">
						<div class="styLNRightNumBox" style="height:7mm;width:7.1mm;padding-top:2mm;border-bottom-width:0px;">8</div>
						<div class="styLNAmountBox" style="width:29.8mm;height:7mm;padding-top:2mm;border-bottom-width:0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$PartIData/RefundableAmerOppCreditAmt"/>
							</xsl:call-template>
						</div>
						</span>
					</div>
					<!-- Part lI -->
					<!-- Part lI - Header -->
					<div class="styBB" style="width:187mm;height:0mm;border-style:solid; border-bottom-width:1px;border-top-width:1px;
          border-right-width:0px;border-left-width:0px;float:left;">
						<span class="styPartName" style="width:15mm;font-size:13;">Part II</span>
						<span style="width:170mm;font-weight:normal;" class="styPartDesc">
							<span style="width:3mm;font-size:10pt;vertical-align:bottom;"/>
							<b>Nonrefundable Education Credits</b>
						</span>
					</div>
					<!--Line 9-->
					<div style="width:187mm;">
						<span style="float:left;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:5mm;padding-top:1mm;padding-left: 2.25mm">9
        </div>
						<div class="styLNDesc" style="width:142mm;height:5mm;padding-top:1mm;">
        Subtract line 8 from line 7. Enter here and on line 8 of the Credit Limit Worksheet (see instructions)
        <!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:16px"/>.
            </span>
						</div>
						</span>
						<span style="float:right;">
						<div class="styLNRightNumBox" style="height:5mm;width:7.1mm;padding-top:0mm;">9</div>
						<div class="styLNAmountBox" style="width:29.8mm;height:5mm;padding-top:0mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$PartIIData/TentativeEducCrLessRfdbCrAmt"/>
							</xsl:call-template>
						</div>
						</span>
					</div>

					<!--Line 10-->
					<div style="width:187mm;">
						<span style="float:left;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:5mm;padding-left: 2.25mm">10
        </div>
						<div class="styLNDesc" style="font-size:7pt;width:142mm;height:5mm;">
        After completing Part III for each student, enter the total of all amounts from all Parts III, line 31. If zero, <br/> skip lines 11 through 17, 
        enter -0- on line 18, and go to line 19
        <!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
            </span>
						</div>
						</span>
						<span style="float:right;">
						<div class="styLNRightNumBox" style="height:8mm; width:7.1mm;padding-top:3mm;">10</div>
						<div class="styLNAmountBox" style="width:29.8mm;height:8mm;padding-top:3mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$PartIIData/TotalQualifiedExpensesAmt"/>
							</xsl:call-template>
						</div>
						</span>
					</div>
					
					<!-- Line 11 -->
					<div style="width:187mm;">
						<span style="float:left;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:5mm;padding-top:1mm;padding-left: 2.25mm">11
        </div>
						<div class="styLNDesc" style="width:142mm;height:5mm;padding-top:1mm;">
        Enter the smaller of line 10 or $10,000
        <!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:16px"/>.
								<span style="width:16px"/>.
								<span style="width:16px"/>.
								<span style="width:16px"/>.
								<span style="width:16px"/>.
								<span style="width:16px"/>.
								<span style="width:16px"/>.
								<span style="width:16px"/>.
								<span style="width:16px"/>.
								<span style="width:16px"/>.
								<span style="width:16px"/>.
								<span style="width:16px"/>.
								<span style="width:16px"/>.
								<span style="width:16px"/>.
								<span style="width:16px"/>.
            </span>
						</div>
						</span>
						<span style="float:right;">
						<div class="styLNRightNumBox" style="height:5mm;width:7.1mm;padding-top:0mm;">11</div>
						<div class="styLNAmountBox" style="width:29.8mm;height:5mm;padding-top:0mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$PartIIData/SmllrOfTotExpnssOrSpcfdAmt"/>
							</xsl:call-template>
						</div>
						</span>
					</div>
					
					<!-- Line 12 -->
					<div style="width:187mm;">
						<span style="float:left;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:5mm;padding-top:1mm;padding-left: 2.25mm">12
        </div>
						<div class="styLNDesc" style="width:142mm;height:5mm;padding-top:1mm;">
        Multiply line 11 by 20% (.20)
        <!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:16px"/>.
								<span style="width:16px"/>.
								<span style="width:16px"/>.
								<span style="width:16px"/>.
								<span style="width:16px"/>.
								<span style="width:16px"/>.
								<span style="width:16px"/>.
								<span style="width:16px"/>.
								<span style="width:16px"/>.
								<span style="width:16px"/>.
								<span style="width:16px"/>.
								<span style="width:16px"/>.
								<span style="width:16px"/>.
								<span style="width:16px"/>.
								<span style="width:16px"/>.
								<span style="width:16px"/>.
								<span style="width:16px"/>.
            </span>
						</div>
						</span>
						<span style="float:right;">
						<div class="styLNRightNumBox" style="height:5mm;width:7.1mm;padding-top:0mm;">12</div>
						<div class="styLNAmountBox" style="width:29.8mm;height:5mm;padding-top:0mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$PartIIData/TentLifetimeLearningCreditAmt"/>
							</xsl:call-template>
						</div>
						</span>
					</div>
					
					
					<!--Line13-->
					<div style="width:187mm;">
						<span style="float:left;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:8mm;padding-left: 2.25mm">13
        </div>
						<div class="styLNDesc" style="font-size:7pt;width:104.98mm;height:4mm;padding-top:1mm;">
			Enter: $124,000 if married filing jointly; $62,000 if single, head of <br/>household, or qualifying widow(er)
        <!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
            </span>
						</div>
						</span>
						<span style="float:right;">
						<div class="styLNRightNumBox" style="font-size:7pt;height:8mm;padding-top:3mm; width:7.1mm; text-align:center; ">13</div>
						<div class="styLNAmountBox" style="width:29.8mm;height:8mm;padding-top:3mm; ">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$PartIIData/EnterSpecifiedAmountForFSAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="width:7.1mm;background-color:lightgrey;border-bottom-width:0px;height:8mm;"/>
	<div class="styLNAmountBox" style="width:29.8mm;border-bottom-width:0px;height:8mm;"/>
					</span>
					</div>
					<!--Line 14-->
					<div style="width:187mm;">
						<span style="float:left;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:12mm;padding-left: 2.25mm">14
        </div>
						<div class="styLNDesc" style="font-size:7pt;width:104.98mm;height:4mm;padding-top:1mm;">
			Enter the amount from Form 1040, line 38, or Form 1040A, line 22. If you
			are filing Form 2555, 2555-EZ, or 4563, or you are excluding income from
			Puerto Rico, see Pub. 970 for the amount to enter
        <!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:16px"/>.
								<span style="width:16px"/>.
								<span style="width:16px"/>.
								<span style="width:16px"/>.
								<span style="width:16px"/>.
								<span style="width:16px"/>.
								<span style="width:16px"/>.
								<span style="width:16px"/>.
							</span>
						</div>
						</span>
						<span style="float:right;">
						<div class="styLNRightNumBox" style="font-size:7pt;height:12mm;padding-top:8mm; width:7.1mm; text-align:center; ">14</div>
						<div class="styLNAmountBox" style="width:29.8mm;height:12mm;padding-top:8mm; ">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$PartIIData/ModifiedAGIAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="width:7.1mm;background-color:lightgrey;border-bottom-width:0px;height:12mm;"/>
	<div class="styLNAmountBox" style="width:29.8mm;border-bottom-width:0px;height:12mm;"/>
						</span>
					</div>
					<!--Line 15-->
					<div style="width:187mm;">
						<span style="float:left;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:8mm;padding-left: 2.25mm">15
        </div>
						<div class="styLNDesc" style="font-size:7pt;width:104.98mm;height:4mm;padding-top:1mm;">
			Subtract line 14 from line 13. If zero or less, skip lines 16 and 17, enter<br/> -0- on line 18, 
			and go to line 19
        <!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
            </span>
						</div>
						</span>
						<span style="float:right;">
						<div class="styLNRightNumBox" style="font-size:7pt;height:8mm;padding-top:3mm; width:7.1mm; text-align:center; ">15</div>
						<div class="styLNAmountBox" style="width:29.8mm;height:8mm;padding-top:3mm; ">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$PartIIData/SubtractAGIFromAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="width:7.1mm;background-color:lightgrey;border-bottom-width:0px;height:8mm;"/>
	<div class="styLNAmountBox" style="width:29.8mm;border-bottom-width:0px;height:8mm;"/>
						</span>
					</div>
					<!--Line 16-->
					<div style="width:187mm;">
						<span style="float:left;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:8mm;padding-left: 2.25mm">16
        </div>
						<div class="styLNDesc" style="font-size:7pt;width:104.98mm;height:4mm;padding-top:1mm;">
			Enter: $20,000 if married filing jointly; $10,000 if single, head of household,<br/> or qualifying widow(er)
        <!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
            </span>
						</div>
						</span>
						<span style="float:right;">
						<div class="styLNRightNumBox" style="font-size:7pt;height:8mm;padding-top:3mm; width:7.1mm; text-align:center; ">16</div>
						<div class="styLNAmountBox" style="width:29.8mm;height:8mm;padding-top:3mm; ">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$PartIIData/SpecifiedAmtPerFSAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="width:7.1mm;background-color:lightgrey;border-bottom-width:0px;height:8mm;"/>
	<div class="styLNAmountBox" style="width:29.8mm;border-bottom-width:0px;height:8mm;"/>
					</span>
					</div>
					<!--LINE 17 -->
					<div class="styGenericDiv " style="width:187mm;">
						<span style="float:left;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-top:1mm;padding-left: 2.25mm">17
        </div>
						<div class="styLNDesc" style="width:142mm;padding-top:1mm;"> If line 15 is:
          </div>
						</span>
						<span style="float:right;">
						<div class="styLNRightNumBox" style=" width:7.1mm;background-color:lightgrey;border-bottom-width:0px;height:5mm"/>
						<div class="styLNAmountBox" style="width:29.8mm;border-bottom-width:0px;height:5mm"/>
						</span>
						<br/>
						<div class="styGenericDiv " style="width:187mm;">
							<span style="float:left;">
							<div class="styLNLeftNumBox" style="width:6mm;"/>
							<div class="styLNDesc" style="width:144mm;height:8mm;padding-left: 2.25mm">
								<img src="{$ImagePath}/8863_Bullet_Round.gif" alt="bullet image"/>
             Equal to or more than line 16, enter 1.000 on  line 17 and go to line 18<br/>
								<img src="{$ImagePath}/8863_Bullet_Round.gif" alt="bullet image"/>
                  Less than line 16, divide line 15 by line 16. Enter the result as a decimal (rounded to at least  <br/>
								<span style="width:2mm;"/> three places)
                   <span class="styBoldText">
									<span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                 <span style="width:16px"/>.
                <span style="width:16px"/>.
                   <span style="width:16px"/>.
                    <span style="width:16px"/>.
                 <span style="width:16px"/>.
                <span style="width:16px"/>.
                 <span style="width:16px"/>.
                 <span style="width:16px"/>.
             
            </span>
							</div>
							</span>
							<span style="float:right;">
							<div class="styLNRightNumBox" style="width:7.1mm;height:6mm;background-color:lightgrey;border-bottom-width:0px;"/>
							<div class="styLNAmountBox" style="width:29.8mm;height:6mm;border-bottom-width:0px;">
            </div>
							<div class="styLNRightNumBox" style=" width:7.1mm;border-bottom-width:1px;height:5mm">17</div>
							<div class="styLNAmountBox" style="width:29.8mm;border-bottom-width:1px;height:5mm">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$PartIIData/CalcTentativeEducationRatio"/>
								</xsl:call-template>
							</div>
							</span>
						</div>
					</div>
					<!-- END LINE 18 -->
					<!--Line 18-->
					<div style="width:187mm;">
						<span style="float:left;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:5mm;padding-top:1mm;padding-left: 2.25mm">18
        </div>
						<div class="styLNDesc" style="width:142mm;height:5mm;padding-top:1mm;">
      Multiply line 12 by line 17. Enter here and on line 1 of the Credit Limit Worksheet (see instructions)
        <!--Dotted Line-->
							<span class="styBoldText" style="width:3mm;">
				
            </span>
							<img src="{$ImagePath}/8863_Bullet.gif" alt="MediumBullet"/>
						</div>
						</span>
						<span style="float:right;">
						<div class="styLNRightNumBox" style="height:5mm;width:7.1mm;padding-top:1mm;">18</div>
						<div class="styLNAmountBox" style="width:29.8mm;height:5mm;padding-top:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$PartIIData/CalcTentativeEducationCrAmt"/>
							</xsl:call-template>
						</div>
						</span>
					</div>
					<!--Line 19-->
					<div style="width:187mm;border-bottom:1px solid black">
						<span style="float:left;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:5mm;padding-top:1mm;padding-left: 2.25mm">19
        </div>
						<div class="styLNDesc" style="width:142mm;height:5mm;padding-top:1mm;">
							<b>Nonrefundable education credits.</b> Enter the amount from line 13 of the Credit Limit Worksheet (see instructions) here
							 and on Form 1040, line 49, or Form 1040A, line 31
        <!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
            </span>
						</div>
						</span>
						<span style="float:right;">
						<div class="styLNRightNumBox" style="height:8mm;width:7.1mm;padding-top:3mm;border-bottom-width:0px">19</div>
						<div class="styLNAmountBox" style="width:29.8mm;height:8mm;padding-top:3mm;border-bottom-width:0px">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$PartIIData/NonrefundableEducationCrAmt"/>
							</xsl:call-template>
						</div>
						</span>
					</div>
					<!-- Page 1 End -->
<!-- Page Break and Footer-->
	<div class="pageEnd" style="width:187mm;padding-top:0mm;border-top-width:1px;">
						<div style="float:left;">
							<span class="styBoldText">For Paperwork Reduction Act Notice, see your tax return instructions.</span>
							<span style="width:4mm;"/>
							<span style="font-style:italic">IRS.gov/form8863</span>
							<span style="width:4mm"/>                        
      Cat. No. 25379M
                        </div>
						<div style="float:right;">
							<span style="width:40px;"/>  
      Form <span class="styBoldText" style="font-size:8pt;">8863</span> (2012)
                        </div>
  </div>
  
    <!--Begin Page 2 -->
    
					<xsl:for-each select="$PartIIIData">
						<xsl:if test="position() &gt; 1">
							<div class="pageEnd"/>
						</xsl:if>
						<xsl:call-template name="Form8863Page2">
							<xsl:with-param name="NodeData" select="."/>
							<xsl:with-param name="outsidePos" select="position()"/>
						</xsl:call-template>
					</xsl:for-each>
					<xsl:if test="count($PartIIIData) = 0">
						<xsl:call-template name="Form8863Page2"/>
					</xsl:if> 

					
					<!-- BEGIN Left Over Table -->
					<div class="pageEnd"/>
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
							<xsl:with-param name="TargetNode" select="$Form8863Data"/>
							<xsl:with-param name="DescWidth" select="105"/>
						</xsl:call-template>
						<xsl:for-each select="$Form8863Data/AmericanOpportunityCreditGroup">
							<xsl:call-template name="PopulateLeftoverRow">
								<xsl:with-param name="Desc">Line 1(a) - American Opportunity Student <xsl:number value="position()"/> Name Control</xsl:with-param>
								<xsl:with-param name="TargetNode" select="AmerOppStudentNameControl"/>
								<xsl:with-param name="DescWidth" select="105"/>
							</xsl:call-template>
						</xsl:for-each>
						<xsl:for-each select="$Form8863Data/LifetimeLearningCreditGroup">
							<xsl:call-template name="PopulateLeftoverRow">
								<xsl:with-param name="Desc">Line 3(a) - Lifetime Student <xsl:number value="position()"/> Name Control</xsl:with-param>
								<xsl:with-param name="TargetNode" select="LifetimeStudentNameControl"/>
								<xsl:with-param name="DescWidth" select="105"/>
							</xsl:call-template>
						</xsl:for-each>
						<xsl:for-each select="$Form8863Data/StudentAndEducationalInstnGrp">
							<xsl:call-template name="PopulateLeftoverRow">
								<xsl:with-param name="Desc">Part III Line 20  -  Student <xsl:number value="position()"/> Name Control</xsl:with-param>
								<xsl:with-param name="TargetNode" select="StudentNameControl"/>
								<xsl:with-param name="DescWidth" select="105"/>
							</xsl:call-template>
						</xsl:for-each>
					</table>
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
