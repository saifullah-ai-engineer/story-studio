# Translation Notes: story-studio (Chinese to English)

Source: [konlu/story-studio](https://github.com/konlu/story-studio), an AI agent Skill for short-video content creation. Original work by konlu, licensed CC BY-NC-SA 4.0. This directory holds English translations of the documentation files only. The story corpus files remain in Chinese, as in the original.

## Files translated (52 Markdown files, 4 installer/config files)

### Root

- README.md (includes the translation note at the top, after the title block)
- SKILL.md
- install.sh, install.ps1, install.bat, agents/openai.yaml (comments and user-facing strings only)

### references/

- references/biography-writing.md
- references/doubao-voice.md
- references/extending.md
- references/fact-and-style.md
- references/project-state.md
- references/setup.md

### assets/

- assets/sponsor/README.md

### modules/characterstory-writing/

- GUIDE.md
- Writing-DNA.md
- 写作视角与认知框架.md
- 带货融入节点DNA.md
- 开头钩子DNA.md
- 文章结构模板.md
- 视觉风格指南.md
- 语言DNA.md
- 选题策略DNA.md

### modules/history-image/

- GUIDE.md
- references/audio-first-storyboard.md
- references/comic-reference.md
- references/cover-design.md
- references/manuscript-storyboard.md
- references/monochrome-cover-design.md
- references/narration-pacing.md
- references/period-context.md
- references/person-photo-reference.md
- references/storyboard-interface.md
- references/style-reference-library.md
- references/validated-example.md
- styles/historical-comic.md
- styles/historical-realism.md
- styles/monochrome-narrative.md

### modules/history-writing/

- GUIDE.md
- references/Writing-DNA.md
- references/写作视角与认知框架.md
- references/史实与素材.md
- references/工具说明.md
- references/开头钩子.md
- references/文章结构模板.md
- references/新选题卡.md
- references/核验事实包.md
- references/维护流程.md
- references/视觉风格指南.md
- references/词频附表.md
- references/语言DNA.md
- references/选题与系列.md

### modules/render-history-video/

- GUIDE.md
- references/jianying.md
- references/pacing-review.md
- references/plan.md
- references/semantic-alignment.md

## What was kept as-is, and why

- **Story corpus (all files under any /corpus/ directory, 356 Chinese story files).** Not copied and not translated. It is the content library the Skill draws on, and it stays Chinese as in the original.
- **JSON catalog and data files.** Not translated. They are machine-read data (catalogs, plan schemas, project state). Changing values would break the tools that read them.
- **Python and shell scripts under scripts/.** Not translated. Only the four installer/config files listed above had user-facing strings translated; no code logic, command, or path was changed in any of them.
- **LICENSE,.gitignore,.github/FUNDING.yml, images.** Untouched.
- **Fenced code blocks.** Kept byte-identical to the source in every file except the README fence fix noted below. This includes Chinese image-generation prompts (they are functional prompts sent to image models in Chinese), script templates with Chinese example text, CLI arguments with Chinese values, JSON example values, and mermaid diagram labels.
- **Link targets, anchors, and file paths.** Kept byte-identical, including links to Chinese-named files (for example `references/选题与系列.md`, `corpus/开头钩子逐篇分析.md`) and the Chinese anchor in `SKILL.md#缺少最终配音时必须先给出两条路径`. Renaming or translating these would break the links.
- **Badge URLs in README.md.** The shield badge URLs contain Chinese text; they are URLs and were left unchanged.

## Chinese characters that remain, and why

The translated set still contains 9,002 CJK characters. That is not untranslated prose. A line-by-line review found no untranslated prose sentence. The remainder falls into these groups:

- **7,746 characters inside fenced code blocks.** Preserved example content: Chinese image-generation prompts, story script templates with Chinese example sentences, CLI arguments, JSON example values, and diagram labels. Translating these would violate the byte-identical code-block rule and would change what the prompts and templates do.
- **1,256 characters in prose, all in these categories:**
- Link targets, anchors, and file paths that must stay byte-identical (for example `文章结构模板.md`, `corpus/选题库.md`, badge URLs).
- Quoted sentence-pattern templates that are the subject matter (for example the `您说……怎么会……` pattern and the `真正的X不是Y，而是Z` formula).
- Quoted classical Chinese passages in the Fact Verification Pack, which are cited evidence from the Records of the Grand Historian and the Records of the Three Kingdoms.
- Word-frequency data in 词频附表.md and 语言DNA.md, where the Chinese words themselves are the data (for example 皇帝, 琢磨, 您, 咱们).
- Source account names in data tables (for example 故纸观山河, 王老师读史观心), kept so the data stays traceable to the corpus.
- The single character 字 in the definition of the character-counting rule in the history-writing GUIDE.
- The literal WeChat remark `自媒体创作` in README.md, which is text the user types when adding the author.
- The Chinese style name "厚涂历史漫画风" in historical-comic.md, kept once in quotes because it is the selection name users type.

Em dashes: 12 in total, all inside preserved code blocks in 带货融入节点DNA.md, identical to the source. Zero em dashes in translated prose.

## Fixes made during verification

- **带货融入节点DNA.md and 文章结构模板.md:** the first translation pass partly translated and partly deleted lines inside fenced code blocks (for example the layer labels were dropped and some template lines were translated while the Chinese body text stayed). All 27 code blocks in the first file and both code blocks in the second were restored byte-identical from the source.
- **README.md unclosed code fence (upstream defect):** the original README is missing the closing fence of the ```text block in the Option A install section, so the separator, the whole Option B heading and prose, and the ```powershell line are swallowed inside that code block. One closing fence was added after the "Agent will automatically recognize..." line, and Option B and Option C are now normal headings with translated prose. The code block content itself is byte-identical. To revert to strict preservation of the defect, remove that one added fence line.

## Judgment calls on inline code

- **SKILL.md:** the placeholders `<story-studio目录>` and `<版本目录>` inside a command example were translated to `<story-studio directory>` and `<version directory>`. They are placeholders the user substitutes, not real paths, so the command still works.
- **render-history-video GUIDE.md:** the formula `amp = min(0.0065 × 镜长秒, 0.16)` was translated to `amp = min(0.0065 × shot length in seconds, 0.16)`. It is explanatory, not executable code.
- **史实与素材.md:** a table header row wrapped in backticks in the source was translated as a header row. It is prose content, not code.
- **README.md:** two descriptive inline-code phrases (a hook sequence and a speaker ID label) were translated; formatting backticks were added around file and tool names in a few places.

## Terms with no clean English equivalent, and what was chosen

- **剪映 / 剪映专业版** - Jianying / Jianying Pro (the Chinese app; kept as a proper noun because the docs refer to its settings paths and the pyJianYingDraft library, not the international CapCut build).
- **豆包** - Doubao (ByteDance voice service). **豆包语音大模型** - Doubao voice model. **火山字幕 API** - Volcano subtitle API. **即梦** - Jimeng.
- **玉玲2711 / 玉玲人物故事风** - Yuling2711 / Yuling character story style (a creator handle, kept as an identifier).
- **您说** - "Tell me" (the signature rhetorical device; a literal "You say" reads wrong in English, while "Tell me" keeps the audience-addressing, question-driving function).
- **带货** - product integration (covers books, food products, courses, and services, not just selling goods).
- **钩子** - hook. **金句** - golden line (character-story module) / quotable closing line (README). **爆款** - hit. **赛道** - track (matches the `track` key in the Skill). **洗稿** - rewriting. **对标** - benchmark (as in benchmark script library). **高赞** - highly liked. **催赞 / 传播号召语** - like-begging call to action / share call to action.
- **分镜** - storyboard shot / shot. **分镜表** - storyboard table. **运镜** - camera move / camera movement. **推拉** - push/pull. **切点冲击缩放** - cut-point punch zoom. **配音** - narration (matches the `narration.mp3` filename). **成片** - finished video. **草稿** - draft (Jianying draft project).
- **厚涂** - impasto. **飞白** - flying white. **榜书** - large-character calligraphy. **行楷 / 行书** - xingkai (transliterated; "semi-cursive regular script" would be misleading). **Q 版** - chibi.
- **演义** - dramatization (history module) / romance when referring to the novel genre; **文学演绎** - literary dramatization. **正史** - official history.
- **口播 / 口播稿** - voiceover / voiceover script. **字** - character (the counting unit), with the character itself kept once in the counting-rule definition.
- **核验事实包** - Fact Verification Pack. **词频附表** - Word Frequency Appendix.
- **民国** - Republican era. **文革** - Cultural Revolution. **民国名媛** - Republican-era socialites.
- **斤 / 里** - jin / li (units kept unconverted so the source numbers do not change). **520** - May 20 (the date pun only works in Chinese).
- **Book titles** - standard English titles, with pinyin on first use where helpful: 《史记》 Records of the Grand Historian (Shiji), 《汉书》 Book of Han (Hanshu), 《三国志》 Records of the Three Kingdoms (Sanguozhi), 《资治通鉴》 Comprehensive Mirror in Aid of Governance (Zizhi Tongjian), 《宋史》 History of Song, 《红岩魂》 The Soul of Red Rock, 《人间值得》 Life Is Worth It.
- **Era names** - transliterated with context: 刘宋 Liu Song (noted as distinct from the Zhao Song), 北宋/南宋 Northern/Southern Song, 西汉 Western Han, 楚汉 Chu-Han, 秦末 end of Qin, 晚清 Late Qing.
- **Benchmark account names** (红颜旧事志, 人间人物志, 闲读人间往事, 通史观人物, 策山读书, 故纸观山河, 王老师读史观心, 王老翻史书, 王老谈史局) - transliterated in pinyin or left in Chinese in data tables, since they are proper-name identifiers of the source accounts.
- **Person names** - standard pinyin (Ruan Lingyu, Qin Yi, Yang Likun, Zhao Yiman, Chang Xiangyu, Li Shimin, Han Xin, Cao Cao, Liu Bang). Note: the source inconsistently writes 杨丽坤 as 杨立坤 in one place and 磨片皇后 for 默片皇后; the standard forms (Yang Likun, silent film queen) are used in the English prose.
- **Coli** - kept as Coli (the local transcription tool). **三不省略** - "three things never omitted" (kept literal; the source names the requirement but never glosses it). **赞赏** - tip (sponsor section: "WeChat tip code", "Alipay tip code").
