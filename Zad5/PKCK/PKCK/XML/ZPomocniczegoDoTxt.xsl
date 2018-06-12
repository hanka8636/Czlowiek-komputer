<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="text"  encoding="UTF-8" />

  <xsl:template match="/">
	<xsl:call-template name="tytul"/>
	<xsl:call-template name="autorzy"/>
  <xsl:call-template name="spis"/>
	<xsl:call-template name="podsumowanie"/>
	</xsl:template>

  <xsl:variable name="hash" select="'# # # # #'" />
	<xsl:variable name="spacje" select="'                                               '" />

  <xsl:template name="tytul">
    <xsl:value-of select="concat($hash, //tytul, '(', //data_wygenerowania, ')', $hash)"/>
    <xsl:text>&#xA;</xsl:text>
    <xsl:text>&#xA;</xsl:text>
  </xsl:template>

  <xsl:template name="autorzy">
    <xsl:value-of select="concat($hash, ' Autorzy ', $hash)"/>
    <xsl:text>&#xA;</xsl:text>
    <xsl:value-of select="//autor[1]"/>
    <xsl:text>&#xA;</xsl:text>
    <xsl:value-of select="//autor[2]"/>
    <xsl:text>&#xA;</xsl:text>
    <xsl:text>&#xA;</xsl:text>
  </xsl:template>

	<xsl:template name="spis">
		<xsl:call-template name="rasy"/>
		<xsl:call-template name="owce"/>
		<xsl:call-template name="pastwiska"/>
	</xsl:template>

	<xsl:template name="rasy">
		<xsl:value-of select="concat($hash, ' Rasy ', $hash)"/>
		<xsl:text>&#xA;</xsl:text>
		<xsl:value-of select="concat('Nazwa rasy                                  |', 'Pastwisko                  |', 'L.owiec|','Średnia waga[kg]|', 'Średnia długość runa[mm]|', 'Średnia szybkość marszu[m/s]|', 'Średnia szybkość zjadania trawy[talerz/min]')"/>
		<xsl:text>&#xA;</xsl:text>
		<xsl:value-of select="concat('--------------------------------------------|', '---------------------------|', '-------|','----------------|', '------------------------|', '----------------------------|', '-------------------------------------------')"/>
		<xsl:text>&#xA;</xsl:text>
    <xsl:for-each select="//rasa_owiec">
			<xsl:value-of select="concat(@nazwa, substring($spacje,0,45 - string-length(@nazwa)), '|', ./pastwisko/@nazwa, substring($spacje,0,28 - string-length(./pastwisko/@nazwa)), '|', ./liczba_owiec, substring($spacje,0,8 - string-length(./liczba_owiec)), '|', ./średnia_waga, substring($spacje,0,17 - string-length(./średnia_waga)), '|', ./średnia_długość_runa, substring($spacje,0,25 - string-length(./średnia_długość_runa)), '|', ./średnia_szybkość_marszu, substring($spacje,0,29 - string-length(./średnia_szybkość_marszu)), '|', ./średnia_szybkość_zjadania_trawy, substring($spacje,0,44 - string-length(./średnia_szybkość_zjadania_trawy)))"/>
			<xsl:text>&#xA;</xsl:text>
		</xsl:for-each>
		<xsl:text>&#xA;</xsl:text>
		<xsl:text>&#xA;</xsl:text>
	</xsl:template>

	<xsl:template name="owce">
		<xsl:value-of select="concat($hash, ' Owce ', $hash)"/>
		<xsl:text>&#xA;</xsl:text>
		<xsl:value-of select="concat('Imię          |', 'Data urodzenia |', 'Płeć     |','Waga[kg]|', 'Długość runa[mm]|', 'Szybkość marszu[m/s]|', 'Szybkość zjadania trawy[talerz/min]|', 'Opis                                                        ')"/>
		<xsl:text>&#xA;</xsl:text>
		<xsl:value-of select="concat('--------------|', '---------------|', '---------|','--------|', '----------------|', '--------------------|', '-----------------------------------|', '------------------------------------------------------------')"/>
		<xsl:text>&#xA;</xsl:text>
		<xsl:for-each select="//owca">
			<xsl:sort select="./imię" />
			<xsl:value-of select="concat(./imię, substring($spacje,0,15 - string-length(./imię)), '|', ./data_urodzenia, substring($spacje,0,16 - string-length(./data_urodzenia)), '|', ./płeć, substring($spacje,0,10 - string-length(./płeć)), '|', ./waga, substring($spacje,0,9 - string-length(./waga)), '|', ./długość_runa, substring($spacje,0,17 - string-length(./długość_runa)), '|', ./szybkość_marszu, substring($spacje,0,21 - string-length(./szybkość_marszu)), '|', ./szybkość_zjadania_trawy, substring($spacje,0,36 - string-length(./szybkość_zjadania_trawy)), '|', substring-before(substring(./opis,14), '.'))"/>
			<xsl:text>&#xA;</xsl:text>
		</xsl:for-each>
		<xsl:text>&#xA;</xsl:text>
		<xsl:text>&#xA;</xsl:text>
	</xsl:template>

	<xsl:template name="pastwiska">
		<xsl:value-of select="concat($hash, ' Pastwiska ', $hash)"/>
		<xsl:text>&#xA;</xsl:text>
		<xsl:value-of select="concat('Nazwa pastwiska            |', 'Powierzchnia[ar]')"/>
		<xsl:text>&#xA;</xsl:text>
		<xsl:value-of select="concat('---------------------------|', '----------------')"/>
		<xsl:text>&#xA;</xsl:text>
		<xsl:for-each select="//pastwisko">
			<xsl:sort select="@nazwa" />
			<xsl:value-of select="concat(@nazwa, substring($spacje,0,28 - string-length(@nazwa)), '|', ./powierzchnia, substring($spacje,0,17 - string-length(./powierzchnia)))"/>
			<xsl:text>&#xA;</xsl:text>
		</xsl:for-each>
		<xsl:text>&#xA;</xsl:text>
		<xsl:text>&#xA;</xsl:text>
	</xsl:template>

	<xsl:template name="podsumowanie">
		<xsl:value-of select="concat($hash, ' Podsumowanie ', $hash)"/>
		<xsl:text>&#xA;</xsl:text>
		<xsl:value-of select="concat('Kategoria                       |', 'Wartość')"/>
		<xsl:text>&#xA;</xsl:text>
		<xsl:value-of select="concat('--------------------------------|', '-------')"/>
		<xsl:text>&#xA;</xsl:text>
		<xsl:value-of select="concat('Całkowita liczba owiec          |', //całkowita_liczba_owiec, substring($spacje,0,8 - string-length(//całkowita_liczba_owiec)))"/>
		<xsl:text>&#xA;</xsl:text>
		<xsl:value-of select="concat('Liczebność samców               |', //liczebność_samców, substring($spacje,0,8 - string-length(//liczebność_samców)))"/>
		<xsl:text>&#xA;</xsl:text>
		<xsl:value-of select="concat('Liczebność samic                |', //liczebność_samic, substring($spacje,0,8 - string-length(//liczebność_samic)))"/>
		<xsl:text>&#xA;</xsl:text>
		<xsl:value-of select="concat('Całkowita liczba ras            |', //całkowita_liczba_ras, substring($spacje,0,8 - string-length(//całkowita_liczba_ras)))"/>
		<xsl:text>&#xA;</xsl:text>
		<xsl:value-of select="concat('Całkowita liczba pastwisk       |', //całkowita_liczba_pastwisk, substring($spacje,0,8 - string-length(//całkowita_liczba_pastwisk)))"/>
		<xsl:text>&#xA;</xsl:text>
		<xsl:value-of select="concat('Całkowita powierzchnia pastwisk |', //całkowita_powierzchnia_pastwisk, substring($spacje,0,8 - string-length(//całkowita_powierzchnia_pastwisk)))"/>
		<xsl:text>&#xA;</xsl:text>
		<xsl:value-of select="concat('Średnia waga                    |', //średnia_waga, substring($spacje,0,8 - string-length(//średnia_waga)))"/>
		<xsl:text>&#xA;</xsl:text>
		<xsl:value-of select="concat('Średnia długość runa            |', //średnia_długość_runa, substring($spacje,0,8 - string-length(//średnia_długość_runa)))"/>
		<xsl:text>&#xA;</xsl:text>
		<xsl:value-of select="concat('Średnia szybkość marszu         |', //średnia_szybkość_marszu, substring($spacje,0,8 - string-length(//średnia_szybkość_marszu)))"/>
		<xsl:text>&#xA;</xsl:text>
		<xsl:value-of select="concat('Średnia szybkość zjadania trawy |', //średnia_szybkość_zjadania_trawy, substring($spacje,0,8 - string-length(//średnia_szybkość_zjadania_trawy)))"/>
	</xsl:template>

</xsl:stylesheet>
