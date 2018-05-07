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
            <!-- <link rel="stylesheet" type="text/css" href="cssxhtml.css" /> -->


        </head>
        <body>
            <xsl:apply-templates/>
        </body>
        <style>
        body, head {
   font-family: Verdana, sans-serif;
}
body {
    text-align: center;

}
table {
     border-collapse: collapse;
    width: 100%;
}
th, td {
    padding: 15px;
    text-align: center;
}
th {
    background-color: #4CAF50;
    color: white;
}
tr:nth-child(even) {background-color: #f2f2f2;}

h1 {
    background-color: #4CAF50;
     padding: 30px;
    color: white;
}

h2 {
    background-color: #a5d899;
     padding: 20px;
    color: white;
}
h1, h2 {text-align: center; }
</style>
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
                <th>Średnia długość runa</th>
                <th>Średnia szybkość marszu</th>
                <th>Średnia szybkość zjadania trawy</th>
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

<!-- SORT -->
    <xsl:template name="Owce">
        <div id="owca">
            <h2> Sortowanie </h2>

            <table>
                <tr>
                    <th>Owca</th>
                    <th>Opis</th>
                    <th>Płeć</th>
                    <th>Data urodzenia</th>
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
                        <td>
                            <xsl:value-of select="data_urodzenia" />
                        </td>
                    </tr>
                </xsl:for-each>
            </table>
            <br />

            <table>
                <tr>
                    <th>Nazwa</th>
                    <th>Powierzchnia</th>
                </tr>
                <xsl:for-each select="//pastwisko" >
                    <xsl:sort select="@nazwa" />
                    <tr>
                        <td>
                            <xsl:value-of select="@nazwa" />
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
            </table>
        </div>

    </xsl:template>
</xsl:stylesheet>
