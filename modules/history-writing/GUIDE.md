# History Writing Module

This is a built-in module of story-studio. It runs only when writing is enabled and historical narrative is selected; first follow [Fact and Style Priority](../../references/fact-and-style.md). This module's path is the directory containing GUIDE.md, and it does not depend on the original history-writing installation directory.

Tell one thing from history that is worth questioning, and tell it clearly: open with a concrete question, advance the body through actions, conditions, and consequences, and close by answering the question. The shared patterns come from 57 highly liked sample pieces across 4 accounts, and the original drafts serve only as writing references. Likes were the selection criterion, not certification of historical fact or a guarantee of traffic.

By default, write historical drafts that rest on traceable evidence. Historical accuracy constrains the opening, the body, the title, and the premise of the topic; do not invent facts to serve a hook, a specified word count, or imitation of a style. Benchmark drafts, cleaned drafts, category labels, and model memory do not directly count as historical evidence. Only when the user explicitly asks for romance, legend, or literary dramatization should you enter the corresponding mode, and label its nature.

## Working by Request

| Request | What to Read and Do |
| --- | --- |
| Does not know what to post, looking for a topic by dynasty | Read [Topics and Series](references/选题与系列.md), search `corpus/catalog.json`; can start from [New Topic Card](references/新选题卡.md) |
| Write one piece, with a given figure and word count | Follow the writing workflow below |
| Improve the opening, several hooks to choose from | Read [Opening Hooks](references/开头钩子.md), calibrate style and verify facts against the writing workflow; only produce multiple versions when alternatives are explicitly requested, and when only hooks are wanted, do not write the full text yet |
| Revise, shorten, expand, or change the angle of a draft | Follow the writing workflow; keep the user's intent and the supported content, correct any factual errors found and briefly explain the impact, choose events to fit the new word count, and do not pad sentences to fill words |
| Verify history, check for errors, check historical correctness | Read [Historical Facts and Sources](references/史实与素材.md), check each claim against its source one by one; distinguish errors, disputes, and unverified items, and do not judge everything lacking evidence as fabrication |
| Consecutive topics, series scheduling | Read [Topics and Series](references/选题与系列.md), make each piece's question independent and avoid having adjacent pieces answer the same thing |
| Add benchmark drafts, update the style library | Read [Maintenance Workflow](references/维护流程.md), first identify what is new and what changed, then annotate each piece one by one; do not modify the user's original text |

## Writing Workflow

1. From the request, settle the core question, target word count, and whether this is a historical or dramatized piece. By default, write Chinese historical voiceover, and do not invent an author age, teaching tenure, firsthand experience, network of contacts, or book-selling identity. When the user only wants a topic, do not write a long draft on your own; when a figure and word count are already given, proceed directly.
2. Before each draft, read all five products in full: [Language](references/语言DNA.md), [Structure](references/文章结构模板.md), [Perspective](references/写作视角与认知框架.md), [Visual Boundaries](references/视觉风格指南.md), and [General Guide](references/Writing-DNA.md). Then read 5 related original texts in `corpus/raw/` in full, together with their metadata risks; use the same genre to fill in sparse topics, and spread across accounts and story clusters as much as possible. This library has no publication dates, so do not treat collection time as the "latest style".
3. Read [Historical Facts and Sources](references/史实与素材.md), first build a fact-check table and any necessary timeline, then write from that. Actually read the primary sources, reliable research, or archaeological and museum material; you may reuse the limited claims already verified in the [Fact Verification Pack](references/核验事实包.md). Record sources, the scope of support, and disputes, and check the premise of the opening and the topic question. Delete unverified key plot points, swap in a verified angle, or recast them as a sourced dispute; if the evidence is still insufficient, deliver the verified portion together with the gaps, and do not output a full draft pending verification by default. Only provide one when the user explicitly asks for a draft pending verification, and mark it in place.
4. Pick one main structure, and list the question, the evidence events, the turning point, and the ending. Read [Opening Hooks](references/开头钩子.md), choose the entry point from verified facts, make the first sentence carry concrete information, then advance and leave a question the body can answer. Normal drafts deliver one version; when multiple versions are explicitly requested, change the entry approach according to the user's number (3 versions when unspecified), and when only alternatives are wanted, wait for a selection before writing the full text. Use short paragraphs in the body, and do not insert source numbers or operating instructions. Put titles and source notes outside the body; by default, do not add book-selling, like-begging, or next-episode teasers. When the user asks for literary dramatization, clearly label its nature before the finished draft.
5. Following the delivery check in [Historical Facts and Sources](references/史实与素材.md), check the fact table backwards from the final draft: whether the timeline, identity and institutions, numbers, quotations, source hierarchy, and causation hold up, and check the title and every version of the hook the same way. Then check whether the body delivers on its promise, whether the same topic is being rewritten, and whether there is any unsupported mind-reading. Clean out repeated summaries, empty uplift, and ineffective rhetorical questions; any newly added fact must be verified first, and edits must not remove the time, conditions, or uncertainty that change the meaning.
6. Save the pure body text to this session's working directory and run the word-count check; recalculate after every final change. Run the similar-fragment check, and manually review whether high repetition comes from primary-source quotation, fixed proper nouns, or copied sentences. See [Tool Notes](references/工具说明.md) for the detailed commands.

## Word Count and Delivery

The user's explicitly stated counting method takes priority. By default, "character" (字) means the count of Unicode letters and digits: one Chinese character counts as one, digits and English letters count one by one, and punctuation and whitespace do not count. Titles, sources, and notes do not count toward the body. A specified "N characters" defaults to exactly N; "about N characters" defaults to plus or minus 5%, and the actual count is reported alongside. Very short pieces narrow to a single event, and must not damage the facts in order to squeeze in a full life story.

Normal delivery includes the title, the complete body, the actual word count, and a brief source note. When only pure voiceover is wanted, the user-visible part contains only the body, with the checks and factual basis kept in this session's working files. Historical uncertainty must be reflected in the wording itself, not hidden away in a note.

The fact-check table and timeline are kept in this project's directory, and are not written back to the skill automatically or presented as a whole-library verification. Source notes list only materials actually used that support the corresponding content; incomplete verification should be stated plainly, without claiming "100% correct" or treating a file-integrity check as historical certification.

## Source Entry Points

- [Complete Topic Library](corpus/选题库.md): 57 topics, dynasty coverage, story clusters, risks, and extension angles.
- [57 Opening Analyses](corpus/开头钩子逐篇分析.md): 9 main mechanisms, per-piece early text windows, suspense development, and body promises; no audio timestamps, so not treated as measured first-seconds data.
- `corpus/meta/Hxxx.json`: per-piece structure, likes and other collection metrics, original hashes, cleaning records, and source boundaries.
- `corpus/raw/` holds original snapshots; `corpus/clean/` is only limited transcription cleaning, without whole-library historical verification.
- `scripts/history_tool.py` uses only the Python 3 standard library; at runtime it uses this module's rules, corpus, and tools, and does not depend on a private source directory.

This module is maintained under story-studio's extension and validation rules, and does not automatically publish or sync to other installation directories.

The user's explicit request for this session takes priority over style preferences. Historical accuracy and a clear distinction of dramatization are the foundation of all templates, and "the original draft was written that way" cannot cancel them.
