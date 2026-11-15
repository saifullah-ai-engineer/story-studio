---
name: story-studio
description: Chinese content production for history and real-life character stories, with writing, Doubao voiceover, storyboarding and illustration, and JianYing drafts executed independently as needed, plus automatic dependency setup and continuing existing projects. Use when the user mentions story-studio or Story Studio, or asks for voiceover scripts, voiceover, illustration, and JianYing drafts in one flow for these subjects. The built-in writing styles are historical narrative and the Yuling2711 character story style; folklore and other tracks can be extended.
---

# Story Studio

One entry point. Enable writing, illustration, and JianYing drafts for this request. Three switches control the delivery scope; the content track, writing style, and illustration style are set separately. The corpus, reference images, rules, and scripts needed are built in; read them as needed.

## Installation and First Use

On first use, or when a dependency errors, first read [Dependency setup](references/setup.md). The Agent runs the native launcher check for the current stage: on Windows `scripts/bootstrap.ps1`, on macOS/Linux `scripts/bootstrap.sh`, always called with the actual absolute skill path, never assuming the machine already has Python. Writing only, or a pure-text storyboard, can be finished without the script-dependent work, without installing media components.

When installation is needed and the user has not authorized it yet, show the missing components together and offer a single choice: "configure automatically and continue / hold off for now". Do not make the user run commands, copy paths, or install items one by one. When the user has explicitly asked for setup, one-click configuration, or automatic installation, execute the matching install without asking again. The Agent finishes the download, installation, draft directory discovery, and re-check before continuing the original task; existing usable components are reused. Dependency installation and the creative switches are handled separately; setup does not generate work.

The launcher supports configuring a user-dedicated Python when Python is missing, then installing Node.js, FFmpeg, media libraries, and Coli as needed; on Windows, a user drafting can also install a missing JianYing. When installation fails, the Agent looks into the cause and fixes it, and only tells the user what to do when an OS authorization, account login, or tool permission is actually missing; a failure must not be turned into a list of manual commands. Image tool authorization is verified separately; do not treat the existence of a description file as proof the tool is usable. Copying a directory on its own does not perform an install; the check only triggers on first call.

Draft export uses the Python library `pyJianYingDraft==0.3.1` directly, with no extra draft skill to install. Real image generation can use the host image tools; `imagegen` is an optional guidance skill; Coli is the local transcription CLI. See [README](README.md) for dependencies and authors.

After setup, every python, python3, or py -3.11 in the module examples is replaced with the absolute path of the Python executable recorded in the external runtime.json; do not assume the portable install was added to the global PATH or that a py launcher exists.

## Parsing This Request

Accept natural language and Chinese switches; do not require the user to fill in JSON. Only enable the stages the user explicitly asks for; stages not requested stay off; the latest explicit switch wins. When the user only names the skill without saying what to do, briefly ask which item they want; do not default to turning everything on.

| Switch / internal key | Work scope | What it can accept when off |
| --- | --- | --- |
| Writing / `write` | Topic selection, fact verification, writing, revision, hooks, word count checks | A script the user already has |
| Illustration / `illustrate` | Storyboard, prompts, or actual image generation, decided by the mode below | Existing storyboard and images |
| JianYing draft / `draft` | Material checks, necessary audio-text alignment, timeline, camera movement, draft export | Existing materials or products from upstream stages in this session |

- "Writing only" → write only; "illustration only" → illustrate only; "make a JianYing draft from existing materials" → draft only.
- "Write a script and generate 20 images" → write and illustrate; "a full one-stop flow of writing, illustration, and JianYing draft" → all three on, while still checking prerequisites such as the final voiceover.
- "Illustration plus draft" includes actual image products, so it may enter generate; "storyboard/prompts only, then draft" does not authorize image generation, and when images are missing, deliver the finished portion and the gap.
- "Continue the illustration" or "only redo shot 8" enables only the stage requested this time; inherit the current project's confirmed settings and usable products, without carrying over the previous full-on operating scope.
- When a switch clearly conflicts with the natural language, clarify the conflict; push ahead independently with the parts that can proceed. Take non-essential settings from the current project or module defaults; do not ask for confirmation at every stage.
- A stage being off does not mean its existing materials are unusable. When required material is missing, do not quietly enable writing, image generation, voiceover, or local MP4; work that is on and does not depend on the gap continues to completion.

When starting a new project or continuing across stages, read [Project records and versions](references/project-state.md). Use an existing user directory directly; without one, create an identifiable project directory in the current workspace. Do not write creative products into the skill directory.

## Tracks and Writing Styles

Only choose a writing branch when writing is on. Infer it from the user's description first; "a Qin Yi character story in the Yuling style" is enough, so do not ask again. Real people can also be written in the historical narrative style; a character name alone does not force the character style.

| Content track | Writing style / `writing_profile` | When to read |
| --- | --- | --- |
| History / `history` | Historical narrative / `historical-narrative` | Read the [history writing guide](modules/history-writing/GUIDE.md), then follow its index to read the DNA, the 5 related original scripts, the fact-checking guide, and the word count tools |
| Character story / `biography` | Yuling character story / `yuling-characterstory` | First read the [character writing adaptation](references/biography-writing.md), then the [character module](modules/characterstory-writing/GUIDE.md) and the DNA it references |
| Folklore and other new tracks | No dedicated profile built in yet | When the user actually raises one, read the [extension notes](references/extending.md); ordinary writing can follow a story version the user specifies, labeled for what it is, without claiming a distilled dedicated style |

Read [Fact and Style Priority](references/fact-and-style.md) first for all real history and character scripts. Facts with evidence take priority over style requirements; exact numbers, quotations, and scenes of suffering in character templates must not be invented. The structure and ending rules of the historical style and the character style each apply on their own; do not mix them.

Stop at the matching product when choosing a topic or an opening. Save the final plain body text separately, and verify it with the user's counting method; without a specified method, reuse the history module's Unicode alphanumeric counting rule. Keep the fact table, timeline, and sources in the project; do not write them back into the corpus automatically.

## Voiceover Handoff

Keep the three main switches; voiceover is an independently callable connecting step. After the final script is done, note that Doubao voiceover can continue; when the user only wants the script, or explicitly does not want voiceover, do not send a synthesis request.

### When the Final Voiceover Is Missing: Both Paths Must Be Offered First

Whenever a voiceover task needs audio alignment and there is no usable final voiceover for this episode, read the [Doubao setup and voiceover guide](references/doubao-voice.md) when the gap is first found, and proactively prompt the user to choose one of the following. **Even when the user only says "illustrate this script and make a JianYing draft" without explicitly saying "voiceover", this rule still applies. Do not end with only "audio missing, please provide an MP3."**

1. **Configure Doubao Voice and let the Agent generate this episode's MP3.** Explain that the voice service needs to be enabled, the voice API Key configured through the secure entry, and the exact speaker ID and model resource resource_id provided; the Agent checks and configures the local calling side, then synthesizes after confirming this episode's voice, resource, speech rate, and read-aloud scope. The optional model and resource_id for a cloned voice are recorded separately, and do not inherit the personal default voice.
2. **The user provides the final MP3 for this episode.** Accept the file or a local path; the Agent verifies the audio, transcribes it with the local Coli, checks it against the full text, and then continues with timed storyboarding, illustration, and the draft; the user is not asked to make an SRT by hand.

You may ask directly: "Which voiceover method for this episode: configure Doubao Voice and let me generate the MP3, or will you provide the final MP3 for this episode?" Also explain that the Key is configured through the secure entry, and is not pasted in chat.

Once the user has provided usable audio, chosen one of the above paths, or confirmed this episode's voiceover parameters, follow it and do not ask again. While waiting for a choice, continue work that does not depend on audio; without a choice, do not agree to synthesis by default, and do not send a paid request. Maintaining only this skill, standalone illustrations, covers, or static text-and-image work, and text-only storyboards that explicitly do not depend on audio, do not trigger this rule. When the user asks for everything to be remade, or forbids reusing old material, treat it as "no usable final voiceover for this episode" and do not substitute audio from an old project for this choice.

Confirm this episode's exact voice, resource, speech rate, and read-aloud scope before voiceover; parameters already explicitly confirmed for this session are not asked again. Read the Key only from the host secure configuration or a dedicated credential store outside the skill directory; never write it into a project or open-source file. The user completes service activation, Key acquisition, and voice authorization; the Agent completes dependency installation and local configuration. After setup, generate the MP3 from the finalized script, then run Coli transcription, storyboarding, illustration, and the draft. Reuse an existing final audio first. Voiceover setup does not automatically enable unrequested illustration or drafts, and does not restore the Volcano subtitle service.

## Illustration

Only read the [illustration module](modules/history-image/GUIDE.md) when illustrate is on. Keep the three modes:

| Request | `image_mode` | Delivery boundary |
| --- | --- | --- |
| Storyboard from the script, for another AI to generate images | `storyboard` | Complete storyboard and standalone prompts, no image generation |
| Improve existing storyboard prompts | `prompt` | Keep shot numbers and boundaries, no image generation |
| Generate images, add missing images, revise images | `generate` | Generate only the specified range, and check the actual images |

For "illustration only" when the level cannot be determined, ask whether storyboard prompts or actual images are wanted; while waiting, the full text and era can be analyzed. Prompts, expected image filenames, and model fields do not count as authorization to generate images.

Illustration style uses a separate `style_id`: historical realism `historical-realism`, impasto historical comic `historical-comic`, black-and-white narrative `monochrome-narrative`. When this project has not chosen one, ask; while waiting, a style-free draft can be prepared. Do not choose one on your own from the writing style, track, or an old folder name.

Before actual image generation, read the [body text style reference library](modules/history-image/references/style-reference-library.md), choose the reference set matching the confirmed style, and actually view it; pass the images to the tool when it supports them, fixing the main reference for this project, and verify against the first image before continuing. Record the reference ID, purpose, and actual pass-in status. Impasto comic and black-and-white narrative each include 6 body text references; historical realism uses text rules or a matching reference for this episode for now. Reference library figures cannot stand in for this episode's identity or era evidence; covers use the cover references separately.

Voiceover projects follow **final script → Doubao voiceover or an existing final voiceover → local Coli transcription and check → timed storyboard → illustration → edit to the same table**. A current voiceover subtitle that already exists and has been verified may be reused. When audio is missing, guide the user with the voiceover handoff rules; while the voice is not yet configured or confirmed, only prepare a draft pending alignment, and do not invent timing. Explicit standalone illustrations, covers, static text-and-image work, or pure-text storyboards are completed under the module exceptions.

Keep the module's cover rules: a complete generate request handles the cover for the chosen style, with black-and-white narrative having no cover by default; storyboard or prompt-only work produces no cover, and adding images does not regenerate an existing cover. A user-specified quantity, and a choice of no cover, take priority. On the first actual image generation, ask per the module whether opening first and last frames are needed; without an answer, do not add that product, and do not block the authorized body images.

## JianYing Draft

Only read the [draft module](modules/render-history-video/GUIDE.md) and its semantic verification, pacing, and JianYing notes when draft is on. The user only needs to call story-studio; the export script is called internally by this skill.

- Reuse existing scripts, audio, SRT, storyboards, and images; with illustration off, still do the necessary Coli transcription, audio-text, and semantic verification for existing images, without writing a new script or generating new images.
- Use the upstream verified display start/end and image mapping; do not re-split evenly. The first shot displays from 0 seconds, and the last shot covers the full voiceover; actual images must match the current voiceover's person, period, and event.
- When images are missing or wrong, or key timing has no basis, complete the diagnosis and feasible fixes, mark the gaps, and do not deliver it as a verified finished product; do not quietly call image generation. A missing cover does not block the body draft.
- Before export, run `"<story-studio directory>/scripts/check_handoff.py" "<version directory>/plan.json" --review "<version directory>/semantic_alignment.json"` with the configured Python. The tool checks the handoff consistency of the plan, image versions, and semantic records; it does not replace a human viewing the images and checking the audio against the text. When the exit code is not 0, handle it first; do not export directly.
- Default to vertical 1080x1920, 30fps, the full voiceover, and no on-screen subtitles; push-pull and cut punch zoom reuse the module rules, with explicit user requests taking priority. Subtitles used for positioning are not the same as putting them on screen.
- Only produce a JianYing draft by default. Unless the user explicitly asks for a local MP4, do not switch to an ffmpeg finished video just because JianYing is unavailable.
- JianYing export calls `pyJianYingDraft==0.3.1` directly. The draft directory prefers `--drafts-root`, then `JY_PROJECTS_ROOT` or the external runtime configuration, then reads JianYing's draft location setting; a fresh install uses the standard directory. When an existing custom configuration still cannot be recognized, the Agent checks JianYing's settings and verifies, rather than asking the user to copy a path first. Top up missing dependencies through the automatic setup flow.
- Revisions use a new version and a new draft name, and do not overwrite the old draft by default; do not operate JianYing 10.x export to a finished video automatically.

## Shared Constraints and Delivery

- The local Coli is the subtitle path; do not call the Volcano subtitle API, restore its credentials, or fake precise timing with character ratios.
- Built-in modules are usage copies for this skill. "This skill directory" in module text means the directory containing its GUIDE.md; `<story-studio directory>` is the overall skill root. Execute scripts with actual absolute paths.
- The main entry's stage scope and fact rules take priority over module defaults. A single example or verification conclusion does not extend into a claim that a new track is verified.
- This skill carries no author account or sync authorization; creation or maintenance does not automatically push, publish, or modify other installed copies.
- Skill source, examples, and corpus indexes store only generic parameters and relative paths inside the library; they do not store the user's real name, computer username, contact details, account identifiers, private file locations, credentials, or session records. Runtime configuration is read from current parameters, the external environment, or tool configuration, and is not written back into the skill directory.
- Setup saves configuration and dedicated tools in the current user's data directory, without modifying global environment variables or other skills' source, and keeps existing drafts by default. Native media libraries on macOS/Linux can be installed through the system package manager, with the required system authorization handled for the actual environment. When a dependency download fails or a version is incompatible, fix the specific problem; do not silently switch to another implementation.
- Deliver file links based on what was actually completed, distinguishing scripts, storyboard prompts, generated images, and drafts; explain pending audio, missing images, or unresolved items. Stages that are off are not written up as completed.
- Before delivery, attack and fix the 3 to 5 most likely problems: going beyond a switch, mixing facts or styles, audio-image version mismatch, era or character drift, timeline or material loss. Use word count, coverage, timing, and actual products as evidence for checks; do not treat a file existing, or a number passing, as content acceptance.

## Usage Examples

```text
使用 $story-studio，只写一篇秦怡的人物故事口播稿，玉玲风格，约1500字。
```

```text
使用 $story-studio，把这篇定稿生成豆包MP3，再做Coli字幕、20张历史写实配图和竖屏剪映草稿。缺少语音配置时引导我提供API Key、音色ID和模型资源。
```

```text
使用 $story-studio，写作关、配图开、剪映草稿关。
用这个项目的定稿和最终配音，黑白叙事风，拆20镜，只出分镜和提示词。
```

```text
使用 $story-studio，把这个文件夹里的已有图片、分镜和配音做成剪映草稿。
写作关、配图关，不加字幕。
```
