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

    <xsl:template match="/adlibXML">
        <rdf:RDF>
            <xsl:for-each select="recordList/record">
                <rdf:Description rdf:about="bfi://resource/item/{@priref}">
                    <rdf:type rdf:resource="bfi://ontology/item" />

                    <!-- question, does this handle multiples? -->

                    <!-- <xsl:variable name="country" select="translate(production_country, ' ', '_')" /> -->
                    <!-- <fiaf:hasCountry rdf:resource="bfi://vocabulary/country/{$country}" /> -->

                </rdf:Description>

            </xsl:for-each>
        </rdf:RDF>
    </xsl:template>

</xsl:stylesheet>