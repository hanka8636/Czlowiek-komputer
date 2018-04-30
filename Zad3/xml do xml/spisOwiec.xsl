<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" standalone="yes" indent="yes"/>
	<xsl:preserve-space elements = '*' />
  <xsl:template match="/">
		<raport>
      <xsl:apply-templates select="//nagłówek"/>
		</raport>
	</xsl:template>

	<xsl:template match="//nagłówek">
    <tytul> Spis Owiec </tytul>
    <autorzy>
      <xsl:for-each select="//autorzy">
        <autor>
          <xsl:value-of select="concat(imię_autora, ' ', nazwisko)"/>
        </autor>
      </xsl:for-each>
    </autorzy>
  </xsl:template>

</xsl:stylesheet>
