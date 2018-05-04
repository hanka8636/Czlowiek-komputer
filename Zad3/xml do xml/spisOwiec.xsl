<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
	<xsl:preserve-space elements = '*' />
  <xsl:template match="/">
		<raport>

      <tytul> Spis Owiec </tytul>
      <autorzy>
        <xsl:for-each select="//autor">
          <autor>
            <xsl:value-of select="concat(imię_autora, ' ', nazwisko)"/>
          </autor>
        </xsl:for-each>
      </autorzy>

			<spis>
				<xsl:for-each select="//definicja_rasy">
					<xsl:sort select="." data-type="text" order="ascending"/>
					<xsl:variable name="rasa" select="./@idr"/>
					<xsl:variable name="rasaOwcy" select="@nazwa"/>
					<rasa_owiec nazwa="{$rasaOwcy}">
						<xsl:for-each select="//rasa[@idr=$rasa]">
							<xsl:variable name="nazwaPastwiska" select="../../nazwa"/>
							<pastwisko nazwa="{$nazwaPastwiska}">
								<powierzchnia jednostka="ha">
									<xsl:if test="../../powierzchnia[@jednostka='ha']"><xsl:value-of select="../../powierzchnia"/></xsl:if>
									<xsl:if test="../../powierzchnia[@jednostka='ar']"><xsl:value-of select="../../powierzchnia * 0.01"/></xsl:if>
									<xsl:if test="../../powierzchnia[@jednostka='m2']"><xsl:value-of select="../../powierzchnia * 0.0001"/></xsl:if>
								</powierzchnia>
								<stado>
								<xsl:for-each select="../owca">
									<xsl:sort select="../owca/data_urodzenia" data-type="number" order="ascending"/>
									<owca>
										<imię>
											<xsl:value-of select="imię"/>
										</imię>
										<data_urodzenia>
											<xsl:value-of select="data_urodzenia"/>
										</data_urodzenia>
										<płeć>
											<xsl:choose>
        								<xsl:when test="płeć/@p = 'm'">Samiec</xsl:when>
        								<xsl:otherwise>Samiczka</xsl:otherwise>
      								</xsl:choose>
										</płeć>
										<waga jednostka="kg">
											<xsl:if test="waga[@jednostka='kg']"><xsl:value-of select="waga"/></xsl:if>
											<xsl:if test="waga[@jednostka='funt']"><xsl:value-of select="waga * 0.4"/></xsl:if>
											<xsl:if test="waga[@jednostka='dkg']"><xsl:value-of select="waga * 0.01"/></xsl:if>
										</waga>
										<długość_runa jednostka="mm">
											<xsl:if test="długość_runa[@jednostka='mm']"><xsl:value-of select="długość_runa"/></xsl:if>
											<xsl:if test="długość_runa[@jednostka='cm']"><xsl:value-of select="długość_runa * 10"/></xsl:if>
											<xsl:if test="długość_runa[@jednostka='cal']"><xsl:value-of select="długość_runa * 25.4"/></xsl:if>
										</długość_runa>
										<szybkość_marszu jednostka="ms">
											<xsl:if test="szybkość_marszu[@jednostka='ms']"><xsl:value-of select="szybkość_marszu"/></xsl:if>
											<xsl:if test="szybkość_marszu[@jednostka='kms']"><xsl:value-of select="szybkość_marszu * 1000"/></xsl:if>
											<xsl:if test="szybkość_marszu[@jednostka='kmh']"><xsl:value-of select="szybkość_marszu * 0.28"/></xsl:if>
										</szybkość_marszu>
										<długość_runa jednostka="talerzmin">
											<xsl:if test="długość_runa[@jednostka='talerzmin']"><xsl:value-of select="długość_runa"/></xsl:if>
											<xsl:if test="długość_runa[@jednostka='miskamin']"><xsl:value-of select="długość_runa * 2"/></xsl:if>
											<xsl:if test="długość_runa[@jednostka='wiadroh']"><xsl:value-of select="długość_runa * 3"/></xsl:if>
										</długość_runa>
										<opis>
											<xsl:value-of select="opis"/>
										</opis>
									</owca>
								</xsl:for-each>
							</stado>
							</pastwisko>
							<xsl:variable name="liczbaOwiec" select="count(../owca)"/>
							<liczba_owiec>
								<xsl:value-of select="$liczbaOwiec"/>
							</liczba_owiec>
							<średnia_waga jednostka="kg">
								<xsl:variable name="kilogramy" select="sum(../owca/waga[@jednostka='kg'])"/>
								<xsl:variable name="dekagramy" select="sum(../owca/waga[@jednostka='dkg']) * 0.01"/>
								<xsl:variable name="funty" select="sum(../owca/waga[@jednostka='funt']) * 0.4"/>
								<xsl:variable name="waga" select="(($kilogramy + $dekagramy + $funty) div $liczbaOwiec)"/>
								<xsl:value-of select="$waga"/>
							</średnia_waga>
						</xsl:for-each>
					</rasa_owiec>
				</xsl:for-each>
			</spis>

		</raport>
	</xsl:template>

</xsl:stylesheet>
