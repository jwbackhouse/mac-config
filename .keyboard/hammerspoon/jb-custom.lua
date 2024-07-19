local log = hs.logger.new('delete-words.lua', 'debug')

local isInTerminal = function()
  app = hs.application.frontmostApplication():name()
  return app == 'iTerm2' or app == 'Terminal' or app == 'Alacritty'
end

hs.hotkey.bind(
    {"ctrl", "cmd", "option", "shift"}, "e", function()
        hs.eventtap.keyStrokes("@edume.com") end
    )

hs.hotkey.bind(
    {"ctrl", "cmd", "option", "shift"}, "p", function()
        hs.eventtap.keyStrokes("cheesecat123") end
    )

hs.hotkey.bind(
    {"ctrl", "cmd", "option", "shift"}, "z", function()
        hs.eventtap.keyStrokes("https://edume.zoom.us/j/81483070280?pwd=MzBXWERGZm1JVThSdEVKMlRNckNpQT09") end
    )

function openNewArcTab(callback)
  local arc = hs.application.launchOrFocus("Arc")
  if not arc then
    hs.alert.show("Arc could not be launched or focused.")
    return
  end
  
  hs.timer.doAfter(0.2, function()
    hs.eventtap.keyStroke({"cmd"}, "t")
    if callback then
      callback()
    end
  end)
end

function openHerokuTab()
  -- hs.timer.doAfter(1, function()
    openNewArcTab(function()
      hs.timer.doAfter(0.3, function()
        hs.eventtap.keyStrokes("https://dashboard.heroku.com/teams/edume-product/apps")
        
        hs.timer.doAfter(0.3, function()
          hs.eventtap.keyStroke({}, "return")
        end)
      end)
    end)
  -- end)
end

function openWikiTab()
  openNewArcTab(function()
    hs.timer.doAfter(0.2, function()
      hs.eventtap.keyStrokes("https://github.com/edume/knowledgebase/wiki/Releases")
      
      hs.timer.doAfter(0.3, function()
        hs.eventtap.keyStroke({}, "return")
      end)
    end)
  end)
end

hs.hotkey.bind({"cmd", "ctrl", "shift", "alt"}, "V", openHerokuTab)
hs.hotkey.bind({"cmd", "ctrl", "shift", "alt"}, "W", openWikiTab)

function openSlack(callback)
  local slack = hs.application.launchOrFocus("Slack")
  if not slack then
    hs.alert.show("Slack could not be launched or focused.")
    return
  end

  hs.timer.doAfter(0.3, function()
    if callback then
      callback()
    end
  end)
end

function setSlackStatusAway()
  openSlack(function()
    hs.eventtap.keyStroke({'cmd'}, 't')
    hs.timer.doAfter(0.3, function()
      hs.eventtap.keyStrokes("James B")
      hs.timer.doAfter(0.3, function()
        hs.eventtap.keyStroke({}, "return")
        hs.timer.doAfter(0.3, function()
          hs.eventtap.keyStrokes("/away")
          hs.timer.doAfter(0.3, function()
            hs.eventtap.keyStroke({}, "return")
          end)
        end)
      end)
    end)
  end)
end

hs.hotkey.bind({"cmd", "ctrl", "shift", "alt"}, "A", setSlackStatusAway)

-- Use cmd + u to delete previous word
hs.hotkey.bind({'cmd'}, 'u', function()
  if isInTerminal() then
    keyUpDown({'ctrl'}, 'w')
  else
    keyUpDown({'alt'}, 'delete')
  end
end)

-- Use option + ; to delete next word
hs.hotkey.bind({'cmd'}, ';', function()
  if isInTerminal() then
    keyUpDown({}, 'escape')
    keyUpDown({}, 'd')
  else
    keyUpDown({'alt'}, 'forwarddelete')
  end
end)

-- Use control + u to delete to beginning of line
--
-- In bash, control + u automatically deletes to the beginning of the line, so
-- we don't need (or want) this hotkey in the terminal. If this hotkey was
-- enabled in the terminal, it would break the standard control + u behavior.
-- Therefore, we only enable this hotkey for non-terminal apps.
local wf = hs.window.filter.new():setFilters({iTerm2 = false, Terminal = false, Alacritty = false})
enableHotkeyForWindowsMatchingFilter(wf, hs.hotkey.new({'ctrl'}, 'u', function()
  keyUpDown({'cmd'}, 'delete')
end))

-- Use control + ; to delete to end of line
--
-- I prefer to use control+h/j/k/l to move left/down/up/right by one pane in all
-- multi-pane apps (e.g., iTerm, various editors). That's convenient and
-- consistent, but it conflicts with the default macOS binding for deleting to
-- the end of the line (i.e., control+k). To maintain that very useful
-- functionality, and to keep it on the home row, this hotkey binds control+; to
-- delete to the end of the line.
hs.hotkey.bind({'ctrl'}, ';', function()
  -- If we're in the terminal, then temporarily disable our custom control+k
  -- hotkey used for pane navigation, then fire control+k to delete to the end
  -- of the line, and then renable the control+k hotkey.
  --
  -- If we're not in the terminal, then just select to the end of the line and
  -- then delete the selected text.
  if isInTerminal() then
    hotkeyForControlK = hs.fnutils.find(hs.hotkey.getHotkeys(), function(hotkey)
      return hotkey.idx == '⌃K'
    end)
    if hotkeyForControlK then hotkeyForControlK:disable() end

    keyUpDown({'ctrl'}, 'k')

    -- Allow some time for the control+k keystroke to fire asynchronously before
    -- we re-enable our custom control+k hotkey.
    hs.timer.doAfter(0.2, function()
      if hotkeyForControlK then hotkeyForControlK:enable() end
    end)
  else
    keyUpDown({'cmd', 'shift'}, 'right')
    keyUpDown({}, 'forwarddelete')
  end
end)
