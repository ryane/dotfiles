timelapsetopleft = {50,50}

module_list = {
  -- "widgets/netspeed",
  -- "widgets/calendar",
  "widgets/hcalendar",
  "widgets/analogclock",
  "widgets/timelapsed",
  -- "widgets/aria2",
  "modes/basicmode",
  "modes/indicator",
  -- "modes/clipshow",
  "modes/cheatsheet",
  -- "modes/hsearch",
  "misc/bingdaily",
}

applist = {
  {shortcut = 'f',appname = 'Finder'},
  {shortcut = 's',appname = 'Safari'},
  {shortcut = 't',appname = 'Terminal'},
  {shortcut = 'v',appname = 'Activity Monitor'},
  {shortcut = 'y',appname = 'System Preferences'},
  {shortcut = 'i',appname = 'iTerm'},
  {shortcut = 'g',appname = 'Google Chrome'},
  {shortcut = 'm',appname = 'Mailplane 3'},
  {shortcut = 'e',appname = 'Emacs'},
  {shortcut = 'c',appname = 'Calendar'},
  {shortcut = 'k',appname = 'Slack'},
}



-- wifiWatcher = nil
-- function ssidChanged()
--   local wifiName = hs.wifi.currentNetwork()
--   if wifiName then
--     wifiMenu:setTitle(wifiName)
--   else
--     wifiMenu:setTitle("Wifi OFF")
--   end
-- end
-- wifiMenu = hs.menubar.newWithPriority(2147483645)
-- ssidChanged()
-- wifiWatcher = hs.wifi.watcher.new(ssidChanged):start()

-- uptimeMenu = hs.menubar.newWithPriority(2147483645)
-- uptimeMenu:setTitle(( hs.execute("bash -c 'echo -n $(uptime)'") ))

function sleepWatch(eventType)
  if (eventType == hs.caffeinate.watcher.systemWillSleep) then
    hs.alert.show("Going to sleep!")
  elseif (eventType == hs.caffeinate.watcher.systemDidWake) then
    hs.alert.show("Waking up!")
  end
end

local sleepWatcher = hs.caffeinate.watcher.new(sleepWatch)
sleepWatcher:start()
