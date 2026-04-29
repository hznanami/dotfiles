-- Gallery mode
swayimg.gallery.set_aspect("fill")                  -- thumbnail aspect ratio
swayimg.gallery.set_thumb_size(200)                 -- thumbnail size in pixels
swayimg.gallery.set_padding_size(5)                 -- padding between thumbnails
swayimg.gallery.set_border_size(5)                  -- border size for selected thumbnail
swayimg.gallery.set_border_color(0xffaaaaaa)        -- border color for selected thumbnail
swayimg.gallery.set_selected_scale(1.15)            -- scale for selected thumbnail
swayimg.gallery.set_selected_color(0xff404040)      -- background color for selected thumbnail
swayimg.gallery.set_unselected_color(0xff202020)    -- background color for unselected thumbnail
swayimg.gallery.set_window_color(0xff000000)        -- window background color
swayimg.gallery.set_pinch_factor(100.0)             -- pinch gesture factor
swayimg.gallery.limit_cache(100)                    -- number of thumbnails stored in memory
swayimg.gallery.enable_preload(false)               -- preloading invisible thumbnails
swayimg.gallery.enable_pstore(false)                -- enable persistent storage for thumbnails
swayimg.gallery.set_text("topleft", {               -- top left text block scheme
  "File: {name}"
})
swayimg.gallery.set_text("topright", {              -- top right text block scheme
  "{list.index} of {list.total}"
})


