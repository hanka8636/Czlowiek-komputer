<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns="http://www.w3.org/1999/xhtml"
                version="2.0">
    <xsl:output method="html" version="4.0" encoding="UTF-8" indent="yes"
            doctype-public="-//W3C//DTD SVG 1.1//EN"
            doctype-system="http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd" />

            <xsl:template match="/">
                <html>
                    <head>
                        <title> Zadanie 4 - XML z XSL do SVG </title>
                        <link rel="stylesheet" type="text/css" href="csssvg.css" />
                    </head>
                    <body>
                        <xsl:apply-templates select="//autorzy" />
                        <xsl:apply-templates select="//podsumowanie" />
                    </body>
                </html>

            </xsl:template>

            <!-- AUTORZY  -->
            <xsl:template  match="autorzy" >
                <div id="naglowek" >
                    <h1>Zadanie 4 - XML z XSL do SVG </h1>

                    <script>
                    function mOver(obj) {
                        obj.setAttribute("fill","blue")
                    }

                    function mOut(obj) {
                        obj.setAttribute("fill","red")
                    }
                    </script>

                    <svg xmlns="http://www.w3.org/2000/svg" height="80" width="80">
                        <circle onmouseover="mOver(this)" onmouseout="mOut(this)"
                                cx="45" cy="45" r="30" stroke="black"
                                stroke-width="0" fill="red" />
                    </svg>

                    <xsl:value-of select="//autor[1]" />

                    <svg xmlns="http://www.w3.org/2000/svg" height="80" width="80">
                        <circle onmouseover="mOver(this)" onmouseout="mOut(this)"
                                cx="45" cy="45" r="30" stroke="black" stroke-width="0" fill="red" />
                    </svg>

                    <xsl:value-of select="//autor[2]" />


                </div>
            </xsl:template>

            <xsl:template  match="podsumowanie" >
                <div id="plcie" >

                    <script>
                        var xF = <xsl:value-of select="liczebność_samic" />;
                        var xM = <xsl:value-of select="liczebność_samców" />;

                        var yF = xF*2.50;
                        var yM = xM*2.50;

                        function ustawWykresyPlci(){
                            document.getElementById('rectF').setAttribute("height",yF);
                            document.getElementById('rectM').setAttribute("height",yM);
                            document.getElementById('tdF').innerHTML =  <xsl:value-of select="liczebność_samic" />;
                            document.getElementById('tdM').innerHTML =  <xsl:value-of select="liczebność_samców" />;

                        }
                    </script>
                        <h2> Porównanie ilości samic i samców </h2>

                        <table>
                            <tr>
                                <th>Samice</th>
                                <th>Samce</th>
                            </tr>
                            <tr>
                                <td>
                                  <xsl:value-of select="liczebność_samic" />
                                    <svg xmlns="http://www.w3.org/2000/svg" >
                                    <rect id="rectF" x="120" y="50" width="50"
                                              height="0" fill="black" stroke="black">
                                        <animate attributeType="style" attributeName="fill"
                                                from="black" to="white" dur="2s"
                                                 repeatCount="indefinite" />
                                    </rect>
                                    </svg>
                                </td>
                                <td>
                                    <svg xmlns="http://www.w3.org/2000/svg" >
                                    <rect id="rectM" x="130" y="50" width="50"
                                              height="0" fill="black" stroke="black">
                                        <animate attributeType="style" attributeName="fill"
                                                from="black" to="white" dur="2s"
                                                 repeatCount="indefinite" />
                                    </rect>
                                    </svg>
                                </td>
                            </tr>
                            <tr>
                                <td id="tdF"></td>
                                <td id="tdM"></td>
                            </tr>
                        </table>

                    <br />
                    <br />
  <button type="button" onClick="ustawWykresyPlci()" > Wykres </button>
                    <br />
                    <br />

                <div>
                    <h2> Porównanie liczby ras i pastwisk </h2>
                    Liczba ras: <xsl:value-of select="całkowita_liczba_ras" />;
                    <svg xmlns="http://www.w3.org/2000/svg" >
                        <rect id="rect11" x="10" y="10" width="0"
                            height="60" fill="red" stroke="red">
                        <animate attributeName="width"
                                 from="0" to="100" dur="3s"
                                 repeatCount="indefinite" />
                        </rect>
                    </svg>
                    Liczba pastwisk: <xsl:value-of select="całkowita_liczba_pastwisk" />;
                    <svg xmlns="http://www.w3.org/2000/svg" >
                        <rect id="rect11" x="10" y="10" width="0"
                              height="60" fill="black" stroke="black">
                        <animate attributeName="width"
                                 from="0" to="100" dur="5s"
                                 repeatCount="indefinite" />
                        </rect>
                    </svg>
                </div>

                </div>
            </xsl:template>


</xsl:stylesheet>
