<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="text"  encoding="UTF-8" />

  <xsl:template match="/">
	<xsl:call-template name="tytul"/>
	<xsl:call-template name="autorzy"/>
  <xsl:call-template name="spis"/>
  <xsl:call-template name="podsumowanie"/>
	</xsl:template>

  <xsl:variable name="hash" select="'# # # # #'" />

  <xsl:template name="tytul">
    <xsl:value-of select="concat($hash, //tytul, '(', //data_wygenerowania, ')', $hash)"/>
    <xsl:text>&#xA;</xsl:text>
    <xsl:text>&#xA;</xsl:text>
  </xsl:template>

  <xsl:template name="autorzy">
    <xsl:value-of select="concat($hash, ' Autorzy ', $hash)"/>
    <xsl:text>&#xA;</xsl:text>
    <xsl:value-of select="//autor[1]"/>
    <xsl:text>&#xA;</xsl:text>
    <xsl:value-of select="//autor[2]"/>
    <xsl:text>&#xA;</xsl:text>
    <xsl:text>&#xA;</xsl:text>
  </xsl:template>

</xsl:stylesheet>
