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
                                page-height="29,7cm"
                                page-width="21cm"
                                margin-top="2cm"
                                margin-bottom="1cm"
                                margin-left="2,5cm"
                                margin-right="2,5cm">
          <fo:region-body margin="2cm"/>
          <fo:region-before extent="5" />
          <fo:region-after extent="5" />
          <fo:region-start extent="5" />
          <fo:region-end extent="5" />
        </fo:simple-page-master>
      </fo:layout-master-set>

      <fo:page-sequence master-reference="Spis">
        <fo:static-content flow-name="xsl-region-before">
          <fo:block text-align="center" font-family="Arial" font-size="15px">
            <xsl:text>Dane plyt</xsl:text>
            <fo:block text-align="center" font-family="monospace" font-size="10px">
              <xsl:text>[&#x20;Wygenerowano:</xsl:text>
              <xsl:value-of select="substring(//document/Podsumowanie/Data_Raportu,1,10)"/>
              <xsl:text>&#xD;&#xA;</xsl:text>
              <xsl:value-of select="substring(//document/Podsumowanie/Data_Raportu,12,5)"/>
              <xsl:text>&#x20;]</xsl:text>
            </fo:block>
          </fo:block>
        </fo:static-content>

        <fo:static-content flow-name="xsl-region-after">
          <fo:block text-align="center" font-family="monospace"  font-size="10px">
            <xsl:text>[&#x20;Strona&#x20;</xsl:text>
                <fo:page-number />
            <xsl:text>&#x20;]</xsl:text>
          </fo:block>
        </fo:static-content>

        <fo:flow flow-name="xsl-region-body">
          <xsl:apply-templates/>
        </fo:flow>
      </fo:page-sequence>
    </fo:root>
  </xsl:template>

  <xsl:template match="autorzy">
    <fo:block font-size="15px" text-align="left" font-family="Segoe UI" margin="25">
      <fo:block>
        <xsl:text>Autorzy:</xsl:text>
        <xsl:text>&#xD;&#xA;</xsl:text>
      </fo:block>
      <fo:block>
      <xsl:value-of select="autor"/>
      </fo:block>
    </fo:block>
  </xsl:template>



<xsl:template match="spis">
    <fo:block font-size="12px" text-align="left" font-family="Actor">
      <fo:block text-align="center" margin="20" font-weight="bold">
        <xsl:text>Plyty</xsl:text>
        <xsl:text>&#xD;&#xA;</xsl:text>
      </fo:block>
        <fo:block>
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
                <fo:block font-weight="bold" text-align="center">Średnia szybkość zjadania trawy[talerz/min]</fo:block>
              </fo:table-cell>
            </fo:table-row>
          </fo:table-header>

          <fo:table-body>
            <xsl:for-each select="//rasa_owiec">
              <fo:table-row>
                <fo:table-cell>
                    <fo:block text-align="center">
                        <xsl:value-of select="@nazwa" />
                    </fo:block>
                </fo:table-cell>
                <fo:table-cell>
                    <fo:block text-align="center">
                        <xsl:value-of select="./pastwisko/@nazwa" />
                    </fo:block>
                </fo:table-cell>
                <fo:table-cell>
                    <fo:block text-align="center">
                        <xsl:value-of select="liczba_owiec" />
                    </fo:block>
                </fo:table-cell>
                <fo:table-cell>
                    <fo:block text-align="center">
                        <xsl:value-of select="średnia_waga" />
                    </fo:block>
                </fo:table-cell>
                <fo:table-cell>
                    <fo:block text-align="center">
                        <xsl:value-of select="średnia_długość_runa" />
                    </fo:block>
                    <fo:block text-align="center">
                        <xsl:value-of select="średnia_szybkość_marszu" />
                    </fo:block>
                </fo:table-cell>
                <fo:table-cell>
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

    <fo:block font-size="12px" text-align="left" font-family="Segoe UI">
      <fo:block text-align="center" margin="20" font-weight="bold" space-before="45pt">
        <xsl:text>Owce</xsl:text>
        <xsl:text>&#xD;&#xA;</xsl:text>
      </fo:block>
      <fo:block>
        <fo:table border="solid black" width="100%">

          <fo:table-header>
            <fo:table-row>
              <fo:table-cell border="solid black">
                <fo:block font-weight="bold" text-align="center">Owca</fo:block>
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
                <fo:table-cell>
                    <fo:block text-align="center">
                        <xsl:value-of select="./imię" />
                    </fo:block>
                </fo:table-cell>
                <fo:table-cell>
                    <fo:block text-align="center">
                        <xsl:value-of select="./data_urodzenia" />
                    </fo:block>
                </fo:table-cell>
                <fo:table-cell>
                    <fo:block text-align="center">
                        <xsl:value-of select="./płeć" />
                    </fo:block>
                </fo:table-cell>
                <fo:table-cell>
                    <fo:block text-align="center">
                        <xsl:value-of select="./waga" />
                    </fo:block>
                </fo:table-cell>
                <fo:table-cell>
                    <fo:block text-align="center">
                        <xsl:value-of select="./długość_runa" />
                    </fo:block>
                </fo:table-cell>
                <fo:table-cell>
                    <fo:block text-align="center">
                        <xsl:value-of select="./szybkość_marszu" />
                    </fo:block>
                </fo:table-cell>
                <fo:table-cell>
                    <fo:block text-align="center">
                        <xsl:value-of select="./szybkość_zjadania_trawy" />
                    </fo:block>
                    </fo:table-cell>
                <fo:table-cell>
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

    <fo:block font-size="12px" text-align="left" font-family="Amaranth">
      <fo:block text-align="center" margin="10" font-weight="bold" >
        <xsl:text>&#160;</xsl:text>
        <xsl:text>Pastwiska</xsl:text>
        <xsl:text>&#xD;&#xA;</xsl:text>
      </fo:block>
        <fo:block>
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
                <fo:table-cell>
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
    <fo:block font-size="10px" text-align="left" font-family="Century Gothic">
      <fo:block text-align="center" font-size="14px">
      <xsl:text>Podsumowanie</xsl:text>
        <fo:table border="none" width="50%" margin="20" font-size="10px">

          <fo:table-header>
            <fo:table-row>
              <fo:table-cell border="solid black">
                <fo:block font-weight="bold" text-align="center">całkowita_liczba_owiec</fo:block>
              </fo:table-cell>
              <fo:table-cell border="solid black">
                <fo:block font-weight="bold" text-align="center">liczebność_samców</fo:block>
              </fo:table-cell>
              <fo:table-cell border="solid black">
                <fo:block font-weight="bold" text-align="center">liczebność_samic</fo:block>
              </fo:table-cell>
              <fo:table-cell border="solid black">
                <fo:block font-weight="bold" text-align="center">całkowita_liczba_ras</fo:block>
              </fo:table-cell>
              <fo:table-cell border="solid black">
                <fo:block font-weight="bold" text-align="center">całkowita_liczba_pastwisk</fo:block>
              </fo:table-cell>
              <fo:table-cell border="solid black">
                <fo:block font-weight="bold" text-align="center">całkowita_powierzchnia_pastwisk</fo:block>
              </fo:table-cell>
              <fo:table-cell border="solid black">
                <fo:block font-weight="bold" text-align="center">średnia_waga</fo:block>
              </fo:table-cell>
              <fo:table-cell border="solid black">
                <fo:block font-weight="bold" text-align="center">średnia_długość_runa</fo:block>
              </fo:table-cell>
              <fo:table-cell border="solid black">
                <fo:block font-weight="bold" text-align="center">średnia_szybkość_marszu</fo:block>
              </fo:table-cell>
              <fo:table-cell border="solid black">
                <fo:block font-weight="bold" text-align="center">średnia_szybkość_zjadania_trawy</fo:block>
              </fo:table-cell>
            </fo:table-row>
          </fo:table-header>

          <fo:table-body>
            <fo:table-row>
              <fo:table-cell border="solid black">
                <fo:block text-align="center">
                  <xsl:value-of select="całkowita_liczba_owiec" />
                </fo:block>
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row>
              <fo:table-cell border="solid black">
                <fo:block text-align="center">
                  <xsl:value-of select="liczebność_samców" />
                </fo:block>
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row>
              <fo:table-cell border="solid black">
                <fo:block text-align="center">
                  <xsl:value-of select="liczebność_samic" />
                </fo:block>
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row>
              <fo:table-cell border="solid black">
                <fo:block text-align="center">
                  <xsl:value-of select="całkowita_liczba_ras" />
                </fo:block>
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row>
              <fo:table-cell border="solid black">
                <fo:block text-align="center">
                  <xsl:value-of select="całkowita_liczba_pastwisk" />
                </fo:block>
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row>
              <fo:table-cell>
                <fo:block text-align="center">
                  <xsl:value-of select="całkowita_powierzchnia_pastwisk" />
                </fo:block>
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row>
              <fo:table-cell>
                <fo:block text-align="center">
                  <xsl:value-of select="średnia_waga" />
                </fo:block>
              </fo:table-cell>
            </fo:table-row><fo:table-row>
              <fo:table-cell>
                <fo:block text-align="center">
                  <xsl:value-of select="średnia_długość_runa" />
                </fo:block>
              </fo:table-cell>
            </fo:table-row><fo:table-row>
              <fo:table-cell>
                <fo:block text-align="center">
                  <xsl:value-of select="całkowita_powierzchnia_pastwisk" />
                </fo:block>
              </fo:table-cell>
            </fo:table-row><fo:table-row>
              <fo:table-cell>
                <fo:block text-align="center">
                  <xsl:value-of select="średnia_szybkość_marszu" />
                </fo:block>
              </fo:table-cell>
            </fo:table-row><fo:table-row>
              <fo:table-cell>
                <fo:block text-align="center">
                  <xsl:value-of select="średnia_szybkość_zjadania_trawy" />
                </fo:block>
              </fo:table-cell>
            </fo:table-row>
          </fo:table-body>

        </fo:table>
      </fo:block>

    </fo:block>
  </xsl:template>

</xsl:stylesheet>
