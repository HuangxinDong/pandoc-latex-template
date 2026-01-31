# Eisvogel for Obsidian & CJK

A customized **Pandoc LaTeX template** based on [Eisvogel](https://github.com/Wandmalfarbe/pandoc-latex-template), optimized for converting **Obsidian/Markdown notes** to beautifully typeset PDFs.

> **This is a fork of [Wandmalfarbe/pandoc-latex-template](https://github.com/Wandmalfarbe/pandoc-latex-template).**  
> For the original template, full documentation, and comprehensive examples, please visit the [upstream repository](https://github.com/Wandmalfarbe/pandoc-latex-template).


## Key Features

This fork focuses on enhancing the Eisvogel template for CJK (Chinese, Japanese, Korean) documents and Obsidian note-taking workflows:

### CJK Optimization
- **CJK font support**
- **First-line paragraph indentation** (2em) following CJK typographic conventions
- Pre-configured for Chinese, Japanese, and Korean documents
- Proper line breaking and character spacing for CJK text

### Obsidian Integration
- **Full Obsidian Callout Support** — Converts Obsidian callout blocks (`[!note]`, `[!warning]`, `[!tip]`, etc.) to beautifully styled boxes
- **Highlight Syntax** — Supports `==highlighted text==` syntax used in Obsidian
- Seamless workflow from Obsidian vault to professional PDF



## Usage with Obsidian Pandoc Plugin

This template works seamlessly with the [Obsidian Pandoc Plugin](https://github.com/OliverBalfour/obsidian-pandoc).
 Example extra arguments:

```
--from=markdown+wikilinks_title_after_pipe
--template eisvogel
--number-sections
--listing
--lua-filter=~/.local/share/pandoc/filters/obsidian-callouts.lua
--lua-filter=~/.local/share/pandoc/filters/highlight.lua
--filter pandoc-latex-environment
--pdf-engine=xelatex
```

> **Note:** Adjust the filter paths according to your system configuration.

## Obsidian Callouts 

The Lua filter (`filters/obsidian-callouts.lua`) converts Obsidian-style callouts to styled LaTeX boxes. See [Obsidian Callouts Documentation](https://help.obsidian.md/callouts) for syntax details.

## Documentation & Examples

For comprehensive documentation, please visit the original repository: [Wandmalfarbe/pandoc-latex-template](https://github.com/Wandmalfarbe/pandoc-latex-template)

## Credits

- Original [Eisvogel template](https://github.com/Wandmalfarbe/pandoc-latex-template) by [Wandmalfarbe](https://github.com/Wandmalfarbe)
- Block quotation styling from [pandoc-letter](https://github.com/aaronwolen/pandoc-letter) by [Aaron Wolen](https://github.com/aaronwolen)