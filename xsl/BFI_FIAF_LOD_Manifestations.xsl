<?xml version="1.0" encoding="UTF-8"?>

<!-- BFI XML Manifestation data to FIAFcore -->
<!-- Paul Duchesne -->
<!-- 2025-05-22 -->

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

                    <xsl:choose>
                        <xsl:when test="manifestationlevel_type/value[@lang='0']">
                            <xsl:variable name="manifest_type" select="translate(manifestationlevel_type/value[@lang='0'], ' ', '')"/>
                            <rdf:type rdf:resource="bfi://ontology/manifestation/{$manifest_type}" />
                        </xsl:when>
                        <xsl:otherwise>
                            <rdf:type rdf:resource="bfi://ontology/manifestation" />
                        </xsl:otherwise>
                    </xsl:choose>

                    <!-- fiaf:hasColourCharacteristic -->

                    <xsl:for-each select="colour_manifestation/value[@lang='0']">
                        <xsl:variable name="colour_manifestation" select="translate(., ' ', '')"/>
                        <fiaf:hasColourCharacteristic rdf:resource="bfi://vocabulary/colourcharacteristic/{$colour_manifestation}"/>
                    </xsl:for-each>

                    <!-- fiaf:hasEvent -->

                    <!-- fiaf:hasExtent -->

                    <!-- fiaf:hasFormat -->

                    <!-- issue with double quotes in 2" videotape-->
                    <!-- <xsl:for-each select="format_low_level"> -->
                    <!-- <xsl:variable name="format" select="translate(., ' ', '')" /> -->
                    <!-- <fiaf:hasFormat rdf:resource="bfi://vocabulary/format/{$format}" /> -->
                    <!-- </xsl:for-each> -->

                    <!-- fiaf:hasIdentifier -->

                    <fiaf:hasIdentifier>
                        <rdf:Description rdf:about="bfi://identifier/manifestation/{@priref}">
                            <rdf:type rdf:resource="bfi://ontology/identifier" />
                            <fiaf:hasIdentifierValue>
                                <xsl:value-of select="@priref" />
                            </fiaf:hasIdentifierValue>
                            <fiaf:hasIdentifierAuthority rdf:resource="bfi://ontology/authority/bfi" />
                        </rdf:Description>
                    </fiaf:hasIdentifier>

                    <!-- fiaf:hasImageCharacteristic -->

                    <!-- fiaf:hasItem -->

                    <xsl:for-each select="Parts">
                        <fiaf:hasItem rdf:resource="bfi://resource/item/{parts_reference.lref}" />
                    </xsl:for-each>

                    <!-- fiaf:hasLanguageUsage -->

                    <xsl:for-each select="language">
                        <xsl:variable name="languageusage" select="translate(./language.type/value[@lang='0'], ' ', '')"/>
                        <fiaf:hasLanguageUsage>
                            <rdf:Description>
                                <rdf:type rdf:resource="bfi://ontology/languageusage/{$languageusage}" />
                                <xsl:variable name="language" select="translate(language, ' ', '')"/>
                                <fiaf:hasLanguage rdf:resource="bfi://vocabulary/language/{$language}"/>
                            </rdf:Description>
                        </fiaf:hasLanguageUsage>
                    </xsl:for-each>

                    <!-- fiaf:hasSoundCharacteristic -->

                    <xsl:for-each select="sound_manifestation/value[@lang='0']">
                        <xsl:variable name="sound_manifestation" select="translate(., ' ', '')"/>
                        <fiaf:hasSoundCharacteristic rdf:resource="bfi://vocabulary/soundcharacteristic/{$sound_manifestation}"/>
                    </xsl:for-each>

                    <!-- fiaf:hasTitle -->

                </rdf:Description>
            </xsl:for-each>
        </rdf:RDF>
    </xsl:template>

</xsl:stylesheet>