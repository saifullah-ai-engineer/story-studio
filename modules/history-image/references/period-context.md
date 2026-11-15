# Identifying the Era from the Manuscript and Adapting the Image

Goal: identify the historical background of the depicted content from the narration without the user filling in the dynasty, then ground that background in visible period features. What is kept is the user's chosen style, not Qing-dynasty styling or the emperor figures in the comic references; era adaptation applies equally to the historical realism style, the impasto historical comic style, and the monochrome narrative style. This document is not a dynasty costume encyclopedia, and a few popular symbols do not substitute for specific research.

## Identify the Event First, Then Fix Time and Space

1. Read the available full text, surrounding passages, and storyboard, and identify the people and events this shot truly depicts. Distinguish the story's time, the narration's speaking time, the time of a quoted ancient figure, and the time of a comparison object. Voiceover phrasing like "today we talk about" or "just a few days ago" cannot be used directly to date a historical image.
2. Prefer the definite year, era name, dynasty, reigning figure, and place names matching this event; then cross-check people against specific events. When a person spans multiple regimes, use the current event's stage; a shared name, a repeated era name, or a bare "emperor, chancellor, general" cannot uniquely determine the dynasty.
3. The main timeline's time and space may carry over to later shots with no new time clues. When a switch like "twenty years ago, later, recalling, compared with the Tang dynasty" appears, judge whether the image shows the memory, the main-line conversation, or the comparison object. Do not mechanically assign the same dynasty to every shot in a whole piece.
4. Only use the precision the evidence supports: when the Tang dynasty is certain but the year is not, write Tang dynasty; when an era-name stage is known, write that period. Do not invent a precise year, place, or character age to fill a field.
5. Distinguish dynasty, region, regime, and population group. For parallel regimes, border regions, multi-ethnic settings, or cross-border events, dress each person by their identity in that place and time; do not put everyone in the same image into central official dress. For non-Chinese history, use the corresponding historical period and local regime; do not force Chinese dynasties onto it.

## Gaps and Conflicts

- When there are enough clues about people and events, infer actively, giving the conclusion and its basis in one brief sentence, instead of passing a decidable question back to the user.
- When only a broad period can be identified, keep the broad label and reduce decorative detail without evidence. When the era cannot be distinguished at all and it would significantly change the styling, ask only one key question, and first complete the prompts for the remaining shots that are certain.
- When an explicit dynasty, person, or year conflicts with another, point out the specific conflict; when changing it would affect a character's identity or the whole era, wait for clarification before generating the related images, and do not quietly turn the manuscript into a different story.
- When the user explicitly specifies an alternate-history, time-travel, or cross-era look, follow their creative setting, marking each element's source era separately, and do not treat it as a true historical reconstruction.
- When the era of key costume forms, landmark buildings, or military equipment is in doubt, prefer verifying against the user's material or available reliable sources, such as museum collection notes, archaeological material, or specialist research; when verification is impossible, lower the detail precision and state the uncertainty. There is no need to force comprehensive research for every ordinary shot, and do not write unqueried memory as "verified".

## Grounding the Judgment in a Period Setting

For each shot, build a brief working record: dynasty or regime, period, region, the main people's identities, the basis for the judgment, what is still uncertain, and the actual appearance constraints for what enters the frame. The structured fields are in [Storyboard Input Conventions](storyboard-interface.md). There is no need to show the user a long internal table.

Check only the following dimensions for what actually enters the frame:

| Dimension | Appearance and conditions to ground |
| --- | --- |
| Character identity | Age stage, gender, social identity, official/civilian/military distinction, ethnicity, and local custom; do not draw everyone in one dynasty as the same kind of person |
| Clothing and headwear | Collar type, sleeve type, garment length, layers, belts, hats, and caps, by identity and occasion; court dress, everyday dress, and military dress cannot be swapped |
| Hairstyles and beards | The hair-bundling, cap-and-cloth, shaved-head, or queue customs of that population group at the time; the Qing queue and official hat do not spill into other eras, and do not apply them indiscriminately to every Qing figure |
| Architecture and interiors | Regional buildings, roofs, doors and windows, walls, seating, and furnishings; do not put late-period palaces, carved windows, and high tables and chairs into every ancient scene |
| Writing and trade | The bamboo slips, silk, paper, and book forms in use at the time, plus writing tools, currency, and payment methods; do not treat thread-bound ledgers, deckle-edged paper, and silver ingots as universal ancient props |
| Military and transport | Armor, weapons, horse gear, carts and boats, and loading methods matching the era, region, and unit; distinguish when objects appeared and where they were actually used |
| Craft and detail | The period suitability of fabrics, porcelain, metal, lighting, and patterns; when the grade color or specific pattern is uncertain, use a conservative description and do not invent a precise system |

Write the most identifying visible features into the prompt. For example, a Han dynasty shot should state the clothing, head cloth, and writing medium for that identity and period, and exclude mistakenly carried Qing official hats and queues; writing only "fits the Han dynasty" is not enough. "One fixed costume per dynasty" is equally wrong; period, identity, region, and occasion must still be considered.

When a reference image has out-of-period clothing, the face identity, pose, or painting texture may be kept, with an explicit requirement to replace its clothing and props. Out-of-period looks that were explicitly requested to be kept are handled per the user's alternate-history setting. Historical settings take priority over the paper, lamps, and character dress in old examples.

## Across Shots and Montage

Reuse the period setting within one continuous time span, and recheck it when a memory, identity change, or dynastic change occurs. Character IDs stay, but age stage, clothing, and objects change with the plot. In a cross-era montage, specify the period of the people and objects in each region separately, and do not let two sets of clothing mix on the same person.

## Delivery and Checking

In natural-language delivery, first write: "Based on a certain person and event in the manuscript, this shot is set in a certain dynasty and period, in a certain region." Each shot's complete prompt still contains this shot's time, space, and concrete appearance, without relying on that general statement. After actual generation, check the visible period elements; a correct prompt does not mean the model drew nothing wrong.

When maintaining these rules, use the following scenarios as adversarial walkthroughs, without calling rule coverage completed image testing:

| Input scenario | Expected judgment and behavior |
| --- | --- |
| No dynasty written, but clearly "after Li Shimin took the throne, he discussed policy with Wei Zheng" | Identify the corresponding Tang dynasty stage, adapt clothing and architecture by character identity, do not carry over the Qing example, and do not invent a specific year |
| A Ming dynasty official quotes Tang Taizong during a discussion | The current discussion image stays Ming; only switch the look when explicitly cutting to a Tang memory or comparison image |
| The storyboard cuts from the Ming main line to an old Han dynasty event | Keep the shot numbers and the narrative switch, forming two period settings shot by shot, without sharing one clothing and prop list |
| Only "old minister raising military funds", with no background in this piece | Do not default to the Qing dynasty because of the verified example; ask about the era; when this project's background is already definite, inherit it |
| Marked "Tang dynasty", but the upstream gives a Qing queue and official-hat reference image | Point out the period-appearance conflict, keep the identity features, and change to the matching period's look; when time travel is explicitly requested, respect the setting |

## Per-Shot Realism Constraints for Character Biographies (added 2026-09-11)

Core principle: style only controls the manner of depiction; people and scenes are decided by the shot's actual event era, region, age, identity, and occasion. Black and white does not equal the Republic of China era, and impasto does not equal antiquity; do not use the style screenshots' people, clothing, and environments as cross-project templates.

- **Build the character timeline first, then write the image.** Read the whole manuscript, determine the actual depicted event period shot by shot, and record age stage, place, occupation or social identity, and occasion. Judge different people separately, and judge the same person's childhood, youth, and middle to late years separately; memories follow the remembered period, not the narration point.
- **Appearance and clothing each need evidence.** For people with photos, verify the visible face, hairstyle, makeup, build, and clothing against real photos from the same period; stage costumes, film-role costumes, or formal dress in photos are only for the matching occasion, and must not be generalized into everyday dress. For ancient figures without photos, design cautiously from credible portraits, archaeology, or written material, without promising a true face reconstruction. Ordinary supporting characters likewise fit the age, occupation, region, and identity of the time.
- **Ground the environment in the place and time.** Choose clothing forms, materials, shoes and hats, accessories, and buildings, doors and windows, furniture, lighting, transport, communications, writing tools, and daily items of types actually available in that period and suited to the scene. Not every person "from the past" wears a long gown or lives in a broken house; and a contemporary person must not be changed into a Republic of China era look because of a black-and-white style.
- **Reference priority.** Verified facts and same-period material that apply to this shot take priority over style screenshots, film and TV impressions, and existing generated images; when the user explicitly requests alternate history, follow their setting and mark it. Do not invent precise uniform insignia, trophies, or building details that the material does not support as established facts. Actively search for sources on key doubts; when something cannot be confirmed, record it as unknown or use a less detailed depiction, and do not call it a precise reconstruction.
- **Carry the constraints into every shot.** Write the actually selected clothing and hairstyles, character stage, and key environmental objects in `period_context.visual_constraints` and in the standalone prompt, not only "fits the era". Link the staged basis through `character_stage_ids` and `reference_ids`; when there is no reference, leave it honestly empty and explain, without inventing a file.
- **Check twice, before and after image generation.** Before generating, check whether the character stage, reference inputs, and period setting match; after generating, open the image and check the actual age, clothing, hairstyles, and environment drawn, without equating a correct prompt with a correct image. When an anachronism is found, handle it per the main entry point's revision rules, and note the remaining uncertainty in the delivery.

Adversarial walkthrough: a black-and-white portrait of a contemporary actor should keep modern dress; the same person cutting from youth to old age must switch to the matching stage's face; ancient figures do not carry modern communications devices; a formal-dress photo does not mean formal dress in a labor scene; an old home in a memory does not use a modern interior from later years. These are rule-check cases, not completed image tests.
