# Monochrome Figure Gold-Red Calligraphy Cover

Cover style ID: `monochrome-gold-red-cover`. A 3:4 reference image is included; the 4:3 version is a horizontal layout rule in the same style, with no standalone acceptance sample provided. Use it only when the current request explicitly chooses it; do not inherit the author's personal preference.

## Trigger and Scope

- Use it when the user explicitly requests a cover, supporting a 3:4 vertical or 4:3 horizontal version; generate only the requested ratios and quantities. Do not mistake a body-text illustration ratio requirement for a cover request.
- Only updating the rules or discussing the style does not generate an image. Monochrome body text still defaults to text-free with no automatic cover.
- This issue's lead character, title, age, clothing, scenes, and symbolic objects all come from this issue's content. Chang Xiangyu, the opera stage, the airplane, and the original sample's text and images belong only to the sample; do not copy them into unrelated themes.

## Built-in Samples and Reference Use

- **Text style reference**: [Zhao Yiman 3:4 Cover](../assets/cover-reference-zhao-yiman-3x4.png), 1086 x 1448. Use the copy inside the skill, without depending on an external project. Open it before generating and actually pass it in, focusing on the whole text language. The Chang Xiangyu sample may serve as a supplement.
- The Zhao Yiman sample's hierarchy is: a huge pale-gold person's name at the top, a black-and-white close-up of the person in the middle, and two short lines below, gold above and red below. The bottom often uses four characters per line, but this is decided by this issue's content; do not invent historical facts to fill the character count. The example "Zhao Yiman / Unyielding and steadfast / Hard as steel" only illustrates layout, and is not default copy for the next issue.
- Text must keep the thick, broad handwritten large-character calligraphy, a clear diagonal brush rhythm with trailing strokes, flying-white breaks, ragged ink-splash edges, and mottled gold leaf. Red emphasis characters are likewise thick brushwork; do not replace them with sans-serif print type, ordinary xingkai, or tidy office fonts. Titles blend with the ink-black background, with no outline stickers, rectangular bars, or regular cards.

- Stable copy inside the skill: `../assets/cover-reference-chang-xiangyu-3x4.png`.
- Open the sample before generating, and actually pass it in when the tool supports it, stating that it only controls calligraphy, gold-red colors, black-and-white photographic texture, smoky-ink blending, and visual hierarchy. It is an AI cover sample, not an original photo of a historical person; do not use it to verify a new person's identity or historical facts.
- This issue's character reference is passed in separately with its purpose stated clearly; when the sample is missing, follow the complete rules below and say so honestly, without claiming it was passed in.

## Fixed Visual Rules

1. People and the narrative background use a pure black-and-white cinematic photographic texture: natural skin, clear faces, rich midtones, and slight film grain; no yellowing, and do not turn people into gold-brown impasto or comics. Facial expressions are restrained and strong, with age and clothing matching this issue's events.
2. Use a large bust or close-up of one lead character as the default visual center, adjusting the headcount by the story when needed. The lead character and the main title form two clear focal points, with the background subordinate, and no decoration covering the face.
3. The main title is usually the person's name or the core theme: huge broad large-character calligraphy, rough brush, flying-white broken edges, dry-brush ragged edges, and mottled pale-gold / rice-gold gold-leaf granules. The character rhythm is varied yet legible; do not replace it with ordinary computer xingkai, thin soft fonts, or tidy office layout.
4. The subtitle distills one evidenced core event or conflict from this issue; ordinary words use warm rice-gold, and the most important short phrase uses cinnabar red. In the vertical version it may break into two lines, with the red emphasis line carrying more visual force; do not pile on extra slogans.
5. Irregular smoky ink, dry-brush texture, and the scene's dark areas blend the text and image naturally; do not use a black rectangular header, paneled borders, or a huge empty black block. A black-and-white scene with gold-red titles is the fixed color relationship.
6. The background picks one or two evidenced secondary scenes or symbolic objects, connected as a narrative montage. A symbolic combination is not historical evidence that they happened in the same place; do not create facts from the cover.
7. Titles and the image are generated as one, with the copy specified character by character. Text sits about 6% from the edges, complete and clear, and legible on a small screen; no extra text, watermarks, or logos.

## Ratio Adaptation

- 3:4: the main title takes a prominent area at the top or upper left; the lead character sits in the middle, slightly to the right; the subtitle goes at the lower left or below, with the key short phrase in cinnabar red; background scenes sit to the left or in the distance, and a symbolic object may sit at the upper right, avoiding the title.
- 4:3: redesign the horizontal layout, with the title and subtitle concentrated on the left, the lead character on the right keeping facial scale, and the background spreading horizontally. Adjust line breaks by character count; do not stretch the vertical image horizontally or crop out the original text.
- Composition serves this issue's content; the sample's positions are references, not a mechanical copy of object coordinates. Verify the final pixel ratio.

## Standalone Prompt Template

When using it, replace the placeholders with this issue's content and delete options that were not adopted.

```text
制作本期《[主题]》完整中文人物传记封面，严格[3:4竖版或4:3横版]。输入的已确认封面样图只用于书法风格、黑白摄影质感、金红配色、烟墨融合及层级，不复制其人物、原文案和事件。[说明本期人物参考及其用途，如无则删除。]
本期主角：[身份、事件时期、年龄、符合时代的服饰发式与神态]。主要人物大幅近景，脸部自然清楚、目光坚定克制；人物和背景纯黑白灰阶、真实皮肤、细微胶片颗粒、丰富中间调，不泛黄，不油画，不漫画。
主标题逐字准确写“[主标题]”，巨大宽厚榜书、飞白破锋、粗毛笔干刷边缘、浅金斑驳金箔颗粒，字形完整。
副标题准确写“[完整副标题]”，断行为[指定断行]；其中“[核心短语]”朱砂红，其他字暖米金，笔锋有力，小屏可读。只使用指定文案。
背景为[本期有依据的一至两个场景或象征物]，以不规则烟墨自然衔接，形成叙事蒙太奇，背景从属。标题与图像一体设计，不做矩形黑色题头，不分格。
构图：[按当前比例写明文字、主角及背景布局]。主角面部与主标题是两个焦点，文字距边缘至少约6%，无裁字、无水印、无额外标志。
```

## Acceptance and Delivery

Check the title and red emphasis words character by character, along with the frame size, face, calligraphy flying white, gold-leaf granules, black-and-white scene, and smoky-ink joins. Check the high-frequency problems: title cropping, text covering the face, sample people or events leaking in, and photographic work drawn as impasto. Fix clear flaws with at most one targeted revision per the main entry point's rules; record remaining problems honestly.

Output this issue's `COVER_3x4.png` or `COVER_4x3.png`; do not overwrite an existing file without a request, using a version suffix instead. Record the final copy, prompt, actual reference inputs, and dimensions. Only results actually generated and viewed in this issue may be called verified.
