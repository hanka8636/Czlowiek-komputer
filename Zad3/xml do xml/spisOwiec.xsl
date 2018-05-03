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
									</owca>
								</xsl:for-each>
							</pastwisko>
							<xsl:variable name="liczbaOwiec" select="count(../owca)"/>
							<liczba_owiec>
								<xsl:value-of select="$liczbaOwiec"/>
							</liczba_owiec>
							<średnia_waga>
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
