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

                    <!-- <xsl:for-each select="colour_manifestation/value[@lang='0']">
                        <xsl:variable name="colour_manifestation" select="translate(., ' ', '')"/>
                        <fiaf:hasColourCharacteristic rdf:resource="bfi://vocabulary/colourcharacteristic/{$colour_manifestation}"/>
                    </xsl:for-each> -->

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
