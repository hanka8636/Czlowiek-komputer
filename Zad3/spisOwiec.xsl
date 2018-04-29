<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" encoding="utf-8" />

  <xsl:template match="/spis_owiec">
    <html>
      <body>
        <h2>Data modyfikacji: <xsl:value-of select="nagłówek/data_modyfikacji" /></h2>
        <h2>Autorzy:</h2>
        <ul style="list-style-type:disc">
          <xsl:for-each select="nagłówek/autorzy/autor">
          <li><xsl:value-of select="imię_autora"/><xsl:text> </xsl:text><xsl:value-of select="nazwisko"/></li>
          </xsl:for-each>
        </ul>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
