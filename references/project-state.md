# Project Records and Versions

Save `STORY_PROJECT.json` in the user's project directory. This record is for continuing work and locating materials; the user is not asked to fill it in by hand, and it is not an automatic execution plan. Existing storyboard formats and user directories are not migrated or renamed; reference them in this file.

## Suggested Structure

```json
{
  "schema_version": 1,
  "project_name": "本期项目名",
  "track": "biography",
  "content_mode": "factual",
  "writing_profile": "yuling-characterstory",
  "style_id": null,
  "aspect_ratio": "9:16",
  "voice_mode": null,
  "last_request": {
    "stages": {"write": true, "illustrate": false, "draft": false},
    "image_mode": null,
    "scope": "本次明确要求的产物或镜号"
  },
  "artifacts": {
    "manuscript": null,
    "facts": null,
    "audio": null,
    "srt": null,
    "storyboard": null,
    "semantic_review": null,
    "plan": null,
    "draft_result": null
  },
  "progress": {},
  "issues": []
}
```

- Use null for empty paths; do not fill an expected filename in as an existing product. An actual artifact may be `{ "path": "manuscript.txt", "sha256": "实际文件哈希" }`; only fill in hashes that were actually computed. Paths are relative to the project directory, or absolute; stay consistent.
- `last_request.stages` only describes the scope of this operation, and is not inherited automatically next time. When the user has not raised a new stage, parse it from their intent to "continue", "add images", or "redo the draft"; keep only the project settings and reusable results.
- Record progress as needed for writing, voice, storyboard, images, timing, semantic_review, and draft, using pending, draft, verified, needs_review, or blocked. State the completed scope clearly, for example which shot numbers were generated; do not write verified without actual verification.
- voice_mode may be doubao, provided, or none. Voice parameters, confirmation evidence, and the body text and audio hashes are saved in the project's voice.json or the audio file's companion .voice.json; artifacts.audio only references files actually generated or provided; do not save API keys or copies of credential files.
- track and writing_profile describe the subject and the writing style separately; style_id is the image style. When writing is off, the first two may be empty; when illustration is off and only existing images are reused, there is no need to ask about the style again.
- content_mode distinguishes factual, legend, fictionalized, and fiction; when a folk story has multiple versions, record the version used and the scope of adaptation.
- Existing upstream timing_basis, text_audio_review, storyboard_status, and per-shot observed_content remain in the original STORYBOARD.json / semantic_alignment.json; this file references them rather than maintaining a second set of cut points.

## Scope of Invalidation on Change

| Change | Must re-check |
| --- | --- |
| Final script or final voiceover changes | Audio-text differences, subtitle source, storyboard boundaries, and downstream drafts; new facts need an additional check |
| SRT correction or timing change | The corresponding tokens/cues and cut points; do not re-split timing by the new character count |
| Single-shot image replacement | That shot's semantics, period and character, composition, and adjacent cut points; update the actual image hash |
| Shot boundary change | Adjacent shots' source text coverage, timing evidence, image applicability, camera movement, and draft |
| Cover-only change | Cover check; no need to redo the body timeline |

Change work keeps the old materials and old drafts, using new transcription/edit version directories. Overwrite a specified file only when the user explicitly asks for it; do not treat the same filename as the same version.

## Stage Handoff

- Writing only: the body text and fact records are enough; do not create fake SRT, storyboard, or draft states.
- Illustration only: accept the finished script and final voiceover; complete a pure-text request as text_only, and do not pass off an unaligned draft as ready for voiceover illustration.
- Draft only: accept externally supplied images and storyboards; add evidence after checking sources, audio-text, and the actual images, without requiring the original writing module to be "finished" first. A missing cover is recorded as optional and does not block.
- Full flow: once the writing is done and there is no final voiceover, follow the [Doubao voiceover](doubao-voice.md) guidance to configure and confirm the voice, generate the MP3, and then move on to the real timeline; while the voiceover is not ready, keep the body text, any storyboard drafts that can be done, and the gaps. When an MP3 already exists, reuse it, do not pay for synthesis again, and do not make a "precise draft" from estimated timing.
- When a stage is specified as off but its product is missing: report the specific missing file or shot numbers, stop the follow-on work that depends on that gap, and continue the independent work. Do not re-ask about switches that are already explicit.

At delivery, distinguish what was completed this time, what was carried over, and what is still pending; do not require the user to understand the internal JSON fields.
