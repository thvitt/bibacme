<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
    <sch:title>Esquema para el archivo "authors.xml" en Bib-ACMé</sch:title>
    <sch:p>Autora: Ulrike Henny-Krahmer</sch:p>
    <sch:ns uri="http://www.tei-c.org/ns/1.0" prefix="tei"/>
    
    <sch:pattern>
        <sch:rule context="tei:listPerson/tei:person">
            <sch:let name="author-id" value="@xml:id"/>
            <sch:assert test="matches($author-id,'^A\d+$')">The id of an author should have the form "A + number"</sch:assert>
            <sch:assert test="doc('../data/works.xml')//tei:bibl[tei:author/@key = $author-id]">There is no corresponding author-id in works.xml</sch:assert>
        </sch:rule>
        <sch:rule context="tei:nationality">
            <sch:assert test=". = doc('../data/nationalities.xml')//tei:term[@type='general']">The nationality is missing in nationalities.xml.</sch:assert>
        </sch:rule>
    </sch:pattern>
</sch:schema>