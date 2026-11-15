# Monochrome Narrative Style

Style ID: `monochrome-narrative`. Aliases: monochrome narrative, monochrome documentary narrative style. It comes from visual distillation of eight screenshots of character narrative video, with six more finished body-text references included; the original generation model was not verified, so this cannot be used to claim reproduction on a specified model is verified. Screenshots and finished works only provide visual reference; subtitles, character identities, and plots are not historical evidence.

## Finished Body-Text References

The package includes six finished works, MN01 to MN06, selected, viewed, and passed in per the [Body-Style Reference Library](../references/style-reference-library.md). They cover window light, low-light exteriors, a bright engineering environment, an indoor crowd scene, an empty seascape, and workshop figures; the lighting and photographic language may be referenced, while specific character identities still use this issue's verified staged material. The small RGB residual color differences, text, and drawings in the reference originals are not generation targets; body text still requires pure black and white. Do not mix in comic-group references or titled covers.

## Core Visuals

Black-and-white historical film still texture, photographic realism, telling a person's experience through natural people, real space, and restrained action. Pure black-and-white grey scale, with no warm brown, yellowing, or blue casts, and no oil-painting brushwork, comic line art, or 3D rendering. Blacks are steady, midtones are rich, bright areas are soft, and faces, hands, and dark clothing keep their layers; bright daylight scenes are allowed, and tragedy must not be equated with pressing the whole image black.

Keep real bone structure, age texture, natural skin, and asymmetric details, avoiding uniform influencer faces, beautified smoothed skin, and modern fashion makeup. Clothing, hairstyles, architecture, paper and pens, furniture, trophies, and other items must fit the shot's era, region, identity, and specific event; old eras do not mean everything is broken down. For modern-era people, first follow the [Real-Person Staged Photo Reference Flow](../references/person-photo-reference.md). This style may also be used for other periods, but must not falsely claim photographic material existed at the time.

## Per-Shot Era and Realism Consistency

You must follow the [Era Identification and Per-Shot Realism Constraints for Character Biographies](../references/period-context.md). First judge each event's period, region, character age stage, identity, and occasion from the whole text, then choose the shot's face, clothing, hairstyle, makeup, architecture, and objects. Black and white is only a photographic manner of depiction; it does not default to the Republic of China era, old Shanghai, or a broken-down environment. When the same person crosses eras, keep the identity but update age and appearance; do not use a young face in old age, and do not use old-age clothing for childhood. Style screenshots only serve as lighting and composition reference, and cannot override real people and era evidence.

Every shot's complete prompt grounds the concrete visible appearance and environment; check the staged references before generating and check the actual result after generating. Mark parts with insufficient material as inferences, and do not call an AI scene reconstruction a historical source photo. This rule applies equally to storyboarding from new copy, writing prompts for an existing storyboard, and actual image generation.

## Light, Space, and Camera

Prefer natural window light, side light, and overcast diffused light; stage or award scenes are handled per the venue lighting. A single coherent space, reasonable perspective, moderate depth of field, with the background explaining the environment without stealing the subject. Fine film grain and slight edge darkening are usable; avoid heavy scratches, floating white dots, glare, overexposure, and excessive sharpening.

Default 9:16 vertical. Choose by narrative among a character close-up, a two-person dialogue medium shot, a stage full-body distant shot, a back view through a window, or an environmental empty shot, without fixing the camera position. Use door and window framing only when the scene makes it reasonable. One shot expresses one visible moment, showing relationships through gaze, gestures, distance, and objects; do not turn an abstract judgment into exaggerated wailing. Biographical portraits may look at the camera; event shots mainly use natural action.

## Base Images and Covers

When this style's cover is explicitly requested, the overall text style of the [Zhao Yiman Reference Image](../assets/cover-reference-zhao-yiman-3x4.png) may be used, following the [Monochrome Gold-Red Cover Rules](../references/monochrome-cover-design.md). The reference image must actually be opened and passed in, referencing the large-character calligraphy forms, brush rhythm, flying white, gold-leaf texture, and gold-red hierarchy; people, copy, and background are redesigned from this issue's full text. These rules apply only to explicitly requested covers.

Base images have no subtitles, titles, logos, watermarks, play triangles, or borders; do not copy the yellow text, upper-right logo, or floating dust effects from the screenshots. Keep roughly the lower quarter to third as low interference as possible, with faces and key hands away from subtitle coverage positions, without hollowing out or adding white bars.

By default, this style outputs only 9:16 vertical pure images, adding no text, fonts, titles, or subtitles of any kind, and does not automatically generate an extra cover. This rule overrides the main entry point's default two titled covers; only when the user later explicitly requests a cover, text, or another ratio is the new request followed.

The skill includes a Chang Xiangyu cover reference, for black-and-white figures, gold large-character calligraphy, cinnabar-red emphasis characters, and smoky-ink blending. When a 3:4 or 4:3 cover is explicitly requested, follow the [Confirmed Cover Rules](../references/monochrome-cover-design.md). Covers allow gold-red text and narrative montage; body-text base images still stay text-free and pure black and white, with no cover added automatically.

## Prompt Organization

Write each shot independently and clearly: event era and place, then the character and age stage, then verified character reference images and their uses, then one action and character relationship, then the period environment, then black-and-white cinematic photography, lighting, and grey scale, then shot size and composition, then frame size and exclusions. Character photos constrain bone structure and stage appearance, and style screenshots only constrain photographic language; when they conflict, real-person references and historical fact come first. A file path or name does not equal an image already passed in.

A reusable style passage (to be merged with the specific shot's content; it cannot replace a complete prompt on its own):

> Black-and-white character biography film still, photographic realism, pure black-and-white grey scale, rich and fine midtones, steady dark areas that keep detail, soft bright areas without overexposure. Natural faces with real age texture, restrained expressions and actions, real texture in cloth, wood, and space, reasonable perspective and moderate depth of field, slight film grain. 9:16 vertical, no subtitles, titles, watermarks, logos, play buttons, or borders, no oil-painting brushwork, comic lines, beautified plastic skin, heavy vignetting, or floating white dots.

## Pre-Delivery Checks

1. Was the black and white made dead black across the whole image, or yellowed? Check faces, hands, clothing, and midtones.
2. Were subtitles, play buttons, logos, or reference-image plots copied? Remove interface elements, and verify facts separately.
3. Was a young face applied to every era, or did style references override character identity? Check each shot's period against the real photos.
4. Were era props, trophies, or clothing claimed as precise reconstructions without a source? Record the uncertainty and fix it.
5. Was similarity or generation quality claimed as verified from the prompt alone? Visual check results may only be reported after actually viewing the result and comparing it against the reference; one hundred percent reproduction cannot be guaranteed.

## Voiceover Pacing and Image Readability

Storyboarding and illustration uniformly follow [Illustration and Voiceover Pacing](../references/narration-pacing.md), without changing image density by style. A short-dwell image keeps only one subject and action recognizable at a glance; a longer image may add spatial layers related to the source text, but must not pile in events not yet spoken. Use grey-scale layers to separate people from the background; restrained narrative does not mean one portrait carries a long stretch of voiceover.
