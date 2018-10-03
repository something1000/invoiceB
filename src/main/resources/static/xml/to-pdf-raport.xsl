<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"  xmlns:xs="http://www.w3.org/2001/XMLSchema"  xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:fn="http://www.w3.org/2005/xpath-functions" version="1.0">
    <xsl:output encoding="UTF-16" indent="yes" method="xml" standalone="no" omit-xml-declaration="no"/>
    <xsl:template match="root">
        <fo:root language="PL"  font-family="Arial">
            <fo:layout-master-set>
                <fo:simple-page-master master-name="A4-landscape" page-height="210mm" page-width="297mm" margin-top="5mm" margin-bottom="5mm" margin-left="15mm" margin-right="15mm">
                    <fo:region-body margin-top="5mm" margin-bottom="20mm"/>
                   </fo:simple-page-master>
            </fo:layout-master-set>

            <fo:page-sequence master-reference="A4-landscape">
                <fo:flow flow-name="xsl-region-body" border-collapse="collapse" reference-orientation="0">
                    <fo:block line-height="4mm" text-align="center" linefeed-treatment="preserve" space-after="3mm">

                        <fo:table table-layout="fixed" width="100%" font-size="10pt" display-align="center" space-after="5mm" space-before="5mm">
                            <fo:table-column column-width="proportional-column-width(40)"/>
                            <fo:table-column column-width="proportional-column-width(20)"/>
                            <fo:table-column column-width="proportional-column-width(40)"/>
                            <fo:table-body font-size="100%">
                                <fo:table-row>
                                    <fo:table-cell border="solid 0.2mm black" padding-left="5mm" space-after="5mm">
                                        <fo:block linefeed-treatment="preserve">Usługi Przewozowe "TRANSPORT"
                                            Sławomir Hibner 64-930 Skrzatusz ul. płk. Jerzego Kleina 5
                                            Nip: 765 122 22 77
                                        </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell>
                                        <fo:block> </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="solid 0.2mm black" padding-left="5mm">
                                        <fo:block linefeed-treatment="preserve" text-align="left">Zestawienie dokumentu dostawy
                                            wyrobów węglowych
                                            Za miesiąc <xsl:value-of select="month"/><xsl:text> </xsl:text><xsl:value-of select="substring(date,4,8)"/>
                                            Data sporządzenia:<xsl:value-of select="date"/></fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                            </fo:table-body>
                        </fo:table>


                            <fo:table table-layout="fixed" border="1" border-color="black" border-width="0.35mm" border-style="solid" width="100%" font-size="8pt" display-align="center" space-after="0mm">
                                <fo:table-column column-width="proportional-column-width(8)"/>
                                <fo:table-column column-width="proportional-column-width(8)"/>
                                <fo:table-column column-width="proportional-column-width(8)"/>
                                <fo:table-column column-width="proportional-column-width(8)"/>
                                <fo:table-column column-width="proportional-column-width(8)"/>
                                <fo:table-column column-width="proportional-column-width(15)"/>

                                <fo:table-column column-width="proportional-column-width(25)"/>
                                <fo:table-column column-width="proportional-column-width(15)"/>
                                <fo:table-column column-width="proportional-column-width(15)"/>

                                <fo:table-body border-style="solid" border-width="0.35mm" font-size="95%">
                                    <fo:table-row height="8mm">
                                        <fo:table-cell border="solid 0.3mm black">
                                            <fo:block>Lp.</fo:block>
                                        </fo:table-cell>
                                        <fo:table-cell border="solid 0.3mm black">
                                            <fo:block>Data </fo:block>
                                        </fo:table-cell>
                                        <fo:table-cell border="solid 0.3mm black">
                                            <fo:block>Nr. Dok.</fo:block>
                                        </fo:table-cell>
                                        <fo:table-cell border="solid 0.3mm black">
                                            <fo:block>Nr. Dok. Dost.</fo:block>
                                        </fo:table-cell>
                                        <fo:table-cell border="solid 0.3mm black">
                                            <fo:block>Ilość (tona)</fo:block>
                                        </fo:table-cell>
                                        <fo:table-cell border="solid 0.3mm black">
                                            <fo:block>Kod CN</fo:block>
                                        </fo:table-cell>
                                        <fo:table-cell border="solid 0.3mm black">
                                            <fo:block>Uwagi</fo:block>
                                        </fo:table-cell>
                                        <fo:table-cell border="solid 0.3mm black">
                                            <fo:block>Adres</fo:block>
                                        </fo:table-cell>
                                        <fo:table-cell border="solid 0.3mm black">
                                            <fo:block>Kontrahent</fo:block>
                                        </fo:table-cell>
                                    </fo:table-row>
                                    <fo:table-row height="4mm">
                                        <fo:table-cell border="solid 0.3mm black">
                                            <fo:block>1</fo:block>
                                        </fo:table-cell>
                                        <fo:table-cell border="solid 0.3mm black">
                                            <fo:block>2</fo:block>
                                        </fo:table-cell>
                                        <fo:table-cell border="solid 0.3mm black">
                                            <fo:block>3</fo:block>
                                        </fo:table-cell>
                                        <fo:table-cell border="solid 0.3mm black">
                                            <fo:block>4</fo:block>
                                        </fo:table-cell>
                                        <fo:table-cell border="solid 0.3mm black">
                                            <fo:block>5</fo:block>
                                        </fo:table-cell>
                                        <fo:table-cell border="solid 0.3mm black">
                                            <fo:block>6</fo:block>
                                        </fo:table-cell>
                                        <fo:table-cell border="solid 0.3mm black">
                                            <fo:block>7</fo:block>
                                        </fo:table-cell>
                                        <fo:table-cell border="solid 0.3mm black">
                                            <fo:block>8</fo:block>
                                        </fo:table-cell>
                                        <fo:table-cell border="solid 0.3mm black">
                                            <fo:block>9</fo:block>
                                        </fo:table-cell>
                                    </fo:table-row>
                                    <xsl:for-each select="lista">
                                        <fo:table-row height="4mm">
                                            <fo:table-cell border-left="solid 0.3mm black">
                                                <fo:block><xsl:value-of select="numerWMiesiacu"/></fo:block>
                                            </fo:table-cell>
                                            <fo:table-cell border-left="solid 0.3mm black">
                                                <fo:block><xsl:value-of select="data"/></fo:block>
                                            </fo:table-cell>
                                            <fo:table-cell border-left="solid 0.3mm black">
                                                <fo:block>
                                                    <xsl:variable name="year" select="data"/>
                                                    <xsl:value-of select="numerWMiesiacu"/><xsl:text>/</xsl:text><xsl:value-of select="substring($year,7,11)"/>
                                                </fo:block>

                                            </fo:table-cell>
                                            <fo:table-cell border-left="solid 0.3mm black">
                                                <fo:block>
                                                    <xsl:variable name="year" select="data"/>
                                                    <xsl:value-of select="numerWMiesiacu"/><xsl:text>/</xsl:text><xsl:value-of select="substring($year,7,11)"/>
                                                </fo:block>
                                            </fo:table-cell>
                                            <fo:table-cell border-left="solid 0.3mm black">
                                                <fo:block><xsl:value-of select="ilosc"/><xsl:text>kg</xsl:text></fo:block>
                                            </fo:table-cell>
                                            <fo:table-cell border-left="solid 0.3mm black">
                                                <fo:block><xsl:value-of select="kod"/></fo:block>
                                            </fo:table-cell>
                                            <fo:table-cell border-left="solid 0.3mm black">
                                                <fo:block><xsl:value-of select="przeznaczenie"/></fo:block>
                                            </fo:table-cell>

                                            <fo:table-cell border-left="solid 0.3mm black">
                                                <fo:block><xsl:value-of select="customer/city"/><xsl:text> </xsl:text> <xsl:value-of select="customer/street"/></fo:block>
                                            </fo:table-cell>

                                            <fo:table-cell border-left="solid 0.3mm black">
                                                <fo:block>
                                                    <xsl:value-of select="customer/name"/> <xsl:text> </xsl:text><xsl:value-of select="customer/surname"/></fo:block>
                                            </fo:table-cell>
                                        </fo:table-row>
                                    </xsl:for-each>

                                    <fo:table-row height="4mm" border-top="solid 0.5mm black">
                                        <fo:table-cell border-left="solid 0.3mm black"><fo:block>RAZEM</fo:block></fo:table-cell>
                                        <fo:table-cell border-left="solid 0.3mm black"><fo:block/></fo:table-cell>
                                        <fo:table-cell border-left="solid 0.3mm black"><fo:block/></fo:table-cell>
                                        <fo:table-cell border-left="solid 0.3mm black"><fo:block/></fo:table-cell>
                                        <fo:table-cell border-left="solid 0.3mm black"><fo:block><xsl:value-of select="razem"/><xsl:text> kg</xsl:text></fo:block></fo:table-cell>
                                        <fo:table-cell border-left="solid 0.3mm black"><fo:block/></fo:table-cell>
                                        <fo:table-cell border-left="solid 0.3mm black"><fo:block/></fo:table-cell>
                                        <fo:table-cell border-left="solid 0.3mm black"><fo:block/></fo:table-cell>
                                        <fo:table-cell border-left="solid 0.3mm black"><fo:block/></fo:table-cell>
                                    </fo:table-row>

                                </fo:table-body>
                            </fo:table>
                    </fo:block>

                </fo:flow>
            </fo:page-sequence>


        </fo:root>
    </xsl:template>
</xsl:stylesheet>