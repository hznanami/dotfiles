-- Key and mouse bindings in gallery mode (example only, not all):

-- bind Escape key for exit
swayimg.gallery.on_key("q", function()
  swayimg.exit()
end)

-- bind Enter key to open image in viewer
swayimg.gallery.on_key("Return", function()
  swayimg.set_mode("viewer")
end)
-- bind the left arrow key to select thumbnail on the left side
swayimg.gallery.on_key("Left", function()
  swayimg.gallery.switch_image("left")
end)

--
-- Other configuration examples
--

-- force set scale mode on window resize (useful for tiling compositors)
swayimg.on_window_resize(function()
  swayimg.viewer.set_fix_scale("optimal")
end)

-- bind the Delete key in slide show mode to delete the current file and display a status message
swayimg.slideshow.on_key("Delete", function()
  local image = swayimg.slideshow.get_image()
  os.remove(image.path)
  swayimg.text.set_status("File "..image.path.." removed")
end)

-- set a custom window title in gallery mode
swayimg.gallery.on_image_change(function()
  local image = swayimg.gallery.get_image()
  swayimg.set_title("Gallery: "..image.path)
end)

-- print paths to all marked files by pressing Ctrl-p in gallery mode
swayimg.gallery.on_key("Ctrl-p", function()
  local entries = swayimg.imagelist.get()
  for _, entry in ipairs(entries) do
    if entry.mark then
        print(entry.path)
    end
  end
end)

swayimg.gallery.on_key("Tab", function()
  if swayimg.text.visible() then
    swayimg.text.hide()
  else
    swayimg.text.show()
  end
end)

swayimg.gallery.on_key("h", function()
    swayimg.gallery.switch_image("left")
end)
swayimg.gallery.on_key("j", function()
    swayimg.gallery.switch_image("down")
end)
swayimg.gallery.on_key("k", function()
    swayimg.gallery.switch_image("up")
end)
swayimg.gallery.on_key("l", function()
    swayimg.gallery.switch_image("right")
end)

