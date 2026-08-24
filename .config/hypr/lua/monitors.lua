hl.monitor({
    output = "eDP-1",
    mode = "1920x1080@60",
    position = "0x0",
    scale = 1,
})

hl.monitor({
    output = "HDMI-A-1",
    position = "1920x0",
    scale = 1,
})

-- =========================================
-- WORKSPACES - LAPTOP
-- =========================================

for i = 1, 5 do
    hl.workspace_rule({
        workspace = tostring(i),
        monitor = "eDP-1",
        persistent = true,
    })
end

-- =========================================
-- WORKSPACES - HDMI
-- =========================================

--for i = 6, 10 do
  --  hl.workspace_rule({
    --    workspace = tostring(i),
      --  monitor = "HDMI-A-1",
        --persistent = true,
   -- })
--end
