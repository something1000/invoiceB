<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" version="1.0">
    <xsl:output encoding="UTF-16" indent="yes" method="xml" standalone="no" omit-xml-declaration="no"/>
    <xsl:template match="faktura">
        <fo:root language="PL"  font-family="Arial">
            <fo:layout-master-set>
                <fo:simple-page-master master-name="A4-landscape" page-height="210mm" page-width="297mm" margin-top="5mm" margin-bottom="5mm" margin-left="15mm" margin-right="15mm">
                    <fo:region-body margin-top="15mm" margin-bottom="20mm"/>
                    <fo:region-before region-name="xsl-region-before" extent="25mm" display-align="before" precedence="true"/>
                </fo:simple-page-master>
            </fo:layout-master-set>

            <fo:page-sequence master-reference="A4-landscape">
                <fo:static-content flow-name="xsl-region-before">
                    <fo:table table-layout="fixed" width="100%" font-size="8pt" display-align="center" space-after="5mm">
                        <fo:table-column column-width="proportional-column-width(70)"/>
                        <fo:table-column column-width="proportional-column-width(30)"/>
                        <fo:table-body font-size="95%">
                            <fo:table-row height="8mm">
                                <fo:table-cell>
                                    <fo:block> </fo:block>
                                </fo:table-cell>
                                <fo:table-cell>
                                    <fo:block linefeed-treatment="preserve" line-height="2mm" text-align="left">Załącznik do rozporządzenia Ministra Finansów
                                        &#xA;z dnia 19 grudnia 2011r.(poz.1717)</fo:block>
                                </fo:table-cell>
                            </fo:table-row>
                        </fo:table-body>
                    </fo:table>
                </fo:static-content>



                <fo:flow flow-name="xsl-region-body" border-collapse="collapse" reference-orientation="0">
                    <fo:block line-height="2mm" text-align="center" linefeed-treatment="preserve" space-after="0mm">
                            <fo:table table-layout="fixed" border="1" border-color="black" border-width="0.35mm" border-style="solid" width="100%" font-size="8pt" display-align="center" space-after="0mm">
                                <fo:table-column  column-width="proportional-column-width(45)"/>
                                <fo:table-column column-width="proportional-column-width(35)"/>
                                <fo:table-column column-width="proportional-column-width(20)"/>
                                <fo:table-body border-style="solid" border-width="0.35mm" font-size="95%">
                                    <fo:table-row height="8mm">
                                        <fo:table-cell border="solid 0.1mm black">
                                            <fo:block><xsl:value-of select="data"/>/..............</fo:block>
                                            <fo:block>Numer i data wystawienia faktury/listu przewozowego</fo:block>
                                        </fo:table-cell>
                                        <fo:table-cell border="solid 0.1mm black" background-color="lightgrey">
                                            <fo:block><fo:inline font-weight="bold">DOKUMENT DOSTAWY</fo:inline> &#xA; wyrobów węglowych
                                            </fo:block>
                                        </fo:table-cell>
                                        <fo:table-cell border="solid 0.1mm black">
                                            <fo:block> NR/No <xsl:value-of select="substring(data,7,4)"/>/<xsl:value-of select="numerWMiesiacu"/></fo:block>
                                        </fo:table-cell>
                                    </fo:table-row>
                                </fo:table-body>
                            </fo:table>

                       <fo:table table-layout="fixed" width="100%" font-size="10pt" border-color="black" border-width="0.35mm" border-style="solid" text-align="center" display-align="center" space-before="0mm">
                        <fo:table-column column-width="proportional-column-width(50)"/>
                        <fo:table-column column-width="proportional-column-width(50)"/>
                        <fo:table-body font-size="80%" text-align="left">
                            <fo:table-row  height="8mm">
                                <fo:table-cell border="solid 0.1mm black" padding-left="5mm">
                                    <fo:block line-height="2mm">
                                        1. Nazwa/ nazwisko i imię podmiotu, który wystawił dokument dostawy:&#xA;
                                        Usługi Przewozowe „Transport” Sławomir Hibner&#xA;
                                        2. Adres siedziby/ miejsca zamieszkania ww. podmiotu:&#xA;
                                        64-930 Szydłowo Skrzatusz ul. płk. Jerzego Kleina 5
                                    </fo:block>
                                </fo:table-cell>
                                <fo:table-cell border="solid 0.1mm black" padding-left="5mm">
                                    <fo:block line-height="2mm">
                                        9. Podmiot odbierający/ zwracający wyroby węglowe:&#xA;
                                        <fo:block font-weight="bold"><xsl:value-of select="customer/name"/><xsl:text> </xsl:text><xsl:value-of select="customer/surname"/></fo:block>&#xA;
                                        10. Adres siedziby/ miejsca zamieszkania ww. podmiotu:&#xA;
                                        <fo:block font-weight="bold" white-space="pre">
                                           <fo:block><xsl:value-of select="customer/postCode"/>, <xsl:value-of select="customer/city"/><xsl:text> </xsl:text> <xsl:value-of select="customer/street"/></fo:block>
                                        </fo:block>&#xA;
                                    </fo:block>
                                </fo:table-cell>
                            </fo:table-row>
                            <fo:table-row  height="8mm">
                                <fo:table-cell border="solid 0.1mm black" padding-left="5mm">
                                    <fo:block line-height="2mm">
                                        3. Nazwa/ nazwisko i imię podmiotu, który wydaje  do przemieszczenia wyroby węglowe: &#xA;
                                        Usługi Przewozowe „Transport” Sławomir Hibner&#xA;
                                        4. Adres siedziby/ miejsca zamieszkania ww. podmiotu: &#xA;
                                        64-930 Szydłowo Skrzatusz ul. płk. Jerzego Kleina 5&#xA;
                                    </fo:block>
                                </fo:table-cell>
                                <fo:table-cell border="solid 0.1mm black" padding-left="5mm">
                                    <fo:block line-height="2mm">
                                        11.  Adres miejsca odbioru wyrobów węglowych:&#xA;
                                            Skrzatusz ul.płk. Jerzego Kleina, 64-930 Szydłowo&#xA;
                                    </fo:block>
                                    <fo:block  border-top="solid 0.3mm black">
                                        12. Data odbioru wyrobów węglowych: <xsl:value-of select="data"/>
                                    </fo:block>
                                </fo:table-cell>
                            </fo:table-row>
                            <fo:table-row  height="8mm">
                                <fo:table-cell border="solid 0.1mm black" padding-left="5mm">
                                    <fo:block line-height="2mm">
                                        5. Adres miejsca wydania do przemieszczenia wyrobów węglowych:&#xA;
                                            64-930 Szydłowo Skrzatusz ul. płk. Jerzego Kleina 5

                                        6. Data rozpoczęcia przemieszczenia wyrobów węglowych: &#xA;
                                        <fo:block><xsl:value-of select="data"/></fo:block>
                                    </fo:block>
                                </fo:table-cell>
                                <fo:table-cell border="solid 0.1mm black" padding-left="5mm">
                                    <fo:block line-height="2mm">
                                        13. Potwierdzam zwrot wyrobów wymienionych w polu 15:&#xA;
                                        &#xA;&#xA;
                                        Data i podpis podmiotu zwracającego lub osoby reprezentującej podmiot zwracający
                                        &#xA;
                                    </fo:block>
                                </fo:table-cell>
                            </fo:table-row>
                            <fo:table-row  height="8mm">
                                <fo:table-cell border="solid 0.1mm black" padding-left="5mm">
                                    <fo:block line-height="2mm">
                                        7. Data i podpis podmiotu, który wystawił dokument dostawy, lub osoby reprezentującej ten podmiot:
                                        &#xA;
                                        <fo:block><xsl:value-of select="data"/></fo:block>
                                    </fo:block>
                                    <fo:block>
                                        8. Data i podpis podmiotu, który wydał wyroby węglowe do przemieszczenia, lub osoby reprezentującej ten podmiot:
                                        &#xA;
                                        <fo:block><xsl:value-of select="data"/></fo:block>
                                    </fo:block>
                                </fo:table-cell>
                                <fo:table-cell border="solid 0.1mm black" padding-left="5mm">
                                    <fo:block line-height="3mm">
                                        14. Potwierdzam odbiór / dostarczenie do odbiorcy poza terytorium kraju wyrobów wymienionych w polu 15:&#xA;
                                        &#xA;
                                        <fo:block><xsl:value-of select="data"/>....................................................................................................................&#xA;</fo:block>

                                       <fo:block text-align="center">
                                           Data i podpis podmiotu odbierającego / dostarczającego lub osoby reprezentującej podmiot odbierający/ dostarczający
                                       </fo:block>
                                        &#xA;


                                        &#xA;
                                    </fo:block>
                                </fo:table-cell>
                            </fo:table-row>

                              <!--  <fo:table-row>
                                    <fo:table-cell>
                                        <fo:block>
                                            <xsl:value-of select="name"/>
                                        </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell>
                                        <fo:block>
                                            <xsl:value-of select="surname"/>
                                        </fo:block>
                                    </fo:table-cell>
                                </fo:table-row> -->
                        </fo:table-body>
                    </fo:table>

                    <fo:table table-layout="fixed" width="100%" font-size="10pt" border-color="black" border-width="0.35mm" border-style="solid" text-align="center" display-align="center" space-before="5mm">
                        <fo:table-column column-width="proportional-column-width(5)"/>
                        <fo:table-column column-width="proportional-column-width(15)"/>
                        <fo:table-column column-width="proportional-column-width(10)"/>
                        <fo:table-column column-width="proportional-column-width(10)"/>
                        <fo:table-column column-width="proportional-column-width(30)"/>
                        <fo:table-column column-width="proportional-column-width(30)"/>
                        <fo:table-body font-size="80%" text-align="left">
                            <fo:table-row  height="8mm">
                                <fo:table-cell text-align="center" border="solid 0.1mm black" padding-left="5mm" number-columns-spanned="6">
                                    <fo:block>15. PRZEMIESZCZANE WYROBY WĘGLOWE ZWOLNIONE OD AKCYZY</fo:block>
                                </fo:table-cell>
                            </fo:table-row>
                            <fo:table-row  height="6mm">
                                <fo:table-cell text-align="center" border="solid 0.1mm black">
                                    <fo:block>Lp.</fo:block>
                                </fo:table-cell>
                                <fo:table-cell text-align="center" border="solid 0.1mm black">
                                    <fo:block>Nazwa wyrobu węglowego</fo:block>
                                </fo:table-cell>
                                <fo:table-cell text-align="center" border="solid 0.1mm black">
                                    <fo:block>Kod CN wyrob</fo:block>
                                </fo:table-cell>
                                <fo:table-cell text-align="center" border="solid 0.1mm black">
                                    <fo:block>Ilość w 1000kg</fo:block>
                                </fo:table-cell>
                                <fo:table-cell text-align="center" border="solid 0.1mm black">
                                    <fo:block>Przeznaczenie uprawniające do zwolnienia (krótki opis i podstawa prawna)</fo:block>
                                </fo:table-cell>
                                <fo:table-cell text-align="center" border="solid 0.1mm black">
                                    <fo:block>Adnotacje dotyczące odbioru wyrobów węglowych</fo:block>
                                </fo:table-cell>
                            </fo:table-row>
                            <fo:table-row  height="3mm">
                                <fo:table-cell text-align="center" border="solid 0.1mm black">
                                    <fo:block>1</fo:block>
                                </fo:table-cell>
                                <fo:table-cell text-align="center" border="solid 0.1mm black">
                                    <fo:block>2</fo:block>
                                </fo:table-cell>
                                <fo:table-cell text-align="center" border="solid 0.1mm black">
                                    <fo:block>3</fo:block>
                                </fo:table-cell>
                                <fo:table-cell text-align="center" border="solid 0.1mm black">
                                    <fo:block>4</fo:block>
                                </fo:table-cell>
                                <fo:table-cell text-align="center" border="solid 0.1mm black">
                                    <fo:block>5</fo:block>
                                </fo:table-cell>
                                <fo:table-cell text-align="center" border="solid 0.1mm black">
                                    <fo:block>6</fo:block>
                                </fo:table-cell>
                            </fo:table-row>


                            <fo:table-row  height="8mm">
                                <fo:table-cell text-align="center" border="solid 0.1mm black">
                                    <fo:block>1</fo:block>
                                </fo:table-cell>
                                <fo:table-cell text-align="center" border="solid 0.1mm black">
                                    <fo:block><xsl:value-of select="nazwa"/></fo:block>
                                </fo:table-cell>
                                <fo:table-cell text-align="center" border="solid 0.1mm black">
                                    <fo:block><xsl:value-of select="kod"/></fo:block>
                                </fo:table-cell>
                                <fo:table-cell text-align="center" border="solid 0.1mm black">
                                    <fo:block><xsl:value-of select="ilosc"/><xsl:text>kg</xsl:text></fo:block>
                                </fo:table-cell>
                                <fo:table-cell text-align="center" border="solid 0.1mm black">
                                    <fo:block><xsl:value-of select="przeznaczenie"/></fo:block>

                                </fo:table-cell>
                                <fo:table-cell text-align="center" border="solid 0.1mm black">
                                    <fo:block> </fo:block>
                                </fo:table-cell>
                            </fo:table-row>

                        </fo:table-body>
                    </fo:table>

                    </fo:block>
                    <fo:block font-size="6pt" linefeed-treatment="preserve" space-before="5mm">
                        <fo:block>1 Wypełnia się, jeżeli sprzedaż wyrobów węglowych, a w przypadku importu lub nabycia wewnątrzwspólnotowego ich nabycie, są potwierdzone fakturą. W przypadku gdy faktura zgodnie z odrębnymi przepisami wystawiana jest w terminie późniejszym niż wydanie wyrobów węglowych, wpisuje się numer i datę wystawienia listu przewozowego, o którym mowa w regulacjach krajowych lub umowach międzynarodowych.</fo:block>
                        <fo:block> 2 Odpowiednio: pośredniczący podmiot węglowy lub podmiot zwolniony, o którym mowa w art. 31a ust. 2 ustawy z dnia 6 grudnia 2008r. o podatku akcyzowym (Dz.U. z 2011 r. Nr 108, poz. 626, Nr 120, poz. 690, Nr 171, poz. 1016, Nr 205, poz. 1208, Nr 232, poz. 1378 i Nr 291, poz. 1707).</fo:block>
                    <fo:block>3 Odpowiednio: pośredniczący podmiot węglowy lub podmiot zwolniony, o którym mowa w art. 31a ust. 2 ustawy z dni 6 grudnia 2008 r. o podatku akcyzowym, do którego są dostarczane albo który zwraca wyroby zwolnione.</fo:block>
                    <fo:block> 4 Podmiot, który wydaje wyroby węglowe do przemieszczenia. W przypadku gdy podmiotem wydającym wyroby węglowe jest podmiot wystawiający dokument dostawy, należy wpisać nazwę, nazwisko i imię oraz adres podmiotu wymienionego w pkt 1 i 2.</fo:block>
                    <fo:block>  5 Adres miejsca, w którym następuje odbiór wyrobów węglowych przez pośredniczący podmiot węglowy lub podmiot zwolniony, o którym mowa w art. 31a ust. 2 ustawy z dnia 6 grudnia 2008 r, o podatku akcyzowym.</fo:block>
                    <fo:block>  6  W przypadku, o którym mowa w § 2 ust. 6e, należy podać okres przemieszczania wyrobów węglowych wymienionych w dokumencie dostawy</fo:block>
                    <fo:block>  7 Wypełnia pośredniczący podmiot węglowy, który wystawił dokument dostawy. W przypadku niewypełnienia przez ten podmiot wypełnia pośredniczący podmiot węglowy, który wydał wyroby węglowe do przemieszczania.</fo:block>
                    <fo:block>  8 Wypełnia podmiot wymieniony w pkt 9, wyłącznie w przypadku zwrotu wyrobów do pośredniczącego podmiotu węglowego.</fo:block>
                    <fo:block>  9  W przypadku zwrotu wyrobów węglowych do pośredniczącego podmiotu węglowego należy wpisać „zwrot wyrobów węglowych”.</fo:block>
                    <fo:block>  10 W przypadku niedostarczenia wyrobów węglowych do podmiotu odbierającego należy wpisać ich ilość, przyczynę oraz datę powrotnego dostarczenia do pośredniczącego podmiotu węglowego</fo:block>

                    </fo:block>
                </fo:flow>
            </fo:page-sequence>
        </fo:root>
    </xsl:template>
</xsl:stylesheet>