local mod = get_mod("SpecialSpawnAnnouncer")

return {
	name = mod:localize("mod_name"),
	description = mod:localize("mod_description"),
	is_togglable = true,
	options = {
		widgets = {
			{
				setting_id      = "mod_volume",
				title           = "mod_volume_title",
				type            = "numeric",
				range           = { 0, 100 },
				tooltip         = "mod_volume_description",
				default_value   = 50,
				decimals_number = 0,
			}
		},
	},
}
