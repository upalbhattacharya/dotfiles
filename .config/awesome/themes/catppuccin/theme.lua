local gears = require("gears")
local lain  = require("lain")
local awful = require("awful")
local wibox = require("wibox")
local dpi   = require("beautiful.xresources").apply_dpi

local os = os
local my_table = awful.util.table or gears.table -- 4.{0,1} compatibility

local theme                                     = {}
theme.dir                                       = os.getenv("HOME") .. "/.config/awesome/themes/nord"
theme.wallpaper
="/home/workboots/Pictures/Wallpapers/Catppuccin/catppuccin.png"
theme.font                                      = "Inconsolata Nerd Font Mono 23"

-- Catppuccin Moca colourscheme

theme.base        = "#24273A"
theme.crust       = "#181926"
theme.mantle      = "#1E2030"
theme.surface0    = "#363A4F"
theme.surface1    = "#494D64"
theme.surface2    = "#5B6078"
theme.overlay0    = "#6E738D"
theme.overlay1    = "#8087A2"
theme.overlay2    = "#939AB7"
theme.subtext0    = "#A5ADCB"
theme.subtext1    = "#B8C0E0"
theme.text        = "#CAD3F5"
theme.lavender    = "#B7BDF8"
theme.blue        = "#8AADF4"
theme.sapphire    = "#7DC4E4"
theme.sky         = "#91D7E3"
theme.teal        = "#8BD5CA"
theme.green       = "#A6DA95"
theme.yellow      = "#EED49F"
theme.peach       = "#F5A97F"
theme.maroon      = "#EE99A0"
theme.red         = "#ED8796"
theme.mauve       = "#C6A0F6"
theme.pink        = "#F5BDE6"
theme.flamingo    = "#F0C6C6"
theme.rosewater   = "#F4DBD6"

-- Convert to standard color notation


theme.fg_focus                                  = theme.mantle
theme.fg_normal                                 = theme.text
theme.fg_urgent                                 = theme.mantle
theme.bg_normal                                 = theme.mantle
theme.bg_focus                                  = theme.green
theme.bg_urgent                                 = theme.red
theme.border_width                              =  dpi(2)
theme.border_normal                             = theme.bg_normal
theme.border_focus                              = theme.sapphire
theme.border_marked                             = theme.red
theme.tasklist_bg_normal                        = theme.bg_normal
theme.tasklist_fg_normal                        = theme.fg_normal
theme.tasklist_bg_focus                         = theme.surface0
theme.tasklist_fg_focus                         = theme.green
theme.titlebar_bg_focus                         = theme.tasklist_bg_focus
theme.titlebar_bg_normal                        = theme.tasklist_bg_normal
theme.titlebar_fg_focus                         = theme.tasklist_fg_focus
theme.menu_height                               = dpi(16)
theme.menu_width                                = dpi(140)
theme.menu_submenu_icon                         = theme.dir .. "/icons/submenu.png"
theme.taglist_bg_occupied                       = theme.surface0
theme.taglist_fg_occupied                       = theme.mantle
theme.layout_tile                               = theme.dir .. "/icons/tile.png"
theme.layout_tileleft                           = theme.dir .. "/icons/tileleft.png"
theme.layout_tilebottom                         = theme.dir .. "/icons/tilebottom.png"
theme.layout_tiletop                            = theme.dir .. "/icons/tiletop.png"
theme.layout_fairv                              = theme.dir .. "/icons/fairv.png"
theme.layout_fairh                              = theme.dir .. "/icons/fairh.png"
theme.layout_spiral                             = theme.dir .. "/icons/spiral.png"
theme.layout_dwindle                            = theme.dir .. "/icons/dwindle.png"
theme.layout_max                                = theme.dir .. "/icons/max.png"
theme.layout_fullscreen                         = theme.dir .. "/icons/fullscreen.png"
theme.layout_magnifier                          = theme.dir .. "/icons/magnifier.png"
theme.layout_floating                           = theme.dir .. "/icons/floating.png"
theme.widget_ac                                 = theme.dir .. "/icons/ac.png"
theme.widget_battery                            = theme.dir .. "/icons/battery.png"
theme.widget_battery_low                        = theme.dir .. "/icons/battery_low.png"
theme.widget_battery_empty                      = theme.dir .. "/icons/battery_empty.png"
theme.widget_mem                                = theme.dir .. "/icons/mem.png"
theme.widget_cpu                                = theme.dir .. "/icons/cpu.png"
theme.widget_temp                               = theme.dir .. "/icons/temp.png"
theme.widget_net                                = theme.dir .. "/icons/net.png"
theme.widget_hdd                                = theme.dir .. "/icons/hdd.png"
theme.widget_music                              = theme.dir .. "/icons/note.png"
theme.widget_music_on                           = theme.dir .. "/icons/note_on.png"
theme.widget_vol                                = theme.dir .. "/icons/vol.png"
theme.widget_vol_low                            = theme.dir .. "/icons/vol_low.png"
theme.widget_vol_no                             = theme.dir .. "/icons/vol_no.png"
theme.widget_vol_mute                           = theme.dir .. "/icons/vol_mute.png"
theme.widget_mail                               = theme.dir .. "/icons/mail.png"
theme.widget_mail_on                            = theme.dir .. "/icons/mail_on.png"
theme.tasklist_plain_task_name                  = true
theme.tasklist_disable_icon                     = false
theme.useless_gap                               = dpi(0)
theme.titlebar_close_button_focus               = theme.dir .. "/icons/titlebar/close_focus.png"
theme.titlebar_close_button_normal              = theme.dir .. "/icons/titlebar/close_normal.png"
theme.titlebar_ontop_button_focus_active        = theme.dir .. "/icons/titlebar/ontop_focus_active.png"
theme.titlebar_ontop_button_normal_active       = theme.dir .. "/icons/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_inactive      = theme.dir .. "/icons/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_inactive     = theme.dir .. "/icons/titlebar/ontop_normal_inactive.png"
theme.titlebar_sticky_button_focus_active       = theme.dir .. "/icons/titlebar/sticky_focus_active.png"
theme.titlebar_sticky_button_normal_active      = theme.dir .. "/icons/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_inactive     = theme.dir .. "/icons/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_inactive    = theme.dir .. "/icons/titlebar/sticky_normal_inactive.png"
theme.titlebar_floating_button_focus_active     = theme.dir .. "/icons/titlebar/floating_focus_active.png"
theme.titlebar_floating_button_normal_active    = theme.dir .. "/icons/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_inactive   = theme.dir .. "/icons/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_inactive  = theme.dir .. "/icons/titlebar/floating_normal_inactive.png"
theme.titlebar_maximized_button_focus_active    = theme.dir .. "/icons/titlebar/maximized_focus_active.png"
theme.titlebar_maximized_button_normal_active   = theme.dir .. "/icons/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_inactive  = theme.dir .. "/icons/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_inactive = theme.dir .. "/icons/titlebar/maximized_normal_inactive.png"


local markup = lain.util.markup
local separators = lain.util.separators

local keyboardlayout = awful.widget.keyboardlayout:new()

-- Textclock
local clock = awful.widget.watch(
    "date +'%a %Y-%m-%d %R'", 60,
    function(widget, stdout)
        widget:set_markup(markup.fontfg(theme.font, theme.mantle, " " .. stdout ))
    end
)

clock = wibox.widget({
    clock,
    bg = theme.green,
    widget = wibox.container.background
})

-- Calendar
theme.cal = lain.widget.cal({
    attach_to = { clock },
    notification_preset = {
        font = "Inconsolata Nerd Font 10",
        fg   = theme.fg_normal,
        bg   = theme.bg_normal
    }
})

-- MEM
local mem = lain.widget.mem({
    settings = function()
        widget:set_markup(markup.fontfg(theme.font, theme.mantle, " Mem: " .. mem_now.used .. "MB "))
    end
})

mem = wibox.widget({
    mem,
    bg = theme.pink,
    widget = wibox.container.background
})

-- CPU
local cpu = lain.widget.cpu({
    settings = function()
        widget:set_markup(markup.fontfg(theme.font, theme.mantle, " CPU: " .. cpu_now.usage .. "% "))
    end
})

cpu = wibox.widget({
    cpu,
    bg = theme.mauve,
    widget = wibox.container.background
})

-- Coretemp
local temp = lain.widget.temp({
    settings = function()
        widget:set_markup(markup.fontfg(theme.font, theme.mantle, " " .. coretemp_now .. "°C "))
    end
})

temp = wibox.widget({
    temp,
    bg = theme.red,
    widget = wibox.container.background
})

-- / fs
-- local fsicon = wibox.widget.imagebox(theme.widget_hdd)
--[[ commented because it needs Gio/Glib >= 2.54
theme.fs = lain.widget.fs({
    notification_preset = { fg = theme.fg_normal, bg = theme.bg_normal, font = "Terminus 10" },
    settings = function()
        widget:set_markup(markup.font(theme.font, " " .. fs_now["/"].percentage .. "% "))
    end
})
--]]

-- Battery
local bat = lain.widget.bat({
    settings = function()
        if bat_now.status and bat_now.status ~= "N/A" then
            widget:set_markup(markup.fontfg(theme.font, theme.mantle, " Bat: " .. bat_now.perc .. "% "))
        else
            widget:set_markup(markup.fontfg(theme.font, theme.mantle, " Bat: AC "))
        end
    end
})

bat = wibox.widget({
    bat,
    bg = theme.peach,
    widget = wibox.container.background
})

-- ALSA volume
theme.volume = lain.widget.alsa({
    settings = function()
        if volume_now.status == "off" then
            widget:set_markup(markup.fontfg(theme.font, theme.surface0, " Vol: Mute "))
        else
            widget:set_markup(markup.fontfg(theme.font, theme.surface0, " Vol: " .. volume_now.level .. "% "))
        end
    end
})

volume = wibox.widget {
    theme.volume,
    bg = theme.rosewater,
    widget = wibox.container.background
}

-- Net
local net = lain.widget.net({
    settings = function()
        widget:set_markup(markup.fontfg(theme.font, theme.mantle,
                          (" D: " .. string.format("%06.1f", net_now.received)
                          ..
                          " U: " .. string.format("%06.1f", net_now.sent) .. " ")))
    end
})

net = wibox.widget({
    net,
    bg = theme.yellow,
    widget = wibox.container.background
})

-- Separators
local spr     = wibox.widget.textbox('    ')
local arrl_dl = separators.arrow_left(theme.bg_normal, "alpha")
local arrl_ld = separators.arrow_left("alpha", theme.bg_normal)

function theme.at_screen_connect(s)
    -- Quake application
    s.quake = lain.util.quake({ app = awful.util.terminal })

    -- If wallpaper is a function, call it with the screen
    local wallpaper = theme.wallpaper
    if type(wallpaper) == "function" then
        wallpaper = wallpaper(s)
    end
    gears.wallpaper.maximized(wallpaper, s, true)

    -- Tags
    awful.tag(awful.util.tagnames, s, awful.layout.layouts[1])

    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()
    -- Create an imagebox widget which will contains an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(my_table.join(
                           awful.button({}, 1, function () awful.layout.inc( 1) end),
                           awful.button({}, 2, function () awful.layout.set( awful.layout.layouts[1] ) end),
                           awful.button({}, 3, function () awful.layout.inc(-1) end),
                           awful.button({}, 4, function () awful.layout.inc( 1) end),
                           awful.button({}, 5, function () awful.layout.inc(-1) end)))
    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist {
      screen  = s,
      filter  = awful.widget.taglist.filter.all,
      style   = {
          shape = gears.shape.powerline
      },
      layout   = {
          spacing = 0,
          spacing_widget = {
              color  = theme.bg_normal,
              shape  = gears.shape.powerline,
              widget = wibox.widget.separator,
          },
      layout  = wibox.layout.flex.horizontal,
          -- max_widget_width = taglist_width /50
      },
      widget_template = {
          {
              {
                  {
                      id     = 'text_role',
                      widget = wibox.widget.textbox,
                  },

                  layout = wibox.layout.flex.horizontal,
              },
              left  = 20,
              right = 4,
              widget = wibox.container.margin,
          },
          id     = 'background_role',
          widget = wibox.container.background,
      },
      buttons = awful.util.taglist_buttons
  }

    -- Create a tasklist widget
    s.mytasklist = awful.widget.tasklist {
              screen  = s,
      filter  = awful.widget.tasklist.filter.currenttags,
      style   = {
          shape = gears.shape.powerline
      },
      layout   = {
          spacing = 0,
          spacing_widget = {
              color  = theme.bg_normal,
              shape  = gears.shape.powerline,
              widget = wibox.widget.separator,
          },
      layout  = wibox.layout.flex.horizontal,
          -- max_widget_width = taglist_width /50
      },
      widget_template = {
          {
              {
                  {
                      id     = 'text_role',
                      widget = wibox.widget.textbox,
                  },

                  layout = wibox.layout.flex.horizontal,
              },
              left  = 30,
              right = 4,
              widget = wibox.container.margin,
          },
          id     = 'background_role',
          widget = wibox.container.background,
      },
      buttons = awful.util.tasklist_buttons
  }


    -- Create the wibox
    s.mywibox = awful.wibar({ position = "top", screen = s, height = dpi(28), bg = theme.bg_normal })

    -- Add widgets to the wibox
    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            -- spr,
            s.mytaglist,
            s.mypromptbox,
            -- spr,
        },
        s.mytasklist, -- Middle widget
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            separators.arrow_left("alpha", theme.mantle),
            wibox.widget.systray(),
            wibox.widget.textbox(' '),
            separators.arrow_left("alpha", theme.rosewater),
            volume,
            separators.arrow_left(theme.rosewater, theme.pink),
            mem,
            separators.arrow_left(theme.pink, theme.mauve),
            cpu,
            separators.arrow_left(theme.mauve, theme.red),
            temp,
            separators.arrow_left(theme.red, theme.peach),
            bat,
            separators.arrow_left(theme.peach, theme.yellow),
            net,
            separators.arrow_left(theme.yellow, theme.green),
            clock,
            wibox.container.background(wibox.widget.textbox(' '), theme.green),
            separators.arrow_left(theme.green, theme.color05),
            wibox.container.background(s.mylayoutbox, theme.color05),
        },
    }
end

return theme
