--
-- Based on 'mpv-zenity-open-files'(https://github.com/alifarazz/mpv-zenity-open-files)
--
-- Default keybindings:
--      CTRL+SHIFT+s: search video in youtube.
--
utils = require 'mp.utils'
rNumber = 5

function get_focus_using_xdotool()
    return utils.subprocess({
        args = {'xdotool', 'getwindowfocus'}
    })
end

function invoke_zenity(args)
    -- local focus = get_focus_using_xdotool()
    return utils.subprocess({
        args = {'zenity', unpack(args)},
        cancellable = false,
    })
end


function search_youtube()
    local url_select = invoke_zenity({
            '--entry',
            '--title=Search Youtube',
            '--window-icon=mpv',
            '--text=Enter Search Text:'
    })
    if (url_select.status ~= 0) then
        return end
    
    for filename in string.gmatch(url_select.stdout, '[^\n]+') do
        mp.commandv('loadfile', "ytdl://ytsearch" .. rNumber .. ":" .. filename, 'replace')
    end
end

mp.add_key_binding("CTRL+SHIFT+s", "search_youtube", search_youtube)
