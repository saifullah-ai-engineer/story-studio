# Automatic Agent Setup

This file is for the Agent to execute. The user only needs to say "configure automatically"; there is no need to install Python, open a terminal, copy a draft path, or find a dependency skill. Copying the skill directory is not an install hook; check on first call, and run the install once authorized.

## Choosing Components and Authorization

| features | Use case | Automatic setup scope |
| --- | --- | --- |
| write | Writing, fact-checking, topic selection, counting | Configure Python when scripts are needed; text work does not depend on media tools |
| storyboard | Pure-text storyboards and prompts | Same as above; voiceover timeline alignment adds asr |
| images | Actual image generation | Reuse the host tools; install the optional imagegen guidance as needed, and verify image tool permissions separately |
| tts | Doubao MP3 voiceover | Python, websockets==15.0.1, FFmpeg/ffprobe; the user's Key, voice, and model resource are guided separately in [voiceover setup](doubao-voice.md) |
| asr | Final voiceover transcription | Python, Node.js LTS and npm, Coli, FFmpeg and ffprobe |
| draft | JianYing drafts from existing materials | Python, pyJianYingDraft==0.3.1, Pillow, NumPy, native libmediainfo, FFmpeg and ffprobe, draft directory |

Choosing "configure all features" selects draft,asr,images,tts; drafting from existing materials alone selects draft, adding asr when transcription is needed. Writing alone does not install JianYing, Node, or FFmpeg. Setup only installs software dependencies; it does not obtain keys, enable paid resources, generate voiceovers, images, or actual projects.

Run check first. When the user has asked for setup, one-click configuration, or automatic installation, or the same dependencies were already authorized in this session, run install directly. When an ordinary creative request first hits a missing dependency, show the components and their uses once based on the check result, and offer "configure automatically and continue (recommended) / hold off for now". Once the user chooses, the Agent carries out the whole process without confirming each package again. When setting up all features on Windows without JianYing, include the JianYing desktop app in that same choice; do not reinstall it when it already exists. When only project files are being generated, or the user explicitly does not want apps installed, do not add a JianYing install option.

## Native Entry Point: Starts Even Without Python on the Machine

The Agent runs the following commands for the operating system, replacing the paths with the actual installed absolute paths. These commands are for the Agent, not a to-do list for the user. check downloads nothing and writes no configuration; without Python it returns a preliminary install plan, which must not be treated as fully verified.

Windows (with Windows PowerShell):

```powershell
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "<技能绝对路径>\scripts\bootstrap.ps1" -Action check -Features "draft,asr,images,tts" -InstallJianying
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "<技能绝对路径>\scripts\bootstrap.ps1" -Action install -Features "draft,asr,images,tts" -InstallJianying
```

macOS/Linux:

```bash
bash "<技能绝对路径>/scripts/bootstrap.sh" check --features draft,asr,images,tts
bash "<技能绝对路径>/scripts/bootstrap.sh" install --features draft,asr,images,tts
```

Adjust the features as needed; the Windows -WithImagegen flag and the --with-imagegen flag on other systems only install the optional guidance skill when it is missing. When Git is available, reuse it; without Git, use the official GitHub HTTPS archive; keep the upstream license and do not overwrite existing skills. The setup notes do not grant image generation ability or paid quota. When the host lacks image tools, the Agent first checks available connections or plugins, and only asks the user to complete authorization when account authorization is needed; it does not collect or write keys.

## Install Behavior

1. Reuse Python 3.10 or later, 3.11 recommended; when missing, download the tool from Astral's official uv release, verify the SHA-256, and use uv to install a user-dedicated Python 3.11. Install files and Python live in the current user's data directory, and the global PATH is not changed.
2. asr needs Node.js 20 or later and npm; when missing, download the portable LTS release from the official Node.js site, verify the official SHA-256, and install it into a dedicated directory. Coli is pinned to @marswave/coli@0.0.20, using a dedicated npm prefix. The tool PATH is set only for the current child process.
3. On Windows without FFmpeg/ffprobe, use the Gyan essentials build listed on the official FFmpeg site, verifying the publisher SHA-256. Media Python packages go into a dedicated venv; a compatible interpreter can be reused directly, with no global pip install. The original libraries bring in runtime dependencies such as pymediainfo and imageio; verify MediaInfo.can_parse() in practice.
4. On macOS, reuse Homebrew to install ffmpeg and libmediainfo; on Debian/Ubuntu, reuse apt to install ffmpeg and libmediainfo0v5. Without a package manager, or on another system, the Agent chooses the official install method and continues the setup. When system privileges are insufficient, request authorization through the authorization flow the host provides; do not ask the user to run sudo or install commands on their own. When authorization cannot be obtained, keep the completed parts and state the blocker accurately; do not claim everything is ready.
5. When a Windows request includes installing JianYing: reuse the app when it already exists; when missing, first use WinGet for a user-level silent install. Without WinGet, read the Microsoft-maintained JianYing manifest, download the vendor installer, verify the manifest SHA-256, and use its declared silent parameters. Detect again after installing. When the installer, network, or system authorization fails, the Agent checks the official source and handles it; do not retry blindly.
6. The draft directory is resolved in this order: explicit parameter, environment, runtime configuration, the currentCustomDraftPath in JianYing's globalSetting, and existing standard directories. A fresh Windows install creates the standard draft directory automatically; other systems may save projects to a dedicated drafts directory. When an existing JianYing setting still cannot be read, the Agent checks the settings and verifies, rather than asking the user to find the path manually. Only read the relevant plain-text settings; do not read app credentials or account storage.
7. When finished, run check again through the same native entry point, plus setup_dependencies.py check. Check the Python library versions, module sources, APIs, libmediainfo, FFmpeg/ffprobe, Coli location, and required apps. Verify Coli can run before the first asr run; the first transcription may download models, but setup does not download models, upload audio, or call the Volcano subtitle API.

Scripts are a repeatable entry point, not a background install service. When a failure returns agent_action_required or error, the Agent looks at the current failing item, fixes what it can control, and runs it again; do not present the raw error, private paths, or manual user commands as the final delivery. Network downloads and software installs run within the scope the user has authorized; system authorization, account login, and tool authorization may still need the user in person.

## Configuration and Verification Scope

The dedicated Python, venv, Node, FFmpeg, Coli, cache, and runtime.json are stored in the user data directory story-studio, outside the skill directory. Windows uses LOCALAPPDATA; other systems use XDG_DATA_HOME or the user data directory convention. runtime.json records only python, coli_bin, drafts_root, and tool_dirs; STORY_STUDIO_CONFIG can change the configuration location, but must not be written into the skill source.

JY_PROJECTS_ROOT and COLI_BIN can override the corresponding tools and directories. The export, rendering, and handoff check entries automatically start the configured Python and set the tool PATH for the current process; they do not modify the user's or system's global environment variables, and do not modify other skills' source.

ready only means the selected dependency checks passed; it does not mean image generation authorization was obtained, the ASR model was downloaded, or a draft was accepted in JianYing. The current full production chain targets the Windows desktop Chinese JianYing; the macOS/Linux native install entry and file generation ability are not the same as verified full JianYing desktop export. Actual work still needs its materials, timeline, keyframes, and preview in the target JianYing checked.

tts dependencies being ready also does not mean the Doubao Key, quota, and voice are usable; continue with the [voice setup guidance](doubao-voice.md), and do not treat a successful install as a paid API verification that has passed.

Sources: [uv Python management](https://docs.astral.sh/uv/guides/install-python/), [Node.js](https://nodejs.org/en/download), [FFmpeg](https://ffmpeg.org/download.html), [Gyan builds](https://www.gyan.dev/ffmpeg/builds/), [WinGet manifests](https://github.com/microsoft/winget-pkgs/tree/master/manifests/b/ByteDance/JianyingPro), [pyJianYingDraft](https://pypi.org/project/pyJianYingDraft/0.3.1/), [Coli](https://github.com/marswaveai/coli), [imagegen](https://github.com/openai/skills/tree/main/skills/.system/imagegen).
