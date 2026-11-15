# Historical Cover Style

> These rules apply to historical-comic project covers, or to the same kind of cover the current user explicitly specifies. Other styles still follow body-text and cover style binding; when only one ratio is requested, do not generate the other ratio as well.

These rules describe the impasto gold-leaf large-character calligraphy cover style; they do not automatically mean the current user has chosen or approved this style.

## Execution and Content

After completing the specified illustrations, generate two extra covers, output as COVER_3x4.png and COVER_4x3.png; they do not count toward the specified storyboard count. The cover theme, title, people, era, clothing, props, and events must come from this issue's body text. Titles may be distilled, but do not alter the body text or invent historical facts. Choose one lead character with supporting characters, two leads, or a crowd scene based on the content; do not fix a single headcount. Connect related events with a deliberate historical narrative montage, avoiding paneled borders.

## Typography and Image

- Main title: huge, forceful, broad handwritten large-character calligraphy; rough brush, flying white, broken edges, dry-brush ragged edges, varied stroke rhythm, mottled gold leaf and pigment granules, varied in size while the character forms stay complete.
- Second layer: a theme or conflict line, mainly warm rice-gold, with key words optionally in cinnabar red or in rice-gold on a dark-red dry-brush ground, keeping a sharp brush edge; do not emphasize the whole line equally. An optional third layer of short subtitle text may supplement the content in smaller warm rice-colored text, without squeezing the main title.
- Titles are generated as one with the image by default; do not replace the approved effect with ordinary computer xingkai, thin soft rounded fonts, or even office letter spacing. The main title and conflict line must be supplied character by character.
- The ink ground is irregular smoky ink, dry brushing, and shadows that blend naturally into the scene; do not use a pure black rectangle or a huge empty black block. The title and faces are clear visual focal points, with safe margins kept, and legible on a small screen.
- Impasto historical narrative, broken brushwork, block modeling; gold-brown, smoky black, dark red, with faces and hands clear; keep clothing and objects that fit this issue's era, and do not treat style references as sources of historical fact.
- In 3:4, the title may go at the top or upper left, the lead character in the middle and lower area, with related scenes around them; in 4:3, usually the title at upper left, the lead character at middle right, with the background spreading horizontally. Lay out each ratio independently; do not stretch or simply crop the other ratio.

## Standalone Complete Prompt Template

Replace all square brackets with this issue's content; output one complete prompt per ratio. Actually pass in the available confirmed cover reference, stating clearly that it is only for typography and visual style; when nothing was passed in, do not claim it was.

```text
为本期《[主题]》制作完整成品历史封面，包含准确中文标题，画幅[3:4竖版／4:3横版，只保留一个]。
参考已确认历史封面的粗犷书法、金箔质感、墨色融合和厚涂绘画，不复制参考人物、服饰、事件或文字。直接在图中设计标题，不留空标题区，不用普通电脑行楷、细软圆滑笔画或办公字体。
主标题准确写“[主标题]”：巨大、强劲、宽厚、飞白破锋的手写榜书，斑驳金箔颜料颗粒，大小错落但字形清楚。
第二行准确写“[主题或冲突句]”，其中“[常规部分]”用暖米金，“[重点词]”用朱砂红，同样具有凌厉毛笔笔锋。[如需要，第三行小字准确写“[短副标题]”；不需要则删除本句。]
仅使用指定标题，不添加额外标语。墨底是不规则烟墨和干刷，自然融入背景，不能方形纯黑矩形，不能空出巨大黑块。文字有安全边距，不裁断。
本期内容：[有正文依据的主题、事件和转折]。主要人物：[身份、年龄阶段、固定外貌、当时服饰、动作与神态]。次要人物：[若有，写具体身份、造型与主次关系]。背景：[2至4个与本期直接相关的场景，明确时代与空间关系]。有意的历史叙事蒙太奇以烟墨连接场景，无分格框。道具：[时代相符的具体物件]。排除：[本期易混入的异时代造型与物件]。
整体厚涂历史图像小说，破碎笔触，金褐烟黑暗红，脸与手清楚，面部绘画块面而非照片滤镜。主角与标题是两个清楚焦点，小屏可读。
构图：[针对当前画幅写明确标题位置、人物体量、场景布局和安全边距]。
```

## Acceptance and Revision

Check the title character by character, and check brush edge and gold-leaf texture, text cropping, the main figure's hands and face, era-appropriate props, and how the scene matches this issue's content. Fix title errors first with targeted generation using the image tool, keeping the image and calligraphy style. When local typesetting is genuinely needed, the approved rough brush, flying white, and granule effect must still be kept; do not replace it with ordinary xingkai flat-color overlaid text. Do not add an extra user approval checkpoint for all future covers; execute per the current request, and wait only when the user explicitly asks to review first.

## Built-in Reference Images and Execution Rules

Prefer the stable copies inside the skill, avoiding reliance on original project paths. Before generating, open the sample image for the matching ratio and actually pass it in as a style reference when the tool supports it; it controls only typography, brushwork, color, and composition, not historical figures or historical fact.

| Reference image | Purpose |
| --- | --- |
| [Chang Yuchun 3:4](../assets/cover-reference-chang-yuchun-3x4.png) | Original reference for gold-leaf large-character calligraphy, flying-white broken edges, dark-red dry brushing, and impasto figures |
| [Zeng and Zuo 3:4](../assets/cover-reference-zeng-zuo-3x4.png) | Vertical finished work with a large title at the top and figures below, joined by smoky ink |
| [Zeng and Zuo 4:3](../assets/cover-reference-zeng-zuo-4x3.png) | Horizontal finished work with text on the left and people on the right, laid out independently |

- Typography continues the huge, broad, forceful handwritten large-character calligraphy, with flying-white broken edges, dry-brush ragged edges, and mottled gold-leaf granules; the main title is gold, and the subtitle is rice-gold and dark cinnabar red. People and scenes are impasto historical comics in ochre-gold, burnt brown, smoky black, and dark red. Do not replace them with ordinary computer xingkai or smooth flat-color characters.
- Design 3:4 and 4:3 separately; do not stretch or simply crop. The reference finished works are 1086x1448 and 1448x1086 respectively; other resolutions at the same ratio may be used, and 1086x814 is not an exact 4:3.
- Headcount and scenes are decided by this issue's content; do not fix them at two people, and do not copy the Zeng and Zuo names, Qing official dress, the Great Wall, or the writing brush. When people from across time are placed together, state clearly that it is a narrative montage, to avoid drawing it as a real meeting.
- This issue's sample titles "Zeng Guofan / and Zuo Zongtang", "Eight years apart / one couplet ends the grudge", and "A lifetime of grudges, settled with a brushstroke of respect" serve only as hierarchy references; replace them every issue. Numbers and quotations in titles must be checked; do not amplify obvious errors from the original manuscript.
- Before delivery, check four common error types: Chinese errors or omissions; large-character calligraphy degrading into an ordinary computer font; ratio or text cropping; and sample figures and out-of-period props leaking in. Open each finished cover and check it character by character, verify the actual dimensions, and record the reference image used and the generation method.
