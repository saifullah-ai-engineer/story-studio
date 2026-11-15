# Semantic Alignment of Images, Source Text, and Current Narration

This check takes priority over balancing shot lengths; all styles, Jianying, and local finished videos run it. Alignment has two parts: the text is actually read at that moment; and the actual image actually expresses that passage. A timestamp existing, or a script passing, does not prove the second part.

## Build the Correspondence from Image Content

Open each actual image, one by one; do not rely only on the filename or prompt. Check the person, age stage, place, action, time, and causal stage, and record image_path, shot_id, source_start/source_end, visual_anchor, observed_content, and the corresponding narration. For example, "still raising money" must not be paired with an army already marching out, and "retreat" must not be paired with a triumphal return. When an image is wrong, change the image or mark the gap for a replacement image; do not explain a wrong image into correctness by shifting time. For an abstract summary, use a scene covering the whole sentence, and state clearly that it is a summary image; do not show a specific result from the second half of the sentence early.

## Build the Time Correspondence from the Full Text

- First verify the narration version and the complete text, locating by source-text offset and order of occurrence, combining repeated sentences with surrounding context; do not use the first global search result. Person names, numbers, negation words, turning points, and the start and end of flashbacks are the focus; do not auto-confirm with a low-similarity short-sentence match.
- The Coli automatic path uses full-text order matching and context on both sides of the cut; only complete token timestamps may be used; do not skip the start of a sentence, do not interpolate by character count, and do not treat a missing time as 0. Different written forms of numbers or person names in transcription go to review_required: you may listen to the local audio, or compare against a verified SRT, and re-run after building a recorded correction / manual alignment version; do not change the narration or the original script to accommodate the ASR. Record the original transcription, corrected text, time evidence, and reasons; do not change words just to make the script pass.
- When a single token contains multiple characters and the cut falls inside it, you cannot claim character-level precision; use verified word-level times or listen manually to locate it, and do not hang multiple shots on one token start. Handle an SRT line spanning events the same way. When you have no listening ability or reliable time evidence, keep it pending verification and do not invent a conclusion.
- The script output start/end are display boundaries, with the first image start=0; audio_start is the real speaking time of the first matched token and can be greater than 0. When there is a silent opening, record them separately. Do not force the first shot's audio_start to 0 again.
- Automatic output only marks semantic_review_status=pending. When the script fails, read alignment_review.json and do not reuse the old alignment.json; each re-run uses a new version directory. A strict failure of full-text alignment does not mean the narration must be re-recorded; only handle the specific differences and evidence.

## Cut the Image at the Correct Semantic Point

When designing each shot, decide from which source-text clause the image starts to apply. The cut-in is based on the actual start of that complete semantic unit; resolve pronouns and omitted subjects from the preceding text. When an image only expresses the second half of a sentence, move the boundary to the real start of that second half, or switch to an image that covers the whole sentence; do not show the result at the start of the sentence. During a pause between transitions, keep the previous image by default, and cut only when the next event starts; a long cross-time pause needs its specific decision recorded. The first shot still shows an image matching the opening sentence from frame 0.

Satisfy semantics first, then balance dwell time. When a long segment contains incompatible events, adjust the storyboard under the existing authorization or list a replacement-image plan; when a specified count cannot satisfy both at once, explain the conflict; do not hide it with evenly split time, reusing an unrelated image, or moving a cut point far earlier or later. Editing must not add or remove specified images on its own.

## Per-Shot Evidence and Pre-Export Check

In the version directory, write semantic_alignment.json, containing this run's audio, subtitles, storyboard, image paths, and file SHA-256 (or a verifiable version identifier), plus per-shot image_path, source-text range, narration, observed_content, start/end, cut-point time basis, narration context before and after, review_status (verified/pending/mismatch), and issues. verified must come from actually viewing the image and checking reliable audio-text evidence; automatic matching only proves text location and cannot automatically set verified.

Check the narration corresponding to the start, middle, and end of each shot; at each cut, check the complete sentences before and after and the two actual images, focusing on person changes, age jumps, place changes, negation, and results shown early. After quantizing to video frames, check again that the final plan matches the verified times, allowing at most one frame of quantization error; check the actual draft / finished video material mapping, so the table can be right while the image files are swapped.

When any shot is pending/mismatch, first complete the fixes and evidence you can, and do not deliver it as an aligned finished product. You can save a diagnostic plan clearly marked as needing fixes; only export that preview when the user explicitly accepts a preview with problems, and list the shot numbers. When you have no playback ability, state accurately that it is an image and timeline evidence check, and do not claim to have watched the full playback. After an image, narration, script, or cut point changes, re-verify the affected shots and adjacent cut points; do not reuse an old report.

## story-studio Handoff Check Format

Before export, build on this file's existing manual semantic verification and add the following stable format, for the main entry's `scripts/check_handoff.py` to check read-only. You may keep the original custom fields; this does not require rebuilding the original storyboard. All relative paths use semantic_alignment.json's directory as the base. Map fields from an old format first and verify them in practice; do not automatically turn pending into verified.

```json
{
  "schema_version": 1,
  "workflow": "audio_first",
  "artifacts": {
    "audio": {"path": "../../narration.mp3", "sha256": "实际计算值"},
    "srt": {"path": "../../transcription/v1/transcript.srt", "sha256": "实际计算值"},
    "storyboard": {"path": "../../STORYBOARD.json", "sha256": "实际计算值"}
  },
  "text_audio_review": {"status": "verified", "notes": "实际完成的核对、差异及处理"},
  "shots": [
    {
      "shot_id": "S001",
      "image_path": "../../S001.png",
      "image_sha256": "实际计算值",
      "narration": "实际对应原文",
      "observed_content": "实际打开该图后记录的内容",
      "start": 0,
      "end": 8,
      "timing_evidence": "实际SRT cue/token或核听证据",
      "review_status": "verified"
    }
  ]
}
```

All plan shots must have one and only one record with the same ID, with paths and actual content hashes matching, start/end differing from the frame-quantized plan by no more than one frame, and source text, observed result, and time evidence non-empty. Video shots use video_path/video_sha256. When there is narration, artifacts.audio must point to the same file as in the plan; when silent but with a reliable SRT, workflow=srt_only, audio may be omitted, with the verification basis explained. The current SRT must have its hash recorded and its last line must not run past the end of the plan; the storyboard, original script, and other files that exist and took part in verification are also included in artifacts.

The script passing only shows that file identity, times, and record coverage agree; it does not understand observed_content, and it does not replace the real viewing and audio-text verification above. Run this check and the pacing check first, then call this module's export_jianying.py; if they fail, handle or report the specific block first.
