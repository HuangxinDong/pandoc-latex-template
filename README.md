# Eisvogel-CJK

A customized **Pandoc LaTeX template** based on [Eisvogel](https://github.com/Wandmalfarbe/pandoc-latex-template), optimized for converting **Obsidian/Markdown notes** to beautifully typeset PDFs.

> **This is a fork of [Wandmalfarbe/pandoc-latex-template](https://github.com/Wandmalfarbe/pandoc-latex-template).**  
> For the original template, full documentation, and comprehensive examples, please visit the [upstream repository](https://github.com/Wandmalfarbe/pandoc-latex-template).

---

## Key Features

This fork focuses on enhancing the Eisvogel template for **CJK (Chinese, Japanese, Korean) documents** and **Obsidian note-taking workflows**:

### CJK Optimization
- **Native CJK font support** via XeLaTeX with proper font fallback
- **First-line paragraph indentation** (2em) following CJK typographic conventions
- Pre-configured for Chinese, Japanese, and Korean documents
- Proper line breaking and character spacing for CJK text

### Obsidian Integration
- **Full Obsidian Callout Support** — Converts Obsidian callout blocks (\`[!note]\`, \`[!warning]\`, \`[!tip]\`, etc.) to beautifully styled LaTeX boxes
- **Highlight Syntax** — Supports \`==highlighted text==\` syntax used in Obsidian
- Seamless workflow from Obsidian vault to professional PDF

### Enhanced Styling
- **Elegant blockquotes** with refined typography
- **Optimized code highlighting** with proper font sizing
- Clean, modern design suitable for academic notes and documentation

---

## Quick Start

### Basic Usage

\`\`\`bash
pandoc your-notes.md -o output.pdf \\
    --from markdown \\
    --template eisvogel \\
    --pdf-engine=xelatex \\
    --lua-filter=filters/obsidian-callouts.lua \\
    --lua-filter=filters/highlight.lua
\`\`\`

### For CJK Documents (Chinese Example)

\`\`\`bash
pandoc document.md -o output.pdf \\
    --from markdown \\
    --template eisvogel \\
    --pdf-engine=xelatex \\
    -V CJKmainfont="PingFang SC" \\
    --lua-filter=filters/obsidian-callouts.lua
\`\`\`

---

## Obsidian Callouts

This template includes a Lua filter (\`filters/obsidian-callouts.lua\`) that converts Obsidian-style callouts to styled LaTeX boxes.

### Supported Callout Types

| Type | Aliases |
|------|---------|
| \`[!note]\` | — |
| \`[!info]\` | — |
| \`[!tip]\` | — |
| \`[!warning]\` | \`[!caution]\` |
| \`[!danger]\` | \`[!error]\` |
| \`[!important]\` | — |
| \`[!abstract]\` | \`[!summary]\` |
| \`[!question]\` | — |
| \`[!quote]\` | — |
| \`[!example]\` | — |
| \`[!success]\` | \`[!check]\`, \`[!done]\` |
| \`[!fail]\` | \`[!bug]\` |

### Example

In your Obsidian/Markdown file:

\`\`\`markdown
> [!note] Important Note
> This is a note callout that will be beautifully rendered in the PDF.

> [!warning]
> Be careful with this operation!
\`\`\`

---

## Included Filters

| Filter | Description |
|--------|-------------|
| \`filters/obsidian-callouts.lua\` | Converts Obsidian callout blocks to LaTeX tcolorbox |
| \`filters/highlight.lua\` | Converts \`==text==\` to highlighted text (CJK compatible) |

---

## Documentation & Examples

For comprehensive documentation, please visit the original repository: [Wandmalfarbe/pandoc-latex-template](https://github.com/Wandmalfarbe/pandoc-latex-template)

---

## Credits

- Original [Eisvogel template](https://github.com/Wandmalfarbe/pandoc-latex-template) by [Wandmalfarbe](https://github.com/Wandmalfarbe)
- Block quotation styling from [pandoc-letter](https://github.com/aaronwolen/pandoc-letter) by [Aaron Wolen](https://github.com/aaronwolen)

## 📄 License

This project is open source licensed under the BSD 3-Clause License. Please see the [LICENSE file](LICENSE) for more information.