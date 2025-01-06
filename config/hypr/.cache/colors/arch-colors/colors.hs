--Place this file in your .xmonad/lib directory and import module Colors into .xmonad/xmonad.hs config
--The easy way is to create a soft link from this file to the file in .xmonad/lib using ln -s
--Then recompile and restart xmonad.

module Colors
    ( wallpaper
    , background, foreground, cursor
    , color0, color1, color2, color3, color4, color5, color6, color7
    , color8, color9, color10, color11, color12, color13, color14, color15
    ) where

-- Shell variables
-- Generated by 'wal'
wallpaper="/home/js-bro/.config/hypr/Wallpaper/arch.png"

-- Special
background="#12121b"
foreground="#bcd4ea"
cursor="#bcd4ea"

-- Colors
color0="#12121b"
color1="#56708E"
color2="#607F9F"
color3="#698CAF"
color4="#759DC3"
color5="#7BA5CD"
color6="#83B1DA"
color7="#bcd4ea"
color8="#8394a3"
color9="#56708E"
color10="#607F9F"
color11="#698CAF"
color12="#759DC3"
color13="#7BA5CD"
color14="#83B1DA"
color15="#bcd4ea"
