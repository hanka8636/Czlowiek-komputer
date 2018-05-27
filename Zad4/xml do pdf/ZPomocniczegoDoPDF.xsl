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
                        page-height="297mm" page-width="210mm"
                                              margin-top="20mm"
                                              margin-bottom="10mm"
                                              margin-left="25mm"
                                              margin-right="25mm">
                        <fo:region-body margin="20mm"/>
                        <fo:region-before extent="5" />
                        <fo:region-after extent="5" />
                        <fo:region-start extent="5" />
                        <fo:region-end extent="5" />
                      </fo:simple-page-master>
                    </fo:layout-master-set>



      <fo:page-sequence master-reference="Spis">
		        <fo:static-content flow-name="xsl-region-before">
		          <fo:block text-align="center" font-family="Segoe UI"  font-size="20px">
		            <xsl:text>Spis owiec</xsl:text>
		            <fo:block text-align="center" font-family="Segoe UI"  font-size="10px">
		               <xsl:text>[&#x20;Wygenerowano:</xsl:text>
                   <xsl:value-of select="data_wygenerowania"/>
		              <xsl:text>&#xD;&#xA;</xsl:text>
                  <xsl:text>&#x20;]</xsl:text>
		            </fo:block>
		          </fo:block>
		        </fo:static-content>

		        <fo:static-content flow-name="xsl-region-after">
		          <fo:block text-align="center" font-family="Segoe UI"  font-size="10px">
		            <xsl:text>strona </xsl:text>
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
        <fo:block font-size="15px" text-align="left" font-family="Segoe UI" margin="25">
          <fo:block>
            <xsl:text>Autorzy:</xsl:text>
            <xsl:text>&#xD;&#xA;</xsl:text>
          </fo:block>
          <fo:block>
            <xsl:apply-templates />
          </fo:block>
        </fo:block>
      </xsl:template>

			<xsl:template match="autor">
		    <fo:block 	font-size="20px" 	text-align="left" font-family="Segoe UI">
		      <fo:block>
		        <fo:block margin-left="5mm">
		          <xsl:value-of select="autor"/>
		          <xsl:text>&#xD;&#xA;</xsl:text>
		        </fo:block>
		      </fo:block>
		    </fo:block>
		  </xsl:template>


			<xsl:template match="rasa_owiec">
	<fo:block font-size="16px" 	text-align="left" font-family="Segoe UI">
		<fo:block text-align="center" margin="20" font-weight="bold">
			<xsl:text>Pastwisko</xsl:text>
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
							<fo:block font-weight="bold" text-align="center">Powierzchnia</fo:block>
						</fo:table-cell>
						<fo:table-cell border="solid black">
							<fo:block font-weight="bold" text-align="center">Liczba owiec</fo:block>
						</fo:table-cell>
						<fo:table-cell border="solid black">
							<fo:block font-weight="bold" text-align="center">Średnia waga</fo:block>
						</fo:table-cell>
						<fo:table-cell border="solid black">
							<fo:block font-weight="bold" text-align="center">Średnia długość runa</fo:block>
						</fo:table-cell>
						<fo:table-cell border="solid black">
							<fo:block font-weight="bold" text-align="center">Średnia szybkość marszu</fo:block>
						</fo:table-cell>
						<fo:table-cell border="solid black">
							<fo:block font-weight="bold" text-align="center">Średnia szybkość zjadania trawy</fo:block>
						</fo:table-cell>
					</fo:table-row>
				</fo:table-header>

				<fo:table-body>
					<xsl:for-each select="rasa_owiec">
						<fo:table-row>
							<fo:table-cell>
								<fo:block text-align="center">
									<xsl:value-of select="@nazwa" />
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>
								<fo:block text-align="center">
									<xsl:value-of select="powierzchnia" />
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>
								<fo:block text-align="center">
										<xsl:value-of select="@nazwa" />
								</fo:block>
							</fo:table-cell>

						</fo:table-row>
					</xsl:for-each>
				</fo:table-body>
      </fo:table>
		</fo:block>
	</fo:block>
</xsl:template>

<xsl:template match="podsumowanie">
      <fo:block>
        <xsl:apply-templates />
    </fo:block>
  </xsl:template>

  <xsl:template match="Statystyki">
    <fo:block font-size="16px" 	text-align="left" font-family="Century Gothic">
      <fo:block>
        <fo:table border="none" width="50%" margin="40">

          <fo:table-header>
            <fo:table-row>
              <fo:table-cell border="none">
                <fo:block font-weight="bold" text-align="center">Rodzaj</fo:block>
              </fo:table-cell>
              <fo:table-cell border="none">
                <fo:block font-weight="bold" text-align="center">Ilość</fo:block>
              </fo:table-cell>
            </fo:table-row>
          </fo:table-header>
          <fo:table-body>
            <fo:table-row>
              <fo:table-cell border="none">
                <fo:block text-align="center">
                  <fo:block>Kontrakt</fo:block>
                </fo:block>
              </fo:table-cell>
              <fo:table-cell border="none">
                <fo:block text-align="center">
                  <xsl:value-of select="całkowita_liczba_owiec" />
                </fo:block>
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row>
              <fo:table-cell border="none">
                <fo:block text-align="center">
                  <fo:block>Umowa o dzieło</fo:block>
                </fo:block>
              </fo:table-cell>
              <fo:table-cell border="none">
                <fo:block text-align="center">
                  <xsl:value-of select="liczebność_samców" />
                </fo:block>
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row>
              <fo:table-cell border="none">
                <fo:block text-align="center">
                  <fo:block>Umowa zlecenie</fo:block>
                </fo:block>
              </fo:table-cell>
              <fo:table-cell border="none">
                <fo:block text-align="center">
                  <xsl:value-of select="liczebność_samic" />
                </fo:block>
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row>
              <fo:table-cell border="none">
                <fo:block text-align="center">
                  <fo:block>Na czas nieokreślony</fo:block>
                </fo:block>
              </fo:table-cell>
              <fo:table-cell border="none">
                <fo:block text-align="center">
                  <xsl:value-of select="całkowita_liczba_ras" />
                </fo:block>
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row>
              <fo:table-cell border="none">
                <fo:block text-align="center">
                  <fo:block>Razem</fo:block>
                </fo:block>
              </fo:table-cell>
              <fo:table-cell border="none">
                <fo:block text-align="center">
                  <xsl:value-of select="całkowita_liczba_pastwisk" />
                </fo:block>
              </fo:table-cell>
            </fo:table-row>
          </fo:table-body>
        </fo:table>
      </fo:block>
    </fo:block>

			<xsl:apply-templates select="Autorzy"/>
	  </xsl:template>

</xsl:stylesheet>
