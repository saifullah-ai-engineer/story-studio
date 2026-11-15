# Generate a Jianying Draft Directly

The export script calls the upstream Python library `pyJianYingDraft==0.3.1` directly, with no external draft skill needed.

## Initialization and Directories

First check the Python libraries, libmediainfo, and ffmpeg/ffprobe per [dependency setup](../../../references/setup.md). The runtime environment and local configuration live outside the skill directory.

Draft root priority: `--drafts-root` command line → `JY_PROJECTS_ROOT` → user runtime configuration → the draft location in Jianying's globalSetting → the single determinable standard directory that already exists. A new installation gets its standard directory from automatic initialization; when an existing custom setting still cannot be read, the Agent checks Jianying's settings to verify it, and does not first ask the user to manually copy the path.

```sh
python "<story-studio目录>/modules/render-history-video/scripts/export_jianying.py" "<版本目录>/plan.json" --drafts-root "<剪映设置中的草稿目录>"
```

The python above should be replaced with the absolute Python path recorded in the initialization configuration; a portable install does not require a global PATH or the py launcher. The entry point automatically uses the configured Python environment.

## Write Behavior

1. Validate the plan and current materials, reusing verified times without re-splitting evenly.
2. Create a dedicated staging project for this run under the draft root; copy materials into materials, naming them by content hash, so media is not lost if external files move.
3. Arrange the project with the original library's DraftFolder, TrackSpec, VideoSegment, AudioSegment, and optional TextSegment.
4. Sample the shared camera move curve into linear scale/position keyframes at the output frame rate, expressing ease in/out and cut-point zoom, without passing Bezier parameters the original library does not support, and without encoding video.
5. Save the native draft_content.json, generate a content-identical draft_info.json entry copy, update the project name, duration, paths, and time metadata, then commit to the final directory.

By default, same-name drafts are rejected. When `--overwrite` is explicitly used, first keep the old directory as a backup in the same directory, then commit the new project; a failed staging project is cleaned up and does not replace the old result.

It outputs jianying_draft.json and resolved_plan.json; the former records the actual library version, draft path, duration, tracks, and subtitle status. It does not generate final.mp4.

## Acceptance

Check that the two project JSON files agree in content, that meta paths are correct, that all materials exist and are in the final materials directory. Check track count, continuous timing, that the first shot starts at 0, that the audio covers the end, the scale/position keyframes, and any explicitly requested subtitles.

The upstream feature notes mark basic features as supporting Jianying 10.8, but the generated files and structure checks so far do not equal playback. You need to open it in the target Jianying, preview, and export manually; do not use UI automation to export. If the draft list has not refreshed, restart Jianying or enter and leave an old project to refresh it.

When errors occur, check the library version, system libmediainfo, material parsing, and directory permissions; do not automatically switch implementations or modify other skills. See [upstream documentation](https://github.com/GuanYixuan/pyJianYingDraft).
