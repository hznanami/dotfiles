-- Gallery mode
swayimg.gallery.aspect = "fit"                  -- thumbnail aspect ratio
swayimg.gallery.thumb_size = 200                 -- thumbnail size in pixels
swayimg.gallery.padding_size = 5                 -- padding between thumbnails
swayimg.gallery.border_size = 5                  -- border size for selected thumbnail
swayimg.gallery.border_color = 0xffaaaaaa        -- border color for selected thumbnail
swayimg.gallery.selected_scale = 1.15            -- scale for selected thumbnail
swayimg.gallery.selected_color = 0xff404040      -- background color for selected thumbnail
swayimg.gallery.unselected_color = 0xff202020    -- background color for unselected thumbnail
swayimg.gallery.window_color = 0xff000000        -- window background color
swayimg.gallery.pinch_factor = 100.0             -- pinch gesture factor
swayimg.gallery.cache = 100                    -- number of thumbnails stored in memory
swayimg.gallery.preload = false               -- preloading invisible thumbnails
swayimg.gallery.pstore = true                -- enable persistent storage for thumbnails
swayimg.gallery.set_text = {
  topleft = {               -- top left text block scheme
    "File:\t{name}"
  },
  topright = {              -- top right text block scheme
    "{list.index} of {list.total}"
  }
}


