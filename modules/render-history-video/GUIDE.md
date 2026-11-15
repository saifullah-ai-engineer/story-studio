# Storyboard Images and Jianying Draft Module

This is the draft branch of story-studio, for projects that already have storyboard images, and not limited to the history track. It runs only when draft is enabled. When image generation is off, you can still verify the timing and semantics of old images, but you must not generate images or covers; a missing cover does not block the main draft. The scope and old-version retention rules of the main entry take priority.

Arrange the existing images by storyboard and actual narration time. By default, write a Jianying Professional draft: images, narration, and push/pull keyframes are written to the timeline in one pass, and Jianying previews and exports it. Only when the user explicitly asks for a local finished video should you generate an mp4 with per-frame float sampling. Each image runs its camera move from the moment it cuts in to the moment it cuts out; add a punch zoom at each cut (push in on the outgoing shot, pull back on the incoming shot, with enough amplitude, and both the outgoing and incoming moves run on slow durations). The default feel is about 12% over roughly 16-20 seconds. The order, narration, frame size, and camera requirements given by the user take priority; when the production method is already clear, execute it directly without asking for confirmation again.

## Invocation Convention

The user only needs to call `story-studio` and enable the Jianying draft. Draft export is called directly by `scripts/export_jianying.py` using pyJianYingDraft; see [references/jianying.md](references/jianying.md).

- **Do not** treat "please switch to calling the Jianying skill" as a delivery step
- Once this skill is activated, follow the flow below to align, write `plan.json`, and export the draft

## Receive the Upstream Aligned Storyboard

For a new project, the built-in image module completes Coli transcription → SRT verification → a storyboard table with times and source text → image generation from the table, following [audio first, then storyboard](../history-image/references/audio-first-storyboard.md). Rendering reuses that table's start/end, time basis, and actual image mapping directly; do not re-split time evenly, and do not overwrite verified cut points with fuzzy matching. If the narration or script changes, go back to audio-text verification first.

## Semantic Alignment First

You must read and execute [per-shot semantic alignment](references/semantic-alignment.md). Each image must match the person, time and place, and event stage currently being narrated; reuse the upstream verified source text and audio times, check each actual image against the source text of that time span, then re-check the shot length; if you find a version or timing problem, return to audio-text verification first. Before export, every shot must complete semantic verification; passing the pacing check is not a substitute.

## Materials and Time Alignment

- Check the storyboard JSON/Markdown, image numbers, SRT, narration, and the existing edit/project.md. Sort images by storyboard ID or explicit generation number; do not infer order from file modification time. Verify counts, missing images, and duplicate numbers.
- The cover is an optional deliverable; a missing cover does not block the main draft. An existing cover can be checked for consistency with the main body style; you may only make up a missing one when the image generation switch for this run is on and the request includes the corresponding image generation, otherwise record the gap and do not generate an image. When a standalone cover style is explicitly specified, record it in `edit/project.md`. When you only reuse existing images and do not change them, there is no need to re-select a style for rendering.
- When there is a reference video, use ffprobe to read its frame size and frame rate, and extract frames from different times within the same shot to compare camera move amplitude. Keep the original image style; do not automatically copy subtitles, particles, or music from the reference.
- SRT is the basis for narration timing, not text that must be shown. By default there are no subtitles; keep existing narration continuous and do not cut the audio when the image cuts; when an existing SRT has been verified as coming from the current narration and is usable, do not transcribe it again.
- **When an old project has narration but no SRT, transcribe it independently first, then check it against the existing storyboard.** Use `py -3.11 "<story-studio目录>/modules/history-image/scripts/transcribe_with_coli.py" --audio "<配音>" --out-dir "<新转录版本目录>"`, which can produce the raw SRT and timestamps without needing a storyboard table. The original `py -3.11 "<story-studio目录>/modules/render-history-video/scripts/align_with_coli.py" --audio "<配音>" --storyboard "<表>" --asr-json "<coli_asr.json>" --out-dir "<新核验目录>"` is only for later conservative re-checking; its per-shot SRT is not a true prerequisite transcription subtitle. When existing images do not match the actual spoken narration, handle them within the fix scope; do not force them into the old boundaries.
- Prefer the display `start/end` of the upstream verified storyboard table to generate `plan.json`. Only when an old project needs boundary verification redone should you use the display `start/end` of `alignment.json`; both paths keep the real speech `audio_start` and boundary evidence and complete semantic re-checking. If Coli is missing, transcription fails, or there are no usable timestamps, you must report the block and stop precise rendering; do not silently fall back to character-ratio estimation. Do not call the Volcano subtitle API, and do not configure or restore `VOLCENGINE_SUBTITLE_APP_ID`, `VOLCENGINE_SUBTITLE_SECRET_KEY`, or `VOLCENGINE_SUBTITLE_ACCESS_TOKEN`.
- The storyboard script and SRT may be a long version and a short version. Match narrative meaning segment by segment, and record an SRT starting anchor for each shot; do not split evenly by character count or image count. When a storyboard has no audio_start, do not treat the empty value as zero.
- The opening frame covers from 0 seconds. The last shot covers the full audio and the end of the SRT. After alignment, you must run [pacing review and correction](references/pacing-review.md), diagnose first, then handle shots that are too long, too short, or densely cut in succession; do not just report the average length. Only ask the user when multiple candidate narrations cannot be distinguished.

## Production

Create `<素材目录>/edit/<本次版本>/plan.json`. Parameters and examples are in [references/plan.md](references/plan.md). The script accepts any material path and does not depend on materials in the skill directory.

Requires Python 3.10+, `pyJianYingDraft==0.3.1`, Pillow, NumPy, and ffmpeg/ffprobe; the original library also needs a working libmediainfo. Coli is needed when there is no SRT. Configure per [setup flow](../../references/setup.md); keep the runtime environment outside the skill directory. Coli transcribes locally and does not call Volcano or any other cloud subtitle service.

### Default: Jianying Draft

Read [references/jianying.md](references/jianying.md) first, then use the wrapper script:

```powershell
py -3.11 "<skill目录>/scripts/export_jianying.py" "<版本目录>/plan.json"
```

The script first validates `plan.json` with the same rules as local rendering, then writes the Jianying draft: vertical frame, the full narration, push/pull keyframes covering each shot's dwell time, and cut-point punch zoom (slow durations, keeping the punch amplitude; by default no dynamic in/out transitions, to avoid a black flash at the cut). Materials are copied into the draft directory to avoid Jianying 5.9+ reporting missing media. It outputs `jianying_draft.json` and `resolved_plan.json`. The draft goes into the directory set under Jianying "Settings → Draft location" on the current computer. You can specify it with `--drafts-root` or `JY_PROJECTS_ROOT`; otherwise the backend detects it; verify the actual location before running, and do not use the author's machine directory.

- Do not encode frame by frame just to produce a draft. Jianying preview and export are the finishing steps.
- If using Jianying 10.x, do not run UI automation to export; after generating the draft, let the user open Jianying and export. A new draft may require restarting Jianying, or opening an old draft and returning to the list before it appears.
- Revisions go in a new version directory or use a different draft name; keep the user's materials and old finished videos.
- If export fails, check the original library version, directories, materials, and metadata reading per [references/jianying.md](references/jianying.md); report the specific problem and keep the old project.

### Optional: Local ffmpeg Finished Video

Use only when the user explicitly asks for a local mp4; Jianying being unavailable does not automatically authorize a local finished video. The version directory must not already contain a `final.mp4`.

```powershell
py -3.11 "<skill目录>/scripts/render.py" "<版本目录>/plan.json" --workers 3
```

The script first validates the plan, then applies an affine transform with bicubic sampling to each frame at fractional coordinates, encodes each shot independently, and finally merges the video with copy and joins the full narration. It outputs final.mp4, resolved_plan.json, consecutive-frame diagnostics, and a first/middle/last contact sheet. All outputs are in the same directory as plan.json. Local rendering is slow because every frame goes through float sampling and encoding; this is not the default path.

- Default 1080×1920, 30fps; a reference video or user request can override.
- **Push/pull must fill the shot's dwell time**: `zoom` eases in and out from the shot's `start` to its `end`, never stopping midway and never finishing in the first few seconds and then holding a still frame. The cut point is determined by the narration gap between the two adjacent images, and the camera move covers that whole span.
- **Cut-point punch zoom** (on by default for normal shots, off by default for shots shorter than 5 seconds): after the push/pull reaches a suitable composition, cut hard. The punch amplitude must be enough: the outgoing shot pushes in by `punch_out` (default 1.28), and the incoming shot enters from `zoom[0] * punch_in` (default 1.50). The speed must be slow: the outgoing move takes about 1.00 second, and the incoming move takes about 1.80 seconds to pull back before joining the shot's own push/pull. By default do not add "dynamic shrink / enlarge": those two in/out transitions flash one black frame at the cut; the punch relies only on scale keyframes. Do not add it to video shots by default. It can be turned off per plan or per shot with `cut_punch: false`.
- **Default speed** is about 12% over roughly 16-20 seconds (about 0.6-0.75% per second). Compute amplitude from duration: `amp = min(0.0065 × shot length in seconds, 0.16)`; shots with a person near the edge cap at 12%, wide long shots can reach 16%. When neighboring shots have similar lengths, their speeds should be similar, alternating push and pull. Do not apply a fixed 5-9% to every shot length: short shots would move too fast and long shots would barely show movement. When a single shot is too long and still slower than the reference speed after capping, tell the user; do not loop the push/pull on your own.
- Ease every shot in and out, and avoid short-cycle back-and-forth oscillation.
- Do not use zoompan integer cropping as the default camera move for the local finished video. The Jianying draft samples the shared camera move curve at the output frame rate and writes it as the original library's scale/position keyframes; it does not encode video.
- Shot parallelism is only for local ffmpeg; the Jianying draft is written in a single process.

## Acceptance and Delivery

### Jianying Draft

Confirm the draft path in `jianying_draft.json` exists and contains `draft_info.json`. Spot-check the shot count, that the first shot starts at 0 seconds, that the last shot covers the narration length, and that the narration is on the audio track. Do not claim to have watched Jianying playback unless you actually opened Jianying.

Deliver the clickable absolute path of the draft directory, briefly stating the duration, frame size, and whether it has narration and subtitles. Remind the user: open Jianying → see the new draft → preview the push/pull and cut-point zoom → then export.

### Local mp4

First render a representative short sample with the same parameters (a separate test plan; include a slow push, a slow pull, and a person at the edge), and confirm continuous motion before rendering the full video.

Attack four problems in particular: semantic alignment errors, subpixel jitter or encoding texture flicker, cropping people / black bars, and audio lost at the end. The script checks frame count, duration, and complete decoding, and saves first/middle/last frames for each shot and mid-segment consecutive-frame differences. Difference fluctuation is only a diagnostic, affected by compression and image content; it is not a smoothness score, and passing a threshold alone does not mean acceptance.

Look at the contact sheet, and extract one frame before and after each cut point in the finished video to check order and black frames; when you can play video, watch representative clips at normal speed. When you cannot play video, state clearly that the basis is consecutive-frame analysis and decoding checks, and do not claim to have watched playback.

Record the actual parameters, alignment choices, verification evidence, and unresolved limits in the project's edit/project.md. Do not hard-code the previous material's 12 images, 376.5 seconds, or person names as generic configuration.
