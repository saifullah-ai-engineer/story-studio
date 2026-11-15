# Real-Person Staged Photo Reference Flow

For real people with verifiable photos, especially modern-era biographies; applies to all styles, and is enabled by default for the monochrome narrative style. The goal is to check three things separately: that it looks like the person, that it fits the age and dress of the time, and that it fits the event facts. A similar face does not prove the scene happened, and a generated image cannot stand as a historical photo.

## 1. Build a Person and Period Index

Extract from the manuscript the person's name, identity, birth and death years (when evidenced), event years, and age stages. Link the whole piece with a stable character_id; for the same person, build separate stage_ids for youth, middle age, and old age, or divide them by specific experiences. Do not cut stages mechanically by fixed ages. When the birth year or event year is uncertain, mark it as approximate or pending verification, and do not invent a precise age.

## 2. Search and Verify Real Photos

When an actual project needs a person's identity material, actively search the name plus period, event, or institution; prefer archives, museums, memorial halls, original reporting from authoritative media, and formal material from the person or an institution. Image search thumbnails are only for finding leads; open the original source page to check the caption, person, shoot time, and occasion. A web page's publication date does not equal the photo's shoot date.

For each stage, try to choose 2 to 4 clear photos that can be cross-checked against each other, keeping front or three-quarter angles, adding a profile when needed; this is a selection suggestion, not a required count to pass in every time. When not enough photos can be found, record the gap; do not fill it with actor stills, AI images, beautified restored photos, or unsourced web images. A character still may serve as evidence for that character's look, but must not be mistaken for everyday dress; user-provided photos also have their source verification status recorded. Do not identify a photo's subject by face similarity alone.

Record reference_id, character_id, stage_id, the source page URL, the source institution, the caption, the photo date or range, the date basis, the photo type, the purpose, the verification status, and the local path when actually obtained. When an original photo needs public reuse, check its usage terms separately; do not treat being visible online as freely reusable. Merely recording a link without obtaining the image must not be marked as passed to the model.

## 3. Select Images Per Shot and Actually Pass Them In

For each shot, choose the verified photo closest in time to the event with a suitable angle, using that stage's real original photo as the main identity basis; state clearly each input image's character and purpose. Style references only control the black-and-white grey scale, lighting, grain, and composition, not the face. For multi-person shots, map character IDs and reference images one by one, to avoid mixing faces.

Within the tool's supported range, actually pass in the reference images and confirm the loading status; do not merely write a name, file path, or "reference the online photo" in the prompt. Reference image count, input order, and fidelity parameters are decided by the current tool's instructions; do not invent face-locking, seed, or weight parameters, and do not promise absolute similarity. When the interface cannot receive images, deliver the prompts and reference list and explain the similarity limits, without claiming reference-based generation is complete.

## 4. Consistency Across Eras and Shots

Fix stable facial proportions and visible features, changing hairline, wrinkles, build, makeup and hairstyle, and clothing with the same-period photos. Do not mix photos of different ages into one request without explanation and let the model average the face. When a stage's photo is missing, use the nearest period's original photo plus an evidenced age change, but mark it as an age inference; a shot needing precise historical appearance must not present that inference as verified, and may instead show an evidenced original photo or reduce facial detail with a back view or distant shot.

Keep attaching the matching period's real original photo for each new image. An already generated and approved image may help keep lighting and clothing continuity, but cannot replace the original photo as the sole identity source, to avoid drift from repeatedly building on generated images. First finish one representative shot within the currently authorized scope and check the likeness, then extend to the remaining authorized shots; do not use this to generate extra unauthorized age-setting images or variants.

## 5. Acceptance and Delivery

Compare against the reference image shot by shot, checking visible features such as face shape, eye spacing, brow and eye shape, nose and mouth proportions, hairline, and ear shape against the stage age; do not force places with different lighting and angles to be judged as the same geometric projection. Do not output invented similarity percentages, and do not call manual visual comparison identity verification.

At the same time, check clothing, scenes, character relationships, timing, and key objects; photos can support appearance, but do not necessarily support event details. Record reference_ids, stage_id, appearance basis, scene fact sources, unknown items, actual passing status, and result checks. When a deviation is clear, revise with targeted corrections per the main entry point's limited retry rules. Without image generation, report "flow configured, generation results not verified".

When the request is for the closest possible likeness to the original, prefer directly showing a suitable and available original photo or doing a conservative restoration; any new generated image that changes pose, angle, expression, or scene should be treated as an AI scene reconstruction. In the delivery list, distinguish original photos, restored photos, AI scene reconstructions, and age inferences; when video needs labeling, add it in post-production, and do not require the text-free base image to carry the explanation.
