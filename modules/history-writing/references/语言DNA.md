# Language DNA

## Measurement Results

The object of analysis is the body text of the transcripts after conservative cleaning. Character counts use Unicode letters and digits, excluding punctuation and whitespace; sentence boundaries use `。！？!?`, and clauses additionally include commas, semicolons, and colons. The original punctuation comes from transcription, and cannot be equated with the author's written habits.

| Metric | All 57 Pieces | 45-Piece Discovery Set |
| --- | --- | --- |
| Body characters, including punctuation | 114,571 | 89,698 |
| Body character count, excluding punctuation and whitespace | 102,299 | 80,053 |
| Transcribed sentences | 4,067 | 3,192 |
| Average sentence length | 25.15 | 25.08 |
| Sentence length median | 23 | 23 |
| Sentences of 15 characters or fewer | 26.78% | 27.51% |
| Sentences of at least 50 characters | 6.71% | 6.83% |
| Average clause length | 8.51 | 8.47 |

Each body text is a single large paragraph, averaging 71.35 sentences per paragraph, which is an export form, not a layout rule. The body text has no reliable title structure, so the authors' subheading character counts cannot be measured. Dashes, parentheses, and quotation marks do not appear in the transcription, so no meaningful dash or parenthesis ratio can be calculated, and it cannot be inferred that the authors never quote. Chinese dominates, and numbers and a small amount of foreign text do not make a stable Chinese-English mixed style.

## Spoken Language and Vocabulary

| Expression | Occurrences | Articles | Use and Choices |
| --- | --- | --- | --- |
| 您 | 406 | 51 | Keeps conversational distance; usable, without forcing it into every paragraph |
| 咱们 | 201 | 50 | Invites shared understanding; usable, avoid inventing a shared experience |
| 为什么 | 80 | 30 | Raises a question that can be answered |
| 结果呢 | 12 | 11 | Moves from a decision to its consequence; not a fixed transition |
| 不是 | 261 | 53 | Common in contrasts; do not uniformly treat it as an AI tell |
| 而是 | 50 | 24 | Its count does not mean it pairs with "不是" sentence by sentence |
| 后背发凉 | 7 | 7 | The samples use it; a new draft does not need it as a required emotion |
| 关注 | 54 | 43 | Commercial and interactive ending; not inherited by default |
| 评论区 | 43 | 35 | Not a necessary narrative element |
| 左下角 | 15 | 10 | Product-selling wording; removed by default |

High-frequency nouns such as emperor, Cao Cao, Liu Bang, and Han Xin mainly reflect the topics; verbs such as know, feel, and ponder reflect spoken explanation; adverbs such as truly, in the end, and stubbornly are often used for reassessment and turning points. Frequency does not equal recommended usage. The full noun 100, verb 50, and adverb 50 lists are in the [Word Frequency Appendix](词频附表.md), and the raw data is in `corpus/statistics.json`. Jieba's automatic part of speech contains misclassifications, for example "明白" and "大将", useful only for locating expressions, not for learning wrong parts of speech from it.

## Workable Feel for the Language

First tell people and actions, then give the judgment. Rather than writing "the power relations were highly complex", find out who proposed the advice, who had the power to decide, and who bore the consequences, and then say it directly. Long sentences supply conditions, short sentences make the turning point visible; do not chase the statistical average.

Use a question at the opening or when changing layers, then give concrete progress or partial facts, keeping the core question for the body to explain; avoid revealing the whole mechanism at once, and avoid dangling a tease repeatedly. Statements and actions can form a hook just as well; see [Opening Hooks](开头钩子.md) for the nine opening types and same-topic alternatives. The narrative distance is close, allowing one "just think about it", but do not crowd out information with a run of "savor it, ponder it, guess". When explaining an official post or an institution, add only the part this story needs.

Use concrete contrasts instead of gasps: going from being able to command troops to losing military power helps the listener understand more than "the wheel of fate suddenly turned". Actions in the original drafts that clearly happened may be retold; unrecorded trembling hands, tears, thoughts, and secret talks cannot be added as fact in pursuit of visuals.

## Limited Removal of AI Flavor

After the body is finished, clean only problems that can be located: summary sentences that repeat earlier text, value uplift unrelated to the events, synonymous parallel phrases, consecutive exaggerated words, chains of rhetorical questions with no answers, and generic "deep logic" explanations. Keep functional spoken language, questions, and before-and-after contrasts, and do not aim to scrub the draft into a neutral encyclopedia entry. Recount after cleaning, without adding new facts.
