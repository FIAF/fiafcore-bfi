# FIAFcore [BFI]

Conformation of BFI data to FIAFcore.

**Mapping: Work**

A moving image Work comprises both the intellectual or artistic content and the process of realisation in a cinematographic medium.

| fiaf | bfi |
| -- | -- |
| rdf:type |  |
| fiaf:hasCountry | production_country |
| fiaf:hasEvent (production) | cast, credits |
| fiaf:hasForm |  |
| fiaf:hasGenre | Content_genre/content.genre |
| fiaf:hasIdentifier | @priref |
| fiaf:hasLanguageUsage |  |
| fiaf:hasManifestation | parts_reference.lref |
| fiaf:hasSubject | Content_subject/content.subject |
| fiaf:hasTitle | Title/title  |
| fiaf:hasVariant |  |
| fiaf:hasWork |  |

**Mapping: Variant**

A moving image Variant is an entity that may be used to indicate any change to content-related characteristics that do not significantly change the overall content of a Work as a whole.

| fiaf | bfi |
| -- | -- |
| rdf:type |  |
| fiaf:hasEvent |  |
| fiaf:hasIdentifier |  |
| fiaf:hasLanguageUsage |  |
| fiaf:hasManifestation |  |
| fiaf:hasTitle |  |

**Mapping: Manifestation**

A moving image Manifestation is the embodiment of a moving image Work or Variant. Manifestations usually include all analogue, digital and online media associated with a particular embodiment of a Work or Variant.

| fiaf | bfi |
| -- | -- |
| rdf:type | manifestationlevel_type/value[@lang='0'] |
| fiaf:hasColourCharacteristic | colour_manifestation/value[@lang='0'] |
| fiaf:hasEvent |  |
| fiaf:hasExtent |  |
| fiaf:hasFormat | format_low_level |
| fiaf:hasIdentifier | @priref |
| fiaf:hasImageCharacteristic |  |
| fiaf:hasItem | parts_reference.lref |
| fiaf:hasLanguageUsage | language/language.type/value[@lang='0'] |
| fiaf:hasSoundCharacteristic | sound_manifestation/value[@lang='0'] |
| fiaf:hasTitle |  |

**Mapping: Item**

A moving image Item is the physical or digital product of a Manifestation of a Work or Variant, i.e. the actual copy of a Work or Variant. Whereas the Manifestation record describes the “ideal” of a particular format or publication, the Item record represents the actual holding in a repository's collection.

| fiaf | bfi |
| -- | -- |
| rdf:type |  |
| fiaf:hasBase | base/value[@lang='0'] |
| fiaf:hasBroadcastStandard |  |
| fiaf:hasCarrier |  |
| fiaf:hasColourCharacteristic |  |
| fiaf:hasEvent | Dimension/dimension.value |
| fiaf:hasExtent |  |
| fiaf:hasFormat | gauge_film/value[@lang='0'] |
| fiaf:hasFrameRate |  |
| fiaf:hasHoldingInstitution | "BFI" |
| fiaf:hasIdentifier | @priref |
| fiaf:hasImageCharacteristic |  |
| fiaf:hasLineStandard |  |
| fiaf:hasResolution |  |
| fiaf:hasSoundCharacteristic | sound_item/value[@lang='0'] |
| fiaf:hasSourceDevice |  |
| fiaf:hasSourceSoftware |  |
| fiaf:hasStatus | copy_status/value[@lang='0'] |
| fiaf:hasStock | stock/stock_film |
| fiaf:hasStream |  |
| fiaf:hasTitle |  |
| fiaf:hasTransferSpeed |  |
| fiaf:isElement | physical_description |

**Mapping: Carrier**

A moving image Carrier is the discrete physical unit on which the moving image is retained. It can either contain the entire artistic work or a portion, for example in the case of individual film reels.

| fiaf | bfi |
| -- | -- |
| rdf:type |  |
| fiaf:hasEvent |  |
| fiaf:hasIdentifier |  |

**Mapping: Event**

An Event characterises occurrences in the lifecycle of a moving image Work, Variant, Manifestation or Item. Instances of any Event can have Activity (and Agent) relationships.

| fiaf | bfi |
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

| fiaf | bfi |
| -- | -- |
| rdf:type |  |
| fiaf:hasAgent |  |

**Mapping: Agent**

Agents, whether for works/variants, manifestations, or items in moving images, are entities involved in their creation, exploitation, or preservation, with typical distinctions including person, corporate body, family, and person group, encompassing responsibilities such as release, distribution, acquisition, or preservation.

| fiaf | bfi |
| -- | -- |
| rdf:type |  |
| fiaf:hasIdentifier |  |



TODO example input/output here?

