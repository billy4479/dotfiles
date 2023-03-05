# -*- coding: utf-8 -*-
import os
import re
import socket
import subprocess
from libqtile import qtile
from libqtile.config import KeyChord, Key, Screen, Group, Drag, Click, Match
from libqtile.command import lazy
from libqtile import layout, bar, widget, hook
from libqtile.lazy import lazy
from typing import List  # noqa: F401

mod = "mod4"                                      # Sets mod key to SUPER/WINDOWS
myTerm = "kitty"                                  # My terminal of choice
myConfig = "/home/billy/.config/qtile/config.py"  # The Qtile config file location

# myLauncherDesktop = 'j4-dmenu-desktop --dmenu="(cat ; (stest -flx $(echo $PATH | tr : \' \') | sort -u)) | dmenu -h 20" --display-binary'
# myLauncher = "dmenu_run -h 20 -p 'Run: '"
myLauncherDesktop = "rofi -show drun -display-drun \"Run: \" -drun-display-format \"{name}\""
myLauncher = "rofi -show run -display-run \"Run: \" -run-display-format \"{name}\""

keys = [
    # The essentials
    Key([mod], "Return",
        lazy.spawn(myTerm),
        desc='Launches My Terminal'
        ),
    Key([mod, "shift"], "Return",
        lazy.spawn(myLauncherDesktop),
        desc='Run Launcher for .desktop files'
        ),
    Key([mod, "control", "shift"], "Return",
        lazy.spawn(myLauncher),
        desc='Run Launcher'
        ),
    Key([mod], "Tab",
        lazy.next_layout(),
        desc='Toggle through layouts'
        ),
    Key([mod, "shift"], "c",
        lazy.window.kill(),
        desc='Kill active window'
        ),
    Key([mod, "shift"], "r",
        lazy.restart(),
        desc='Restart Qtile'
        ),
    Key([mod, "shift"], "q",
        lazy.shutdown(),
        desc='Shutdown Qtile'
        ),
    Key([mod], "b",
        lazy.spawn("librewolf"),
        desc='Spawn a browser'
        ),
    Key([mod], "v",
        lazy.spawn("xfce4-popup-clipman"),
        desc='Clipman popup'
        ),
    Key([mod], "c",
        lazy.spawn("qalculate-gtk"),
        desc="Spawn a calculator",
        ),
    Key([mod, "shift"], "l",
        lazy.spawn("dm-tool lock"),
        desc="Lock"
        ),
    Key([mod], "e",
        lazy.spawn("pcmanfm-qt"),
        desc="Spawn file manager"
        ),
    # Switch focus to specific monitor
    Key([mod], "comma",
        lazy.to_screen(1),
        desc='Keyboard focus to monitor 1'
        ),
    Key([mod], "period",
        lazy.to_screen(0),
        desc='Keyboard focus to monitor 2'
        ),
    # Window controls
    Key([mod], "k",
        lazy.layout.down(),
        desc='Move focus down in current stack pane'
        ),
    Key([mod], "j",
        lazy.layout.up(),
        desc='Move focus up in current stack pane'
        ),
    Key([mod, "shift"], "k",
        lazy.layout.shuffle_down(),
        desc='Move windows down in current stack'
        ),
    Key([mod, "shift"], "j",
        lazy.layout.shuffle_up(),
        desc='Move windows up in current stack'
        ),
    Key([mod], "h",
        lazy.layout.grow(),
        lazy.layout.increase_nmaster(),
        desc='Expand window (MonadTall), increase number in master pane (Tile)'
        ),
    Key([mod], "l",
        lazy.layout.shrink(),
        lazy.layout.decrease_nmaster(),
        desc='Shrink window (MonadTall), decrease number in master pane (Tile)'
        ),
    Key([mod], "n",
        lazy.layout.normalize(),
        desc='normalize window size ratios'
        ),
    Key([mod], "m",
        lazy.layout.maximize(),
        desc='toggle window between minimum and maximum sizes'
        ),
    Key([mod, "shift"], "f",
        lazy.window.toggle_floating(),
        desc='toggle floating'
        ),
    Key([mod, "shift"], "m",
        lazy.window.toggle_fullscreen(),
        desc='toggle fullscreen'
        ),
    # Stack controls
    Key([mod, "shift"], "space",
        lazy.layout.rotate(),
        lazy.layout.flip(),
        desc='Switch which side main pane occupies (monadtall)'
        ),
    Key([mod], "space",
        lazy.layout.next(),
        desc='Switch window focus to other pane(s) of stack'
        ),
    Key([mod, "control"], "Return",
        lazy.layout.toggle_split(),
        desc='Toggle between split and unsplit sides of stack'
        ),
    # Media keys
    Key([], "XF86AudioPlay",
            lazy.spawn(
                'playerctl -p spotify,%any play-pause'),
            desc='Sent play/pause signal'
        ),
    Key([], "XF86AudioNext",
            lazy.spawn(
                'playerctl -p spotify,%any next'),
            desc='Sent next signal'
        ),
    Key([], "XF86AudioPrev",
            lazy.spawn(
                'playerctl -p spotify,%any previous'),
            desc='Sent previous signal'
        ),
    # Screenshots
    Key([], "Print",
        lazy.spawn("/home/billy/scripts/dmenu/screenshot.sh"),
        desc="Screenshot script with dmenu",
        ),
]

group_names = [("WWW", {'layout': 'monadtall'}),
               ("DEV", {'layout': 'monadtall'}),
               ("SYS", {'layout': 'monadtall'}),
               ("CHAT", {'layout': 'monadtall'}),
               ("MUS", {'layout': 'monadtall'}),
               ("BG", {'layout': 'monadtall'}),
               ("DOC", {'layout': 'monadtall'}),
               ("SRV", {'layout': 'monadtall'}),
               ("GAME", {'layout': 'monadtall'})]

groups = [Group(name, **kwargs) for name, kwargs in group_names]

for i, (name, kwargs) in enumerate(group_names, 1):
    # Switch to another group
    keys.append(Key([mod], str(i), lazy.group[name].toscreen()))
    # Send current window to another group
    keys.append(Key([mod, "shift"], str(i), lazy.window.togroup(name)))

#col = {
#    'bg':     '#282c34',
#    'fg':     '#abb2bf',
#    'black':  '#212121',
#    'white':  '#efffff',
#    'red':    '#e06c75',
#    'purple': '#c678dd',
#    'blue':   '#61afef',
#    'green':  '#98c379',
#    'yellow': '#e5c07b',
#    'cyan':   '#56b6c2',
#}

col = {
    'bg':     '#303446',
    'fg':     '#c6d0f5',
    'black':  '#232634',
    'white':  '#c6d0f5',
    'red':    '#e78284',
    'purple': '#ca9ee6',
    'blue':   '#8caaee',
    'green':  '#a6d189',
    'yellow': '#e5c890',
    'cyan':   '#81c8be',
}

layout_theme = {"border_width": 1,
                "margin": 6,
                "border_focus": col['white'],
                "border_normal": col['bg'],
                }

layouts = [
    layout.MonadWide(**layout_theme),
    # layout.Bsp(**layout_theme),
    # layout.Stack(stacks=2, **layout_theme),
    # layout.Columns(**layout_theme),
    layout.RatioTile(**layout_theme),
    # layout.VerticalTile(**layout_theme),
    layout.Matrix(**layout_theme),
    # layout.Zoomy(**layout_theme),
    layout.MonadTall(**layout_theme),
    layout.Max(**layout_theme),
    layout.Tile(shift_windows=False, **layout_theme),
    # layout.Stack(num_stacks=2),
    # layout.TreeTab(
    #     font = "Ubuntu",
    #     fontsize = 10,
    #     sections = ["FIRST", "SECOND"],
    #     section_fontsize = 11,
    #     bg_color = "141414",
    #     active_bg = "90C435",
    #     active_fg = "000000",
    #     inactive_bg = "384323",
    #     inactive_fg = "a0a0a0",
    #     padding_y = 5,
    #     section_top = 10,
    #     panel_width = 320
    #     ),
    layout.Floating(**layout_theme)
]


# colors = [["#212121", "#212121"], # panel background
#           ["#212121", "#212121"], # background for current screen tab
#           ["#eeffff", "#eeffff"], # font color for group names
#           ["#ff5370", "#ff5370"], # border line color for current tab
#           ["#c792ea", "#c792ea"], # border line color for other tab and odd widgets
#           ["#82aaff", "#82aaff"], # color for the even widgets
#           ["#c3e88d", "#c3e88d"], # window name
#          ]

prompt = "{0}@{1}: ".format(os.environ["USER"], socket.gethostname())

##### DEFAULT WIDGET SETTINGS #####
widget_defaults = dict(
    font="JetBrainsMono Nerd Font",
    fontsize=12,
    padding=2,
    background=col['bg']
)
extension_defaults = widget_defaults.copy()


def init_widgets_list():
    widgets_list = [
        widget.Sep(
            linewidth=0,
            padding=6,
            foreground=col['white'],
            background=col['bg']
        ),
        # widget.Image(
        #         filename = "~/.config/qtile/icons/python.png",
        #         mouse_callbacks = {'Button1': lambda qtile: qtile.cmd_spawn('dmenu_run')}
        #         ),
        widget.GroupBox(
            font="Ubuntu Bold",
            fontsize=10,
            margin_y=3,
            margin_x=3,
            padding_y=7,
            padding_x=3,
            borderwidth=3,
            active=col['white'],
            inactive=col['white'],
            rounded=False,
            highlight_color=col['bg'],
            highlight_method="line",
            this_current_screen_border=col['green'],
            this_screen_border=col['blue'],
            other_current_screen_border=col['bg'],
            other_screen_border=col['bg'],
            foreground=col['white'],
            background=col['bg'],
        ),
        # widget.Prompt(
        #         prompt = prompt,
        #         font = "Ubuntu Mono",
        #         padding = 10,
        #         foreground = colors[3],
        #         background = colors[1]
        #         ),
        widget.Sep(
            linewidth=0,
            padding=35,
            foreground=col['white'],
            background=col['bg'],
        ),
        widget.WindowName(
            foreground=col['fg'],
            background=col['bg'],
            padding_y=2,
            fontsize=11
        ),
        widget.TextBox(
            text=" 🌡",
            padding=2,
            foreground=col['white'],
            background=col['bg'],
            fontsize=11
        ),
        widget.ThermalSensor(
            foreground=col['white'],
            background=col['bg'],
            threshold=90,
            padding=5,
            tag_sensor="Tctl"
        ),
        widget.Sep(
            linewidth=3,
            padding=10,
            foreground=col['blue'],
            background=col['bg'],
        ),
        widget.TextBox(
            text=" ⟳",
            padding=2,
            foreground=col['white'],
            background=col['bg'],
            fontsize=14
        ),
        widget.CheckUpdates(
            distro='Arch_checkupdates',
            update_interval=1800,
            foreground=col['white'],
            background=col['bg'],
            no_update_string='No Updates',
            mouse_callbacks={'Button1': lambda: qtile.cmd_spawn(
                myTerm + ' -e yay -Syu')},
            display_format="{updates} Updates",
            padding=5
        ),
        widget.Sep(
            linewidth=3,
            padding=10,
            foreground=col['green'],
            background=col['bg'],
        ),
        widget.TextBox(
            text="  ",
            foreground=col['white'],
            background=col['bg'],
            padding=0,
            fontsize=14
        ),
        widget.Memory(
            foreground=col['white'],
            background=col['bg'],
            mouse_callbacks={
                'Button1': lambda qtile: qtile.cmd_spawn(myTerm + ' -e htop')},
            padding=5
        ),
        widget.Sep(
            linewidth=3,
            padding=10,
            foreground=col['blue'],
            background=col['bg'],
        ),
        widget.Net(
            interface="eno1",
            format='{down} ↓↑ {up}',
            foreground=col['white'],
            background=col['bg'],
            padding=5
        ),
        widget.Sep(
            linewidth=3,
            padding=10,
            foreground=col['green'],
            background=col['bg'],
        ),
        widget.TextBox(
            text=" Vol:",
            foreground=col['white'],
            background=col['bg'],
            padding=0
        ),
        widget.Volume(
            foreground=col['white'],
            background=col['bg'],
            padding=5
        ),
        widget.Sep(
            linewidth=3,
            padding=10,
            foreground=col['blue'],
            background=col['bg'],
        ),
        widget.CurrentLayoutIcon(
            custom_icon_paths=[os.path.expanduser(
                "~/.config/qtile/icons")],
            foreground=col['white'],
            background=col['bg'],
            padding=0,
            scale=0.7
        ),
        widget.CurrentLayout(
            foreground=col['white'],
            background=col['bg'],
            padding=5
        ),
        widget.Sep(
            linewidth=3,
            padding=10,
            foreground=col['green'],
            background=col['bg'],
        ),
        widget.Clock(
            foreground=col['white'],
            background=col['bg'],
            format="%A %d %B [ %H:%M ]"
        ),
   ]
    return widgets_list


def init_widgets_screen1():
    widgets_screen1 = init_widgets_list()
    sep = widget.Sep(
            linewidth=3,
            padding=10,
            foreground=col['blue'],
            background=col['bg'],
    )
    tray = widget.Systray(
            background=col['bg'],
            padding=5,
    )
    widgets_screen1.append(sep)
    widgets_screen1.append(tray)
    return widgets_screen1


def init_widgets_screen2():
    widgets_screen2 = init_widgets_list()
    return widgets_screen2


def init_screens():
    return [Screen(top=bar.Bar(widgets=init_widgets_screen1(), opacity=1.0, size=20)),
            Screen(top=bar.Bar(widgets=init_widgets_screen2(), opacity=1.0, size=20))]


if __name__ in ["config", "__main__"]:
    screens = init_screens()
    widgets_list = init_widgets_list()
    widgets_screen1 = init_widgets_screen1()
    widgets_screen2 = init_widgets_screen2()


def window_to_prev_group(qtile):
    if qtile.currentWindow is not None:
        i = qtile.groups.index(qtile.currentGroup)
        qtile.currentWindow.togroup(qtile.groups[i - 1].name)


def window_to_next_group(qtile):
    if qtile.currentWindow is not None:
        i = qtile.groups.index(qtile.currentGroup)
        qtile.currentWindow.togroup(qtile.groups[i + 1].name)


def window_to_previous_screen(qtile):
    i = qtile.screens.index(qtile.current_screen)
    if i != 0:
        group = qtile.screens[i - 1].group.name
        qtile.current_window.togroup(group)


def window_to_next_screen(qtile):
    i = qtile.screens.index(qtile.current_screen)
    if i + 1 != len(qtile.screens):
        group = qtile.screens[i + 1].group.name
        qtile.current_window.togroup(group)


def switch_screens(qtile):
    i = qtile.screens.index(qtile.current_screen)
    group = qtile.screens[i - 1].group
    qtile.current_screen.set_group(group)


mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
main = None
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False

floating_layout = layout.Floating(float_rules=[
    # Run the utility of `xprop` to see the wm class and name of an X client.
    # default_float_rules include: utility, notification, toolbar, splash, dialog,
    # file_progress, confirm, download and error.
    *layout.Floating.default_float_rules,
    Match(title='Qalculate!'),  # qalculate-gtk
])

auto_fullscreen = True
focus_on_window_activation = "smart"


@hook.subscribe.startup_once
def start_once():
    home = os.path.expanduser('~')
    subprocess.call([home + '/.config/qtile/autostart.sh'])


# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"

os.environ["XDG_SESSION_DESKTOP"] = "qtile"

