<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:svg="http://www.w3.org/2000/svg" xmlns="http://www.w3.org/2000/svg" version="1.0"
    xmlns:xlink="http://www.w3.org/1999/xlink">

    <xsl:output method="xml" media-type="image/svg" encoding="utf-8"  doctype-public="-//W3C//DTD SVG 1.1//EN"
        doctype-system="http://www.w3.org/TR/2001/REC-SVG-20010904/DTD/svg10.dtd"/>

    <xsl:template match="/">
        <svg:svg width="1520" height="1400" font-family="Calibri">
            <svg:desc>Spis owiec - wizualizacja</svg:desc>
            <svg:title><xsl:value-of select="nagłówek"/></svg:title>
            <defs>
                <linearGradient id="grad1" x1="0%" y1="0%" x2="0%" y2="100%">
                    <stop offset="0%" style="stop-color:rgb(195, 255, 193);stop-opacity:1" />
                    <stop offset="100%" style="stop-color:rgb(195, 255, 193);stop-opacity:1" />
                </linearGradient>
            </defs>

            <svg:rect x="3" y="3" width="1920" height="1080" fill="url(#grad1)" stroke="black" stroke-width="3"/>

            <svg:text x="50%" y="30" font-size="18" fill="black" font-weight="bold" text-anchor="middle">
                Spis owiec - wizualizacja
            </svg:text>
            <svg:text x="50%" y="1080" font-size="18" fill="black" font-weight="bold" text-anchor="middle">
                <xsl:value-of select="całkowita_powierzchnia_pastwisk" />;
            </svg:text>


            <script>
            function mOver(obj) {
                obj.setAttribute("fill","green")
            }

            function mOut(obj) {
                obj.setAttribute("fill","yellow")
            }
            </script>
                        <xsl:apply-templates select="//autorzy" />
                        <xsl:apply-templates select="//podsumowanie" />


                        <xsl:apply-templates/>
                    </svg:svg>
                </xsl:template>

            <!-- AUTORZY  -->
            <xsl:template  match="autorzy" >

              <svg version="1.1" id="Warstwa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="45%" y="-70"  xml:space="preserve">
              <style type="text/css">
                .st0{fill:#3A3A3A;}
                .st1{fill:#FFFFFF;}
              </style>
              <g
                >
                <rect x="171.7" y="196.3" class="st0" width="3.1" height="10.9"/>
                <rect x="184.8" y="196.3" class="st0" width="3.1" height="10.9"/>
                <circle class="st1" cx="171.3" cy="181.8" r="12.2"/>
                <circle class="st1" cx="182.4" cy="177.1" r="12.2"/>
                <circle class="st1" cx="188.3" cy="187.6" r="12.2"/>
                <circle class="st1" cx="176.7" cy="191.1" r="12.2"/>
                <path class="st0" d="M186,182.7c0,3.3-2.7,8.9-6,8.9s-6-5.6-6-8.9s2.7-6,6-6S186,179.3,186,182.7z"/>
                <path class="st0" d="M187.6,178.5c1.5,0.8,3.6,2.8,3.1,3.7c-0.5,0.9-3.3,0.2-4.8-0.5s-2.3-2.1-1.9-3S186.1,177.7,187.6,178.5z"/>
                <path class="st0" d="M172.8,178c-1.5,0.8-3.6,2.8-3.1,3.7c0.5,0.9,3.3,0.2,4.8-0.5s2.3-2.1,1.9-3S174.3,177.3,172.8,178z"/>
                <circle cx="177.5" cy="183.1" r="1"/>
                <circle cx="181.8" cy="183.1" r="1"/>

              </g>

              </svg>

              <svg version="1.1" id="Warstwa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="5%" y="-70"  xml:space="preserve">
              <style type="text/css">
                .st0{fill:#3A3A3A;}
                .st1{fill:#FFFFFF;}
              </style>
              <g
                >
                <rect x="171.7" y="196.3" class="st0" width="3.1" height="10.9"/>
                <rect x="184.8" y="196.3" class="st0" width="3.1" height="10.9"/>
                <circle class="st1" cx="171.3" cy="181.8" r="12.2"/>
                <circle class="st1" cx="182.4" cy="177.1" r="12.2"/>
                <circle class="st1" cx="188.3" cy="187.6" r="12.2"/>
                <circle class="st1" cx="176.7" cy="191.1" r="12.2"/>
                <path class="st0" d="M186,182.7c0,3.3-2.7,8.9-6,8.9s-6-5.6-6-8.9s2.7-6,6-6S186,179.3,186,182.7z"/>
                <path class="st0" d="M187.6,178.5c1.5,0.8,3.6,2.8,3.1,3.7c-0.5,0.9-3.3,0.2-4.8-0.5s-2.3-2.1-1.9-3S186.1,177.7,187.6,178.5z"/>
                <path class="st0" d="M172.8,178c-1.5,0.8-3.6,2.8-3.1,3.7c0.5,0.9,3.3,0.2,4.8-0.5s2.3-2.1,1.9-3S174.3,177.3,172.8,178z"/>
                <circle cx="177.5" cy="183.1" r="1"/>
                <circle cx="181.8" cy="183.1" r="1"/>

              </g>

              </svg>

                    <svg xmlns="http://www.w3.org/2000/svg" height="80" width="80">
                        <circle onmouseover="mOver(this)" onmouseout="mOut(this)"
                                cx="45" cy="45" r="30" stroke="black"
                                stroke-width="0" fill="red" />

                    </svg>
  <svg:text x="20%" y="120" fill="black" font-size="16" > <xsl:value-of select="//autor[1]" /></svg:text>


                    <svg xmlns="http://www.w3.org/2000/svg" height="80" width="80">
                        <circle onmouseover="mOver(this)" onmouseout="mOut(this)"
                                cx="45" cy="45" r="30" stroke="black" stroke-width="0" fill="yellow" />
                                  <svg:text x="25" y="574" fill="white" font-size="16" >  <xsl:value-of select="//autor[2]" /></svg:text>
                    </svg>

  <svg:text x="60%" y="120" fill="black" font-size="16" >  <xsl:value-of select="//autor[2]" /></svg:text>

            </xsl:template>

            <xsl:template  match="podsumowanie" >


                    <script>
                        var xF = <xsl:value-of select="liczebność_samic" />;
                        var xM = <xsl:value-of select="liczebność_samców" />;

                        var yF = xF*2.50;
                        var yM = xM*2.50;

                        function ustawWykresyPlci(){
                            document.getElementById('rectF').setAttribute("height",yF);
                            document.getElementById('rectM').setAttribute("height",yM);

                        }
                    </script>
                    <svg:text x="50%" y="230" font-size="18" fill="black" font-weight="bold" text-anchor="middle">
                      Porównanie ilości samic i samców
                    </svg:text>

                      <svg:text x="45%" y="380" fill="black" font-size="16" >  Samice </svg:text>
                        <svg:text x="55%" y="380" fill="black" font-size="16" >  Samce </svg:text>

                                  <xsl:value-of select="liczebność_samic" />
                                    <svg xmlns="http://www.w3.org/2000/svg" >
                                    <rect id="rectF" x="45%" y="250" width="50"
                                              height="0" fill="#42f459" stroke="black">
                                        <animate attributeType="style" attributeName="fill"
                                                from="black" to="#04a018" dur="2s"
                                                 repeatCount="indefinite" />
                                    </rect>
                                    </svg>

                                    <svg xmlns="http://www.w3.org/2000/svg" >
                                    <rect id="rectM" x="55%" y="250" width="50"
                                              height="0" fill="#42f459" stroke="black">
                                        <animate attributeType="style" attributeName="fill"
                                                from="black" to="#04a018" dur="2s"
                                                 repeatCount="indefinite" />
                                    </rect>
                                    </svg>



  <svg:g id="authors" class="btn" width="70" height="20" onclick="ustawWykresyPlci()" cursor="pointer">
      <svg:rect x="49%" y="420" width="70" height="20" fill="#42f459" stroke="black"/>
      <svg:text x="25" y="1" fill="white" font-size="16" >Autorzy:</svg:text>
  </svg:g>

  <svg:text x="50%" y="530" font-size="18" fill="black" font-weight="bold" text-anchor="middle">
    Porównanie liczby ras i pastwisk
  </svg:text>
  <xsl:variable name="liczba_ras"><xsl:value-of select="całkowita_liczba_ras"/></xsl:variable>
  <svg:text x="55%" y="620" fill="black" font-size="16" >  Rasy </svg:text>
    <svg:text x="45%" y="620" fill="black" font-size="16" >  Pastwiska </svg:text>
                <svg:text x="45%" y="640" fill="black" font-size="16" >  <xsl:value-of select="$liczba_ras"/> </svg:text>
                    Liczba ras: <xsl:value-of select="całkowita_liczba_ras" />;
                    <svg xmlns="http://www.w3.org/2000/svg" >
                        <rect id="rect11" x="45%" y="550" width="20"
                            height="0" fill="blue" stroke="blue">
                        <animate attributeName="height"
                                 from="0" to="{$liczba_ras}" dur="3s"
                                 repeatCount="indefinite" />
                        </rect>
                    </svg>

                    <xsl:variable name="liczba_pastwisk"><xsl:value-of select="całkowita_liczba_pastwisk"/></xsl:variable>
                <svg:text x="55%" y="640" fill="black" font-size="16" >  <xsl:value-of select="$liczba_pastwisk"/> </svg:text>
                    Liczba pastwisk: <xsl:value-of select="całkowita_liczba_pastwisk" />;
                    <svg xmlns="http://www.w3.org/2000/svg" >
                        <rect id="rect11" x="55%" y="550" width="20"
                              height="0" fill="grey" stroke="black">
                        <animate attributeName="height"
                                 from="0" to="{$liczba_pastwisk}" dur="5s"
                                 repeatCount="indefinite" />
                        </rect>
                    </svg>

                    <svg:text x="50%" y="680" font-size="18" fill="black" font-weight="bold" text-anchor="middle">
                      Calkowita powierzchnia pastwisk
                    </svg:text>

                    <script>
                    function mOverP(evt) {
                    var numbers = document.getElementById("txp");
                    numbers.setAttribute("visibility", "visible");

                    }

                    function mOutP(evt) {
                    var numbers = document.getElementById("txp");
                    numbers.setAttribute("visibility", "hidden");
                    }
                    </script>

                    <svg:text id="txp" visibility="hidden"  x="50%" y="920" font-size="18" fill="white" font-weight="bold" text-anchor="middle">
                      <xsl:value-of select="całkowita_powierzchnia_pastwisk" />
                    </svg:text>




                                      <svg xmlns="http://www.w3.org/2000/svg" >
                                          <circle id="rect11"   cx="50%" cy="820" r="30" onmouseover="mOverP(evt)" onmouseout="mOutP(evt)"   fill="#04a018" stroke="red">
<animate attributeName="r" attributeType="XML" begin="0s" dur="3s" fill="freeze" from="0" to="100" />
                                          </circle>
                                      </svg>

                                      <svg version="1.1" id="Warstwa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="800" y="-100"  xml:space="preserve">
                                      <style type="text/css">
                                      	.st0{fill:#3A3A3A;}
                                      	.st1{fill:#FFFFFF;}
                                      </style>
                                      <g  transform="scale(2.5)"
                                        >
                                      	<rect x="171.7" y="196.3" class="st0" width="3.1" height="10.9"/>
                                      	<rect x="184.8" y="196.3" class="st0" width="3.1" height="10.9"/>
                                      	<circle class="st1" cx="171.3" cy="181.8" r="12.2"/>
                                      	<circle class="st1" cx="182.4" cy="177.1" r="12.2"/>
                                      	<circle class="st1" cx="188.3" cy="187.6" r="12.2"/>
                                      	<circle class="st1" cx="176.7" cy="191.1" r="12.2"/>
                                      	<path class="st0" d="M186,182.7c0,3.3-2.7,8.9-6,8.9s-6-5.6-6-8.9s2.7-6,6-6S186,179.3,186,182.7z"/>
                                      	<path class="st0" d="M187.6,178.5c1.5,0.8,3.6,2.8,3.1,3.7c-0.5,0.9-3.3,0.2-4.8-0.5s-2.3-2.1-1.9-3S186.1,177.7,187.6,178.5z"/>
                                      	<path class="st0" d="M172.8,178c-1.5,0.8-3.6,2.8-3.1,3.7c0.5,0.9,3.3,0.2,4.8-0.5s2.3-2.1,1.9-3S174.3,177.3,172.8,178z"/>
                                      	<circle cx="177.5" cy="183.1" r="1"/>
                                      	<circle cx="181.8" cy="183.1" r="1"/>
<animateMotion path="M 40 10 L 40 600 L 40 10" dur="8s" repeatCount="indefinite"/>
                                      </g>

                                      </svg>
            </xsl:template>


</xsl:stylesheet>
