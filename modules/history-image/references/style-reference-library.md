# Body-Style Reference Library

Before actual image generation, read this file and the chosen styles rules, and select references from the same group. Only maintaining the skill or discussing how to use it does not trigger image generation. When only storyboarding or prompting, references may be viewed to understand the style, but the image generation tool is not called.

## Library and Scope

The file index is [catalog.json](../assets/body-style-references/catalog.json), with image paths relative to the directory containing that index. The index stores file and pixel hashes, dimensions, actual image descriptions, and selection tags; it does not store original private paths, accounts, or session information.

| style_id | Current body-text references | Execution method |
| --- | --- | --- |
| historical-comic | 6 finished impasto historical comic works | Select same-group references per the table below, together with that style's text rules |
| monochrome-narrative | 6 finished monochrome narrative works | Select same-group references per the table below, keeping the pure black-and-white photographic language |
| historical-realism | No categorized and verified body-text reference images yet | Use the [Historical Realism Rules](../styles/historical-realism.md); the user may provide matching references, and do not use comic or black-and-white images as substitutes, without blocking feasible text or image work for that reason |

These images come from the user's existing creative material, viewed one by one and sampled by actual visual performance. They are for observing style, not historical source photos, character identity evidence, or research material for clothing and objects; the original generation model was not verified. Existing images and style names together do not support a conclusion that style reproduction on a specified model is verified.

## Impasto Historical Comic: HC01 to HC06

| ID and file | Actual image and applicable observation | Boundaries to keep when using |
| --- | --- | --- |
| [HC01 Dim Interior](../assets/body-style-references/historical-comic/HC01-dim-interior.png) | Figure in profile inside a tent, bright area outside the door; broken brushwork on face, clothing, wood, and background | For low light, layering, and materials; do not darken every new image or fix it as a military tent |
| [HC02 Outdoor Figure](../assets/body-style-references/historical-comic/HC02-outdoor-figure.png) | Bow-carrying figure, crowd, and clouds; block modeling and the relationship between fine and coarse brushwork | Do not copy the face, warfare, ragged clothing, or weapons; actions follow this shot |
| [HC03 Bright Interior](../assets/body-style-references/historical-comic/HC03-daylight-study.png) | Woman organizing bamboo slips; bright warm-grey layers, fine face and hands against a looser architectural background | Still life likewise uses impasto; do not fix the woman's face, the Han dynasty interior, or the bamboo slips |
| [HC04 Object Close-Up](../assets/body-style-references/historical-comic/HC04-object-detail.png) | Hand, bamboo slips, wooden desk, and side light; readable material of key objects | Reference only material and local light and shade; do not copy patterns, readable text, or object eras |
| [HC05 Wide Scene](../assets/body-style-references/historical-comic/HC05-wide-landscape.png) | Overhead view of a military camp, valley, and crowd; near-far layers and the warm bright area / grey-cold mountain relationship | Do not treat a large army, valley, or sunset as required elements for every shot |
| [HC06 Modern-Era Outdoor](../assets/body-style-references/historical-comic/HC06-modern-outdoor.png) | Uniformed figure beside a ship's rail; impasto material of sea, clouds, and greatcoat | For carrying the painting language across periods; people, uniforms, ships, and era are re-decided |

Stable features within the group: figures at near-realistic proportions; key faces and hands finer; visible painting brushwork on clothing, wood and stone, and clouds; layered ochre-brown and warm-grey bright areas, with grey-cold colors allowed in the environment. Scene light, shade, and mood follow this shot; do not reduce the whole style to a brown-yellow filter, tragedy, or war.

## Monochrome Narrative: MN01 to MN06

| ID and file | Actual image and applicable observation | Boundaries to keep when using |
| --- | --- | --- |
| [MN01 Window Manuscripts](../assets/body-style-references/monochrome-narrative/MN01-window-manuscripts.png) | Older woman organizing manuscripts; soft window light, age texture, rich midtones | Do not fix the person's face, age, desk, or era |
| [MN02 Night Exterior](../assets/body-style-references/monochrome-narrative/MN02-night-exterior.png) | Two women in front of a door with local lighting; light-and-shade layers of dark clothing and a reflective ground | Do not automatically add snow, a foreign-style house, fashion, or floating white dots; the environment follows this shot |
| [MN03 Outdoor Engineering](../assets/body-style-references/monochrome-narrative/MN03-outdoor-engineering.png) | Older person in the foreground, engineering works, and a river; bright grey scale and environmental depth | Do not treat the engineering scene as the new person's experience, and do not fix the safety helmet or occupation |
| [MN04 Indoor Discussion](../assets/body-style-references/monochrome-narrative/MN04-indoor-discussion.png) | A man presenting with listeners around a table; crowd sightlines, natural window light, and grey-scale material distinctions | Monochrome narrative does not limit gender; text, maps, and engineering material in the image are not copied or used as historical sources |
| [MN05 Empty Seascape](../assets/body-style-references/monochrome-narrative/MN05-seascape.png) | Sea, clouds, and low-angle skylight; material and grey-scale depth of an empty space | Do not repeat the sea in every shot, and do not treat a symbolic empty shot as this issue's real place |
| [MN06 Workshop Figure](../assets/body-style-references/monochrome-narrative/MN06-workshop.png) | A girl, an adult man behind her, and a sequence of machines; side light, age, and cloth/metal layering | The people's ages, occupations, and relationships are decided by this issue's material; do not assume child labor, suffering, or a textile factory by default |

Stable features within the group: photographic realism, pure black-and-white grey scale, natural age and materials; faces, hands, and dark areas keep detail, and bright daylight scenes are allowed; actions are restrained. Do not borrow the comic group's impasto brushwork or ochre-gold tones.

The reference originals are saved as RGB, with small channel differences, not pixel-level single-channel greyscale. This group passed visual and near-neutral grey-scale screening, with the measured channel differences recorded in the index; the residual color difference is not a target. Generation still follows the pure black-and-white rules; do not bring in warm brown or other color casts from the references.

## Before Image Generation: Select, View, and Pass In

1. Select a group by this project's confirmed style_id; do not infer the style from the subject, a person's gender, or a folder name. Usually select 1 to 3 images from the same group: one main visual benchmark, plus character/object/environment references as the shot needs. Do not mix two style groups in one pass, and do not require all 6 images to be passed in for every shot.
2. Actually open the images selected this time, and check the index description against the visible content. Filenames, old storyboard text, and already generated images may disagree; the actual image governs. When an image is missing, damaged, or hash-mismatched, state the gap; do not claim it was already viewed.
3. Mark the body-text reference as "only for style, material, lighting, and grey scale / color reference". This issue's character identity and age references, period setting, and action composition are provided separately; verified staged material for real people takes priority, and do not use a face from the library in place of the target person.
4. When the image generation tool used supports reference images, pass in the selected images through that tool's real image input, using the absolute path resolved at runtime; merely writing the filename in the prompt does not count as passing in the image. When the tool does not support it or cannot pass it in, keep the text style rules and record this run as text_only, without falsely claiming the reference image was injected.
5. Fix the main visual benchmark for the same project, keeping its ID across batches; this issue's first verified image may serve as a continuity aid, but keep the original style benchmark, to avoid drift from chaining only the previous image shot by shot. Update the benchmark only when the user explicitly asks to change the style.

It is recommended to add the following fields to the project STORYBOARD.json or existing production record; do not ask the user to fill them in by hand, and do not change the original shot numbers:

```json
{
  "style_id": "historical-comic",
  "style_reference_ids": ["HC03", "HC04"],
  "style_reference_roles": {
    "HC03": "主要画风、色层与脸手/背景笔触关系",
    "HC04": "关键物件材质与局部光照"
  },
  "style_reference_delivery": "pending",
  "style_review_status": "pending"
}
```

Fill style_reference_delivery with pending, attached, text_only, or unavailable according to actual execution. Only write attached when the tool actually received the image input; update style_review_status to matched or needs_revision only after actually viewing this issue's generated image, and do not fill in matched merely because the tool returned success.

## First Image and Follow-Up Verification

First compare this project's first actually generated image against the main reference before continuing with batch generation: check painting/photographic material, brush thickness or grey scale, light-and-shade layers, face and hand readability, and the subject-background relationship. Also check this shot's people, period, and action; matching style does not equal correct content.

Spot-check later batches and shots with clear scene or period changes. When color and black-and-white are mixed up, photographic and impasto styles are mixed up, the whole image is too dark, or a person is replaced by the reference image, first make a targeted correction, following the main module's revision count and delivery rules. When the tool cannot keep the visual reference or the result still does not match, report honestly, without guaranteeing full consistency across models.

The body-text library is not used for default cover layout. Covers continue to use their own cover rules and existing cover references, and identity photos are still handled per the [Real-Person Staged Photo Reference Flow](person-photo-reference.md).

## Resource Maintenance

Images are collected as pixel-identical PNG copies, with non-essential extra information removed; the original creative files are not distributed with the package. The pixel hashes in the index can verify the image, and file hashes verify the distributed version.

When replacing a reference, first actually view the candidate, confirm it belongs to the same style, and check faces and hands, material, text/watermarks, and private information, then update the index hash and this file. The general package only stores relative paths; do not add original material disk addresses, computer usernames, credentials, or private sessions. Collecting finished references carries no new redistribution license; the project's content and license notes still apply.
