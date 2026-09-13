hl.on("hyprland.start", function()
    hl.exec_cmd("awww-daemon")
    hl.exec_cmd("waybar")
    hl.exec_cmd("swaync")
	--mi parlante derecho esta dañado esto lo quita
    hl.exec_cmd("~/.config/scripts/left-speaker.sh")
end)
