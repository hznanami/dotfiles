-- General config
swayimg.set_mode("viewer")                -- mode at startup
swayimg.enable_antialiasing(false)         -- anti-aliasing
swayimg.enable_decoration(true)           -- window title/buttons/borders
swayimg.enable_overlay(true)             -- window overlay mode
swayimg.enable_exif_orientation(true)     -- image orientation by EXIF
swayimg.set_dnd_button("MouseRight")      -- drag-and-drop mouse button
-- swayimg.set_window_size(1280, 720)

-- Image list configuration
swayimg.imagelist.set_order("numeric")    -- list order
swayimg.imagelist.enable_reverse(false)   -- reverse order
swayimg.imagelist.enable_recursive(false) -- recursive directory reading
swayimg.imagelist.enable_adjacent(true)  -- add adjacent files from same dir
swayimg.imagelist.enable_fsmon(true)      -- enable file system monitoring

-- Text overlay configuration
swayimg.text.set_font("Source Sans 3")        -- font name
swayimg.text.set_size(20)                 -- font size in pixels
swayimg.text.set_spacing(0)               -- line spacing
swayimg.text.set_padding(10)              -- padding from window edge
swayimg.text.set_foreground(0xffcccccc)   -- foreground text color
swayimg.text.set_background(0x80000000)   -- text background color
swayimg.text.set_shadow(0x000000ff)       -- text shadow color
swayimg.text.set_timeout(5)               -- layer hide timeout
swayimg.text.set_status_timeout(3)        -- status message hide timeout
swayimg.text.hide()                       -- hide text on startup
