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

                    <xsl:for-each select="production_country[normalize-space(.)]">
                        <xsl:variable name="country" select="translate(., ' ', '_')" />
                        <xsl:choose>
                            <xsl:when test="$country = 'USSR'"/>
                            <xsl:when test="$country = 'Yugoslavia'"/>
                            <xsl:otherwise>
                                <fiaf:hasCountry rdf:resource="bfi://vocabulary/country/{$country}" />
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:for-each>

                    <!-- fiaf:hasEvent -->

                    <!-- <fiaf:hasEvent>
                        <rdf:Description>
                            <rdf:type rdf:resource="bfi://ontology/event/production_event"/>
                            <xsl:for-each select="credits">
                                <fiaf:hasActivity>
                                    <rdf:Description>
                                        <xsl:variable name="activity" select="translate(credit.type, ' ', '')"/>
                                        <rdf:type rdf:resource="bfi://ontology/activity/{$activity}"/>
                                        <fiaf:hasAgent>
                                            <rdf:Description rdf:about="bfi://resource/agent/{credit.name.lref}">
                                                <rdf:type rdf:resource="bfi://ontology/agent"/>
                                                <rdfs:label>
                                                    <xsl:value-of select="credit.name"/>
                                                </rdfs:label>
                                                <fiaf:hasIdentifier>
                                                    <rdf:Description rdf:about="bfi://identifier/agent/{credit.name.lref}">
                                                        <rdf:type rdf:resource="bfi://ontology/identifier"/>
                                                        <fiaf:hasIdentifierValue>
                                                            <xsl:value-of select="credit.name.lref"/>
                                                        </fiaf:hasIdentifierValue>
                                                        <fiaf:hasIdentifierAuthority rdf:resource="bfi://resource/agent/bfi"/>
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
                                                <rdf:type rdf:resource="bfi://ontology/agent"/>
                                                <rdfs:label>
                                                    <xsl:value-of select="cast.name"/>
                                                </rdfs:label>
                                                <fiaf:hasIdentifier>
                                                    <rdf:Description rdf:about="bfi://identifier/agent/{cast.name.lref}">
                                                        <rdf:type rdf:resource="bfi://ontology/identifier"/>
                                                        <fiaf:hasIdentifierValue>
                                                            <xsl:value-of select="cast.name.lref"/>
                                                        </fiaf:hasIdentifierValue>
                                                        <fiaf:hasIdentifierAuthority rdf:resource="bfi://resource/agent/bfi"/>
                                                    </rdf:Description>
                                                </fiaf:hasIdentifier>
                                            </rdf:Description>
                                        </fiaf:hasAgent>
                                    </rdf:Description>
                                </fiaf:hasActivity>
                            </xsl:for-each>
                        </rdf:Description>
                    </fiaf:hasEvent> -->

                    <!-- fiaf:hasForm -->

                    <!-- Provided dataset may not contain this data. -->

                    <!-- fiaf:hasGenre -->

                    <xsl:for-each select="Content_genre/content.genre[normalize-space(.)]">
                        <xsl:variable name="apos">'</xsl:variable>
                        <xsl:variable name="genre1" select="translate(., ' ', '_')" />
                        <xsl:variable name="genre2" select="translate($genre1, $apos, '')" />
                        <xsl:choose>
                            <xsl:when test="$genre2 = 'Film_noir'"/>
                            <xsl:when test="$genre2 = 'Police_drama'"/>
                            <xsl:when test="$genre2 = 'Artists_Moving_Image'"/>
                            <xsl:when test="$genre2 = 'Anthology'"/>
                            <xsl:when test="$genre2 = 'Swashbuckling'"/>
                            <xsl:when test="$genre2 = 'Martial_arts'"/>
                            <xsl:when test="$genre2 = 'Sex_comedy'"/>
                            <xsl:when test="$genre2 = 'Road_movie'"/>
                            <xsl:when test="$genre2 = 'Spaghetti_western'"/>
                            <xsl:when test="$genre2 = 'Disaster'"/>
                            <xsl:when test="$genre2 = 'Performance'"/>
                            <xsl:when test="$genre2 = 'Fairy_tale'"/>
                            <xsl:when test="$genre2 = 'Documentary'"/>
                            <xsl:when test="$genre2 = 'Amateur_film'"/>
                            <xsl:when test="$genre2 = 'School_programme_and_Educational_film'"/>
                            <xsl:when test="$genre2 = 'Drama-documentary'"/>
                            <xsl:when test="$genre2 = 'Documentary_drama'"/>
                            <xsl:when test="$genre2 = 'Parody'"/>
                            <xsl:when test="$genre2 = 'Blaxploitation'"/>
                            <xsl:when test="$genre2 = 'Industry_sponsored_film'"/>
                            <xsl:when test="$genre2 = 'Variety_show'"/>
                            <xsl:when test="$genre2 = 'Promotional'"/>
                            <xsl:when test="$genre2 = 'Pornography'"/>
                            <xsl:when test="$genre2 = 'Student_film'"/>
                            <xsl:when test="$genre2 = 'Farce'"/>
                            <xsl:when test="$genre2 = 'Public_Information_Filler'"/>
                            <xsl:when test="$genre2 = 'Home_movie'"/>
                            <xsl:when test="$genre2 = 'Government_sponsored_film'"/>
                            <xsl:when test="$genre2 = 'Film_serial'"/>
                            <xsl:when test="$genre2 = 'Performance_music_video'"/>
                            <xsl:when test="$genre2 = 'Training'"/>
                            <xsl:when test="$genre2 = 'Advert'"/>
                            <xsl:when test="$genre2 = 'Trick_film'"/>
                            <xsl:when test="$genre2 = 'Sketch_show'"/>
                            <xsl:when test="$genre2 = 'Adventure'"/>
                            <xsl:when test="$genre2 = 'Music_video'"/>
                            <xsl:when test="$genre2 = 'Puppet_(live-action)'"/>
                            <xsl:when test="$genre2 = 'Australian_western'"/>
                            <xsl:when test="$genre2 = 'Action_and_Adventure'">
                                <fiaf:hasGenre rdf:resource="bfi://vocabulary/genre/Action" />
                                <fiaf:hasGenre rdf:resource="bfi://vocabulary/genre/Adventure" />
                            </xsl:when>
                            <xsl:otherwise>
                                <fiaf:hasGenre rdf:resource="bfi://vocabulary/genre/{$genre2}" />
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:for-each>

                    <!-- fiaf:hasIdentifier -->

                    <fiaf:hasIdentifier>
                        <rdf:Description rdf:about="bfi://identifier/work/{@priref}">
                            <rdf:type rdf:resource="bfi://ontology/identifier" />
                            <fiaf:hasIdentifierValue>
                                <xsl:value-of select="@priref" />
                            </fiaf:hasIdentifierValue>
                            <fiaf:hasIdentifierAuthority rdf:resource="bfi://resource/agent/bfi" />
                        </rdf:Description>
                    </fiaf:hasIdentifier>

                    <!-- fiaf:hasLanguageUsage -->

                    <!-- fiaf:hasManifestation -->

                    <!-- <xsl:for-each select="Parts">
                        <fiaf:hasManifestation rdf:resource="bfi://resource/manifestation/{parts_reference.lref}" />
                    </xsl:for-each> -->

                    <!-- fiaf:hasTitle -->

                    <xsl:for-each select="Title">
                        <fiaf:hasTitle>
                            <rdf:Description>
                                <xsl:variable name="title_type" select="translate(title.type/value[@lang='0'], ' ', '_')" />
                                <xsl:choose>
                                <xsl:when test="$title_type = 'Archive'">
                                    <rdf:type rdf:resource="bfi://ontology/title/Title" />
                                 </xsl:when>
                                 <xsl:when test="$title_type = ''">
                                     <rdf:type rdf:resource="bfi://ontology/title/Title" />
                                  </xsl:when>
                                <xsl:otherwise>
                                <rdf:type rdf:resource="bfi://ontology/title/{$title_type}" />
                                </xsl:otherwise>
                                </xsl:choose>
                                <fiaf:hasTitleValue>
                                    <xsl:value-of select="normalize-space(concat(title.article, ' ', title))" />
                                </fiaf:hasTitleValue>
                            </rdf:Description>
                        </fiaf:hasTitle>
                    </xsl:for-each>

                    <!-- fiaf:hasVariant -->

                    <!-- Provided dataset may not contain this data. -->

                    <!-- fiaf:hasWork -->

                    <!-- Provided dataset may not contain this data. -->

                </rdf:Description>
            </xsl:for-each>
        </rdf:RDF>
    </xsl:template>

</xsl:stylesheet>
