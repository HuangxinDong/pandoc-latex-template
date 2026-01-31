-- obsidian-callouts.lua
-- Converts Obsidian callout blocks to LaTeX tcolorbox

-- Callout type to color mapping
local callout_colors = {
    note = {bg = "blue!5!white", border = "blue!60!black"},
    info = {bg = "cyan!5!white", border = "cyan!60!black"},
    tip = {bg = "teal!5!white", border = "teal!60!black"},
    warning = {bg = "orange!5!white", border = "orange!80!black"},
    caution = {bg = "orange!5!white", border = "orange!80!black"},
    danger = {bg = "red!5!white", border = "red!75!black"},
    error = {bg = "red!5!white", border = "red!75!black"},
    important = {bg = "purple!5!white", border = "purple!60!black"},
    abstract = {bg = "teal!5!white", border = "teal!60!black"},
    summary = {bg = "teal!5!white", border = "teal!60!black"},
    question = {bg = "yellow!5!white", border = "yellow!70!black"},
    quote = {bg = "gray!5!white", border = "gray!60!black"},
    example = {bg = "violet!5!white", border = "violet!60!black"},
    success = {bg = "green!5!white", border = "green!60!black"},
    check = {bg = "green!5!white", border = "green!60!black"},
    done = {bg = "green!5!white", border = "green!60!black"},
    fail = {bg = "red!5!white", border = "red!75!black"},
    bug = {bg = "red!5!white", border = "red!75!black"},
}

local default_colors = {bg = "gray!8!white", border = "gray!50!black"}

function BlockQuote(el)
    -- Check first block is Para
    if #el.content == 0 then return el end
    local first_block = el.content[1]
    if first_block.t ~= "Para" then return el end
    
    -- Check first element is [!type]
    local first_elem = first_block.content[1]
    if not first_elem or first_elem.t ~= "Str" then return el end
    
    local ctype = first_elem.text:match("^%[!([^%]]+)%][-+]?$")
    if not ctype then return el end
    
    -- It's a callout! Get colors
    local ctype_lower = ctype:lower()
    local colors = callout_colors[ctype_lower] or default_colors
    local title = ctype
    
    -- Find where the title ends (at first SoftBreak or LineBreak)
    local content_start_idx = 2
    local title_parts = {}
    for i = 2, #first_block.content do
        local elem = first_block.content[i]
        if elem.t == "SoftBreak" or elem.t == "LineBreak" then
            content_start_idx = i + 1
            break
        else
            table.insert(title_parts, elem)
            content_start_idx = i + 1
        end
    end
    
    -- Build title if there's additional text after [!type]
    if #title_parts > 0 then
        local title_str = pandoc.utils.stringify(title_parts):gsub("^%s+", "")
        if title_str ~= "" then
            title = title_str
        end
    end
    
    -- Build content elements (rest of first para + other blocks)
    local content_inlines = {}
    for i = content_start_idx, #first_block.content do
        table.insert(content_inlines, first_block.content[i])
    end
    
    -- Create new content blocks
    local new_blocks = {}
    if #content_inlines > 0 then
        table.insert(new_blocks, pandoc.Para(content_inlines))
    end
    
    -- Add remaining blocks from original blockquote
    for i = 2, #el.content do
        table.insert(new_blocks, el.content[i])
    end
    
    -- Convert content to LaTeX
    local content_doc = pandoc.Pandoc(new_blocks)
    local content_latex = pandoc.write(content_doc, 'latex')
    
    -- Generate tcolorbox
    local latex = string.format(
        "\\begin{tcolorbox}[colback=%s,colframe=%s,arc=2pt,boxrule=0.8pt,left=8pt,right=8pt,top=6pt,bottom=6pt,title={\\textbf{%s}},breakable]\n%s\\end{tcolorbox}",
        colors.bg, colors.border, title, content_latex
    )
    
    return pandoc.RawBlock('latex', latex)
end
