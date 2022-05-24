local filesystem = require('gears.filesystem')

-- Thanks to jo148 on github for making rofi dpi aware!
local with_dpi = require('beautiful').xresources.apply_dpi
local get_dpi = require('beautiful').xresources.get_dpi
local rofi_command = 'env /usr/bin/rofi -dpi ' .. get_dpi() .. ' -width ' .. with_dpi(400) .. ' -show drun -theme ' .. filesystem.get_configuration_dir() .. '/configuration/rofi.rasi -run-command "/bin/bash -c -i \'shopt -s expand_aliases; {cmd}\'"'

return {
  -- List of apps to start by default on some actions
  default = {
    terminal = 'kitty',
    dashboard = "/home/kvl/.local/bin/dashboard",
    rofi = rofi_command,
    lock = 'i3lock-fancy',
    quake = 'kitty',
    screenshot = 'screenshot -m -s', --'~/.config/awesome/configuration/utils/screenshot -m',
    region_screenshot = 'screenshot -r -s', --'~/.config/awesome/configuration/utils/screenshot -r',
    delayed_screenshot = 'screenshot -d 10 -r', --'~/.config/awesome/configuration/utils/screenshot --delayed -r',
    ss_and_edit_screenshot = 'screenshot -r',
    
    -- Editing these also edits the default program
    -- associated with each tag/workspace
    browser = '/usr/bin/firefox',
    editor = '/usr/bin/emacs', -- gui text editor
    -- editor = 'kitty -e nvim', -- gui text editor
--    social = 'discord',
    game = rofi_command,
    files = 'nautilus',
    news = '/usr/bin/raven-reader',
    office = '/usr/bin/onlyoffice-desktopeditors',
    music = '/usr/bin/spotify' 
  },
  -- List of apps to start once on start-up
  run_on_start_up = {
    --'blueberry-tray', -- Bluetooth tray icon
    --'/usr/lib/x86_64-linux-gnu/libexec/polkit-kde-authentication-agent-1 & eval $(gnome-keyring-daemon -s --components=pkcs11,secrets,ssh,gpg)', -- credential manager
    -- Add applications that need to be killed between reloads
    -- to avoid multipled instances, inside the awspawn script
    '~/.config/awesome/configuration/awspawn' -- Spawn "dirty" apps that can linger between sessions
  }
}
