<?xml version="1.0" encoding="UTF-8"?>

<!-- BFI XML Work data to FIAFcore -->
<!-- Paul Duchesne -->

<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
    xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#"
    xmlns:fiaf="https://ontology.fiafcore.org/">

    <xsl:output method="xml" indent="yes" />

    <xsl:template match="/">
        <rdf:RDF>
            <xsl:for-each select="record">
                <rdf:Description rdf:about="bfi://resource/work/{@priref}">

                    <!-- fiaf:Work -->

                    <rdf:type rdf:resource="bfi://ontology/work" />

                    <!-- fiaf:hasCountry -->

                    <xsl:for-each select="production_country">
                        <xsl:variable name="country" select="translate(., ' ', '_')" />
                        <fiaf:hasCountry rdf:resource="bfi://vocabulary/country/{$country}" />
                    </xsl:for-each>

                    <!-- fiaf:hasEvent -->
                    
                    <fiaf:hasEvent>
                        <rdf:Description>
                            <rdf:type rdf:resource="bfi://ontology/event/production_event"/>
                            <xsl:for-each select="credits">
                                <fiaf:hasActivity>
                                    <rdf:Description>
                                        <xsl:variable name="activity" select="translate(credit.type, ' ', '')"/>
                                        <rdf:type rdf:resource="bfi://ontology/activity/{$activity}"/>
                                        <fiaf:hasAgent>
                                            <rdf:Description rdf:about="bfi://resource/agent/{credit.name.lref}">
                                                <rdfs:label>
                                                    <xsl:value-of select="credit.name"/>
                                                </rdfs:label>
                                                <fiaf:hasIdentifier>
                                                    <rdf:Description rdf:about="bfi://identifier/agent/{credit.name.lref}">
                                                        <rdf:type rdf:resource="bfi://ontology/identifier"/>
                                                        <fiaf:hasIdentifierValue>
                                                            <xsl:value-of select="credit.name.lref"/>
                                                        </fiaf:hasIdentifierValue>
                                                        <fiaf:hasIdentifierAuthority rdf:resource="bfi://ontology/authority/bfi"/>
                                                    </rdf:Description>
                                                </fiaf:hasIdentifier>
                                            </rdf:Description>
                                        </fiaf:hasAgent>
                                    </rdf:Description>
                                </fiaf:hasActivity>
                            </xsl:for-each>
                            <xsl:for-each select="cast">
                                <fiaf:hasActivity>
                                    <rdf:Description>
                                        <xsl:variable name="activity" select="translate(cast.credit_type, ' ', '')"/>
                                        <rdf:type rdf:resource="bfi://ontology/activity/{$activity}"/>
                                        <fiaf:hasAgent>
                                            <rdf:Description rdf:about="bfi://resource/agent/{cast.name.lref}">
                                                <rdfs:label>
                                                    <xsl:value-of select="cast.name"/>
                                                </rdfs:label>
                                                <fiaf:hasIdentifier>
                                                    <rdf:Description rdf:about="bfi://identifier/agent/{cast.name.lref}">
                                                        <rdf:type rdf:resource="bfi://ontology/identifier"/>
                                                        <fiaf:hasIdentifierValue>
                                                            <xsl:value-of select="cast.name.lref"/>
                                                        </fiaf:hasIdentifierValue>
                                                        <fiaf:hasIdentifierAuthority rdf:resource="bfi://ontology/authority/bfi"/>
                                                    </rdf:Description>
                                                </fiaf:hasIdentifier>
                                            </rdf:Description>
                                        </fiaf:hasAgent>
                                    </rdf:Description>
                                </fiaf:hasActivity>
                            </xsl:for-each>
                        </rdf:Description>
                    </fiaf:hasEvent>

                    <!-- fiaf:hasForm -->

                    <!-- fiaf:hasGenre -->

                    <xsl:for-each select="Content_genre/content.genre">
                        <xsl:variable name="genre" select="translate(., ' ', '_')" />
                        <fiaf:hasGenre rdf:resource="bfi://vocabulary/genre/{$genre}" />
                    </xsl:for-each>

                    <!-- fiaf:hasIdentifier -->

                    <fiaf:hasIdentifier>
                        <rdf:Description rdf:about="bfi://identifier/work/{@priref}">
                            <rdf:type rdf:resource="bfi://ontology/identifier" />
                            <fiaf:hasIdentifierValue>
                                <xsl:value-of select="@priref" />
                            </fiaf:hasIdentifierValue>
                            <fiaf:hasIdentifierAuthority rdf:resource="bfi://ontology/authority/bfi" />
                        </rdf:Description>
                    </fiaf:hasIdentifier>

                    <!-- fiaf:hasLanguageUsage -->

                    <!-- fiaf:hasManifestation -->

                    <xsl:for-each select="Parts">
                        <fiaf:hasManifestation rdf:resource="bfi://resource/manifestation/{parts_reference.lref}" />
                    </xsl:for-each>

                    <!-- fiaf:hasSubject -->

                    <xsl:for-each select="Content_subject/content.subject">
                        <xsl:variable name="subject1" select="translate(., ' ', '_')" />
                        <xsl:variable name="subject2" select="translate($subject1, '`', '_')" />
                        <fiaf:hasSubject rdf:resource="bfi://vocabulary/subject/{$subject2}" />
                    </xsl:for-each>

                    <!-- fiaf:hasTitle -->

                    <xsl:for-each select="Title">
                        <fiaf:hasTitle>
                            <rdf:Description>
                                <xsl:variable name="title_type" select="translate(title.type/value[@lang='0'], ' ', '_')" />
                                <rdf:type rdf:resource="bfi://ontology/title/{$title_type}" />
                                <fiaf:hasTitleValue>
                                    <xsl:value-of select="concat(title.article, ' ', title)" />
                                </fiaf:hasTitleValue>
                            </rdf:Description>
                        </fiaf:hasTitle>
                    </xsl:for-each>

                    <!-- fiaf:hasVariant -->

                    <!-- fiaf:hasWork -->

                </rdf:Description>

            </xsl:for-each>
        </rdf:RDF>
    </xsl:template>

</xsl:stylesheet>