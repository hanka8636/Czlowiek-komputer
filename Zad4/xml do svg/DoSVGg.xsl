<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:svg="http://www.w3.org/2000/svg" xmlns="http://www.w3.org/2000/svg" version="1.0"
    xmlns:xlink="http://www.w3.org/1999/xlink">

    <xsl:output method="xml" media-type="image/svg" encoding="utf-8"  doctype-public="-//W3C//DTD SVG 1.1//EN"
        doctype-system="http://www.w3.org/TR/2001/REC-SVG-20010904/DTD/svg10.dtd"/>

    <xsl:template match="/">
        <svg:svg width="1520" height="800" font-family="Calibri">
            <svg:desc>Dane pracownicze firmy informatycznej</svg:desc>
            <svg:title><xsl:value-of select="nagłówek"/></svg:title>
            <defs>
                <linearGradient id="grad1" x1="0%" y1="0%" x2="0%" y2="100%">
                    <stop offset="0%" style="stop-color:rgb(255,240,220);stop-opacity:1" />
                    <stop offset="100%" style="stop-color:rgb(235,220,200);stop-opacity:1" />
                </linearGradient>
            </defs>

            <svg:rect x="3" y="3" width="1920" height="1080" fill="url(#grad1)" stroke="black" stroke-width="3"/>

            <svg:text x="50%" y="30" font-size="18" fill="black" font-weight="bold" text-anchor="middle">
                Dane pracownicze firmy informatycznej
            </svg:text>
            <script>
            function mOver(obj) {
                obj.setAttribute("fill","blue")
            }

            function mOut(obj) {
                obj.setAttribute("fill","red")
            }
            </script>
                        <xsl:apply-templates select="//autorzy" />
                        <xsl:apply-templates select="//podsumowanie" />


                        <xsl:apply-templates/>
                    </svg:svg>
                </xsl:template>

            <!-- AUTORZY  -->
            <xsl:template  match="autorzy" >


  <svg:text x="25" y="300" fill="black" font-size="16" >Autorzy:</svg:text>
                    <svg xmlns="http://www.w3.org/2000/svg" height="80" width="80">
                        <circle onmouseover="mOver(this)" onmouseout="mOut(this)"
                                cx="45" cy="45" r="30" stroke="black"
                                stroke-width="0" fill="red" />

                    </svg>
  <svg:text x="25" y="120" fill="black" font-size="16" >  Autor1 <xsl:value-of select="//autor[1]" /></svg:text>


                    <svg xmlns="http://www.w3.org/2000/svg" height="80" width="80">
                        <circle onmouseover="mOver(this)" onmouseout="mOut(this)"
                                cx="45" cy="45" r="30" stroke="black" stroke-width="0" fill="red" />
                                  <svg:text x="25" y="574" fill="white" font-size="16" >  <xsl:value-of select="//autor[2]" /></svg:text>
                    </svg>

  <svg:text x="425" y="120" fill="black" font-size="16" >  Autor2 <xsl:value-of select="//autor[2]" /></svg:text>

  <svg width="600" height="400" viewBox="0 0 370 60">>
  <title>Expenses</title>

  <g id='rowGroup' transform='translate(0, 0)'>
  <rect x='25' y='40' width='310' height='20' fill='gainsboro'/>
  <rect x='25' y='76' width='310' height='20' fill='gainsboro'/>

  <text x='30' y='30' font-size='18px' font-weight='bold' fill='crimson' text-anchor='middle' role="row">
  <tspan  x='100'>Sales</tspan>
  <tspan   x='200'>Expenses</tspan>
  <tspan  x='300'>Net</tspan>
  </text>

  <text x='30' y='30' font-size='18px' text-anchor='middle' role="row">
  <tspan  x='30' dy='1.5em' font-weight='bold' fill='crimson' text-anchor='start'>Q1</tspan>
  <tspan  x='100'>$ 223</tspan>
  <tspan  x='200'>$ 195</tspan>
  <tspan  x='300'>$ 28</tspan>
  </text>

  <text x='30' y='30' font-size='18px' text-anchor='middle' role="row">
  <tspan  x='30' dy='2.5em' font-weight='bold' fill='crimson' text-anchor='start'>Q2</tspan>
  <tspan  x='100'>$ 183</tspan>
  <tspan  x='200'>$ 70</tspan>
  <tspan  x='300'>$ 113</tspan>
  </text>

  <text x='30' y='30' font-size='18px' text-anchor='middle' role="row">
  <tspan  x='30' dy='3.5em' font-weight='bold' fill='crimson' text-anchor='start'>Q3</tspan>
  <tspan  x='100'>$ 277</tspan>
  <tspan  x='200'>$ 88</tspan>
  <tspan  x='300'>$ 189</tspan>
  </text>

  <text x='30' y='30' font-size='18px' text-anchor='middle' role="row">
  <tspan id="q4"  x='30' dy='4.5em' font-weight='bold' fill='crimson' text-anchor='start'>Q4</tspan>
  <tspan  x='100'>$ 402</tspan>
  <tspan  x='200'>$ 133</tspan>
  <tspan  x='300'>$ 269</tspan>
  </text>
  </g>
  </svg>
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
                    <svg:text x="50%" y="330" font-size="18" fill="black" font-weight="bold" text-anchor="middle">
                      Porównanie ilości samic i samców
                    </svg:text>

                      <svg:text x="125" y="520" fill="black" font-size="16" >  Samice </svg:text>
                        <svg:text x="225" y="520" fill="black" font-size="16" >  Samce </svg:text>

                                  <xsl:value-of select="liczebność_samic" />
                                    <svg xmlns="http://www.w3.org/2000/svg" >
                                    <rect id="rectF" x="125" y="550" width="50"
                                              height="0" fill="black" stroke="black">
                                        <animate attributeType="style" attributeName="fill"
                                                from="black" to="white" dur="2s"
                                                 repeatCount="indefinite" />
                                    </rect>
                                    </svg>

                                    <svg xmlns="http://www.w3.org/2000/svg" >
                                    <rect id="rectM" x="225" y="550" width="50"
                                              height="0" fill="black" stroke="black">
                                        <animate attributeType="style" attributeName="fill"
                                                from="black" to="white" dur="2s"
                                                 repeatCount="indefinite" />
                                    </rect>
                                    </svg>


  <button type="button" onClick="ustawWykresyPlci()" > Wykres </button>
  <svg:g id="authors" class="btn" width="70" height="20" onclick="ustawWykresyPlci()" cursor="pointer">
      <svg:rect x="18" y="600" width="70" height="20" fill="#927212" stroke="black"/>
      <svg:text x="25" y="1" fill="white" font-size="16" >Autorzy:</svg:text>
  </svg:g>

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

            </xsl:template>


</xsl:stylesheet>
