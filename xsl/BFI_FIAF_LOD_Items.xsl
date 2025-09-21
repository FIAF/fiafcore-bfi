<?xml version="1.0" encoding="UTF-8"?>

<!-- BFI XML Item data to FIAFcore -->
<!-- Paul Duchesne -->
<!-- 2025-05-22 -->

<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
    xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#"
    xmlns:fiaf="https://ontology.fiafcore.org/">

    <xsl:output method="xml" indent="yes" />

    <!-- Items -->

    <xsl:template match="/">
        <rdf:RDF>
            <xsl:for-each select="record">
                <rdf:Description rdf:about="bfi://resource/item/{@priref}">
                    <rdf:type rdf:resource="bfi://ontology/item" />

                    <!-- fiaf:hasBase -->

                    <xsl:for-each select="base/value[@lang='0']">
                        <xsl:variable name="base" select="translate(., ' ', '')" />
                        <fiaf:hasBase rdf:resource="bfi://vocabulary/base/{$base}" />
                    </xsl:for-each>

                    <!-- fiaf:hasBroadcastStandard -->

                    <!-- fiaf:hasCarrier -->

                    <!-- fiaf:hasColourCharacteristic -->

                    <!-- fiaf:hasEvent -->

                    <!-- fiaf:hasExtent -->

                    <xsl:for-each select="Dimension/dimension.value">
                        <fiaf:hasExtent>
                            <rdf:Description>
                                <rdf:type rdf:resource="bfi://ontology/extent/feet"/>
                                <fiaf:hasExtentValue>
                                    <xsl:value-of select="."/>
                                </fiaf:hasExtentValue>
                            </rdf:Description>
                        </fiaf:hasExtent>
                    </xsl:for-each>

                    <!-- fiaf:hasFormat -->

                    <xsl:for-each select="gauge_film/value[@lang='0']">
                        <xsl:variable name="gauge_film" select="translate(., ' ', '')"/>
                        <fiaf:hasFormat rdf:resource="bfi://vocabulary/filmformat/{$gauge_film}"/>
                    </xsl:for-each>

                    <!-- fiaf:hasFrameRate -->

                    <!-- fiaf:hasHoldingInstitution -->

                    <fiaf:hasHoldingInstitution rdf:resource="bfi://ontology/holdinginstitution/bfi"/>

                    <!-- fiaf:hasIdentifier -->

                    <fiaf:hasIdentifier>
                        <rdf:Description rdf:about="bfi://identifier/item/{@priref}">
                            <rdf:type rdf:resource="bfi://ontology/identifier" />
                            <fiaf:hasIdentifierValue>
                                <xsl:value-of select="@priref" />
                            </fiaf:hasIdentifierValue>
                            <fiaf:hasIdentifierAuthority rdf:resource="bfi://ontology/authority/bfi" />
                        </rdf:Description>
                    </fiaf:hasIdentifier>

                    <!-- fiaf:hasImageCharacteristic -->

                    <!-- fiaf:hasLineStandard -->

                    <!-- fiaf:hasResolution -->

                    <!-- fiaf:hasSoundCharacteristic -->

                    <xsl:for-each select="sound_item/value[@lang='0']">
                        <xsl:variable name="soundcharacteristic" select="translate(., ' ', '')" />
                        <fiaf:hasSoundCharacteristic rdf:resource="bfi://vocabulary/soundcharacteristic/{$soundcharacteristic}" />
                    </xsl:for-each>

                    <!-- fiaf:hasSourceDevice -->

                    <!-- fiaf:hasSourceSoftware -->

                    <!-- fiaf:hasStatus -->

                    <xsl:for-each select="copy_status/value[@lang='0']">
                        <xsl:variable name="status" select="translate(., ' ', '')" />
                        <fiaf:hasStatus rdf:resource="bfi://vocabulary/status/{$status}" />
                    </xsl:for-each>

                    <!-- fiaf:hasStock -->

                    <!-- fiaf:hasStream -->

                    <!-- fiaf:hasTitle -->

                    <!-- fiaf:hasTransferSpeed -->

                    <!-- fiaf:isElement -->

                    <xsl:variable name="element" select="translate(physical_description, ' ', '_')" />
                    <fiaf:isElement rdf:resource="bfi://vocabulary/element/{$element}" />

                </rdf:Description>

            </xsl:for-each>
        </rdf:RDF>
    </xsl:template>

</xsl:stylesheet>