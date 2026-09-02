# config.bind('<space>th', 'config-cycle tabs.show multiple never')
# config.bind('<space>sh', 'config-cycle statusbar.show always never')
config.bind('f', 'mode-leave', mode='hint')

keymap = {
    "<Alt-f>": "hint all hover",
    "<Ctrl-y>": "hint links yank",
    '<space>th': 'config-cycle tabs.show multiple never',
    '<space>sh': 'config-cycle statusbar.show always never',
    "si": "hint images download"
}

for lhs, rhs in keymap.items():
    config.bind(lhs, rhs)
