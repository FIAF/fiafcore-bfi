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

                    <fiaf:hasEvent>
                        <rdf:Description>
                            <rdf:type rdf:resource="bfi://ontology/event/production_event"/>
                            <xsl:for-each select="credits">
                                <fiaf:hasActivity>
                                    <rdf:Description>
                                        <xsl:variable name="activity1" select="translate(credit.type, ' ', '_')" />
                                        <xsl:variable name="activity" select="translate($activity1, '&amp;', '')" />
                                        <xsl:choose>
                                            <xsl:when test="$activity = ''">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Photography'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Assistant_Photographer'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Studio'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Presents'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = '©'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Costumes'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Script_Supervisor'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = '2nd_Unit_Photographer'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Sound_Re-recording'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Consultant'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Music_Recording'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Opticals'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Sound_Effects'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Production_Supervisor'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Stunts'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Video_Operator'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Music_Director'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Dialogue'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Draughtsperson'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'music_performance'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Clapper'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Production_Executive'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Sound_Effects_Editor'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Technical_Adviser'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Special_Make-up_Effects'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Conductor'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Storyboard_Artist'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = '2nd_Assistant_Director'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Sound_Supervisor'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Special_Effects_Supervisor'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Line_Producer'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Paint__Trace'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = '1st_Assistant_Director'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Special_Photographic_Effects'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Animation_Effects'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Sound_Design'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Sound_Recordist'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Music_Producer'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'ADR_Recordist'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Script_Collaborator'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Stunt_Double'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Additional_Photography'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Music_Arranger'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'ADR_Mixer'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Graphics'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Production_Team'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Lyricist'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Re-recording_Mixer'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Helicopter_Pilot'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Dialogue_Coach'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Music_Consultant'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Colour_Consultant'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Screenplay_by'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Armourer'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Sound_System'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Foley_Recordist'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Foley'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = '3rd_Assistant_Director'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Visual_Effects_1'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Foley_Mixer'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Music_Co-ordinator'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Lighting'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Written_by'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'voice'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Matte_Artist'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'ADR_Loop_Group'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Layout_Artist'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Supervising_Editor'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Miniatures'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Production_Illustrator'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Artwork'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Continuity'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Production_Associate'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Property_Master'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Assistant_Photographer'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Production_Controller'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Make-up_Artist'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Background_Artist'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Digital_Intermediate'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Associate_Editor'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Location_Assistant'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Thanks'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Production_Sound_Mixer'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Make-up_Supervisor'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Sculptures'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'music_performance'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Director_of_Animation'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Dubbing'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Sponsor'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Visual_Effects'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Casting_Director'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Puppeteer'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Computer_Graphics'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Aerial_Photographer'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Assistant_Producer'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Hairdresser'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Administration'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Assistant_to_Producer'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Unit_Publicist'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Post-production'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Researcher'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Unit_Manager'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Production_Buyer'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Camera_Equipment'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Production_Secretary'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = '1st_Assistant_Camera'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = '2nd_Assistant_Camera'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Designer'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'narrator'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Clapper/Loader'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Dubbing_Mixer'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Special_Optical_Effects'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Associate_Director'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = '1st_Assistant_Editor'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'International_Sales'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'On-line_Editor'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Script_Editor'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Co-director'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Production_Consultant'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Colour_by'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Subtitles'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Matte_Photographer'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Additional_Dialogue'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'ADR_Supervisor'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Distributor'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Conceptual_Artist'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Underwater_Photographer'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Colourist'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Laboratory'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Dubbing_Editor'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Costume_Assistant'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Based_on_the_novel_by'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Animation_Checker'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Best_Boy'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'ADR'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = '2nd_Assistant_Editor'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Special_Effects_Technician'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Script_Adviser'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Translator'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Wardrobe_Supervisor'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Visual_Effects_2'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'ADR_Artist'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Photographic_Effects'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Art_Department_Assistant'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Standby_Props'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Story'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Cel_Painter'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Sound_Engineer'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Carpenter'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Supervising_ADR_Editor'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'In_association_with'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Extras_Casting'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Dressing_Props'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Post-synchronization'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Digital_Imaging_Technician'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Hair_and_Make-up_Designer'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Hair_Stylist'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Graphic_Designer'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Costumer'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Driver'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Prosthetics'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Make-up_Assistant'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Location_Co-ordinator'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'EPK_[Electronic_Press_Kit]'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Foley_Supervisor'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Sound_Mixer'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Casting_Assistant'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Visual_Effects_Supervisor'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Standby_Art_Director'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'B_Camera_Operator'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Motion_Control'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Lighting_Equipment'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Wardrobe_Mistress'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Computer_Effects'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Sound_Designer'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'on-screen_participant'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Animal_Wrangler'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Assistant_Costume_Designer'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Sound_Assistant'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Film_Stock'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Sound_Maintenance'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Key_Make-up'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Make-up_Designer'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Equipment'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Processing'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Post-production_Co-ordinator'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Painter'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Music_Recorded_at'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Martial_Arts_Instructor'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Visual_Consultant'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Technical_Director'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Supervising_Electrician'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Scenario'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Casting_Associate'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Animatronics'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Supervising_Art_Director'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Assistant_to_the_Director'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Construction_Co-ordinator'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Assistant_Sound_Editor'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Production_Services'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Supervising_Foley_Editor'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Animation_Photographer'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Catering'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = '2nd_Unit_Director_of_Photography'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = '[Subject_of_Film]'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Lenses'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Re-recordist'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Genny_Operator'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Technical_Assistant'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Production_Runner'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'With_the_support_of'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Story_by'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Music_Mixer'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Draughtsman'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Video_Assist'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Negative_Cutter'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Art_Department_Co-ordinator'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Key_Hair_Stylist'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Completion_Bond'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Assistant_Props'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Visual_Effects_Producer'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Additional_Music'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Rigging_Gaffer'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Assistant_Accountant'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Assistant_Location_Manager'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Wardrobe_Master'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Music_Composed_and_Conducted_by'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Special_Effects_Co-ordinator'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Foley_Walker'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Optical_Photographer'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'World_Revenues_Collected_and_Distributed_by'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Runner'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Based_on_the_play_by'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Composer'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'activity_not_known'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Original_Music'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Music_Adapter'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Location_Scout'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Film_Industry_Visitor'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = '2nd_2nd_Assistant_Director'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Transportation_Captain'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Developed_by'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Dialect_Coach'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = '1st_Assistant_B_Camera'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Pyrotechnics'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'A_Camera_Operator'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Chief_Lighting_Technician'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Compositor'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Prints_by'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Visual_Effects_Photography'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Loader'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Art_Consultant'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Location_Consultant'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Camera'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Consultant_Editor'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Horsemaster'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Visual_Effects_3'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = '2nd_Assistant_B_Camera'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Colour_Timer'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Sound_Camera_Operator'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Animation_1'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Floor_Runner'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Action_Vehicles_Co-ordinator'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'With_the_participation_of'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Additional_Editor'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Rigging'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Script_Consultant'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Technical_Supervisor'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = '1st_Assistant_A_Camera'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Orchestra_Contractor'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Visual_Effects_Co-ordinator'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Electronic_Special_Effects'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Dolby_Consultant'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Crowd_Assistant_Director'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Orchestra_Leader'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = '2nd_Assistant_A_Camera'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Digital_Effects'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Visual_Effects_Editor'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Construction_Foreperson'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Post-production_Accountant'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Rostrum_Photography'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Story_Consultant'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Assembly_Editor'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Transportation_Co-ordinator'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Animation_5'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Trainee_Camera'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Cinematographer'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Leadman'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Lighting_Cameraman'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Assistant_Production_Co-ordinator'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Music_Preparation'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Commentary_Writer'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'In_Memoriam'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Hair_Design'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Historical_Adviser'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Department_Head_Make-up'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Plasterer'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Dialogue_Consultant'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Rigging_Grip'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Best_Boy_Electrician'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Story_Editor'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Animation_Director'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Audio_Commentary'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Medical_Adviser'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Visual_Effects_4'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'ADR_Voice_Casting'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Lighting_Director'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Commissioning_Editor'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Location_Adviser'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Department_Head_Hair'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Animation_7'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Aerial_Director'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Recordist'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Dolly_Grip'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Compositing'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Stop_Motion'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Colour_Grader'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Animation_2'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Creator'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'commentator'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Best_Boy_Grip'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Inbetweener'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Post-production_Manager'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Movement_Coach'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Music_Programming'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Stunt_Arranger'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Assistant_Animator'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'In_co-production_with'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Music_Mixed_at'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Crane_Operator'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Archive_Researcher'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Chief_Electrician'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Marine_Co-ordinator'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Animation_6'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Section_1'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'dancer'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Acknowledgement'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Animation_4'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Visual_Effects_5'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Special_Effects_Foreperson'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Voice_Casting'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Animation_3'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Archive_Footage'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Compositing_Artist'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Dialogue_Supervisor'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Systems'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Executive_in_Charge_of_Production'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Additional_Visual_Effects'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Cameraman'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Assistant_Production_Accountant'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Commissioning_Company'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Fight_Co-ordinator'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = '[Produced]_For'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'C_Camera_Operator'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Business_Affairs'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Associate_Art_Director'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Additional_Visual_Effects1'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Aerial_Co-ordinator'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Supervising_Dialogue_Editor'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = '1st_Assistant_C_Camera'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = '2nd_Assistant_C_Camera'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Visual_Effects_Art_Director'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Lighting_Consultant'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Score_Recordist'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'On-set_Dresser'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Artist'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'With_the_financial_support_of'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'CG_Artist'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'interviewee'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Technical_Effects'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Transmission_Company'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = '3D_Artist'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Visual_Effects_6'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Theatrical_Distributor'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Historical_Consultant'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Fight_Arranger'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Additional_Camera'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Script_Development'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Cel_Animator'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Sound_Effects_Recordist'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Crowd_Marshall'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Archive_Producer'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Rights_Holder'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'unknown_credit_activity'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Colour_and_Prints_by'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Rigging_Best_Boy'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Friend/Family_Visitor'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Medical_Authority'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'introduction'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Matte_Painter'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Off-line_Editor'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Digital_Artist'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Score_Mixer'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Story_Artist'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Additional_Visual_Effects3'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Dedicated_to'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Publicity_Supervisor'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Tailor'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = '[International_Sales]'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Stage_Manager'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Military_Adviser'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Dresses'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Cable'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Mens_Wardrobe'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Animation_Lead'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Visual_Effects_7'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Modelling'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Intimacy_Co-ordinator'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Incidental_Music'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Gowns'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Tax'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Lighting_Technical_Director'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Womens_Wardrobe'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Casting_Supervisor'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Medical_Consultant'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = '2nd_Company_Grip'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Dialogue_Recordist'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Archive_Stills'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'presenter'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Publicity_Co-ordinator'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Action_Choreographer'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Visual_Effects_8'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Project_Co-ordinator'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = '3D_Supervisor'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Additional_2nd_Assistant_Director'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Orchestra_Conductor'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Stereographer'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Stunt_Supervisor'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Making_Of_-_Director'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Cashier'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = '24_Frame_Playback'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Orchestra'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Rostrum_Camera'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Fight_Director'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Footage_courtesy_of'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'CG_Supervisor'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'VTR_Operator'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Additional_Visual_Effects2'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Visual_Effects_9'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Pyrotechnics_Supervisor'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Front_Projection_Supervisor'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Fur'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Special_Effects_Shop_Supervisor'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Textures'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Production_Technology'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Wire_Arranger'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Section_2'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Supervising_Producer'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Sound_Effects_Designer'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Head_of_Production'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Pre-visualisation'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Making_Of_-_Photography'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Playback_Singer'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Floor_Manager'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Layout_Supervisor'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Electrical_Equipment'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Visual_Development'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Score_Recorded_at'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Visiting_Press'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Character_Designer'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Prop_Modelling'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'CG_Lead'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Soundtrack_Co-ordinator'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Creative_Consultant'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Compositing_Supervisor'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Compiler'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Making_Of'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Series_Editor'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Payroll'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Studio_Director'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Weapons'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Teleplay'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Pre-vis'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Animation_Technical_Director'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = '1st_Company_Grip'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'D_Camera_Operator'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Pyrotechnics_Technician'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Videotape_Editor'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Vision_Mixer'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Motion_Graphics'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Motion_Capture'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Lighting_Supervisor'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = '2D_Artist'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Matte_Camera'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'CG_Technical_Director'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Making_Of_-_Editor'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Clean-up'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Additional_Digital_Effects'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Set_Modelling'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Set_Lighting_Technician'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Series_Producer'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Jib_Operator'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Website_Designer'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Weapons_Handler'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Telecine'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Score_Mixed_at'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Animatics'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Scientific_Adviser'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Crowds'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Additional_Visual_Effects4'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Production_Resources'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Visiting_Statesmen'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'Assistant_Co-ordinator'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <rdf:type rdf:resource="bfi://ontology/activity/{$activity}"/>
                                            </xsl:otherwise>
                                        </xsl:choose>
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
                                        <xsl:variable name="activity1" select="translate(credit.type, ' ', '_')" />
                                        <xsl:variable name="activity" select="translate($activity1, '&amp;', '')" />
                                        <xsl:choose>
                                            <xsl:when test="$activity = ''">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:when test="$activity = 'music_performance'">
                                                <rdf:type rdf:resource="bfi://ontology/activity/Activity" />
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <rdf:type rdf:resource="bfi://ontology/activity/{$activity}"/>
                                            </xsl:otherwise>
                                        </xsl:choose>
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
                    </fiaf:hasEvent>

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
