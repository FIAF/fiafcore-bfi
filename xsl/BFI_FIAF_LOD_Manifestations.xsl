<?xml version="1.0" encoding="UTF-8"?>

<!-- BFI XML Manifestation data to FIAFcore -->
<!-- Paul Duchesne -->

<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
    xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#"
    xmlns:fiaf="https://ontology.fiafcore.org/">

    <xsl:output method="xml" indent="yes" />

    <!-- Manifestations -->

    <xsl:template match="/">
        <rdf:RDF>
            <xsl:for-each select="record">
                <rdf:Description rdf:about="bfi://resource/manifestation/{@priref}">

                    <!-- Temp until we assess manifestation-type situation. -->

                    <rdf:type rdf:resource="bfi://ontology/manifestation" />


                    <!-- <xsl:choose>
                        <xsl:when test="manifestationlevel_type/value[@lang='0']">
                            <xsl:variable name="manifest_type" select="translate(manifestationlevel_type/value[@lang='0'], ' ', '')"/>
                            <rdf:type rdf:resource="bfi://ontology/manifestation/{$manifest_type}" />
                        </xsl:when>
                        <xsl:otherwise>
                            <rdf:type rdf:resource="bfi://ontology/manifestation" />
                        </xsl:otherwise>
                    </xsl:choose> -->

                    <!-- fiaf:hasColourCharacteristic -->

                    <xsl:variable name="colour_manifestation" select="translate(colour_manifestation/value[@lang='0'][normalize-space(.)], ' ', '_')"/>
                    <fiaf:hasColourCharacteristic>
                    <rdf:Description>
                        <xsl:choose>
                            <xsl:when test="$colour_manifestation = 'Colour'">
                                <rdf:type rdf:resource="bfi://ontology/colourcharacteristic/Colour"/>
                            </xsl:when>
                            <xsl:when test="$colour_manifestation = 'Black_and_White'">
                                <rdf:type rdf:resource="bfi://ontology/colourcharacteristic/BlackAndWhite"/>
                            </xsl:when>
                            <xsl:when test="$colour_manifestation = 'Colour_and_Black_and_White '">
                                <rdf:type rdf:resource="bfi://ontology/colourcharacteristic/Colour"/>
                                <rdf:type rdf:resource="bfi://ontology/colourcharacteristic/BlackAndWhite"/>
                            </xsl:when>
                            <xsl:otherwise/>
                        </xsl:choose>
                        <xsl:variable name="colour_standard1" select="translate(colour_code_manifestation[normalize-space(.)], ' ', '_')"/>
                        <xsl:variable name="colour_standard" select="translate($colour_standard1, '&amp;', '')" />
                            <xsl:choose>
                                <xsl:when test="$colour_standard = ''"/>
                                <xsl:when test="$colour_standard = 'Avala_Color'"/>
                                <xsl:when test="$colour_standard = 'CFI_Color'"/>
                                <xsl:when test="$colour_standard = 'Movielabcolor'"/>
                                <xsl:when test="$colour_standard = 'Rankcolor'"/>
                                <xsl:when test="$colour_standard = 'Foto-Kem'"/>
                                <xsl:when test="$colour_standard = 'Warnercolor'"/>
                                <xsl:when test="$colour_standard = 'Sovcolor'"/>
                                <xsl:when test="$colour_standard = 'Pathécolor'"/>
                                <xsl:when test="$colour_standard = 'TVC_Color'"/>
                                <xsl:when test="$colour_standard = 'Trucolor'"/>
                                <xsl:when test="$colour_standard = 'Cinecolor'"/>
                                <xsl:when test="$colour_standard = 'Film_House_color'"/>
                                <xsl:when test="$colour_standard = 'Cinefotocolor'"/>
                                <xsl:when test="$colour_standard = 'Atlab_Color'"/>
                                <xsl:when test="$colour_standard = 'Telecolor'"/>
                                <xsl:when test="$colour_standard = 'Gevacolour'"/>
                                <xsl:when test="$colour_standard = 'Astro_colour'"/>
                                <xsl:when test="$colour_standard = 'Ferraniacolor'"/>
                                <xsl:when test="$colour_standard = 'Panavision_Color'"/>
                                <xsl:when test="$colour_standard = 'Alpha_Cine_Color'"/>
                                <xsl:when test="$colour_standard = 'Kodacolor'"/>
                                <xsl:when test="$colour_standard = 'MGM_Color'"/>
                                <xsl:when test="$colour_standard = 'Eclair_Color'"/>
                                <xsl:when test="$colour_standard = 'Anscocolor'"/>
                                <xsl:when test="$colour_standard = 'Kodachrome'"/>
                                <xsl:when test="$colour_standard = 'Medallioncolor'"/>
                                <xsl:when test="$colour_standard = 'Scope_Colour'"/>
                                <xsl:when test="$colour_standard = 'Cinecittà_Color'"/>
                                <xsl:when test="$colour_standard = 'United_Color'"/>
                                <xsl:when test="$colour_standard = 'Consolidated_Film_Industries'"/>
                                <xsl:when test="$colour_standard = 'Supercinecolor'"/>
                                <xsl:when test="$colour_standard = 'Monaco_colour'"/>
                                <xsl:when test="$colour_standard = 'Daieicolor'"/>
                                <xsl:when test="$colour_standard = 'Ektachrome'"/>
                                <xsl:when test="$colour_standard = 'Cinevexcolour'"/>
                                <xsl:when test="$colour_standard = 'Prizma_Color'"/>
                                <xsl:when test="$colour_standard = 'Kinemacolour'"/>
                                <xsl:when test="$colour_standard = 'Luciano_Vittori_colour'"/>
                                <xsl:when test="$colour_standard = 'Dufay'"/>
                                <xsl:when test="$colour_standard = 'Image_Transform'"/>
                                <xsl:when test="$colour_standard = 'Cinefilm_Color'"/>
                                <xsl:when test="$colour_standard = 'Cinecocolor'"/>
                                <xsl:when test="$colour_standard = 'Telcocolor'"/>
                                <xsl:when test="$colour_standard = 'Technochrome'"/>
                                <xsl:when test="$colour_standard = 'Getty_colour'"/>
                                <xsl:when test="$colour_standard = 'Panacolor'"/>
                                <xsl:when test="$colour_standard = 'Perfect'"/>
                                <xsl:when test="$colour_standard = 'Spot_Film__Continental_color'"/>
                                <xsl:when test="$colour_standard = 'Magicolor'"/>
                                <xsl:when test="$colour_standard = 'Sonolab_colour'"/>
                                <xsl:when test="$colour_standard = 'Colorfilm_Color'"/>
                                <xsl:when test="$colour_standard = 'Astral_Bellvue_Pathé_Color'"/>
                                <xsl:when test="$colour_standard = 'Monochrome'"/>
                                <xsl:when test="$colour_standard = 'Avala_Color'"/>
                                <xsl:otherwise>
                                    <fiaf:hasColourStandard rdf:resource="bfi://vocabulary/colourstandard/{$colour_standard}"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </rdf:Description>
                    </fiaf:hasColourCharacteristic>

                    <!-- fiaf:hasEvent -->

                    <!-- fiaf:hasExtent -->

                    <!-- fiaf:hasFormat -->

                    <xsl:for-each select="format_low_level[normalize-space(.)]">
                        <xsl:variable name="format1" select="translate(., ' ', '_')" />
                        <xsl:variable name="format" select="translate($format1, '&quot;', '')" />
                        <xsl:choose>
                            <xsl:when test="$format = 'VHS_Videocassette'"/>
                            <xsl:when test="$format = 'Videocassette'"/>
                            <xsl:when test="$format = 'Digital_Cinema_Package_(DCP)'"/>
                            <xsl:when test="$format = 'Digital_Video'"/>
                            <xsl:when test="$format = 'Digital_Media'"/>
                            <xsl:when test="$format = 'Phase_Alternate_Line_(PAL)'"/>
                            <xsl:when test="$format = 'U-Matic_Videocassette'"/>
                            <xsl:when test="$format = 'High-Definition_Video'"/>
                            <xsl:when test="$format = 'DVD-ROM'"/>
                            <xsl:when test="$format = '3-D_(Un-specified)'"/>
                            <xsl:when test="$format = 'Imax'"/>
                            <xsl:when test="$format = 'Betamax_Videocassette'"/>
                            <xsl:when test="$format = 'IMF_Package_(IMP)'"/>
                            <xsl:when test="$format = 'Mini-DV'"/>
                            <xsl:when test="$format = '65mm_film'"/>
                            <xsl:when test="$format = 'HD_Digital'"/>
                            <xsl:when test="$format = 'Apple_ProRes_422_HQ'"/>
                            <xsl:when test="$format = '25mm_Film'"/>
                            <xsl:when test="$format = 'Betacam_Videocassette'"/>
                            <xsl:when test="$format = 'VHS_Compact'"/>
                            <xsl:when test="$format = '2_Videotape'"/>
                            <xsl:when test="$format = 'V2000_Videocassette'"/>
                            <xsl:when test="$format = 'Super-VHS'"/>
                            <xsl:when test="$format = 'Reel_to_reel_tape'"/>
                            <xsl:when test="$format = 'Scope_(Un-specified)'"/>
                            <xsl:when test="$format = 'QuickTime'"/>
                            <xsl:when test="$format = 'D2_Digital'"/>
                            <xsl:when test="$format = 'D5-HD'"/>
                            <xsl:when test="$format = '1_Videotape'"/>
                        <xsl:otherwise>
                        <fiaf:hasFormat rdf:resource="bfi://vocabulary/format/{$format}" />
                        </xsl:otherwise>
                         </xsl:choose>
                    </xsl:for-each>

                    <!-- fiaf:hasIdentifier -->

                    <fiaf:hasIdentifier>
                        <rdf:Description rdf:about="bfi://identifier/manifestation/{@priref}">
                            <rdf:type rdf:resource="bfi://ontology/identifier" />
                            <fiaf:hasIdentifierValue>
                                <xsl:value-of select="@priref" />
                            </fiaf:hasIdentifierValue>
                            <fiaf:hasIdentifierAuthority rdf:resource="bfi://resource/agent/bfi" />
                        </rdf:Description>
                    </fiaf:hasIdentifier>

                    <!-- fiaf:hasImageCharacteristic -->

                    <!-- fiaf:hasItem -->

                    <xsl:for-each select="Parts">
                        <fiaf:hasItem rdf:resource="bfi://resource/item/{parts_reference.lref}" />
                    </xsl:for-each>

                    <!-- fiaf:hasLanguageUsage -->

                    <xsl:for-each select="language">
                        <xsl:variable name="languageusage" select="translate(./language.type/value[@lang='0'], ' ', '_')"/>
                        <fiaf:hasLanguageUsage>
                            <rdf:Description>
                                <xsl:choose>
                                    <xsl:when test="$languageusage = ''">
                                        <rdf:type rdf:resource="bfi://ontology/languageusage/languageusage" />
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <rdf:type rdf:resource="bfi://ontology/languageusage/{$languageusage}" />
                                   </xsl:otherwise>
                                </xsl:choose>
                                <xsl:variable name="language" select="translate(language, ' ', '_')"/>
                                <xsl:choose>
                                    <xsl:when test="$language = ''"/>
                                    <xsl:when test="$language = 'Artificial_language'"/>
                                    <xsl:when test="$language = 'Bantu'"/>
                                    <xsl:when test="$language = 'Bodo'"/>
                                    <xsl:when test="$language = 'British_Sign_Language'"/>
                                    <xsl:when test="$language = 'Rajasthani'"/>
                                    <xsl:otherwise>
                                <fiaf:hasLanguage rdf:resource="bfi://vocabulary/language/{$language}"/>
                                </xsl:otherwise>
                             </xsl:choose>
                            </rdf:Description>
                        </fiaf:hasLanguageUsage>
                    </xsl:for-each>

                    <!-- fiaf:hasSoundCharacteristic -->

                    <xsl:for-each select=".//sound_manifestation/value[@lang='0'][normalize-space(.)]">
                        <xsl:variable name="soundcharacteristic" select="translate(., ' ', '_')" />
                        <fiaf:hasSoundCharacteristic>
                        <rdf:Description>
                            <rdf:type rdf:resource="bfi://ontology/{$soundcharacteristic}"/>
                        </rdf:Description>
                        </fiaf:hasSoundCharacteristic>
                    </xsl:for-each>

                    <!-- fiaf:hasTitle -->

                </rdf:Description>
            </xsl:for-each>
        </rdf:RDF>
    </xsl:template>

</xsl:stylesheet>
