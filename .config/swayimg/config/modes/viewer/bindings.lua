-- Key and mouse bindings in viewer mode (example only, not all):

-- bind Escape key for exit
swayimg.viewer.on_key("q", function()
  swayimg.exit()
end)
-- bind the "h" arrow key to move the image to the left by 1/10 of the application window size
swayimg.viewer.on_key("h", function()
    local wnd = swayimg.get_window_size()
    local pos = swayimg.viewer.get_position()
    swayimg.viewer.set_abs_position(math.floor(pos.x + wnd.width / 10), pos.y);
end)

swayimg.viewer.on_key("j", function()
    local wnd = swayimg.get_window_size()
    local pos = swayimg.viewer.get_position()
    swayimg.viewer.set_abs_position(pos.x, math.floor(pos.y - wnd.height / 10));
end)

swayimg.viewer.on_key("k", function()
    local wnd = swayimg.get_window_size()
    local pos = swayimg.viewer.get_position()
    swayimg.viewer.set_abs_position(pos.x, math.floor(pos.y + wnd.height / 10));
end)

swayimg.viewer.on_key("l", function()
    local wnd = swayimg.get_window_size()
    local pos = swayimg.viewer.get_position()
    swayimg.viewer.set_abs_position(math.floor(pos.x - wnd.width / 10), pos.y);
end)
-- bind mouse vertical scroll button with pressed Ctrl to zoom in the image at mouse pointer coordinates
swayimg.viewer.on_mouse("ScrollUp", function()
  local pos = swayimg.get_mouse_pos()
  local scale = swayimg.viewer.get_scale()
  scale = scale + scale / 10
  swayimg.viewer.set_abs_scale(scale, pos.x, pos.y);
end)

swayimg.viewer.on_mouse("ScrollDown", function()
  local pos = swayimg.get_mouse_pos()
  local scale = swayimg.viewer.get_scale()
  scale = scale - scale / 10
  swayimg.viewer.set_abs_scale(scale, pos.x, pos.y);
end)

swayimg.viewer.on_key("i", function()
    -- local pos = swayimg.get_mouse_pos()
    local scale = swayimg.viewer.get_scale()
    scale = scale + scale / 10
    swayimg.viewer.set_abs_scale(scale);
end)

swayimg.viewer.on_key("o", function()
    -- local pos = swayimg.get_mouse_pos()
    local scale = swayimg.viewer.get_scale()
    scale = scale - scale / 10
    swayimg.viewer.set_abs_scale(scale);
end)

swayimg.viewer.on_key("n", function()
    swayimg.viewer.switch_image("next")
end)

swayimg.viewer.on_key("p", function()
    swayimg.viewer.switch_image("prev")
end)

swayimg.viewer.on_key("Tab", function()
  if swayimg.text.visible() then
    swayimg.text.hide()
  else
    swayimg.text.show()
  end
end)

swayimg.viewer.on_key("return", function()
    swayimg.set_mode("gallery")
end)

swayimg.viewer.on_key("z", function()
    swayimg.viewer.reset()
end)

swayimg.viewer.on_key("e", function()
    swayimg.viewer.set_fix_scale("fill")
end)


