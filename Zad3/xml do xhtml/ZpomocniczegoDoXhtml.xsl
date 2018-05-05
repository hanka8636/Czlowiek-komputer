<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml" version="2.0">
<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"
doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" />

<xsl:template match="/">
    <html>
        <head>
            <title>Zadanie 3</title>
            <!-- <link rel="stylesheet" type="text/css" href="cssxhtml.css" /> -->
        </head>
        <body>
            <xsl:apply-templates/>
        </body>
    </html>
</xsl:template>

<!-- AUTORZY  -->
<xsl:template match="autorzy" >
    <div id="naglowek" >
        <h1> Zadanie 3 - XML z XSL -> XHTML </h1>

        <xsl:value-of select="//autor[1]"/>
        <br />
        <xsl:value-of select="//autor[2]"/>
    </div>

</xsl:template>

<!-- Spis -->

<xsl:template match="spis" >
    <xsl:call-template name="rasa_owiec" />
</xsl:template>

<!-- Rasy -->
<xsl:template name="rasa">
    <div id="pastwisko">
        <h2> Rasy </h2>

        <table>

            <tr>
                <th>Nazwa rasy</th>
                <th>Pastwisko</th>
                <th>Liczba owiec</th>
                <th>Średnia waga</th>
                <th>Średnia długość runa</th>
                <th>Średnia szybkość marszu</th>
                <th>Średnia szybkość zjadania trawy</th>
            </tr>

            <xsl:for-each select="//definicja_rasy" >
                <tr>
                    <td>
                        <xsl:value-of select="rasaOwcy" />
                    </td>
                    <td>
                        <xsl:value-of select="nazwaPastwiska" />
                    </td>
                    <td>
                        <xsl:value-of select="liczbaOwiec" />
                    </td>
                    <td>
                        <xsl:value-of select="waga" />
                    </td>
                    <td>
                        <xsl:value-of select="dlugość" />
                    </td>
                    <td>
                        <xsl:value-of select="szybkośćMarszu" />
                    </td>
                    <td>
                        <xsl:value-of select="szybkośćJedzenia" />
                    </td>
                </tr>
            </xsl:for-each>
        </table>
    </div>
</xsl:template>
