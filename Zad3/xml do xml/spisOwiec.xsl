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
									<xsl:if test="../../powierzchnia[@jednostka='ar']"><xsl:value-of select="format-number(../../powierzchnia * 0.01,'##.0')"/></xsl:if>
									<xsl:if test="../../powierzchnia[@jednostka='m2']"><xsl:value-of select="format-number(../../powierzchnia * 0.0001,'##.0')"/></xsl:if>
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
											<xsl:if test="waga[@jednostka='funt']"><xsl:value-of select="format-number(waga * 0.4,'##.0')"/></xsl:if>
											<xsl:if test="waga[@jednostka='dkg']"><xsl:value-of select="format-number(waga * 0.01,'##.0')"/></xsl:if>
										</waga>
										<długość_runa jednostka="mm">
											<xsl:if test="długość_runa[@jednostka='mm']"><xsl:value-of select="długość_runa"/></xsl:if>
											<xsl:if test="długość_runa[@jednostka='cm']"><xsl:value-of select="format-number(długość_runa * 10,'##.0')"/></xsl:if>
											<xsl:if test="długość_runa[@jednostka='cal']"><xsl:value-of select="format-number(długość_runa * 25.4,'##.0')"/></xsl:if>
										</długość_runa>
										<szybkość_marszu jednostka="ms">
											<xsl:if test="szybkość_marszu[@jednostka='ms']"><xsl:value-of select="szybkość_marszu"/></xsl:if>
											<xsl:if test="szybkość_marszu[@jednostka='kms']"><xsl:value-of select="format-number(szybkość_marszu * 1000,'##.0')"/></xsl:if>
											<xsl:if test="szybkość_marszu[@jednostka='kmh']"><xsl:value-of select="format-number(szybkość_marszu * 0.28,'##.0')"/></xsl:if>
										</szybkość_marszu>
										<szybkość_zjadania_trawy jednostka="talerzmin">
											<xsl:if test="szybkość_zjadania_trawy[@jednostka='talerzmin']"><xsl:value-of select="szybkość_zjadania_trawy"/></xsl:if>
											<xsl:if test="szybkość_zjadania_trawy[@jednostka='miskamin']"><xsl:value-of select="format-number(szybkość_zjadania_trawy * 2,'##.0')"/></xsl:if>
											<xsl:if test="szybkość_zjadania_trawy[@jednostka='wiadroh']"><xsl:value-of select="format-number(szybkość_zjadania_trawy * 3,'##.0')"/></xsl:if>
										</szybkość_zjadania_trawy>
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
								<xsl:value-of select="format-number($waga,'##.0')"/>
							</średnia_waga>
							<średnia_długość_runa jednostka="mm">
								<xsl:variable name="mm" select="sum(../owca/długość_runa[@jednostka='mm'])"/>
								<xsl:variable name="cm" select="sum(../owca/długość_runa[@jednostka='cm']) * 10"/>
								<xsl:variable name="cal" select="sum(../owca/długość_runa[@jednostka='cal']) * 25.4"/>
								<xsl:variable name="dlugość" select="(($mm + $cm + $cal) div $liczbaOwiec)"/>
								<xsl:value-of select="format-number($dlugość,'##.0')"/>
							</średnia_długość_runa>
							<średnia_szybkość_marszu jednostka="ms">
								<xsl:variable name="ms" select="sum(../owca/szybkość_marszu[@jednostka='ms'])"/>
								<xsl:variable name="kms" select="sum(../owca/szybkość_marszu[@jednostka='kms']) * 1000"/>
								<xsl:variable name="kmh" select="sum(../owca/szybkość_marszu[@jednostka='kmh']) * 0.28"/>
								<xsl:variable name="szybkośćMarszu" select="(($ms + $kms + $kmh) div $liczbaOwiec)"/>
								<xsl:value-of select="format-number($szybkośćMarszu,'##.0')"/>
							</średnia_szybkość_marszu>
							<średnia_szybkość_zjadania_trawy jednostka="talerzmin">
								<xsl:variable name="talerzmin" select="sum(../owca/szybkość_zjadania_trawy[@jednostka='talerzmin'])"/>
								<xsl:variable name="miskamin" select="sum(../owca/szybkość_zjadania_trawy[@jednostka='miskamin']) * 2"/>
								<xsl:variable name="wiadroh" select="sum(../owca/szybkość_zjadania_trawy[@jednostka='wiadroh']) * 3"/>
								<xsl:variable name="szybkośćJedzenia" select="(($talerzmin + $miskamin + $wiadroh) div $liczbaOwiec)"/>
								<xsl:value-of select="format-number($szybkośćJedzenia,'##.0')"/>
							</średnia_szybkość_zjadania_trawy>
						</xsl:for-each>
					</rasa_owiec>
				</xsl:for-each>
			</spis>

			<podsumowanie>
				<xsl:variable name="liczbaOwiec" select="count(//owca)"/>
				<całkowita_liczba_owiec>
					<xsl:value-of select="$liczbaOwiec"/>
				</całkowita_liczba_owiec>
				<liczebność_samców>
					<xsl:value-of select="count(//płeć[@p='m'])"/>
				</liczebność_samców>
				<liczebność_samic>
					<xsl:value-of select="count(//płeć[@p='k'])"/>
				</liczebność_samic>
				<całkowita_liczba_ras>
					<xsl:value-of select="count(//definicja_rasy)"/>
				</całkowita_liczba_ras>
				<całkowita_liczba_pastwisk>
					<xsl:value-of select="count(//pastwisko)"/>
				</całkowita_liczba_pastwisk>
				<całkowita_powierzchnia_pastwisk jednostka="ha">
					<xsl:variable name="ha" select="sum(//powierzchnia[@jednostka='ha'])"/>
					<xsl:variable name="ar" select="sum(//powierzchnia[@jednostka='ar']) * 0.01"/>
					<xsl:variable name="m2" select="sum(//powierzchnia[@jednostka='m2']) * 0.0001"/>
					<xsl:variable name="powierzchnia" select="(($ha + $ar + $m2) div $liczbaOwiec)"/>
					<xsl:value-of select="format-number($powierzchnia,'##.0')"/>
				</całkowita_powierzchnia_pastwisk>
				<średnia_waga jednostka="kg">
					<xsl:variable name="kilogramy" select="sum(//waga[@jednostka='kg'])"/>
					<xsl:variable name="dekagramy" select="sum(//waga[@jednostka='dkg']) * 0.01"/>
					<xsl:variable name="funty" select="sum(//waga[@jednostka='funt']) * 0.4"/>
					<xsl:variable name="waga" select="(($kilogramy + $dekagramy + $funty) div $liczbaOwiec)"/>
					<xsl:value-of select="format-number($waga,'##.0')"/>
				</średnia_waga>
				<średnia_długość_runa jednostka="mm">
					<xsl:variable name="mm" select="sum(//długość_runa[@jednostka='mm'])"/>
					<xsl:variable name="cm" select="sum(//długość_runa[@jednostka='cm']) * 10"/>
					<xsl:variable name="cal" select="sum(//długość_runa[@jednostka='cal']) * 25.4"/>
					<xsl:variable name="dlugość" select="(($mm + $cm + $cal) div $liczbaOwiec)"/>
					<xsl:value-of select="format-number($dlugość,'##.0')"/>
				</średnia_długość_runa>
				<średnia_szybkość_marszu jednostka="ms">
					<xsl:variable name="ms" select="sum(//szybkość_marszu[@jednostka='ms'])"/>
					<xsl:variable name="kms" select="sum(//szybkość_marszu[@jednostka='kms']) * 1000"/>
					<xsl:variable name="kmh" select="sum(//szybkość_marszu[@jednostka='kmh']) * 0.28"/>
					<xsl:variable name="szybkośćMarszu" select="(($ms + $kms + $kmh) div $liczbaOwiec)"/>
					<xsl:value-of select="format-number($szybkośćMarszu,'##.0')"/>
				</średnia_szybkość_marszu>
				<średnia_szybkość_zjadania_trawy jednostka="talerzmin">
					<xsl:variable name="talerzmin" select="sum(//szybkość_zjadania_trawy[@jednostka='talerzmin'])"/>
					<xsl:variable name="miskamin" select="sum(//szybkość_zjadania_trawy[@jednostka='miskamin']) * 2"/>
					<xsl:variable name="wiadroh" select="sum(//szybkość_zjadania_trawy[@jednostka='wiadroh']) * 3"/>
					<xsl:variable name="szybkośćJedzenia" select="(($talerzmin + $miskamin + $wiadroh) div $liczbaOwiec)"/>
					<xsl:value-of select="format-number($szybkośćJedzenia,'##.0')"/>
				</średnia_szybkość_zjadania_trawy>
			</podsumowanie>

		</raport>
	</xsl:template>

</xsl:stylesheet>
