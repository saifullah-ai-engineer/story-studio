# Adding a New Track or Writing Style

Currently available: historical narrative, the Yuling character story style, and three existing illustration styles. Folklore is an extendable track, not an existing dedicated DNA. Do not create empty modules, fake corpora, or unverified capability claims.

## When a User Asks for Folklore Now

First check whether the story version, region, or source the user specifies is already clear; folk legends, historical events, and literary adaptations are labeled separately. Ordinary writing can follow the given version or sources actually consulted, without waiting for a dedicated skill; record `track=folklore` and `writing_profile=general-folklore`, and state that this is ordinary writing rather than an established distilled style. When no version is specified and the differences would change the main plot, ask; do not stitch together mutually exclusive versions and call the result the original story.

Illustration can reuse a confirmed style, but realistic appearance research and legendary settings are kept separate: supernatural or fantasy characters and fictional scenes follow the chosen story version or the user's setting, and are not presented as historical photos or research conclusions. The voiceover, storyboard, image semantics, and draft workflow for narration still apply.

## When Actually Extending a Module

1. Register the track, writing_profile, scope, and actual rule files in the root entry, adding only the guidance that changes decisions for this track. One track can have multiple profiles; do not lock a style to a subject.
2. When there is source corpus or a style supplied by the user, distill from the evidence and keep the source boundaries; without them, do not claim a style has been distilled. Do not automatically apply the Yuling arc of suffering for women to ordinary people, male characters, or other eras.
3. A new writing profile is only responsible for the writing; the illustration style_id, the three stage switches, and the project handoff are reused. When adding a new illustration style, register it in the illustration module and maintain a separate styles/ file.
4. Each module is maintained independently within its own directory, using relative resource paths. Without an explicit request, do not publish or modify other installation directories.
5. Verify the real paths: writing only, storyboard only, draft only, combined production, missing voiceover, single-shot rework, and version changes; do not treat the existence of switches as proof that standalone use works.

## Built-in Module Sources and Runtime Dependencies

| Built-in path | Source and purpose |
| --- | --- |
| modules/history-writing/ | History writing rules, 57 corpus scripts, and retrieval/counting tools |
| modules/characterstory-writing/ | Character writing DNA and the actual corpus in its source directory; original scripts are not used as factual evidence |
| modules/history-image/ | Storyboarding and three illustration styles, cover reference images, Coli transcription, and allocation checks |
| modules/render-history-video/ | Semantic and pacing checks, push-pull camera movement, JianYing export, and local rendering on explicit request |

The built-ins are usage resources; they do not include the source directory's Git history, cache, or the original skill discovery entry. The directory containing `GUIDE.md` is the module's script and resource base. Once the original skill directory is deleted, the built-in rules and corpus remain readable. External dependencies are configured selectively following the [setup flow](setup.md): Python 3.10+, media libraries, ffmpeg/ffprobe, local Coli, and pyJianYingDraft for drafts. Illustration reuses the tools currently available, with optional imagegen guidance; do not store keys or reimplement clients.

When a backend is missing, report the exact dependency; do not describe "rules and materials are built in" as "there are no external dependencies."
