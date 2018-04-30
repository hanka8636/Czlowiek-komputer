<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" standalone="yes" indent="yes"/>
	<xsl:preserve-space elements = '*' />
  <xsl:template match="/">
		<raport>
      <tytul> Spis Owiec </tytul>
      <autorzy>
        <xsl:for-each select="//autor">
          <autor>
            <xsl:value-of select="concat(imię_autora, ' ', nazwisko)"/>
          </autor>
        </xsl:for-each>
      </autorzy>
		</raport>
	</xsl:template>

</xsl:stylesheet>
