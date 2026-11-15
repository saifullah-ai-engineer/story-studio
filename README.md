<div align="center">

# 🎬 Story Studio

**A one-stop AI short-video content creation Skill, from topic selection → script → voiceover → illustration → JianYing draft**

[![Skill Type](https://img.shields.io/badge/AI_Agent-Skill-blue?style=flat-square)](#)
[![License: CC BY-NC-SA 4.0](https://img.shields.io/badge/License-CC_BY--NC--SA_4.0-lightgrey.svg?style=flat-square)](LICENSE)
[![GitHub Stars](https://img.shields.io/github/stars/konlu/story-studio?style=flat-square)](https://github.com/konlu/story-studio)
[![Track](https://img.shields.io/badge/赛道-历史叙事_%7C_人物故事-orange?style=flat-square)](#)
[![ corpus](https://img.shields.io/badge/内置对标库-370%2B_篇高赞文案-success?style=flat-square)](#)
[![Visual](https://img.shields.io/badge/内置画风-3_套视觉体系_%2B_参考图库-purple?style=flat-square)](#)
[![Export](https://img.shields.io/badge/交付-可编辑剪映专业版草稿-ff69b4?style=flat-square)](#)

<p align="center">
  <b>Describe what you need in plain language, and let an AI Agent carry your short-form voiceover production from start to finish.</b><br/>
  It can generate a complete JianYing project from a single sentence, or work like building blocks: write only the script, polish only the opening hook, split only the storyboard and generate images, or build a JianYing draft from materials you already have.
</p>

[✨ Highlights](#-highlights) • [🛠️ The Four Core Modules](#-the-four-core-modules-in-detail) • [🚀 Quick Start](#-quick-start) • [🎛️ Flexible Workflow Switches](#-flexible-workflow-switches) • [💬 Example Prompts](#-example-prompts) • [📦 Dependencies and Privacy](#-dependencies-and-privacy) • [☕ Sponsor](#-sponsor) • [📬 Contact](#-contact)

</div>

---

> **Note:** This is an English translation of [konlu/story-studio](https://github.com/konlu/story-studio), original work by konlu, licensed under CC BY-NC-SA 4.0. The story corpus files remain in Chinese, as in the original.

## 📖 Project Overview

**Story Studio** is a one-stop short-video content creation skill pack built for AI Agents that support Skills, such as Claude Code, Codex, and Cursor.

Making history or character story short videos usually means jumping back and forth between **finding topics, checking historical sources, polishing the opening hook, writing the voiceover script, recording the voiceover, aligning the timeline, splitting dozens of storyboard shots, keeping AI-generated images stylistically consistent, and setting keyframes frame by frame in JianYing for push and pull camera moves**.

**Story Studio packs that whole industrial pipeline into a single Skill:**

```mermaid
flowchart LR
    A[💡 选题与黄金钩子] --> B[✍️ 口播文案定稿]
    B --> C[🎙️ 豆包语音大模型 / 自备配音]
    C --> D[⏱️ Coli 本地转录对齐]
    D --> E[🎨 3大画风分镜与配图]
    E --> F[🎞️ 剪映专业版草稿导出]
```

- **No need to piece together several loose Skills from scratch**: writing, voiceover, speech recognition, visual storyboarding, and JianYing project generation are deeply integrated inside.
- **Stop and hand off at any point**: you can have it only write the script or revise the hook; or drop a finished script and a self-recorded MP3 into a folder and let the Agent read them and carry on with subtitle timestamp alignment, illustration, and JianYing draft layout.

---

## ✨ Highlights

- 🧠 **Two built-in ace writing Skills plus a 370+ hit benchmark script library**: no more AI-flavored outline writing! Two complete, deeply distilled Writing-DNAs are built in, covering "historical narrative" and "real-life character stories / legendary women", including topic strategy, a golden first-3-seconds hook library, sentence rhythm, and historical fact-checking.
- 🎨 **Three mature illustration styles plus a built-in finished reference image library**: supports **historical realism**, **impasto historical comic**, and **black-and-white documentary narrative**. Built-in high-quality body text and cover reference images (Reference Images) are checked against material and lighting during generation, ending cross-shot style drift and anachronisms.
- 🎙️ **Two flexible voiceover paths plus local high-precision timestamp alignment**: connect the **Doubao voice model (V3 bidirectional streaming)** for one-click, highly expressive narration, or **drop a voiceover MP3 you prepared yourself into the project folder for the Agent to read directly**. Paired with local **Coli (built on sherpa-onnx)** offline recognition, it produces SRT timelines accurate down to the word, never guessing timing from character counts.
- 🎞️ **A genuinely re-editable JianYing Pro draft**: generates JianYing project files directly with `pyJianYingDraft`. It automatically lays 9:16 vertical images and the full voiceover on the timeline, and **automatically writes slow push-pull keyframes across every shot plus punch zoom at cut points**, so you can open JianYing, preview, fine-tune, and export the finished video.
- ⚡ **Zero-barrier automatic environment setup**: no manual wrestling with Python, Node.js, FFmpeg, or speech recognition environments. On first use, tell the Agent to configure with one click, and the portable environment is set up in your own separate data directory.

---

## 🛠️ The Four Core Modules in Detail

### 1️⃣ Script Writing: Two Writing-DNAs Plus a 370+ Benchmark Script Library

More than just asking a model to "write a story", Story Studio builds in two complete professional writing submodules, distilled from hundreds of highly liked verbatim hit scripts from Channels and short-video platforms:

| Built-in writing style | Best tracks and traits | Built-in corpus and DNA arsenal |
| :------------------------------------------ | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | :----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **📜 Historical narrative**<br>`historical-narrative`  | **Tell one historical event worth digging into, thoroughly**<br>• Open with a specific historical anomaly or core question<br>• Drive the body with character actions, institutional conditions, and knock-on consequences<br>• Close by resolving the opening suspense tightly, with no empty uplift                                                                   | • **57** top hit historical narrative verbatim scripts with structural breakdowns<br>• **9 types of golden opening hook mechanics** (analyzed from the first seconds of each script)<br>• Built-in topic library, fact and source verification, and word count and duplication check tools                                     |
| **👩 Character story**<br>`yuling-characterstory` | **Real historical figures and legendary women, in single episodes or series**<br>• Classic rhythm: `hook first → peak numbers → but no one expected → scenes of hardship → quotable closing line`<br>• Highly moving emotional anchors ("You say... how could..." with precise number beats)<br>• Supports single-episode deep biographies or 2 to 3 episode serial scheduling | • Full character writing DNA distilled from **300+** top hit verbatim scripts<br>• Benchmark libraries across Republican-era socialites, heroines, era pioneers, legendary mothers, and more high-like tracks<br>• **Five categories of opening hook templates, A/B/C/D/E**, plus topic strategy DNA, emotional uplift, and quotable closing line templates |

**💡 What finer optimizations can the writing module help with?**
- **Hit topic planning**: not sure what to post? Name a dynasty or a person, and the Agent plans topic cards and angles with dramatic tension from the 370+ benchmark library.
- **Golden opening hook polishing**: opening not gripping enough? The Agent follows built-in hook DNA such as "number sequences", "fate frozen in a moment", "anomalous scenes", "ending up front", and "historic moments" to produce 3 to 5 openings with different angles for you to pick from.
- **Facts first and fact-checking**: a strict "Fact and Style Priority" standard is built in. Build the fact table and timeline first, separate official history, controversy, and dramatization, and never invent numbers, quotations, or scenes of suffering out of thin air to fit a template or a rhyme.
- **Precise word count control and rewriting**: expand, shorten, continue, or adjust the narration's breathing to a target word count (within plus or minus 5% by default).

---

### 2️⃣ Visual Storyboarding and Illustration: Three Signature Styles, Era Research, and a Reference Library

The illustration module turns text into visuals that fit the narration's rhythm, in three modes: **"split the storyboard and output prompts only (for other tools to generate images)", "improve an existing storyboard", or "call the image tools to generate images directly"**.

#### 🎨 Three Built-in, Highly Distinctive Illustration Styles

| Style name (`style_id`) | Visual traits and mood | Built-in reference images and cover strategy |
| :--------------------------------------------- | :--------------------------------------------------------------------------------------------------------- | :------------------------------------------------------------------------------------------------------------- |
| **🖌️ Impasto historical comic**<br>`historical-comic`     | **Strong narrative tension and sculptural mass**<br>Visible broken impasto brushwork, ochre-gold and burnt-brown tones, strong warm-cool contrast, highly dramatic and cinematic   | • **6** built-in body text style reference images (`HC01` to `HC06`)<br>• Two impasto gold-foil calligraphy title covers by default, **3:4 vertical and 4:3 horizontal**  |
| **📷 Black-and-white documentary narrative**<br>`monochrome-narrative` | **Restrained, weighty, modern-era character biography feel**<br>Pure black-and-white grayscale, film photography texture, fine facial age texture and period light, deep and restrained emotion | • **6** built-in body text black-and-white photography reference images (`MN01` to `MN06`)<br>• Body images only, no text, by default; an optional dedicated "black-and-white portrait with gold-red calligraphy cover" |
| **🏞️ Historical realism**<br>`historical-realism`       | **Natural, steady, traditional history narration feel**<br>Natural human proportions and real lighting, fine and soft realistic painting texture, restrained warm-cool color relationships       | • Complete era research and detail-density examples built in<br>• Two title covers in the same style by default, **3:4 vertical and 4:3 horizontal**                      |

**🔍 Why do its images look right, with no anachronisms?**
1. **Audio first**: never split the script mechanically! Cut points are planned from the real voiceover's SRT timestamps, at a narrative pace of about 8 seconds per image, so **the first sentence has a matching image from frame 0**, and each image strictly matches the sentence being spoken.
2. **Per-shot era and character age research**: each shot's dynasty, region, and character age stage (such as young, middle-aged, or elderly) is identified automatically, and clothing and hairstyles, architecture, objects, and currency are written into standalone prompts; for real modern figures, matching historical photographs can be retrieved by period.
3. **Reference image anchoring**: the built-in reference image (Reference Image) for the same style is automatically read and passed in during generation, and the first image is checked for brushwork and tone before batch generation, greatly reducing style drift across shots.
4. **Opening motion video first and last frame design (optional)**: on the first image generation, you can also generate the golden first 6 seconds as a "first frame + last frame + image-to-video camera prompt", ready for a video model to make a highly attractive motion opening.

---

### 3️⃣ Voiceover and Subtitle Alignment: Doubao Voice Model or Your Own Audio, Two Paths

Voiceover is the core bridge between a good script and precise visual pacing. Story Studio offers two very smooth voiceover paths:

#### Path A: Recommended Setup, the Doubao Voice Model, Fully Synthesized by the Agent
- Built on the Volcano Engine Doubao voice **V3 bidirectional streaming WebSocket protocol**, supporting the latest `seed-tts-2.0` (2.0 general high-expressiveness voices) and `seed-icl-2.0` (voice cloning 2.0).
- **Safe and worry-free**: you only need to get an `API Key`, a `speaker ID` (voice ID), and a `resource_id` from the [Doubao voice console](https://console.volcengine.com/speech/new). The API Key can be saved through system encrypted storage (Windows DPAPI, or a 0600 permission file on macOS and Linux) or an environment variable, and is **never written into the code repository or project files in plain text**.
- **No repeat billing, plus integrity checks**: voice and speech rate are confirmed before synthesis, and after synthesis the audio integrity is verified automatically with `ffprobe/ffmpeg`, while text and audio hashes are recorded, so the same script with the same voice never triggers a repeat paid request.

#### Path B: Prepare a Voiceover MP3 in Advance and Drop It in the Folder for the Agent to Read Directly
- If you prefer JianYing voice cloning, another TTS app, or **recording it yourself**, just drop the final `.mp3` audio file into the project folder and tell the Agent: *"I have put the voiceover in the folder. Use this audio directly to continue with the storyboard and JianYing draft."*
- The Agent reads your audio file automatically, skips cloud synthesis, and goes straight to the next step, local subtitle alignment.

#### ⏱️ Coli Local Offline Speech Recognition and Audio-Text Verification
- Whichever voiceover path you use, the Agent calls local **Coli (built on sherpa-onnx)** to generate offline `.srt` subtitles with precise timestamps, and **automatically checks names of people and places and proper nouns against your finalized script**, giving the storyboard millisecond-level timing evidence.

---

### 4️⃣ JianYing Pro Draft Export: Push-Pull Camera Moves and a Finished Timeline in One Step

Once all materials are ready, Story Studio generates a **local draft project that JianYing Pro can open** directly:

- **Semantic alignment check**: before export, `check_handoff.py` and a per-shot semantic check run automatically, so each image appears exactly while the narration talks about that person and event.
- **Cinematic camera movement (no stiff still frames)**:
  - **Slow push-pull with easing on every shot**: for each image, from cut-in to cut-out, a smooth push-pull range is calculated automatically (about 12% of range over 16 to 20 seconds by default, adapting to shot length, with wide shots and close-cropped figures optimized separately), flowing throughout without stalling.
  - **Punch zoom at cuts (Cut Punch)**: at regular shot changes, keyframes are written automatically for a slow push-in out of the shot (`1.28x`) and a pull-back into the next shot (`1.50x`), keeping visual breathing room and impact while avoiding the black flash frames JianYing's built-in transitions can cause.
- **No lost materials, clean delivery**: all images and audio are copied automatically into the JianYing draft directory, at 1080x1920 (9:16 vertical) and 30fps by default, covering the full voiceover; no on-screen subtitles are forced by default (just say "add editable subtitles" when you want them).
- **Optional local FFmpeg render**: if you do not need to fine-tune in JianYing, you can explicitly ask to use the built-in high-precision sub-pixel affine transform script to render `final.mp4` locally.

---

## 🚀 Quick Start

### Step 1: Install the Skill with One Click (Three Easy Options)

Pick whichever option fits how you work:

#### Option A (Most Recommended, Zero Effort): Send One Sentence in the AI Chat and Let the Agent Install It
If your Agent (such as Codex, Claude Code, Cursor, or others) has terminal access, you **do not even need to open a command line**. Just send this in any chat:

```text
请帮我把这个 GitHub 仓库克隆安装到你的 skills 目录，并完成依赖环境检查：
https://github.com/konlu/story-studio
Agent 会自动识别自身 skills 目录（如 `~/.codex/skills/story-studio`），自动拉取并完成接入！
```

---

#### Option B (For Power Users, One Command): Clone with a Single Terminal Command
Open a terminal (Terminal or PowerShell) and paste the command for your system:

```powershell
# Windows (PowerShell)
git clone https://github.com/konlu/story-studio.git "$HOME\.codex\skills\story-studio"
```

```bash
# macOS / Linux
git clone https://github.com/konlu/story-studio.git ~/.codex/skills/story-studio
```
> 💡 *Note: if you use Claude Code or another Agent, just replace `.codex` in the path with `.claude` or `.agents`.*

---

#### Option C (For Zip Downloads): Double-Click the One-Click Installer
If you downloaded a Release archive (`.zip`) from GitHub, unzip it. There is no need to hunt for hidden system directories by hand:
- **Windows**: just double-click **`install.bat`** in the folder
- **macOS / Linux**: open a terminal in the folder and run **`./install.sh`**

The script automatically detects the Agent skills directories available on your system and installs into place.

---

### Step 2: Ask the Agent to Configure the Environment in One Sentence

No manual setup of Python, Node.js, FFmpeg, or JianYing paths! After installing, send this to the Agent:

```text
使用 $story-studio，帮我一键检查并自动配置全部运行环境。
```

> 💡 **Smart on-demand setup**: if you only use it for writing, it installs no media components at all; when voiceover, transcription, and JianYing draft export are needed, the native launchers (`bootstrap.ps1` / `bootstrap.sh`) automatically configure Python 3.11 (`uv`), Node.js LTS, `Coli`, `FFmpeg`, `pyJianYingDraft`, and all other dependencies in your own separate data directory.

### Step 3: Start Creating!

Just tell the Agent what you want in plain language. Here are the most common ways to use it 👇
---

## 🎛️ Flexible Workflow Switches

Inside Story Studio, three main switches control the scope: **writing (`write`), illustration (`illustrate`), and JianYing draft (`draft`)**. Voiceover and transcription run as seamless connecting steps, triggered as needed.

You do not need to write any configuration file. Just direct it in natural language, or state the switch states explicitly:

| Your scenario | Writing | Illustration | JianYing draft | Notes |
|:----------------------------------------- |:---: |:---: |:------: |:----------------------------------------------- |
| **Only find topics / write a voiceover script / revise the opening hook** | ✅ On | ❌ Off | ❌ Off | Pure text creation; it will not touch paid image generation or voiceover APIs |
| **Script already written; split the storyboard and generate images** | ❌ Off | ✅ On | ❌ Off | Storyboard prompts only, or call the image tools to generate images |
| **Voiceover and images already in the folder; lay out the JianYing draft directly** | ❌ Off | ❌ Off | ✅ On | Runs Coli timeline alignment automatically, adds push-pull camera moves, and writes the JianYing draft |
| **Full end-to-end production from scratch** | ✅ On | ✅ On | ✅ On | Topic and script → finalized script → voiceover and transcription → images → JianYing draft |

---

## 💬 Example Prompts

### Scenario 1: Full End-to-End Production (From Topic and Script to JianYing Draft)
```text
使用 $story-studio，制作一期关于「张居正考成法改革」的历史短视频。
1. 写作：采用历史叙事风，约 1800 字，先给我 3 个不同切入角度的开头钩子让我选，定稿后再继续。
2. 配音：定稿后使用我配置好的豆包语音生成 MP3（如果还没配置请引导我）。
3. 配图：用 Coli 对齐时间轴后拆成 20 镜，采用「厚涂历史漫画风」，9:16 竖屏生成配图，并带 3:4 和 4:3 封面。
4. 草稿：生成 1080x1920 的剪映专业版草稿，加入慢推拉运镜，默认不显示字幕。
```

### Scenario 2: Write a Voiceover Script About a Legendary Woman in the Character Story Style
```text
使用 $story-studio，只写一篇关于「林巧稚」的人物故事口播稿。
采用人物故事风，单集约 1600 字。
请先核实她的生平关键时间节点与真实数字，使用“数字连排”或“反常画面”做开头钩子，只交付文稿和事实核查表。
```

### Scenario 3: Prepare Your Own Voiceover in the Folder and Let the Agent Read It and Finish Post-Production
```text
使用 $story-studio，继续当前文件夹里的项目。
我已经把定稿文案 `script.md` 和我自己录好的配音 `voice.mp3` 放进这个文件夹了。
请直接读取我的配音文件，用本地 Coli 生成字幕对齐时间轴，按「黑白叙事风」拆 18 个分镜并生成配图，最后直接导出到我的剪映草稿箱。
```

### Scenario 4: Only Split the Storyboard and Write Image Prompts (For External Tools Such as Midjourney or Jimeng)
```text
使用 $story-studio，写作关、配图开、剪映草稿关。
读取文件夹里的定稿和 MP3 配音，先做音文时间对齐，然后按「历史写实风」拆解 22 个分镜。
注意：这次只输出带时间戳的 STORYBOARD.md 分镜表和每镜独立的完整中文生图提示词，不要实际调用生图工具。
```

### Scenario 5: Precise Rework of Single Shots and Version Iteration
```text
使用 $story-studio，继续这个项目。
文案、配音和前面生成的图片都保持不变，只重做第 8 镜和第 15 镜的配图（第 8 镜人物年龄改成晚年阶段），然后用新图片重新导出一版带可编辑字幕的剪映草稿，保留旧草稿别覆盖。
```

---

## 📂 Project Directory Structure and Deliverables

### Repository Layout at a Glance
```text
story-studio/
├── SKILL.md                        # AI Agent 核心总控指令与路由规则
├── README.md                       # 项目说明文档
├── install.bat / .ps1 / .sh        # 跨平台一键安装脚本（自动寻路部署）
├── scripts/                        # 跨平台环境自动初始化、豆包TTS、交接核验等核心脚本
│   ├── bootstrap.ps1 / .sh         # Windows / macOS / Linux 零依赖启动器
│   ├── doubao_tts.py               # 豆包语音 V3 双向 WebSocket 合成客户端
│   ├── voice_settings.py           # 音色配置与本地加密凭据管理
│   └── check_handoff.py            # 剪映导出前的音图语义与时间轴一致性检查
├── references/                     # 事实核查原则、豆包配置指南、扩展赛道说明等
└── modules/                        # 内置四大专业子模块
    ├── history-writing/            # 【历史叙事模块】含 DNA 规则 + 57 篇高赞原稿与钩子分析
    ├── characterstory-writing/     # 【人物故事模块】含人物故事 DNA + 300+ 篇爆款对标语料库
    ├── history-image/              # 【分镜配图模块】含 3 套画风规则 + 12 张正文参考图 + 封面参考
    └── render-history-video/       # 【剪映草稿模块】含时间轴对齐、缓入缓出推拉运镜与草稿导出
```

### What Do You Get with Each Creation?
All creative products are saved cleanly in your own **workspace project directory**, never polluting the Skill source:

| Stage | Files and products delivered |
|:--------------- |:------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| **✍️ Writing stage** | Plain voiceover script, alternative titles, fact-check table and timeline notes, source notes |
| **🎙️ Voiceover and transcription** | `narration.mp3` (final voiceover), voiceover parameters and hash verification records, Coli local recognition `.srt` subtitles and check files |
| **🎨 Storyboard and illustration** | `STORYBOARD.md` & `STORYBOARD.json` (with timestamps, source text anchors, and standalone prompts per shot), body images named by shot number, `COVER_3x4.png` / `COVER_4x3.png` cover images, and optionally opening first and last frames with video prompts |
| **🎞️ JianYing draft** | Editable project written directly to the JianYing Pro draft directory, `plan.json` timeline and camera movement plan, `semantic_alignment.json` semantic verification record, and optionally a locally rendered `final.mp4` |

---

## 📦 Dependencies and Privacy

### 1. Automatically Managed Runtime Environment
Story Studio's built-in launcher automatically configures the following on demand in the **user data directory** outside the skill directory (`%LOCALAPPDATA%\story-studio` on Windows, `~/.local/share/story-studio` on macOS/Linux):
- **Python 3.11** (a separate virtual environment managed automatically through `uv`, installing `websockets==15.0.1`, `pyJianYingDraft==0.3.1`, `Pillow`, `NumPy`, `pymediainfo`, and others)
- **Node.js 20+ LTS & Coli**: for local offline speech-to-subtitle (based on `sherpa-onnx`), with no paid cloud subtitle API calls
- **FFmpeg & ffprobe**: for audio integrity decoding checks and optional local video rendering
- **JianYing Pro**: one-click draft directory detection on Windows, with help installing through WinGet when it is missing

### 2. Account Security and Privacy Boundaries
- **No private information left behind**: the source, examples, and corpus indexes in this open-source repository have been desensitized and hashed, and contain no personal computer paths, account information, or keys.
- **Secure key storage**: the Doubao voice `API Key` is only read from the `DOUBAO_TTS_API_KEY` environment variable or a system-level secure credential file (encrypted with the current user's DPAPI on Windows, a `0600` private file on macOS/Linux), and is never written into chat logs, project JSON, or the Git repository.
- **Transparent and controllable costs**: the Skill itself is completely free and open source. Doubao voice synthesis (TTS) and the AI image tools in the host environment may incur API fees from their providers; the Agent asks for confirmation before the first synthesis or batch image generation, and never silently issues repeated billing requests in the background.

---

## 🙏 Acknowledgements

Story Studio would not exist without the following excellent open-source projects and infrastructure. Thanks to their authors and maintainers:

- **[GuanYixuan / pyJianYingDraft](https://github.com/GuanYixuan/pyJianYingDraft)** (Apache-2.0): provides the powerful JianYing Pro draft data structures, tracks, keyframes, and project generation.
- **[MarsWave / Coli](https://github.com/marswaveai/coli)** & **[k2-fsa / sherpa-onnx](https://github.com/k2-fsa/sherpa-onnx)**: provide a fast, accurate local offline speech recognition CLI and the underlying inference engine.
- **[OpenAI / imagegen](https://github.com/openai/skills/tree/main/skills/.system/imagegen)**: provides an image generation workflow collaboration reference.
- **[Astral / uv](https://github.com/astral-sh/uv)**, **[Node.js](https://nodejs.org/)**, **[FFmpeg](https://ffmpeg.org/)**, **[python-websockets](https://github.com/python-websockets/websockets)**, **[Pillow](https://python-pillow.github.io/)**, **[NumPy](https://numpy.org/)**: provide a solid cross-platform base for environment management and multimedia processing.
- **[Volcano Engine / Doubao voice model](https://docs.volcengine.com/docs/DoubaoVoice/bidirectional-streaming-text-to-speech-websocket?lang=zh)**: provides natural, fluent Chinese speech synthesis support.

---

## ☕ Sponsor

<span id="sponsor"></span>

If you find **Story Studio** helpful for your short-video creation, creator business, or AI Agent workflow, tips are welcome!

> **Special note: all tips to this project will be donated in full to children in mountain areas and to seriously ill patients, for charitable education and medical aid. Thank you to every supporter for your kindness and warmth!**

<div align="center">

| WeChat Tip Code | Alipay Tip Code |
|:-----------------------------------------------------------------------------------------------------: |:-----------------------------------------------------------------------------------------------------: |
| <img src="assets/sponsor/wechat-pay.png" width="220" alt="WeChat tip code"/><br/><sub>Scan with WeChat to tip</sub> | <img src="assets/sponsor/alipay.png" width="220" alt="Alipay tip code"/><br/><sub>Scan with Alipay to tip</sub> |

</div>

---

## 📬 Contact

Creators, indie developers, and AI enthusiasts are welcome to get in touch and explore new ideas together:

- **WeChat**: add the personal WeChat account lukon102 (please add the note: `Story Studio` or `自媒体创作`)
- **Email**: `lukonn@163.com`
- **Feedback**: bug reports and feature suggestions are welcome on [GitHub Issues](https://github.com/konlu/story-studio/issues)

---

## 📄 Open-Source License and Statement

- **Code and skill specifications**: this project is open source under **[CC BY-NC-SA 4.0](LICENSE)** (Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International). For personal study, exchange, and non-commercial creation only; any form of commercial resale, paid repackaging, commercial course distribution, or offering as a commercial paid tool is strictly prohibited.
- **Content and corpus note**: the built-in benchmark script corpus is for studying narrative structure, opening hooks, and writing technique only, and is not a source of verified historical fact; the AI-generated style reference images and cover samples are likewise not historical photographs.
- **Third-party ecosystem**: third-party dependency libraries (such as `pyJianYingDraft`, `Coli`, `websockets`, and others) are distributed under their own open-source licenses; this repository does not embed or redistribute their source code.
