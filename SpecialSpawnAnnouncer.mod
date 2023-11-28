return {
	run = function()
		fassert(rawget(_G, "new_mod"), "`SpecialSpawnAnnouncer` encountered an error loading the Darktide Mod Framework.")

		new_mod("SpecialSpawnAnnouncer", {
			mod_script       = "SpecialSpawnAnnouncer/scripts/mods/SpecialSpawnAnnouncer/SpecialSpawnAnnouncer",
			mod_data         = "SpecialSpawnAnnouncer/scripts/mods/SpecialSpawnAnnouncer/SpecialSpawnAnnouncer_data",
			mod_localization = "SpecialSpawnAnnouncer/scripts/mods/SpecialSpawnAnnouncer/SpecialSpawnAnnouncer_localization",
		})
	end,
	packages = {},
}
