# Comic Style Reference Record and Trial Example

This style was distilled from visual analysis of twelve screenshots of historical videos. The original screenshots are not distributed with the package; using this skill does not depend on the author's material directory. When extra reference images are actually needed, the current user provides usable files.

Six finished body-text works chosen by visual sampling are also included; see [Body-Style Reference Library](style-reference-library.md). These finished works are used to reference brushwork, material, and color when generating images; they are not the original screenshots described in this record, and they do not constitute historical fact or verification of a generation model.

## Observation Basis

| Screenshot suffix | Visible content and style evidence |
| --- | --- |
| References 01, 02 | Full-body figures, a throne, and a crowd scene; large-scale protagonists, dark-gold clothing patterns, ochre-gold surroundings, strong block modeling |
| References 03, 05 | Civilian migration and conflict; figures keep realistic proportions, with clearly broken impasto brushwork on clothing, ground, and sky |
| Reference 04 | A woman beside a train window; the face is relatively fine while the train body and distant view are looser, showing the style cannot be locked into tough masculinity |
| References 06, 07 | Crowd deliberation and a riding column; diagonal lines, column depth, flags, and dust organize the scene |
| References 08, 09, 10 | A seated figure in profile, figure-led scenes, and indoor writing; still images work just as well, so dynamic warfare must not be treated as required |
| References 11, 12 | Ancient figures placed alongside a modern train, city, and students; this is a deliberate cross-era juxtaposition, not an element every historical image should have |

The working description uses "impasto historical comic style", emphasizing hand-painted modeling close to the references. The yellow subtitles and black bars in the screenshots are not written into the base image, and character identities and object eras are not assumed verified from the images.

## Complete Trial Prompt

The following is a newly written comic-style example, without completed actual image generation verification. Reusing the known "old minister raising military funds" scene helps compare the two styles; it does not mean this style only suits the Qing dynasty. The specific style rules follow the corresponding styles file.

```text
生成一张 9:16 竖版厚涂历史漫画插图，主题“老臣筹措军饷”。

19 世纪 70 年代，中国西北一处清军驻地的账房。六十五岁左右的官员坐在旧木桌后，身体前倾，一只手按住账册，另一只手指向账目。他面容清瘦，颧骨分明，灰白胡须，眉头紧锁；穿符合晚清身份的深靛色官服与黑色官帽，衣缘仅有暗淡绣纹。一位灰褐长衫的中年账房先生在左侧拨动算盘，目光停在同一本账册上，两人都不看镜头。

前景旧木钱箱敞开，大部分为空，底部仅几枚暗哑银锭；桌上有纸账册与木算盘，不堆满杂物，不生成可读的虚构账目。中景突出两人的脸、指向账目的手与算盘。背景敞开的门外，几名清军士兵把粮袋绑上骡车，远处土墙和干燥山地在灰尘中逐渐减弱。表达军队准备出发而资金不足的压力，统一真实空间，不使用跨时代叠化。

采用偏写实的历史图像小说厚涂画法。人物保持真实比例，以眉眼、鼻梁、颧骨和衣褶的明暗块面塑造体积；面部与手用较细笔触，木桌、衣料、墙面和远山由可见的不规则干刷、交错擦扫与破碎色块表现。保留厚重手绘感，深色形体边界自然融入颜料，不用等粗黑描边，不做照片套油画滤镜。

有限配色以赭金、焦褐、烟黑和暗赭红为主，官服仍保留低饱和靛青；少量冷灰暗部衬托暖色纸面与木材。午后的斜向门光照亮脸、手和账册，形成明确明暗分组，阴影中仍可辨认织物和桌面细节。金色来自自然光与颜料色层，不把官服和钱箱画成闪亮黄金。画面沉重克制，但不全图发黑或覆盖不透明棕黄滤镜。

平视略俯的中广景，桌沿向人物引导视线，门外运输活动建立纵深。画面下方约三分之一处减少细碎高对比信息，关键面孔和核算手势在其上方，便于后期叠字幕，不留白条。画面只有一个主要事件，不追加帝王冕冠、风暴云层、骑兵冲锋或现代器物。

只生成单幅完整插图，无字幕、标题、黄色文字、气泡、漫画格、边框、水印或白色漂浮光斑。避免 Q 版、日系大眼、平涂赛璐璐、光滑三维、塑料皮肤、重复人物、错误手部及满箱银两。
```

## Adversarial Walkthrough

- New manuscript with no style chosen: ask which of the two styles to use first; do not automatically assign it from a past realism-style sample.
- Explicit "comic style, prompts only": apply historical-comic directly, do not ask again, do not generate images, and do not inject the realism style's no-heavy-brushstroke constraint.
- Continuing the third shot of the same already-chosen comic-style project: keep the project's style and characters, do not ask again every shot; when a new manuscript arrives, judge again whether a style has been chosen.
- Comic style for ordinary Han dynasty life: design by identity and era; do not automatically add a crown, paper ledgers, warfare, or a modern train.
- Maintaining the Skill without a creation request: finish the configuration and verification, and do not throw the style-choice question for future creation at the user.

These are behavior check scenarios for maintenance; they cannot be used to claim model image output testing has passed.
