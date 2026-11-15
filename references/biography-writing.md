# Character Story Writing Adaptation

The current dedicated profile is `yuling-characterstory`, sourced from characterstory-writing. Its main style is based on the real-life historical women's stories of Yuling2711; original scripts from other accounts added later do not count as having been re-distilled and verified for this style, and the applicable audience is not automatically expanded on that basis.

## Reading and Execution

1. First read [Fact and Style Priority](fact-and-style.md). Take the character name, core events, target word count, and number of episodes in a series directly from the request when available; without a series requirement, do not force a split into 2 to 3 episodes.
2. Read the [character module](../modules/characterstory-writing/GUIDE.md), its Writing-DNA.md, opening hook DNA, article structure template, language DNA, and writing perspective and cognitive framework. The visual style guide is a reference for titles and pacing; it does not replace the illustration style choice.
3. First verify the life story, timeline, and core turning points, then choose hooks and structures the facts can support. Do not force a "suffering and perseverance" arc that has no supporting evidence; switch to a verified event and note that the original template does not apply. For a character outside this dedicated style's scope, write an ordinary character biography as the user requests, record `writing_profile=general-biography`, and do not claim the verified Yuling style or force a switch back to historical analysis.
4. Exact numbers and scene details follow the fact rules; template requirements such as the "three things never omitted" apply only when the evidence and the user's request allow. Do not invent numbers or experiences to complete a template.
5. Arrange background, rise, turning point, and ending according to the single episode or series plan. Series continuations read the earlier episodes first to avoid retelling the same event, or errors in age or identity continuity; without material from earlier episodes, do not invent a "previously on" recap.
6. Save the plain body text, and check the word count with `modules/history-writing/scripts/history_tool.py count`. An exact "N words" means strictly N; "about N words" defaults to plus or minus 5%, with the user's counting method taking priority. Do not use a low-similarity result from the history library to claim a duplication check against the character library has been done; when needed, compare against the actual character scripts referenced.

## Resource Boundaries

- Original texts in the module corpus/ are kept as references for writing style and topic selection; read them selectively for the current character and style, and do not load all files by default.
- Read the topic strategy DNA only when choosing a topic. The product placement DNA applies only when the user explicitly asks for commercial content; it is not part of a default voiceover task, and must not be added automatically.
- The gender, suffering, and sharing call to action in the templates are conditions of that specific style, not global rules for every character story track. A new style is added separately following the [extension notes](extending.md).
