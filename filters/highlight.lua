-- highlight.lua
-- Converts ==highlighted text== to LaTeX \mdhighlight{} command (CJK compatible)

function Span(el)
    if el.classes[1] == "mark" then
        return pandoc.RawInline('latex', '\\mdhighlight{' .. pandoc.utils.stringify(el.content) .. '}')
    end
end

function Str(el)
    -- Match ==text== pattern
    local text = el.text
    local result = {}
    local last_end = 1
    
    for start_pos, content, end_pos in text:gmatch("()%=%=(.-)%=%=()") do
        if start_pos > last_end then
            table.insert(result, pandoc.Str(text:sub(last_end, start_pos - 1)))
        end
        table.insert(result, pandoc.RawInline('latex', '\\mdhighlight{' .. content .. '}'))
        last_end = end_pos
    end
    
    if last_end <= #text then
        if #result > 0 then
            table.insert(result, pandoc.Str(text:sub(last_end)))
        else
            return el
        end
    end
    
    if #result > 0 then
        return result
    end
    return el
end
