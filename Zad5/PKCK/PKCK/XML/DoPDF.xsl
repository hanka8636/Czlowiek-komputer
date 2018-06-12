<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:fo="http://www.w3.org/1999/XSL/Format">

    <xsl:output method="xml"
                encoding="utf-8"/>

  <xsl:template match="/">
    <fo:root>
      <fo:layout-master-set>
        <fo:simple-page-master  master-name="Spis"
                                page-height="297mm"
                                page-width="210mm"
                                margin-top="20mm"
                                margin-bottom="10mm"
                                margin-left="15mm"
                                margin-right="15mm">
          <fo:region-body margin="10mm"/>
          <fo:region-before extent="5" />
          <fo:region-after extent="5" />
          <fo:region-start extent="5" />
          <fo:region-end extent="5" />
        </fo:simple-page-master>
      </fo:layout-master-set>

      <fo:page-sequence master-reference="Spis">
        <fo:static-content flow-name="xsl-region-before">
          <fo:block text-align="center" font-family="Tahoma" font-size="24px">
            <xsl:text>Spis owiec</xsl:text>
            <fo:block text-align="center" font-family="Courier New" font-size="12px">
              <xsl:text>Wygenerowano:</xsl:text>
                            <xsl:value-of select="//data_wygenerowania"/>
            </fo:block>
          </fo:block>
        </fo:static-content>

        <fo:static-content flow-name="xsl-region-after">
          <fo:block text-align="center" font-family= "Courier New"  font-size="12px">
            <xsl:text>Strona &#xD;&#xA;</xsl:text>
                <fo:page-number />
          </fo:block>
        </fo:static-content>

        <fo:flow flow-name="xsl-region-body">
          <xsl:apply-templates/>
        </fo:flow>
      </fo:page-sequence>
    </fo:root>
  </xsl:template>

  <xsl:template match="autorzy">
    <fo:block font-size="16px" text-align="left" font-family="Calibri" margin="25">
      <fo:block>
        <xsl:text>Autorzy:</xsl:text>
      </fo:block>
      <fo:block>
      <xsl:value-of select="//autor[1]"/>
      </fo:block>
      <fo:block>
      <xsl:value-of select="//autor[2]"/>
      </fo:block>
    </fo:block>
  </xsl:template>



<xsl:template match="spis">
    <fo:block font-size="20px" text-align="left" font-family="Liberation Sans">
      <fo:block text-align="center" margin="10" font-weight="bold">
        <xsl:text>Rasy</xsl:text>
        <xsl:text>&#xD;&#xA;</xsl:text>
      </fo:block>
        <fo:block font-size="10px" text-align="left" font-family="Liberation Sans">
        <fo:table border="solid black" width="100%">

          <fo:table-header>
            <fo:table-row>
              <fo:table-cell border="solid black">
                <fo:block font-weight="bold" text-align="center">Nazwa rasy</fo:block>
              </fo:table-cell>
              <fo:table-cell border="solid black">
                <fo:block font-weight="bold" text-align="center">Pastwisko</fo:block>
              </fo:table-cell>
              <fo:table-cell border="solid black">
                <fo:block font-weight="bold" text-align="center">L.owiec</fo:block>
              </fo:table-cell>
              <fo:table-cell border="solid black">
                <fo:block font-weight="bold" text-align="center">Średnia waga[kg]</fo:block>
              </fo:table-cell>
              <fo:table-cell border="solid black">
                <fo:block font-weight="bold" text-align="center">Średnia długość runa[mm]</fo:block>
              </fo:table-cell>
              <fo:table-cell border="solid black">
                <fo:block font-weight="bold" text-align="center">Średnia szybkość marszu[m/s]</fo:block>
              </fo:table-cell>
              <fo:table-cell border="solid black">
                <fo:block font-weight="bold" text-align="center">Średnia szybkość jedzenia [talerz/min]</fo:block>
              </fo:table-cell>
            </fo:table-row>
          </fo:table-header>

          <fo:table-body>
            <xsl:for-each select="//rasa_owiec">
              <fo:table-row>
                <fo:table-cell border-left-style="solid" border-right-style="solid" border-bottom-style="dashed">
                    <fo:block text-align="center">
                        <xsl:value-of select="@nazwa" />
                    </fo:block>
                </fo:table-cell>
                <fo:table-cell border-left-style="solid" border-right-style="solid"  border-bottom-style="dashed">
                    <fo:block text-align="center">
                        <xsl:value-of select="./pastwisko/@nazwa" />
                    </fo:block>
                </fo:table-cell>
                <fo:table-cell border-left-style="solid" border-right-style="solid"  border-bottom-style="dashed">
                    <fo:block text-align="center">
                        <xsl:value-of select="liczba_owiec" />
                    </fo:block>
                </fo:table-cell>
                <fo:table-cell border-left-style="solid" border-right-style="solid"  border-bottom-style="dashed">
                    <fo:block text-align="center">
                        <xsl:value-of select="średnia_waga" />
                    </fo:block>
                </fo:table-cell>
                <fo:table-cell border-left-style="solid" border-right-style="solid"  border-bottom-style="dashed">
                    <fo:block text-align="center">
                        <xsl:value-of select="średnia_długość_runa" />
                    </fo:block>
                  </fo:table-cell>
                  <fo:table-cell border-left-style="solid" border-right-style="solid"  border-bottom-style="dashed">
                    <fo:block text-align="center">
                        <xsl:value-of select="średnia_szybkość_marszu" />
                    </fo:block>
                </fo:table-cell>
                <fo:table-cell border-left-style="solid" border-right-style="solid"  border-bottom-style="dashed">
                    <fo:block text-align="center">
                        <xsl:value-of select="średnia_szybkość_zjadania_trawy" />
                    </fo:block>
                </fo:table-cell>
               </fo:table-row>
            </xsl:for-each>
          </fo:table-body>

        </fo:table>
      </fo:block>
    </fo:block>

    <xsl:text>&#xD;&#xA;&#xA;</xsl:text>

    <fo:block font-size="20px" font-family="Liberation Sans">
      <fo:block text-align="center" margin="20" font-weight="bold" space-before="45pt">
        <xsl:text>Owce</xsl:text>
        <xsl:text>&#xD;&#xA;</xsl:text>
      </fo:block>
      <fo:block font-size="12px" text-align="left" font-family="Segoe UI">
        <fo:table border="solid black" width="100%">

          <fo:table-header>
            <fo:table-row>
              <fo:table-cell border="solid black">
                <fo:block font-weight="bold" text-align="center">Owca</fo:block>
              </fo:table-cell>
              <fo:table-cell border="solid black">
                <fo:block font-weight="bold" text-align="center">Data ur</fo:block>
              </fo:table-cell>
              <fo:table-cell border="solid black">
                <fo:block font-weight="bold" text-align="center">Płeć</fo:block>
              </fo:table-cell>
              <fo:table-cell border="solid black">
                <fo:block font-weight="bold" text-align="center">Waga</fo:block>
              </fo:table-cell>
              <fo:table-cell border="solid black">
                <fo:block font-weight="bold" text-align="center">Długość runa</fo:block>
              </fo:table-cell>
              <fo:table-cell border="solid black">
                <fo:block font-weight="bold" text-align="center">Szybkość marszu</fo:block>
              </fo:table-cell>
              <fo:table-cell border="solid black">
                <fo:block font-weight="bold" text-align="center">Szybkość zjadania trawy</fo:block>
              </fo:table-cell>
              <fo:table-cell border="solid black">
                <fo:block font-weight="bold" text-align="center">Opis</fo:block>
              </fo:table-cell>
            </fo:table-row>
          </fo:table-header>

          <fo:table-body>
            <xsl:for-each select="//owca">
              <fo:table-row>
                <fo:table-cell  border-bottom-style="dotted">
                    <fo:block text-align="center">
                        <xsl:value-of select="./imię" />
                    </fo:block>
                </fo:table-cell >
                <fo:table-cell border-bottom-style="dotted">
                    <fo:block text-align="center">
                        <xsl:value-of select="./data_urodzenia" />
                    </fo:block>
                </fo:table-cell>
                <fo:table-cell border-bottom-style="dotted">
                    <fo:block text-align="center">
                        <xsl:value-of select="./płeć" />
                    </fo:block>
                </fo:table-cell>
                <fo:table-cell border-bottom-style="dotted">
                    <fo:block text-align="center">
                        <xsl:value-of select="./waga" />
                    </fo:block>
                </fo:table-cell>
                <fo:table-cell border-bottom-style="dotted">
                    <fo:block text-align="center">
                        <xsl:value-of select="./długość_runa" />
                    </fo:block>
                </fo:table-cell>
                <fo:table-cell border-bottom-style="dotted">
                    <fo:block text-align="center">
                        <xsl:value-of select="./szybkość_marszu" />
                    </fo:block>
                </fo:table-cell>
                <fo:table-cell border-bottom-style="dotted">
                    <fo:block text-align="center">
                        <xsl:value-of select="./szybkość_zjadania_trawy" />
                    </fo:block>
                    </fo:table-cell>
                <fo:table-cell border-bottom-style="dotted">
                        <fo:block text-align="center">
                            <xsl:value-of select="./opis" />
                        </fo:block>
                </fo:table-cell>
               </fo:table-row>
            </xsl:for-each>
          </fo:table-body>

          </fo:table>
      </fo:block>
    </fo:block>

    <fo:block font-size="12px" text-align="left" font-family="Poppins Black">
      <fo:block text-align="center" margin="10" font-weight="bold" >
        <xsl:text>&#160;</xsl:text>
        <xsl:text>Pastwiska</xsl:text>
        <xsl:text>&#xD;&#xA;</xsl:text>
      </fo:block>
        <fo:block font-size="12px" text-align="left" font-family="Segoe UI">
        <fo:table border="solid black" width="100%">

          <fo:table-header>
            <fo:table-row>
              <fo:table-cell border="solid black">
                <fo:block font-weight="bold" text-align="center">Nazwa</fo:block>
              </fo:table-cell>
              <fo:table-cell border="solid black">
                <fo:block font-weight="bold" text-align="center">Powierzchnia [ha]</fo:block>
              </fo:table-cell>
            </fo:table-row>
          </fo:table-header>

          <fo:table-body>
            <xsl:for-each select="//pastwisko">
              <fo:table-row>
                <fo:table-cell  border="solid black">
                    <fo:block text-align="center">
                        <xsl:value-of select="@nazwa" />
                    </fo:block>
                </fo:table-cell>
                <fo:table-cell  border="solid black">
                    <fo:block text-align="center">
                        <xsl:value-of select="./powierzchnia" />
                    </fo:block>
                </fo:table-cell>
               </fo:table-row>
            </xsl:for-each>
          </fo:table-body>

        </fo:table>
      </fo:block>
    </fo:block>

    <xsl:text>&#xD;&#xA;&#xA;</xsl:text>


  </xsl:template>

  <xsl:template match="podsumowanie">
    <fo:block font-size="12px" text-align="left" font-family="Segoe UI">
      <fo:block text-align="center" margin="20" font-weight="bold" space-before="45pt">
        <xsl:text>Podsumowanie</xsl:text>
        <xsl:text>&#xD;&#xA;</xsl:text>
      </fo:block>
      <fo:block font-size="12px" text-align="left" font-family="Segoe UI">
        <fo:table border="solid black" width="100%">

          <fo:table-header>
            <fo:table-row>
              <fo:table-cell border="solid black">
                <fo:block font-weight="bold" text-align="center">całkowita liczba owiec</fo:block>
              </fo:table-cell>
              <fo:table-cell border="solid black">
                <fo:block font-weight="bold" text-align="center">liczebność samców</fo:block>
              </fo:table-cell>
              <fo:table-cell border="solid black">
                <fo:block font-weight="bold" text-align="center">liczebność samic</fo:block>
              </fo:table-cell>
            </fo:table-row>
          </fo:table-header>

          <fo:table-body>
              <fo:table-cell border="solid black">
                <fo:block text-align="center">
                  <xsl:value-of select="całkowita_liczba_owiec" />
                </fo:block>
              </fo:table-cell>

              <fo:table-cell border="solid black">
                <fo:block text-align="center">
                  <xsl:value-of select="liczebność_samców" />
                </fo:block>
              </fo:table-cell>

              <fo:table-cell border="solid black">
                <fo:block text-align="center">
                  <xsl:value-of select="liczebność_samic" />
                </fo:block>
              </fo:table-cell>



          </fo:table-body>

        </fo:table>
      </fo:block>

      <fo:block>
        <fo:table border="solid black" width="100%">

          <fo:table-header>
            <fo:table-row>

              <fo:table-cell border="solid black">
                <fo:block font-weight="bold" text-align="center">liczba ras</fo:block>
              </fo:table-cell>
              <fo:table-cell border="solid black">
              <fo:block font-weight="bold" text-align="center">liczba pastwisk</fo:block>
            </fo:table-cell>
                <fo:table-cell border="solid black">
                  <fo:block font-weight="bold" text-align="center">powierzchnia pastwisk</fo:block>
                </fo:table-cell>
                <fo:table-cell border="solid black">
                  <fo:block font-weight="bold" text-align="center">średnia waga</fo:block>
                </fo:table-cell>
                <fo:table-cell border="solid black">
                  <fo:block font-weight="bold" text-align="center">średnia długość runa</fo:block>
                </fo:table-cell>
                <fo:table-cell border="solid black">
                  <fo:block font-weight="bold" text-align="center">średnia szybkość marszu</fo:block>
                </fo:table-cell>
                <fo:table-cell border="solid black">
                  <fo:block font-weight="bold" text-align="center">średnia szybkość zjadania trawy</fo:block>
                </fo:table-cell>
            </fo:table-row>
          </fo:table-header>

          <fo:table-body>

              <fo:table-cell border="solid black">
                <fo:block text-align="center">
                  <xsl:value-of select="całkowita_liczba_ras" />
                </fo:block>
              </fo:table-cell>

              <fo:table-cell border="solid black">
                <fo:block text-align="center">
                  <xsl:value-of select="całkowita_liczba_pastwisk" />
                </fo:block>
              </fo:table-cell>

              <fo:table-cell  border="solid black">
                <fo:block text-align="center">
                  <xsl:value-of select="całkowita_powierzchnia_pastwisk" />
                </fo:block>
              </fo:table-cell>

              <fo:table-cell  border="solid black">
                <fo:block text-align="center">
                  <xsl:value-of select="średnia_waga" />
                </fo:block>
              </fo:table-cell>

              <fo:table-cell  border="solid black">
                <fo:block text-align="center">
                  <xsl:value-of select="średnia_długość_runa" />
                </fo:block>
              </fo:table-cell>

              <fo:table-cell  border="solid black">
                <fo:block text-align="center">
                  <xsl:value-of select="średnia_szybkość_marszu" />
                </fo:block>
              </fo:table-cell>

              <fo:table-cell  border="solid black">
                <fo:block text-align="center">
                  <xsl:value-of select="średnia_szybkość_zjadania_trawy" />
                </fo:block>
              </fo:table-cell>

          </fo:table-body>

        </fo:table>
      </fo:block>

</fo:block>

  </xsl:template>

</xsl:stylesheet>
