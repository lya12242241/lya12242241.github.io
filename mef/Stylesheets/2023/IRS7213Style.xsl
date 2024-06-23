<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template name="IRS7213Style">

  .sty7213DotLn {
    letter-spacing:3.1mm;
    font-weight:bold;
    float:right;
    padding-right:2px;
  }
  .sty7213EmptyLonLatBox {
		border: 1px solid black;
		width:5mm;
		height:5mm;
   }
  .sty7213AmountBox{ 
	width:32mm;height:4mm;
	padding-top:.5mm;
	padding-bottom:.5mm;
	text-align:right;
	border-style: solid; border-color: black;
	border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 0px;
	float:left; clear: none;
  }
  
  .sty7213QtyBox{ 
	width:43mm;height:4mm;
	padding-top:.5mm;
	padding-bottom:.5mm;
	padding-right:.5mm;
	text-align:right;
	border-style: solid; border-color: black;
	border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 0px;
	float:left; clear: none;
  }
  
  .sty7213RateBox{ 
	width:18mm;height:4mm;
	padding-top:.5mm;
	padding-bottom:.5mm;
	text-align:center;
	border-style: solid; border-color: black;
	border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 0px;
	float:left; clear: none;
  }
  
  .sty7213Desc{ /* Line item description */
	width:77mm;height:4mm;
	padding-top:.5mm;
	padding-bottom:.5mm;
	float:left; clear: none;
  }
  
  </xsl:template>

</xsl:stylesheet>