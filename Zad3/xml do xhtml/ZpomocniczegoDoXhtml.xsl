<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml" version="2.0">
<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"
doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
doctype-public="-//W3C//DTD XHTML 2.0 Strict//EN" />

<xsl:template match="/">
  <xsl:attribute name="xml:lang">pl</xsl:attribute>
  <xsl:attribute name="lang">pl</xsl:attribute>
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
    <xsl:call-template name="rasa" />
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

<!-- SORT -->
    <xsl:template name="Owce">
        <div id="listaOwiec">
            <h2> Sortowanie </h2>

            <table>
                <tr>
                    <th>Owca</th>
                    <th>Opis</th>
                    <th>Płeć</th>
                </tr>
                <xsl:for-each select="//owca" >
                    <xsl:sort select="imię" />
                    <tr>
                        <td>
                            <xsl:value-of select="imię" />
                        </td>
                        <td>
                            <xsl:value-of select="opis" />
                        </td>
                        <td>
                            <xsl:value-of select="płeć" />
                        </td>
                    </tr>
                </xsl:for-each>
            </table>
            <br />

            <table>
                <tr>
                    <th>Nazwa</th>
                    <th>Rasa</th>
                    <th>Powierzchnia</th>
                </tr>
                <xsl:for-each select="//pastwisko" >
                    <xsl:sort select="nazwa" />
                    <tr>
                        <td>
                            <xsl:value-of select="nazwa" />
                        </td>
                        <td>
                            <xsl:value-of select="rasa" />
                        </td>
                        <td>
                            <xsl:value-of select="powierzchnia" />
                        </td>
                    </tr>
                </xsl:for-each>
            </table>
            <br />

        </div>
    </xsl:template>

    <!--    PODSUMOWANIE -->
    <xsl:template match="Podsumowanie" >
        <div id="podsumowanie" >
            <h2> Podsumowanie </h2>
            <table>

                <tr>
                    <th>Całkowita liczba owiec</th>
                    <th>Liczebność samców</th>
                    <th>Liczebność samic</th>
                    <th>Całkowita liczba ras</th>
                    <th>Całkowita liczba pastwisk</th>
                    <th>Całkowita powierzchnia pastwisk</th>
                    <th>Średnia waga</th>
                    <th>Średnia długość runa</th>
                    <th>Średnia szybkość marszu</th>
                    <th>Średnia szybkość zjadania trawy</th>
                </tr>
                <xsl:for-each select="//Podsumowanie" >
                    <tr>
                        <td>
                            <xsl:value-of select="całkowita_liczba_owiec" />
                        </td>
                        <td>
                            <xsl:value-of select="liczebność_samców" />
                        </td>
                        <td>
                            <xsl:value-of select="liczebność_samic" />
                        </td>
                        <td>
                            <xsl:value-of select="całkowita_liczba_ras" />
                        </td>
                        <td>
                            <xsl:value-of select="całkowita_liczba_pastwisk" />
                        </td>
                        <td>
                            <xsl:value-of select="całkowita_powierzchnia_pastwisk" />
                        </td>
                        <td>
                            <xsl:value-of select="średnia_waga" />
                        </td>
                        <td>
                            <xsl:value-of select="średnia_długość_runa" />
                        </td>
                        <td>
                            <xsl:value-of select="średnia_szybkość_marszu" />
                        </td>
                        <td>
                            <xsl:value-of select="średnia_szybkość_zjadania_trawy" />
                        </td>
                    </tr>
                </xsl:for-each>
            </table>
        </div>

    </xsl:template>
</xsl:stylesheet>
