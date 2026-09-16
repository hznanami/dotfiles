-- Image viewer mode
swayimg.viewer.default_scale = "optimal"      -- default image scale
swayimg.viewer.default_position = "center"    -- default image position
swayimg.viewer.drag_button = "MouseLeft"      -- mouse button to drag image
swayimg.viewer.set_window_background(0xff000000) -- window background color
swayimg.viewer.set_image_chessboard(20, 0xff333333, 0xff4c4c4c) -- chessboard
swayimg.viewer.autocenter = true            -- enable automatic centering
swayimg.viewer.loop = true                 -- enable image list loop mode
swayimg.viewer.preload = 1                  -- number of images to preload
swayimg.viewer.history = 1                  -- number of the history cache
swayimg.viewer.mark_color = 0xff808080        -- mark icon color
swayimg.viewer.pinch_factor = 1.0             -- pinch gesture factor
swayimg.viewer.text = {
  topleft = {             -- top left text block scheme
    "File:\t{name}",
    "Format:\t{format}",
    "File size:\t{sizehr}",
    "EXIF date:\t{meta.Exif.Photo.DateTimeOriginal}",
    "EXIF camera:\t{meta.Exif.Image.Model}"
  },
  topright = {            -- top right text block scheme
    "Image:\t{list.index} of {list.total}",
    "Frame:\t{frame.index} of {frame.total}",
    "Size:\t{frame.width}x{frame.height}"
  },
  bottomleft = {          -- bottom left text block scheme
    "Scale:\t{scale}"
  }
}

-- force set scale mode on window resize (useful for tiling compositors)
swayimg.on_window_resize(function()
  swayimg.viewer.set_fix_scale("optimal")
end)
