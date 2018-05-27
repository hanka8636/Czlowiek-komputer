<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:svg="http://www.w3.org/2000/svg" xmlns="http://www.w3.org/2000/svg" version="1.0"
    xmlns:xlink="http://www.w3.org/1999/xlink">

    <xsl:output method="xml" media-type="image/svg" encoding="utf-8"  doctype-public="-//W3C//DTD SVG 1.1//EN"
        doctype-system="http://www.w3.org/TR/2001/REC-SVG-20010904/DTD/svg10.dtd"/>

        <xsl:template match="/">
            <svg:svg width="800" height="600" font-family="Calibri">
                <svg:desc>Spis owiec</svg:desc>
                <svg:title><xsl:value-of select="raport"/></svg:title>
                <defs>
                    <linearGradient id="grad1" x1="0%" y1="0%" x2="0%" y2="100%">
                        <stop offset="0%" style="stop-color:rgb(0,120,220);stop-opacity:1" />
                        <stop offset="100%" style="stop-color:rgb(0,220,200);stop-opacity:1" />
                    </linearGradient>
                </defs>

                <svg:rect x="3" y="3" width="794" height="594" fill="url(#grad1)" stroke="black" stroke-width="3"/>

                <svg:text x="50%" y="30" font-size="18" fill="black" font-weight="bold" text-anchor="middle">
                    Spis owiec
                </svg:text>


                <script type="text/ecmascript">
                    <![CDATA[
                        function onMouseOverUmowy(evt) {
                            var numbers = document.getElementById("num");
                            numbers.setAttribute("visibility", "visible");
                        }]]>
                </script>

                <script type="text/ecmascript">
                    <![CDATA[
                        function onMouseOutUmowy(evt) {
                            var numbers = document.getElementById("num");
                            numbers.setAttribute("visibility", "hidden");

                        }]]>
                </script>

                <script type="text/ecmascript">
                    <![CDATA[
                        function onClickAutorzy(evt) {
                            var students = document.getElementById("students");
                            var visibility = students.getAttribute("visibility");
                            if(visibility==="visible"){
                                students.setAttribute("visibility", "hidden");
                            }else{
                                students.setAttribute("visibility", "visible");
                            }

                        }
                        ]]>
                </script>

                <style>
                    g.btn:hover
                    {
                        opacity:0.7;
                    }
                </style>

                <xsl:apply-templates/>
            </svg:svg>
        </xsl:template>


        <xsl:template match="autorzy" >
            <svg:g id="authors" class="btn" width="70" height="20" onclick="onClickAutorzy(evt)" cursor="pointer">
                <svg:rect x="18" y="559" width="70" height="20" fill="#927212" stroke="black"/>
                <svg:text x="25" y="574" fill="white" font-size="16" >Autorzy:</svg:text>
            </svg:g>
            <svg:g id="students" visibility="hidden">
                <svg:rect x="105" y="559" width="390" height="20" fill="#927212" stroke="black"/>
                <xsl:apply-templates/>
            </svg:g>
         </xsl:template>

         <xsl:template match="autor">
             <xsl:element name="svg:text">

                 <xsl:attribute name="fill">
                     <xsl:text>white</xsl:text>
                 </xsl:attribute>
                 <xsl:attribute name="font-size">
                     <xsl:text>16</xsl:text>
                 </xsl:attribute>
                  <svg:text x="25" y="574" fill="white" font-size="16" ><xsl:value-of select="raport//autor"/></svg:text>
             </xsl:element>
         </xsl:template>

         <xsl:template match="raport//podsumowanie//podsumowanie">
             <xsl:apply-templates/>
         </xsl:template>

         <xsl:template match="raport//podsumowanie//liczebność_samców">

             <svg:g id="rect" width="600" height="200" onmouseover="onMouseOverUmowy(evt)" onmouseout="onMouseOutUmowy(evt)">
                 <svg:rect x="100" y="50" width="600" height="200" fill="#927212" stroke="black"/>
             </svg:g>

             <svg:text x="50%" y="68" font-size="16" fill="white" font-weight="bold" text-anchor="middle">Plcie</svg:text>
             <svg:text x="115" y="240" font-size="16" fill="white" font-weight="bold">Samce </svg:text>
             <svg:text x="195" y="240" font-size="16" fill="white" font-weight="bold">Samica</svg:text>
             <svg:text x="615" y="240" font-size="16" fill="white" font-weight="bold">Wszystkie</svg:text>

             <svg:g id="num" visibility="hidden">
                 <xsl:element name="svg:text">
                     <xsl:attribute name="x">
                         <xsl:variable name="poz" select="0"/>
                         <xsl:value-of select="(125*$poz)+140"/>
                     </xsl:attribute>
                     <xsl:attribute name="y">
                         <xsl:variable name="ile" select="raport//podsumowanie//liczebność_samców"/>
                         <xsl:value-of select="220-$ile*5-15"/>
                     </xsl:attribute>
                     <xsl:attribute name="fill">
                         <xsl:text>white</xsl:text>
                     </xsl:attribute>
                     <xsl:attribute name="font-size">
                         <xsl:text>16</xsl:text>
                     </xsl:attribute>
                     <xsl:value-of select="raport//podsumowanie//liczebność_samców"/>
                 </xsl:element>
                 <xsl:element name="svg:text">
                     <xsl:attribute name="x">
                         <xsl:variable name="poz" select="1"/>
                         <xsl:value-of select="(125*$poz)+140"/>
                     </xsl:attribute>
                     <xsl:attribute name="y">
                         <xsl:variable name="ile" select="raport//podsumowanie//liczebność_samic"/>
                         <xsl:value-of select="220-$ile*5-15"/>
                     </xsl:attribute>
                     <xsl:attribute name="fill">
                         <xsl:text>white</xsl:text>
                     </xsl:attribute>
                     <xsl:attribute name="font-size">
                         <xsl:text>16</xsl:text>
                     </xsl:attribute>
                     <xsl:value-of select="raport//podsumowanie//liczebność_samic"/>
                 </xsl:element>
                 <xsl:element name="svg:text">
                     <xsl:attribute name="x">
                         <xsl:variable name="poz" select="2"/>
                         <xsl:value-of select="(125*$poz)+140"/>
                     </xsl:attribute>
                     <xsl:attribute name="y">
                         <xsl:variable name="ile" select="raport//podsumowanie//całkowita_liczba_owiec"/>
                         <xsl:value-of select="220-$ile*5-15"/>
                     </xsl:attribute>
                     <xsl:attribute name="fill">
                         <xsl:text>white</xsl:text>
                     </xsl:attribute>
                     <xsl:attribute name="font-size">
                         <xsl:text>16</xsl:text>
                     </xsl:attribute>
                     <xsl:value-of select="raport//podsumowanie//całkowita_liczba_owiec"/>
                 </xsl:element>
             </svg:g>
             <xsl:for-each select="*">
                 <xsl:element name="svg:rect">
                     <xsl:attribute name="x">
                             <xsl:variable name="poz" select="position()-1"/>
                             <xsl:value-of select="(125*$poz)+120"/>
                     </xsl:attribute>
                     <xsl:attribute name="width">
                         <xsl:text>50</xsl:text>
                     </xsl:attribute>
                     <xsl:attribute name="fill">
                         <xsl:text>#EBDCC8</xsl:text>
                     </xsl:attribute>
                     <xsl:variable name="ile" select="."/>
                     <svg:animate attributeName="y" from="220" to="{220-$ile*5}" dur="5s" fill="freeze"/>
                     <svg:animate attributeName="height" from="1" to="{$ile*5}" dur="5s" fill="freeze"/>
                 </xsl:element>
             </xsl:for-each>
         </xsl:template>


</xsl:stylesheet>
