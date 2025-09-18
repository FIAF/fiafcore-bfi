# FIAFcore [BFI]

Conformation of BFI data to FIAFcore.

**Mapping: Work**

| FIAFcore | BFI |
| -- | -- |
| rdf:type |  |
| fiafcore:hasCountry | production_country/text |
| fiafcore:hasForm |  |
| fiafcore:hasGenre | Content_genre/content.genre/text |
| fiafcore:hasIdentifier/fiafcore:hasIdentifierValue | @priref |
| fiafcore:hasLanguageUsage |  |
| fiafcore:hasLanguageUsage/fiafcore:hasLanguage |  |
| fiafcore:hasManifestation | parts_reference.lref |
| fiafcore:hasSubject | Content_subject/content.subject/text |
| fiafcore:hasTitle/rdf:type | Title/title.type/value/text |
| fiafcore:hasTitle/fiafcore:hasTitleValue | Title/title/text |

TODO example input/output here?

*Template below*

**Mapping: Work**

A moving image Work comprises both the intellectual or artistic content and the process of realisation in a cinematographic medium.

| fiaf | local |
| -- | -- |
| rdf:type |  |
| fiaf:hasCountry |  |
| fiaf:hasEvent |  |
| fiaf:hasForm |  |
| fiaf:hasGenre |  |
| fiaf:hasIdentifier |  |
| fiaf:hasLanguageUsage |  |
| fiaf:hasManifestation |  |
| fiaf:hasSubject |  |
| fiaf:hasTitle |  |
| fiaf:hasVariant |  |
| fiaf:hasWork |  |

**Mapping: Variant**

A moving image Variant is an entity that may be used to indicate any change to content-related characteristics that do not significantly change the overall content of a Work as a whole.

| fiaf | local |
| -- | -- |
| rdf:type |  |
| fiaf:hasEvent |  |
| fiaf:hasIdentifier |  |
| fiaf:hasLanguageUsage |  |
| fiaf:hasManifestation |  |
| fiaf:hasTitle |  |

**Mapping: Manifestation**

A moving image Manifestation is the embodiment of a moving image Work or Variant. Manifestations usually include all analogue, digital and online media associated with a particular embodiment of a Work or Variant.

| fiaf | local |
| -- | -- |
| rdf:type |  |
| fiaf:hasColourCharacteristic |  |
| fiaf:hasEvent |  |
| fiaf:hasExtent |  |
| fiaf:hasFormat |  |
| fiaf:hasIdentifier |  |
| fiaf:hasImageCharacteristic |  |
| fiaf:hasItem |  |
| fiaf:hasLanguageUsage |  |
| fiaf:hasSoundCharacteristic |  |
| fiaf:hasTitle |  |

**Mapping: Item**

A moving image Item is the physical or digital product of a Manifestation of a Work or Variant, i.e. the actual copy of a Work or Variant. Whereas the Manifestation record describes the “ideal” of a particular format or publication, the Item record represents the actual holding in a repository's collection.

| fiaf | local |
| -- | -- |
| rdf:type |  |
| fiaf:hasBase |  |
| fiaf:hasBroadcastStandard |  |
| fiaf:hasCarrier |  |
| fiaf:hasColourCharacteristic |  |
| fiaf:hasEvent |  |
| fiaf:hasExtent |  |
| fiaf:hasFormat |  |
| fiaf:hasFrameRate |  |
| fiaf:hasHoldingInstitution |  |
| fiaf:hasIdentifier |  |
| fiaf:hasImageCharacteristic |  |
| fiaf:hasLineStandard |  |
| fiaf:hasResolution |  |
| fiaf:hasSoundCharacteristic |  |
| fiaf:hasSourceDevice |  |
| fiaf:hasSourceSoftware |  |
| fiaf:hasStatus |  |
| fiaf:hasStock |  |
| fiaf:hasStream |  |
| fiaf:hasTitle |  |
| fiaf:hasTransferSpeed |  |
| fiaf:isElement |  |

**Mapping: Carrier**

A moving image Carrier is the discrete physical unit on which the moving image is retained. It can either contain the entire artistic work or a portion, for example in the case of individual film reels.

| fiaf | local |
| -- | -- |
| rdf:type |  |
| fiaf:hasEvent |  |
| fiaf:hasIdentifier |  |

**Mapping: Event**

An Event characterises occurrences in the lifecycle of a moving image Work, Variant, Manifestation or Item. Instances of any Event can have Activity (and Agent) relationships.

| fiaf | local |
| -- | -- |
| rdf:type |  |
| fiaf:hasAchievement |  |
| fiaf:hasActivity |  |
| fiaf:hasAwardName |  |
| fiaf:hasDate |  |
| fiaf:hasLocation |  |
| fiaf:nominationOnly |  |

**Mapping: Activity**

This describes the activity or role of the Agent in relation to the moving image Work/Variant, or to make explicit the relationship(s) between the Agent and the Manifestation or Item.

| fiaf | local |
| -- | -- |
| rdf:type |  |
| fiaf:hasAgent |  |

**Mapping: Agent**

Agents, whether for works/variants, manifestations, or items in moving images, are entities involved in their creation, exploitation, or preservation, with typical distinctions including person, corporate body, family, and person group, encompassing responsibilities such as release, distribution, acquisition, or preservation.

| fiaf | local |
| -- | -- |
| rdf:type |  |
| fiaf:hasIdentifier |  |
