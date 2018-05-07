<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns="http://www.w3.org/1999/xhtml">
  <xsl:output method="xml" version="1.0" encoding="utf-8"
      doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
      doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" />

<xsl:template match="/">
  <xsl:attribute name="xml:lang">pl</xsl:attribute>
  <xsl:attribute name="lang">pl</xsl:attribute>
    <html>
        <head>
            <title> <xsl:value-of select="//tytul"/></title>
            <link rel="stylesheet" type="text/css" href="raport.css" />


        </head>
        <body>
            <xsl:apply-templates/>
        </body>

    </html>
</xsl:template>

<xsl:template match="tytul" >
    <div id="tytul" >
       <h1> <xsl:value-of select="//tytul"/> </h1>

    </div>

</xsl:template>

<!-- Data  -->
<xsl:template match="data_wygenerowania" >
    <div id="data" >

 <h2> Data generacji </h2>
        <xsl:value-of select="//data_wygenerowania"/>
    </div>

</xsl:template>

<!-- AUTORZY  -->
<xsl:template match="autorzy" >
    <div id="naglowek" >

 <h2> Autorzy </h2>
        <xsl:value-of select="//autor[1]"/>
        <br />
        <xsl:value-of select="//autor[2]"/>
    </div>

</xsl:template>

<!-- Spis -->

<xsl:template match="spis" >
    <xsl:call-template name="rasa" />
    <xsl:call-template name="Owce" />
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
                <th>[j]</th>
                <th>Średnia długość runa</th>
                <th>[j]</th>
                <th>Średnia szybkość marszu</th>
                <th>[j]</th>
                <th>Średnia szybkość zjadania trawy</th>
                <th>[j]</th>
            </tr>

                <xsl:for-each select="//rasa_owiec">
                <tr>
                    <td>
                        <xsl:value-of  select="@nazwa"/>
                    </td>
                    <td>
                        <xsl:value-of select="pastwisko//@nazwa" />
                    </td>
                    <td>
                        <xsl:value-of select="liczba_owiec" />
                    </td>
                    <td>
                        <xsl:value-of select="średnia_waga" />
                    </td>
                    <td>
                        <xsl:value-of  select="średnia_waga//@jednostka"/>
                    </td>
                    <td>
                        <xsl:value-of select="średnia_długość_runa" />
                    </td>
                    <td>
                        <xsl:value-of  select="średnia_długość_runa//@jednostka"/>
                    </td>
                    <td>
                        <xsl:value-of select="średnia_szybkość_marszu" />
                    </td>
                    <td>
                        <xsl:value-of  select="średnia_szybkość_marszu//@jednostka"/>
                    </td>
                    <td>
                        <xsl:value-of select="średnia_szybkość_zjadania_trawy" />
                    </td>
                    <td>
                        <xsl:value-of  select="średnia_szybkość_marszu//@jednostka"/>
                    </td>
                </tr>
            </xsl:for-each>
        </table>
    </div>
</xsl:template>

<!-- SORT -->
    <xsl:template name="Owce">
        <div id="owca">
            <h2> Sortowanie </h2>

            <table>
                <tr>
                    <th>Owca</th>
                    <th>Data urodzenia</th>
                    <th>Płeć</th>
                    <th>Waga</th>
                    <th>Długość runa</th>
                    <th>Szybkość marszu</th>
                    <th>Szybkość zjadania trawy</th>
                    <th>Opis</th>


                </tr>
                <xsl:for-each select="//owca" >
                    <xsl:sort select="imię" />
                    <tr>
                        <td>
                            <xsl:value-of select="imię" />
                        </td>
                          <td>
                            <xsl:value-of select="data_urodzenia" />
                        </td>
                        <td>

                        <xsl:choose>
                                <xsl:when test="płeć='Samiec'">
                                    <img src="img/samiec.png" alt="Samiec"/>
                                </xsl:when>
                                <xsl:when test="płeć='Samiczka'">
                                    <img src="img/samiczka.png" alt="Samiczka"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <img src="img/samiczka.png" alt="Nic"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </td>
                         <td>
                            <xsl:value-of select="concat(waga, ' ', waga//@jednostka)"/>
                        </td>
                        <td>
                            <xsl:value-of select="concat(długość_runa, ' ', długość_runa//@jednostka)"/>
                        </td>
                        <td>
                            <xsl:value-of select="concat(szybkość_marszu, ' ', szybkość_marszu//@jednostka)"/>
                        </td>
                        <td>
                            <xsl:value-of select="concat(szybkość_zjadania_trawy, ' ', szybkość_zjadania_trawy//@jednostka)"/>
                        </td>
                        <td>
                            <xsl:value-of select="opis" />
                        </td>


                    </tr>
                </xsl:for-each>
            </table>
            <br />

            <table>
                <tr>
                    <th>Nazwa pastwiska</th>
                    <th>Powierzchnia</th>
                </tr>
                <xsl:for-each select="//pastwisko" >
                    <xsl:sort select="@nazwa" />
                    <tr>
                        <td>
                            <xsl:value-of select="@nazwa" />
                        </td>
                        <td>
                            <xsl:value-of select="concat(powierzchnia, ' ', powierzchnia//@jednostka)"/>
                        </td>
                    </tr>
                </xsl:for-each>
            </table>
            <br />

        </div>
    </xsl:template>

    <!--    PODSUMOWANIE -->
    <xsl:template match="podsumowanie" >
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
                             <xsl:value-of select="concat(całkowita_powierzchnia_pastwisk, ' ', całkowita_powierzchnia_pastwisk//@jednostka)"/>
                        </td>
                        <td>
                            <xsl:value-of select="concat(średnia_waga, ' ', średnia_waga//@jednostka)"/>
                        </td>
                        <td>
                            <xsl:value-of select="concat(średnia_długość_runa, ' ', średnia_długość_runa//@jednostka)"/>
                        </td>
                        <td>
                            <xsl:value-of select="concat(średnia_szybkość_marszu, ' ', średnia_szybkość_marszu//@jednostka)"/>
                        </td>
                        <td>
                            <xsl:value-of select="concat(średnia_szybkość_zjadania_trawy, ' ', średnia_szybkość_zjadania_trawy//@jednostka)"/>
                        </td>
                    </tr>
            </table>
        </div>

    </xsl:template>
</xsl:stylesheet>
