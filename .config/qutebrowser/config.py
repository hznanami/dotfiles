import pywal16.draw
config.source("keymaps.py")

pywal16.draw.color(c, {
    'spacing': { 'vertical': 6,
        'horizontal': 8
    }
})

 # ignore GUI settings
config.load_autoconfig(False)

# c.fonts.default_family = 'Source Han Sans CN'
# c.fonts.web.family.fixed = 'Source Han Sans CN'
# c.fonts.web.family.mono = 'Source Han Sans CN'
# c.fonts.web.family.sans_serif = 'Source Han Sans'
# c.fonts.web.family.serif = 'Source Han Sans'
# c.fonts.web.family.standard = 'Source Han Sans'

# c.hints.chars = "lkjhgmnbvcpoit"
# c.hints.chars = "asdghjklqweop"
c.hints.chars = "asdghjkl"

# Start Pages
c.url.start_pages = 'file:///dev/null'
c.url.default_page= 'file:///dev/null'

c.zoom.default = 125
c.zoom.levels = ["25%", "33%", "50%", "67%", "75%", "90%", "100%", "125%", "133%", "150%", "175%", "200%", "250%", "300%"]
c.fonts.default_size = "13pt"

c.content.fullscreen.overlay_timeout = 0

c.colors.webpage.darkmode.enabled = True
c.colors.webpage.darkmode.policy.images = 'never'
c.colors.webpage.darkmode.algorithm = 'lightness-cielab'
c.colors.webpage.darkmode.policy.images = 'never'

# Tabs
c.tabs.show = "never"
c.statusbar.show = "never"

# c.scrolling.bar = "when-searching"
# c.content.canvas_reading = False
# c.content.geolocation = False
# c.content.webrtc_ip_handling_policy = "default-public-interface-only"

c.content.blocking.enabled = True
c.content.blocking.method = 'adblock' # uncomment this if you install python-adblock
# c.content.blocking.adblock.lists = [
#         # "https://github.com/ewpratten/youtube_ad_blocklist/blob/master/blocklist.txt",
#         "https://github.com/uBlockOrigin/uAssets/raw/master/filters/legacy.txt",
#         "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters.txt",
#         "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2020.txt",
#         "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2021.txt",
#         "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2022.txt",
#         "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2023.txt",
#         "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2024.txt",
#         "https://github.com/uBlockOrigin/uAssets/raw/master/filters/badware.txt",
#         "https://github.com/uBlockOrigin/uAssets/raw/master/filters/privacy.txt",
#         "https://github.com/uBlockOrigin/uAssets/raw/master/filters/badlists.txt",
#         "https://github.com/uBlockOrigin/uAssets/raw/master/filters/annoyances.txt",
#         "https://github.com/uBlockOrigin/uAssets/raw/master/filters/annoyances-cookies.txt",
#         "https://github.com/uBlockOrigin/uAssets/raw/master/filters/annoyances-others.txt",
#         "https://github.com/uBlockOrigin/uAssets/raw/master/filters/badlists.txt",
#         "https://github.com/uBlockOrigin/uAssets/raw/master/filters/quick-fixes.txt",
#         "https://github.com/uBlockOrigin/uAssets/raw/master/filters/resource-abuse.txt",
#         "https://anti-ad.net/easylist.txt",
#         "https://github.com/uBlockOrigin/uAssets/raw/master/filters/unbreak.txt"]

# privacy - adjust these settings based on your preference
config.set("completion.cmd_history_max_items", 0)
# config.set("content.private_browsing", True)
config.set("content.webgl", False, "*")
config.set("content.canvas_reading", False)
config.set("content.geolocation", False)
config.set("content.webrtc_ip_handling_policy", "default-public-interface-only")
config.set("content.cookies.accept", "all")
config.set("content.cookies.store", True)

config.bind('<Ctrl-p>', 'completion-item-focus --history prev', mode='command')
config.bind('<Ctrl-n>', 'completion-item-focus --history next', mode='command')

c.hints.selectors["all"].extend([".qutebrowser-custom-clicks"])
