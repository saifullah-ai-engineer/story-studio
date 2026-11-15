# Historical Realism Narrative Style

Style ID: `historical-realism`. The following are visual rules to be grounded concretely in every prompt, not a prefix to be pasted word for word. Subject, era, people, shot size, and the user's explicit changes take priority; the default is not a fixed Qing dynasty subject.

## Body-Text Reference Status

The current package has no categorized and verified finished body-text work in this style yet. Follow this file's rules, and matching references provided by the user for this issue may be used; do not pass off impasto comic images, black-and-white images, or cover images as this style's benchmark. The method for actually viewing, passing in, and recording reference images is in the [Body-Style Reference Library](../references/style-reference-library.md). Missing built-in references does not block feasible prompt or image work, but it cannot be claimed that built-in realism references were passed in.

## Core Visuals

A serious historical subject's realistic narrative illustration, with the real people, space, and lighting of a historical film still, while keeping the fine color layers and soft edges of classical realistic oil painting. People and key objects are realistic, with the distant view slightly painterly. The surface is matte, rich in detail but not over-sharpened, with no heavy oil-painting brushstrokes, plastic skin, smooth 3D rendering, or game key-art texture.

Faces show natural bone structure, age texture, beards, and skin detail; expressions are restrained, telling the story through gaze, posture, gestures, and other people's reactions. People are in the middle of events, not posing at the camera. Clothing has weight, folds, and wear suited to the identity; only fabrics, writing media, and other materials available in that period and region are used, showing the distinct textures of wood, bamboo, cloth and silk, paper, leather, or metal objects actually in frame, without defaulting to cotton cloth and paper ledgers as the standard for every era. Old things do not mean every person's clothes are ragged, and do not mean every object is an antique.

## Space and Composition

Default 9:16 vertical depth composition, organizing the image around a clear main event. When a medium-wide shot fits, use a few related objects in the foreground to establish the scene, let the midground carry the people's actions, and let the background explain the environment or the event's scale. The foreground may be slightly soft, with the background still recognizable, avoiding overly shallow depth of field and wide-angle distortion.

Doors and windows, columns, tents, and city gates may be used as natural framing, but only when the scene makes it reasonable. Roads, queues, and mountain shapes can build depth. Figure-led shots, two-person interaction, crowd deliberation, marching vistas, close-ups, and environmental empty shots are chosen per the storyboard's needs, without always arranging a desk and a door frame.

Crowds have different poses, orientations, and reactions, without neat copying. First guarantee one main event is clear, avoiding cramming every image from one voiceover sentence into a single picture.

## Color and Lighting

Low to low-medium saturation, based on smoky grey, charcoal black, grey-brown, old-paper ochre-yellow, and faded indigo, with a little dark gold for old embroidery, bronze, or local light that fits the plot. Bring in necessary natural colors by region and scene, without applying a yellow-brown filter to the whole image.

- Daylight: overcast scattered light, side light from doors and windows, or low-angle sunlight, with warm-grey bright areas and cooler dark areas forming a restrained distinction. Not every image is gloomy; overall brightness may rise with the daytime environment.
- Night: grey-blue ambient light with local warm lamplight; faces, hands, and important objects are clearly lit.
- Dark areas are heavy but keep detail, and bright areas are soft without overexposure. Dust and mist are only for evidenced environments and near-far layering, without covering the main subject. Avoid excessive HDR, glare, and exaggerated rim light.

## Real Space and Montage

Default is a single real space, with unified perspective and lighting, and no floating documents, figure phantoms, or second scenes.

Use historical montage only when the upstream specifies it or the narrative clearly needs a symbolic dissolve: keep one complete main scene, and blend one low-contrast secondary image into the upper distance, sky, or a building opening, joining the edges with thin mist and similar tones. It is a narrative dissolve, not a claim that two places are physically connected; no split screen, no collage borders, and no multiple images competing for the center.

## Image Surface and Subtitles

Slight fine grain, natural old-material texture, and restrained edge darkening, with the main subject always clear. By default, no large areas of scratches, stains, snow, white floating light spots, or heavy vignetting. These elements in reference screenshots may include video overlays, and must not be treated as required base-image features.

By default, no subtitles, titles, watermarks, logos, or borders are generated. When used for short video and the upstream has not specified otherwise, arrange relatively low-interference content in roughly the lower third of the image, keeping key faces and hands out of that region; do not leave a white bar or hollow out the environment. When text is explicitly requested, follow the user's text and position, without mechanically applying the no-text rule.

## Historical Content Constraints

The dynasty is decided by the events the manuscript depicts, not by the reference images or this style. Before generating, follow [Era Identification and Appearance Adaptation](../references/period-context.md), grounding the judged era in concrete appearance; do not merely change the prompt title from "Qing dynasty" to another dynasty. Character face continuity and painting style may be kept, but hairstyles, clothing forms, furniture, and objects must adjust with the actual period. The color system must not override evidenced clothing colors and materials; it only applies overall saturation and lighting treatment to them.

Clothing, hairstyles, architecture, weapons, and transport follow the specified era and region; the image is a historical-subject creation, and must not be called a historical source reconstruction just because the image is realistic. Without a source, do not invent readable document content, precise historical map boundaries, or specific historical facts about people. When an accurate map is needed, use a map the user provided or one already verified; ordinary background paper may show blurred ink marks, but modern administrative divisions must not be decoratively applied to antiquity.

## Prompt Combination

Select and realistically render per the current shot: theme and event moment, then people and action, then scene and space, then core material style, then period light and color, then shot size and visual focus, then frame size, subtitles, and necessary exclusions.

The final prompt holds only the current shot's definite choices, with no leftover fill-in markers, unchosen day/night options, unchosen compositions, or "same style as the previous image". Keep the content observable; for example, "only a few ingots at the bottom of the open money chest" is better than only writing "funds are tight".

## Voiceover Pacing and Image Readability

Storyboarding and illustration uniformly follow [Illustration and Voiceover Pacing](../references/narration-pacing.md), without changing image density by style. A short-dwell image keeps only one subject and action recognizable at a glance; a longer image may add spatial layers related to the source text, but must not pile in events not yet spoken. Realistic detail serves the main subject; avoid asking viewers to find the focus in a crowded crowd in a short shot.
