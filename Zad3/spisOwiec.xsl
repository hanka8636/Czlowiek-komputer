<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" encoding="utf-8" />

  <xsl:template match="/spis_owiec">
    <html>
      <body>
        <h2>Data modyfikacji: <xsl:value-of select="nagłówek/data_modyfikacji" /></h2>
        <table border="1">
            <tr bgcolor="#9acd32">
              <th style="text-align:left">imie</th>
              <th style="text-align:left">nazwisko</th>
            </tr>
            <xsl:for-each select="nagłówek/autorzy/autor">
            <tr>
              <td><xsl:value-of select="imię_autora"/></td>
              <td><xsl:value-of select="nazwisko"/></td>
            </tr>
            </xsl:for-each>
          </table>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
