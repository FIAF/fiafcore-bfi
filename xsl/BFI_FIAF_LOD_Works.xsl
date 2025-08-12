<?xml version="1.0" encoding="UTF-8"?>

<!-- BFI XML Work data to FIAFcore -->
<!-- Paul Duchesne -->

<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
    xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#"
    xmlns:fiaf="https://ontology.fiafcore.org/">

    <xsl:output method="xml" indent="yes" />

    <xsl:template match="/adlibXML">
        <rdf:RDF>
            <xsl:for-each select="recordList/record">
                <rdf:Description rdf:about="bfi://resource/work/{@priref}">

                    <!-- fiafcore:Work -->
                    <!-- note that work subclass is not visible. -->

                    <rdf:type rdf:resource="bfi://ontology/work" />

                    <!-- fiafcore:hasCountry -->

                    <xsl:for-each select="production_country">
                        <xsl:variable name="country" select="translate(., ' ', '_')" />
                        <fiaf:hasCountry rdf:resource="bfi://vocabulary/country/{$country}" />
                    </xsl:for-each>
                    
                    <!-- fiafcore:hasEvent -->

                    <!-- fiafcore:hasGenre -->

                    <xsl:for-each select="Content_genre/content.genre">
                        <xsl:variable name="genre" select="translate(., ' ', '_')" />
                        <fiaf:hasGenre rdf:resource="bfi://vocabulary/genre/{$genre}" />
                    </xsl:for-each>

                    <!-- fiafcore:hasForm -->

                    <!-- fiafcore:hasIdentifier -->

                    <fiaf:hasIdentifier>
                        <rdf:Description rdf:about="bfi://identifier/work/{@priref}">
                            <rdf:type rdf:resource="bfi://ontology/identifier"/>
                            <fiaf:hasIdentifierValue>
                                <xsl:value-of select="@priref"/>
                            </fiaf:hasIdentifierValue>
                            <fiaf:hasIdentifierAuthority rdf:resource="bfi://ontology/authority/bfi"/>
                        </rdf:Description>
                    </fiaf:hasIdentifier>

                    <!-- fiafcore:hasLanguageUsage -->

                    <!-- fiafcore:hasManifestation -->

                    <xsl:for-each select="Parts">
                        <fiaf:hasManifestation rdf:resource="bfi://resource/manifestation/{parts_reference.lref}" />
                    </xsl:for-each>
                    
                    <!-- fiafcore:hasSubject -->

                    <xsl:for-each select="Content_subject/content.subject">
                        <xsl:variable name="subject" select="translate(., ' ', '_')" />
                        <fiaf:hasSubject rdf:resource="bfi://vocabulary/subject/{$subject}" />
                    </xsl:for-each>

                    <!-- fiafcore:hasTitle -->

                    <!-- fiafcore:hasVariant -->

                    <!-- fiafcore:hasWork -->

                </rdf:Description>

            </xsl:for-each>
        </rdf:RDF>
    </xsl:template>

</xsl:stylesheet>