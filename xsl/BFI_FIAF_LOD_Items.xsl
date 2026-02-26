<?xml version="1.0" encoding="UTF-8"?>

<!-- BFI XML Item data to FIAFcore -->
<!-- Paul Duchesne -->

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

                    <!-- <xsl:for-each select="base/value[@lang='0']">
                        <xsl:variable name="base" select="translate(., ' ', '')" />
                        <xsl:choose>
                            <xsl:when test="$base = 'Acrylic'"/>
                            <xsl:when test="$base = 'Mixed'"/>
                            <xsl:when test="$base = 'PVC'"/>
                            <xsl:otherwise>
                                <fiaf:hasBase rdf:resource="bfi://vocabulary/base/{$base}" />
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:for-each> -->

                    <!-- fiaf:hasBroadcastStandard -->

                    <!-- fiaf:hasCarrier -->

                    <!-- fiaf:hasColourCharacteristic -->

                    <!-- fiaf:hasEvent -->

                    <!-- fiaf:hasExtent -->

                    <!-- <xsl:for-each select="Dimension/dimension.value">
                        <fiaf:hasExtent>
                            <rdf:Description>
                                <rdf:type rdf:resource="bfi://ontology/extent/feet"/>
                                <fiaf:hasExtentValue>
                                    <xsl:value-of select="."/>
                                </fiaf:hasExtentValue>
                            </rdf:Description>
                        </fiaf:hasExtent>
                    </xsl:for-each> -->

                    <!-- fiaf:hasFormat -->

                    <!-- <xsl:for-each select="gauge_film/value[@lang='0']">
                        <xsl:variable name="gauge_film" select="translate(., ' ', '')"/>
                        <fiaf:hasFormat rdf:resource="bfi://vocabulary/filmformat/{$gauge_film}"/>
                    </xsl:for-each> -->

                    <!-- fiaf:hasFrameRate -->

                    <!-- fiaf:hasHoldingInstitution -->

                    <!-- <fiaf:hasHoldingInstitution rdf:resource="bfi://ontology/holdinginstitution/bfi"/> -->

                    <!-- fiaf:hasIdentifier -->

                    <!-- <fiaf:hasIdentifier>
                        <rdf:Description rdf:about="bfi://identifier/item/{@priref}">
                            <rdf:type rdf:resource="bfi://ontology/identifier" />
                            <fiaf:hasIdentifierValue>
                                <xsl:value-of select="@priref" />
                            </fiaf:hasIdentifierValue>
                            <fiaf:hasIdentifierAuthority rdf:resource="bfi://ontology/authority/bfi" />
                        </rdf:Description>
                    </fiaf:hasIdentifier> -->

                    <!-- fiaf:hasImageCharacteristic -->

                    <!-- fiaf:hasLineStandard -->

                    <!-- fiaf:hasResolution -->

                    <!-- fiaf:hasSoundCharacteristic -->

                    <!-- <xsl:for-each select="sound_item/value[@lang='0']">
                        <xsl:variable name="soundcharacteristic" select="translate(., ' ', '')" />
                        <fiaf:hasSoundCharacteristic rdf:resource="bfi://vocabulary/soundcharacteristic/{$soundcharacteristic}" />
                    </xsl:for-each> -->

                    <!-- fiaf:hasSourceDevice -->

                    <!-- fiaf:hasSourceSoftware -->

                    <!-- fiaf:hasStatus -->

                    <!-- <xsl:for-each select="copy_status/value[@lang='0']">
                        <xsl:variable name="status" select="translate(., ' ', '')" />
                        <fiaf:hasStatus rdf:resource="bfi://vocabulary/status/{$status}" />
                    </xsl:for-each> -->

                    <!-- fiaf:hasStock -->

                    <!-- <xsl:for-each select="stock/stock_film">
                        <xsl:variable name="stock" select="translate(., ' ', '')" />
                        <fiaf:hasStock rdf:resource="bfi://vocabulary/stock/{$stock}" />
                    </xsl:for-each> -->

                    <!-- fiaf:hasStream -->

                    <!-- fiaf:hasTitle -->

                    <!-- fiaf:hasTransferSpeed -->

                    <!-- fiaf:isElement -->

                    <xsl:for-each select="physical_description[normalize-space(.)]"> 
                        <xsl:variable name="element" select="translate(., ' ', '_')" />
                        <xsl:choose>
                            <xsl:when test="$element = 'Positive'"/>
                            <xsl:when test="$element = 'Magnetic'"/>
                            <xsl:when test="$element = 'Master'"/>                            
                            <xsl:when test="$element = 'Master_Positive'"/>
                            <xsl:when test="$element = 'Negative'"/> 	
                            <xsl:when test="$element = 'Magnetic_recording'"/>
                            <xsl:when test="$element = 'Cyan_Separation_Promaster'"/> 	
                            <xsl:when test="$element = 'Yellow_Separation_Promaster'"/> 	
                            <xsl:when test="$element = 'Magenta_Separation_Promaster'"/>
                            <xsl:when test="$element = 'BW_Negative'"/>
                            <xsl:when test="$element = 'BW_and_Colour_Positive'"/>
                            <xsl:when test="$element = 'Tinted_Positive'"/> 	
                            <xsl:when test="$element = 'BW_and_Tinted_Positive'"/>	
                            <xsl:when test="$element = 'Cyan_Separation_Negative'"/> 	
                            <xsl:when test="$element = 'Magenta_Separation_Negative'"/>
                            <xsl:when test="$element = 'Yellow_Separation_Negative'"/>
                            <xsl:when test="$element = 'Re-recorded_Negative'"/>
                            <xsl:when test="$element = 'Reversal_Colour_Internegative'"/>
                            <xsl:when test="$element = 'Dupe'"/>
                            <xsl:when test="$element = 'Cyan_Separation_Matrix'"/>
                            <xsl:when test="$element = 'Yellow_Separation_Matrix'"/>
                            <xsl:when test="$element = 'Magenta_Separation_Matrix'"/>
                            <xsl:when test="$element = 'Disc'"/>
                            <xsl:when test="$element = 'Re-recorded'"/>
                            <xsl:when test="$element = 'Dupe_Yellow_Separation_Negative'"/>
                            <xsl:when test="$element = 'Dupe_Cyan_Separation_Negative'"/>
                            <xsl:when test="$element = 'Dupe_Magenta_Separation_Negative'"/>
                            <xsl:when test="$element = 'Interpositive'"/>
                            <xsl:when test="$element = 'Duplicating_BW_Positive'"/>
                            <xsl:when test="$element = 'DTS_Disc'"/>
                            <xsl:when test="$element = 'Original_BW_Negative'"/>
                            <xsl:when test="$element = 'Original_/_Dupe_Negative'"/>
                            <xsl:when test="$element = 'Duplicating'"/>
                            <xsl:when test="$element = 'Original_Magenta_Separation_Negative'"/>
                            <xsl:when test="$element = 'Original_Cyan_Separation_Negative'"/>
                            <xsl:when test="$element = 'Original_Yellow_Separation_Negative'"/>
                            <xsl:when test="$element = 'Digital_Theater_Systems'"/>
                            <xsl:when test="$element = 'Separation_Promaster'"/>
                            <xsl:when test="$element = 'Master'"/>
                            <xsl:when test="$element = 'Original'"/>
                            <xsl:when test="$element = 'Duplicating_Negative'"/>
                            <xsl:when test="$element = 'Tinted_and_Toned_Positive'"/>
                            <xsl:when test="$element = 'Yellow_Matrix'"/>
                            <xsl:when test="$element = 'Cyan_Colour_Matrix'"/>
                            <xsl:when test="$element = 'Magenta_Colour_Matrix'"/>
                            <xsl:when test="$element = 'Negative_and_Positive'"/>
                            <xsl:when test="$element = 'Dupe_Magnetic_Recording'"/>
                            <xsl:when test="$element = 'TV_(low_contrast)'"/>
                            <xsl:when test="$element = 'Colour_Reversal_Internegative'"/>
                            <xsl:when test="$element = 'Original_Separation_Negative'"/>
                            <xsl:when test="$element = 'Promaster'"/>
                            <xsl:when test="$element = 'Separation_Negative'"/>
                            <xsl:when test="$element = 'Dupe_Separation_Negative'"/>
                            <xsl:when test="$element = 'Finegrain_Dupe_Positive'"/>
                            <xsl:when test="$element = 'Yellow_Promaster'"/>
                            <xsl:when test="$element = 'Magenta_Promaster'"/>
                            <xsl:when test="$element = 'Red_Separation_Negative'"/>
                            <xsl:when test="$element = 'Blue_Separation_Negative'"/>
                            <xsl:when test="$element = 'Reversal_Positive'"/>
                            <xsl:when test="$element = 'TV_(low_contrast)_BW_Positive'"/>
                            <xsl:when test="$element = 'BW_and_Tinted_and_Toned_Positive'"/>
                            <xsl:when test="$element = 'Lavender_Positive'"/>
                            <xsl:when test="$element = 'Dupe_Cyan_Separation_Promaster'"/>
                            <xsl:when test="$element = 'Dupe_Magenta_Separation_Promaster'"/>
                            <xsl:when test="$element = 'Original_/_Dupe_Yellow_Separation_Negative'"/>
                            <xsl:when test="$element = 'Reversal_BW_Positive'"/>
                            <xsl:when test="$element = 'Dupe_Yellow_Separation_Promaster'"/>
                            <xsl:when test="$element = 'Magenta_Separation_Positive'"/>
                            <xsl:when test="$element = 'Original_/_Dupe_Cyan_Separation_Negative'"/>
                            <xsl:when test="$element = 'Original_/_Dupe_Magenta_Separation_Negative'"/>
                            <xsl:when test="$element = 'BW_Dupe_Negative'"/>
                            <xsl:when test="$element = 'Cyan_Promaster'"/>
                            <xsl:when test="$element = 'Original_Reversal_Colour_Positive'"/>
                            <xsl:when test="$element = 'TV_(low_contrast)_Positive'"/>
                            <xsl:when test="$element = 'Dupe_Colour_Negative'"/>
                            <xsl:when test="$element = 'Dupe_BW_Positive'"/>
                            <xsl:when test="$element = 'Reversal_Internegative'"/>
                            <xsl:when test="$element = 'Duplicating_Tinted_Positive'"/>
                            <xsl:when test="$element = 'Yellow_Separation_Positive'"/>
                            <xsl:when test="$element = 'Dupe_Magenta_Separation_Matrix'"/>
                            <xsl:when test="$element = 'Magnetic_Tape'"/>
                            <xsl:when test="$element = 'Dupe_Colour_Positive'"/>
                            <xsl:when test="$element = 'Recording'"/>
                            <xsl:when test="$element = 'Dupe_BW_Negative_and_Positive'"/>
                            <xsl:when test="$element = 'Successive_frame_Separation_Negative'"/>
                            <xsl:when test="$element = 'Dupe_Red_Separation_Negative'"/>
                            <xsl:when test="$element = 'Cyan_Separation_Positive'"/>
                            <xsl:when test="$element = 'Cyan_Colour_Promaster'"/>
                            <xsl:when test="$element = 'Dupe_Yellow_Separation_Matrix'"/>
                            <xsl:when test="$element = 'Dupe_Cyan_Separation_Matrix'"/>
                            <xsl:when test="$element = 'Colour_Positive_Technovision'"/>
                            <xsl:when test="$element = 'BW_Negative_and_Positive'"/>
                            <xsl:when test="$element = 'Reversal_Colour_Positive'"/>
                            <xsl:when test="$element = 'Red_Separation_Promaster'"/>
                            <xsl:when test="$element = 'Lavender'"/>
                            <xsl:when test="$element = 'Master_BW_Positive'"/>
                            <xsl:when test="$element = 'Green_Separation_Promaster'"/>
                            <xsl:when test="$element = 'Blue_Separation_Promaster'"/>
                            <xsl:when test="$element = 'Dupe_Reversal_Colour_Positive'"/>
                            <xsl:when test="$element = 'Colour_Promaster'"/>
                            <xsl:when test="$element = 'Dupe_Reversal_BW_Positive'"/>
                            <xsl:when test="$element = 'Original_/_Dupe_Colour_Negative'"/>
                            <xsl:when test="$element = 'Original_Colour_Internegative'"/>
                            <xsl:when test="$element = 'Magenta_Colour_Promaster'"/>
                            <xsl:when test="$element = 'Dupe_Blue_Separation_Negative'"/>
                            <xsl:when test="$element = 'Colour_Reversal_Positive'"/>
                            <xsl:when test="$element = 'Original_Positive'"/>
                            <xsl:when test="$element = 'Reversal_Colour_Negative'"/>
                            <xsl:when test="$element = 'Telerecorded_Negative'"/>
                            <xsl:when test="$element = 'DAT'"/>
                            <xsl:when test="$element = 'Re-recorded_Positive'"/>
                            <xsl:when test="$element = 'Magenta'"/>
                            <xsl:when test="$element = 'X-Mods'"/>
                            <xsl:when test="$element = 'BW_Television_Print'"/>
                            <xsl:when test="$element = 'X-Mods_Positive'"/>
                            <xsl:when test="$element = 'Original_/_Dupe_BW_Negative'"/>
                            <xsl:when test="$element = 'Duplicating_BW_Negative'"/>
                            <xsl:when test="$element = 'Master_Negative'"/>
                            <xsl:when test="$element = 'Sepia_BW_and_Tinted_and_Toned_Positive'"/>
                            <xsl:when test="$element = '2_Colour_Separation_Negative'"/>
                            <xsl:when test="$element = 'Master_Magenta'"/>
                            <xsl:when test="$element = 'Original_Colour'"/>
                            <xsl:when test="$element = 'Sepia_Toned_Positive'"/>
                            <xsl:when test="$element = 'Master_Recording'"/>
                            <xsl:when test="$element = 'Separation_Matrix'"/>
                            <xsl:when test="$element = 'Original_Reversal_Positive'"/>
                            <xsl:when test="$element = 'Master_Cyan'"/>
                            <xsl:when test="$element = 'Yellow_Tinted_Positive'"/>
                            <xsl:when test="$element = 'TV_(low_contrast)_Colour_Positive'"/>
                            <xsl:when test="$element = 'BW_Tinted_and_Toned_Positive'"/>
                            <xsl:when test="$element = 'Yellow'"/>
                            <xsl:when test="$element = 'Successive_frame_Promaster'"/>
                            <xsl:when test="$element = 'Original_Colour_Negative_Technovision'"/>
                            <xsl:when test="$element = 'Master_Magenta_Separation_Promaster'"/>
                            <xsl:when test="$element = 'Duplicating_BW'"/>
                            <xsl:when test="$element = 'Reversal_BW'"/>
                            <xsl:when test="$element = 'Tinted_and_Toned'"/>
                            <xsl:when test="$element = 'Master_Yellow'"/>
                            <xsl:when test="$element = 'Dupe_X-Mods'"/>
                            <xsl:when test="$element = 'Original_Colour_Positive'"/>
                            <xsl:when test="$element = 'Cyan_Tape'"/>
                            <xsl:when test="$element = 'Dupe_Separation_Matrix'"/>
                            <xsl:when test="$element = 'Separation_Positive'"/>
                            <xsl:when test="$element = 'Dupe_Reversal_Colour_Internegative'"/>
                            <xsl:when test="$element = 'Orange_Tinted_Positive'"/>
                            <xsl:when test="$element = 'Original_BW_and_Colour_Negative'"/>
                            <xsl:when test="$element = 'Dupe_Negative_and_Positive'"/>
                            <xsl:when test="$element = 'Dupe_Lavender_Positive'"/>
                            <xsl:when test="$element = 'Cyan'"/>
                            <xsl:when test="$element = 'Original_Magenta_Separation_Matrix'"/>
                            <xsl:when test="$element = 'Colour_Check_Print'"/>
                            <xsl:when test="$element = 'Original_Yellow_Separation_Matrix'"/>
                            <xsl:when test="$element = 'TV_(low_contrast)_BW'"/>
                            <xsl:when test="$element = 'Original_Magenta_Separation_Positive'"/>
                            <xsl:when test="$element = 'Cyan_Negative'"/>
                            <xsl:when test="$element = 'X-Mods_Negative'"/>
                            <xsl:when test="$element = 'Answer_Print'"/>
                            <xsl:when test="$element = 'Dupe_Colour_Internegative'"/>
                            <xsl:when test="$element = 'Dupe_Blue_Negative'"/>
                            <xsl:when test="$element = 'BW_Tinted_Positive'"/>
                            <xsl:when test="$element = 'BW_and_Colour_Negative'"/>
                            <xsl:when test="$element = 'BW_and_Tinted_and_Toned'"/>
                            <xsl:when test="$element = 'Yellow_Separation'"/>
                            <xsl:when test="$element = 'Blue_Positive'"/>
                            <xsl:when test="$element = 'Original_Reversal_Colour_Positive_Monopack'"/>
                            <xsl:when test="$element = 'Colour_Negative_and_Positive'"/>
                            <xsl:when test="$element = 'Blue_Separation_Positive'"/>
                            <xsl:when test="$element = 'Original_Reversal_Colour_Internegative'"/>
                            <xsl:when test="$element = 'Blue_Tape'"/>
                            <xsl:when test="$element = 'Original_Cyan_Separation_Matrix'"/>
                            <xsl:when test="$element = 'Cyan_Matrix'"/>
                            <xsl:when test="$element = 'Original_Reversal'"/>
                            <xsl:when test="$element = 'Yellow_Negative'"/>
                            <xsl:when test="$element = 'Red_Separation_Positive'"/>
                            <xsl:when test="$element = 'Colour_Answer_Print'"/>
                            <xsl:when test="$element = 'Reversal_Disc'"/>
                            <xsl:when test="$element = 'Original_Negative_and_Positive'"/>
                            <xsl:when test="$element = 'Dupe_Green_Separation_Negative'"/>
                            <xsl:when test="$element = 'Magenta_Matrix'"/>
                            <xsl:when test="$element = 'Duplicating_Colour_Positive'"/>
                            <xsl:when test="$element = 'Tinted_and_Tinted_and_Toned_Positive'"/>
                            <xsl:when test="$element = 'Magenta_Positive'"/>
                            <xsl:when test="$element = 'Magenta_Separation'"/>
                            <xsl:when test="$element = 'Successive_frame_Negative'"/>
                            <xsl:when test="$element = 'Lavender_Duplicating_Positive'"/>
                            <xsl:when test="$element = 'Laserdisc'"/>
                            <xsl:when test="$element = 'Magnetic_Recording_3_Track_Stereophonic'"/>
                            <xsl:when test="$element = 'Sepia_Positive'"/>
                            <xsl:when test="$element = 'Duplicating_Reversal'"/>
                            <xsl:when test="$element = 'Duplicating_Negative_and_Positive'"/>
                            <xsl:when test="$element = 'Duplicating_Lavender_Negative_and_Positive'"/>
                            <xsl:when test="$element = 'Dupe_Lavender_Negative'"/>
                            <xsl:when test="$element = 'Master_Cyan_Separation'"/>
                            <xsl:when test="$element = 'Dupe_Magenta_Negative'"/>
                            <xsl:when test="$element = 'Magenta_Negative'"/>
                            <xsl:when test="$element = 'Master_Separation'"/>
                            <xsl:when test="$element = 'Master_X-Mods_Positive'"/>
                            <xsl:when test="$element = 'Original_/_Dupe_BW_Negative_and_Positive'"/>
                            <xsl:when test="$element = 'Original_/_Dupe'"/>
                            <xsl:when test="$element = 'Master_Yellow_Separation_Promaster'"/>
                            <xsl:when test="$element = 'Dupe_Red_Negative'"/>
                            <xsl:when test="$element = 'Tinted_and_Stencil_Positive'"/>
                            <xsl:when test="$element = 'TV_(low_contrast)_BW_and_Colour_Positive'"/>
                            <xsl:when test="$element = 'Re-recorded_Internegative'"/>
                            <xsl:when test="$element = 'Successive_frame_Colour_Promaster'"/>
                            <xsl:when test="$element = 'Reversal_Colour_Interpositive'"/>
                            <xsl:when test="$element = 'Successive_frame_Separation_Promaster'"/>
                            <xsl:when test="$element = 'Yellow_BW_Positive'"/>
                            <xsl:when test="$element = 'Reversal_Negative'"/>
                            <xsl:when test="$element = 'Toned_Positive'"/>
                            <xsl:when test="$element = 'Red'"/>
                            <xsl:when test="$element = 'Reversal'"/>
                            <xsl:when test="$element = 'Red_Negative'"/>
                            <xsl:when test="$element = 'Toned'"/>
                            <xsl:when test="$element = 'Sepia_Internegative'"/>
                            <xsl:when test="$element = 'Telerecorded_BW_and_Tinted_Positive'"/>
                            <xsl:when test="$element = 'Sepia_BW_Positive'"/>
                            <xsl:when test="$element = 'Tinted'"/>
                            <xsl:when test="$element = 'Tinted_Negative_and_Positive'"/>
                            <xsl:when test="$element = 'Separation_Negative_and_Positive'"/>
                            <xsl:when test="$element = 'Tri_Negative'"/>
                            <xsl:when test="$element = '2_Colour_Positive'"/>
                            <xsl:when test="$element = 'Pink'"/>
                            <xsl:when test="$element = 'Dupe_Successive_frame_Colour_Negative'"/>
                            <xsl:when test="$element = 'Duplicating_Tape'"/>
                            <xsl:when test="$element = 'Duplicating_Reversal_Colour_Positive'"/>
                            <xsl:when test="$element = 'Duplicating_Reversal_BW_Positive'"/>
                            <xsl:when test="$element = 'Duplicating_Promaster'"/>
                            <xsl:when test="$element = 'Duplicating_Lavender_Colour_Positive'"/>
                            <xsl:when test="$element = 'Duplicating_Lavender_BW_Positive'"/>
                            <xsl:when test="$element = 'Duplicating_Colour_Interpositive'"/>
                            <xsl:when test="$element = 'Duplicating_Blue_Colour_Positive'"/>
                            <xsl:when test="$element = 'Duplicating_BW_and_Tinted_Positive'"/>
                            <xsl:when test="$element = 'Duplicating_BW_Negative_and_Positive'"/>
                            <xsl:when test="$element = 'Duplicating_Amber_Tinted_Positive'"/>
                            <xsl:when test="$element = 'Dupe_Yellow_and_Magenta_Separation_Negative'"/>
                            <xsl:when test="$element = 'Dupe_X-Mods_Negative'"/>
                            <xsl:when test="$element = 'Dupe_Successive_frame_Separation_Negative'"/>
                            <xsl:when test="$element = 'Dupe_Separation_Promaster'"/>
                            <xsl:when test="$element = 'Green_Separation_Positive'"/>
                            <xsl:when test="$element = 'Dupe_Internegative'"/>
                            <xsl:when test="$element = 'Dupe_Cyan_Separation'"/>
                            <xsl:when test="$element = 'Dupe_Copper_Separation_Matrix'"/>
                            <xsl:when test="$element = 'Dupe_Colour_Reversal_Positive'"/>
                            <xsl:when test="$element = 'Dupe_BW_Reversal_Positive'"/>
                            <xsl:when test="$element = 'DTS_Colour'"/>
                            <xsl:when test="$element = 'Cyan_Separation'"/>
                            <xsl:when test="$element = 'Cyan_BW_Positive'"/>
                            <xsl:when test="$element = 'Blue_Toned_Positive'"/>
                            <xsl:when test="$element = 'Blue_Negative'"/>
                            <xsl:when test="$element = 'Blue_BW_Positive'"/>
                            <xsl:when test="$element = 'Blue'"/>
                            <xsl:when test="$element = 'BW_and_Tinted'"/>
                            <xsl:when test="$element = 'BW_Interpositive'"/>
                            <xsl:when test="$element = 'Duplicating_Tinted_and_Toned_Positive'"/>
                            <xsl:when test="$element = 'Lavender_BW_Positive'"/>
                            <xsl:when test="$element = 'Original_Yellow_Separation_Positive'"/>
                            <xsl:when test="$element = 'Original_/_Dupe_Positive'"/>
                            <xsl:when test="$element = 'Original_X-Mods_Negative'"/>
                            <xsl:when test="$element = 'Original_Separation_Negative_and_Positive'"/>
                            <xsl:when test="$element = 'Original_Reversal_Colour_Negative'"/>
                            <xsl:when test="$element = 'Original_Reversal_Colour'"/>
                            <xsl:when test="$element = 'Original_Reversal_BW_Positive'"/>
                            <xsl:when test="$element = 'Original_Red_Separation_Negative'"/>
                            <xsl:when test="$element = 'Original_Promaster'"/>
                            <xsl:when test="$element = 'Original_Grey_base_Colour_Negative'"/>
                            <xsl:when test="$element = 'Original_Grey_base_Colour_Internegative'"/>
                            <xsl:when test="$element = 'Original_Cyan_Separation_Positive'"/>
                            <xsl:when test="$element = 'Original_Colour_Interpositive'"/>
                            <xsl:when test="$element = 'Original_Blue_Separation_Negative'"/>
                            <xsl:when test="$element = 'Original_BW_and_Colour_Interpositive'"/>
                            <xsl:when test="$element = 'Original_BW_Negative_and_Positive'"/>
                            <xsl:when test="$element = 'Orange_Colour_Positive'"/>
                            <xsl:when test="$element = 'Lavender_BW_and_Tinted_Positive'"/>
                            <xsl:when test="$element = 'Orange_BW_and_Tinted_Positive'"/>
                            <xsl:when test="$element = 'Orange_BW_Positive'"/>
                            <xsl:when test="$element = 'Master_Yellow_Separation'"/>
                            <xsl:when test="$element = 'Master_Magnetic_Recording'"/>
                            <xsl:when test="$element = 'Master_Magenta_Separation'"/>
                            <xsl:when test="$element = 'Master_Cyan_Separation_Promaster'"/>
                            <xsl:when test="$element = 'Master_Cyan_Promaster'"/>
                            <xsl:when test="$element = 'Master_Colour_Interpositive'"/>
                            <xsl:when test="$element = 'Master_Colour'"/>
                            <xsl:when test="$element = 'Master_BW'"/>
                            <xsl:when test="$element = 'Magnetic_Recording_Loop'"/>
                            <xsl:when test="$element = 'Magenta_Colour_Positive'"/>
                            <xsl:when test="$element = 'Magenta_Colour_Negative'"/>
                            <xsl:when test="$element = 'Magenta_BW_Positive'"/>
                            <xsl:when test="$element = 'Magnetic_Cassette_Recording'"/>
                            <xsl:otherwise>
                                <fiaf:isElement rdf:resource="bfi://vocabulary/element/{$element}" />
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:for-each> 

                </rdf:Description>
            </xsl:for-each>
        </rdf:RDF>
    </xsl:template>

</xsl:stylesheet>