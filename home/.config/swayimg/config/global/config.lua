-- General config
swayimg.mode = "viewer"                -- mode at startup
swayimg.antialiasing = false         -- anti-aliasing
swayimg.decoration = true           -- window title/buttons/borders
swayimg.overlay = false             -- window overlay mode
swayimg.exif_orientation = true     -- image orientation by EXIF
swayimg.dnd_button = "MouseRight"      -- drag-and-drop mouse button
swayimg.set_window_size(1280,720)

-- Image list configuration
swayimg.imagelist.order = "numeric"    -- list order
swayimg.imagelist.reverse = false   -- reverse order
swayimg.imagelist.recursive = false -- recursive directory reading
swayimg.imagelist.adjacent = true  -- add adjacent files from same dir
swayimg.imagelist.fsmon = true      -- enable file system monitoring

-- Text overlay configuration
swayimg.text.font = "Source Sans 3"        -- font name
swayimg.text.size = 20                 -- font size in pixels
swayimg.text.spacing = 0               -- line spacing
swayimg.text.padding = 10              -- padding from window edge
swayimg.text.color = 0xffcccccc   -- foreground text color
swayimg.text.background = 0x80000000   -- text background color
swayimg.text.shadow = 0x000000ff       -- text shadow color
swayimg.text.timeout = 5               -- layer hide timeout
swayimg.text.status_timeout = 3        -- status message hide timeout
swayimg.text.visible = false
