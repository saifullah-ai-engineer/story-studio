# Doubao Voiceover and Follow-on Production

For when the user asks for voiceover, turning a script into an MP3, or a full voiceover flow that still has no final voiceover. Only maintaining the skill does not synthesize audio; do not copy another skill's personal voice, credentials, draft paths, or frame size.

## User Flow

Final script → choose Doubao voiceover or provide an existing voiceover → configure and confirm the voice → MP3 → local Coli SRT and audio-text check → storyboard with timing → illustration → JianYing draft.

Keep the three main switches of writing, illustration, and JianYing draft; voiceover is an independently callable connecting step, recorded as voice_mode=doubao, provided, or none. For writing only, deliver the script and note that Doubao voiceover can continue; do not send a paid request; when the user explicitly does not want voiceover, do not press the point.

When a voiceover flow lacks a usable final audio for this episode, first follow the [two-path choice in the main entry](../SKILL.md#when-the-final-voiceover-is-missing-both-paths-must-be-offered-first): proactively offer both "configure Doubao and let the Agent generate the MP3" and "the user provides the final MP3 for this episode". Only saying "audio missing, please provide an MP3" does not count as completing the guidance; when the user only asks for illustration and a JianYing draft without naming voiceover, still prompt. Do not ask again once the user has chosen a method or usable audio exists; only maintaining the skill does not trigger the voiceover choice. Projects where reusing old material is forbidden do not use old voiceover.

After choosing Doubao, follow the setup steps below; the user is not asked to generate files in other software first. After choosing a self-provided voiceover, receive the file or path and let the Agent finish the Coli transcription. While waiting for a choice, only continue work that does not depend on audio; do not treat silence as agreement to synthesize. When a final MP3 already exists and may be used for this episode, verify and transcribe it directly without paying for synthesis again.

## What Must Be Configured the First Time

Explain the following three items to the user in one go, and try to ask about this episode's voice, illustration style, and quantity together; do not re-ask for information already given.

| Setting | Where the user gets it | Purpose |
| --- | --- | --- |
| Voice API Key | [Doubao Voice Console API Key management](https://console.volcengine.com/speech/new/setting/apikeys) | Matches X-Api-Key; use the Key for the voice service |
| speaker ID | [Voice console](https://console.volcengine.com/speech/new) voice library | The exact voice identifier; do not substitute the voice display name; confirm the account is authorized to use that voice |
| Model resource resource_id | Chosen according to the enabled service and voice | Regular 2.0 voices use seed-tts-2.0; cloned voices 2.0 use seed-icl-2.0 |

"Model" covers two different fields: the required resource_id decides the service resource; req_params.model is an optional fine-grained model parameter for cloned voices. The current official documentation gives seed-tts-2.0-standard as the default fine-grained model; regular voices do not pass model, and cloned voices pass it only when the user explicitly selects it or the console requires it. Do not treat an Ark text model ID, App ID, subtitle Key, or voice ID as the resource_id; do not ask users of the new API Key to also provide an App ID or Access Token.

The user enables the voice service and keeps the resources usable; the Agent configures the local calling side. Whether a voice and resource match is decided by the account console and the real API result, not by the name alone. Do not clone anyone's voice by default on first use, or create a cloning task.

You can use this guidance:

> The script is finalized and we can continue with Doubao voiceover. Please enable the corresponding service in the voice console and provide the voice API Key through the host's secure input or key configuration entry; also tell me the voice speaker ID and model resource (regular 2.0 or cloned 2.0). I will configure it and generate the MP3, then continue with Coli transcription, illustration, and the JianYing draft. An existing final voiceover can also be reused directly.

## The Agent Completes the Configuration

First check or configure features=tts following the [setup flow](setup.md); when transcription and drafts are also needed later, use tts,asr,draft,images. The Agent installs any missing Python, websockets, and FFmpeg; the user is not asked to run commands. Dependency installation does not need the voice Key, and does not send a paid test.

The API Key is read first from the host's secure configuration DOUBAO_TTS_API_KEY. Only check that it exists; do not display the value; do not ask for the Key to be pasted in open chat. If the user has already provided the Key through a usable confidential channel and agrees to save it on this machine, the Agent can use voice_settings.py --key-stdin to write it from standard input into the dedicated credential file, and must not put the Key in command arguments, shell history, project JSON, or logs. --prompt-key is only for interactive terminals where the host can provide hidden input directly; do not ask the user to open a terminal on their own. Without a confidential input capability, guide the user to the host key or environment variable panel; do not claim it is configured when it is not.

The Agent runs with the absolute Python path recorded during setup:

```text
"<配置的Python>" "<技能绝对路径>/scripts/voice_settings.py" check
"<配置的Python>" "<技能绝对路径>/scripts/voice_settings.py" configure --speaker "<用户的speaker ID>" --resource-id "<用户选择的resource_id>"
```

Add --model when a cloned voice explicitly needs the fine-grained model. To save an authorized Key, add --key-stdin to the configure command and pass it through the process standard input; the --api-key parameter with an actual key must not be used. Saving only the voice without a Key returns a not-ready state, while the voice configuration is still saved. check does not go online; it only returns whether the Key exists, the non-secret voice parameters, and network_verified=false.

Voice parameters are saved to the user data directory story-studio/voice.json, separate from runtime.json. An optional Key goes to the same dedicated directory: on Windows a file encrypted with the current user's DPAPI; on macOS/Linux a local private file with 0600 permissions, explaining this before saving, and reusing the host key environment variable directly when the user does not want it saved. The source directory refuses writes of these settings; publishing, packaging, or committing code must not include the user data directory.

## Confirming This Episode and Generating the MP3

Before the first generation for each new project, show the exact speaker ID, resource_id, optional model, speech rate (default 0), volume (default 0), and read-aloud scope. Do not re-ask when the user has already explicitly confirmed the above voice for this generation; saved historical configuration may be a candidate, but does not automatically replace this episode's confirmation. After confirmation, record it in the project's voice.json, without the Key. Read only the finalized body text aloud; source.txt keeps the original script, narration.txt keeps the text actually sent, and whether titles and notes are read aloud follows this request.

```text
"<配置的Python>" "<技能绝对路径>/scripts/doubao_tts.py" --text-file "<项目>/narration.txt" --output "<项目>/narration.mp3" --dry-run
"<配置的Python>" "<技能绝对路径>/scripts/doubao_tts.py" --text-file "<项目>/narration.txt" --output "<项目>/narration.mp3" --voice-confirmed
```

dry-run only verifies the local text and voice parameters; it does not read the Key or go online, and success does not mean authentication or quota is verified. Only add --voice-confirmed once actual confirmation is obtained. The script uses the V3 bidirectional WebSocket interface from the user-specified documentation, and does not silently switch to SSE, legacy authentication, another voice, or another service.

The script sends the full text as a lossless character stream, and only treats the service as complete after SessionFinished arrives and audio is received; then it verifies with a full ffprobe and ffmpeg decode, keeping failed partial output for troubleshooting. The output MP3 and its companion .voice.json record the text hash, voice, protocol, audio hash, and duration, without writing the Key. Existing MP3s are not overwritten by default; the same script and voice first checks for an existing successful file, so no repeat paid request is made.

Transmission chunking is not a promise about total service length. For extra-long scripts, first check the current official limits; when multiple sessions are genuinely needed, the Agent splits by sentence or paragraph, saves the order, body text, and hashes, and only continues the segments that have not yet succeeded, without summarizing, dropping sentences, or truncating. Separate MP3 segments are merged with the ffmpeg concat demuxer, not by binary file concatenation; the final merged audio is fully decoded again, and Coli only transcribes the final version.

When authentication, quota, resource, or voice errors occur, stop at the voiceover stage, state the specific gap, and keep the completed script. A network timeout or incomplete stream may already have been billed, so the script does not retry automatically; the Agent first checks the partial output, existing MP3s, and the console request status, and states clearly whether re-synthesis is needed. When the MP3 succeeded but later transcription or illustration fails, only continue the downstream work.

## Continuing to Transcription, Illustration, and Draft

1. Check that the MP3 fully decodes, and check the start and end of the body text, proper-noun pronunciation, and missed reads; do not claim to have listened without listening. Then call the Coli script in the built-in [illustration module](../modules/history-image/GUIDE.md), transcribe the final MP3, keep the audio hash and raw result, and correct misrecognized characters against the script.
2. Use the real SRT and context to set storyboard timing, disambiguating repeated sentences; do not split durations evenly by character count or shot count. Actual image generation still follows this session's illustration switch, style, and quantity choices.
3. Call the built-in [draft module](../modules/render-history-video/GUIDE.md), passing the same MP3, verified SRT, storyboard, and actual images, and keep this project's frame size; the default remains 9:16 and does not inherit the 16:9 of a reference skill. Subtitles are for positioning, which is not the same as putting them on screen.

Doubao only handles TTS here, always with enable_subtitle=false. Subtitles use the local Coli; do not call or restore the discontinued Volcano subtitle API or its credentials. When delivering the MP3, SRT, images, and draft, distinguish what was actually generated, what was structurally verified, what was listened to, and what was previewed in JianYing.

Protocol and parameter sources: [the Doubao bidirectional WebSocket official documentation specified by the user](https://docs.volcengine.com/docs/DoubaoVoice/bidirectional-streaming-text-to-speech-websocket?lang=zh), [the official protocol attachment](https://portal.volccdn.com/obj/volcfe/cloud-universal-doc/upload_5ec6e28945592c909158dc1e2cf9a89c.zip), [the websockets client documentation](https://websockets.readthedocs.io/en/15.0.1/reference/asyncio/client.html). This project implements the required binary frames and flow on its own, and does not embed the official protocol attachment source.
