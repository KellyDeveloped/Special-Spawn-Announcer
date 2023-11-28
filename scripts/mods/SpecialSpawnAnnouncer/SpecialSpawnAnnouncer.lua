local mod = get_mod("SpecialSpawnAnnouncer")
local Breeds = require("scripts/settings/breed/breeds")
local settings_volume = mod:get("mod_volume")
local settings_chance = mod:get("mod_chance")
local settings_shadow = mod:get("mod_shadow")
mod.on_setting_changed = function(setting_name)
    if setting_name == "mod_volume" then
        settings_volume = mod:get(setting_name)
    elseif setting_name == "mod_chance" then
        settings_chance = mod:get(setting_name)
    elseif setting_name == "mod_shadow" then
        settings_shadow = mod:get(setting_name)
    end
end

local LocalServer = get_mod("DarktideLocalServer")
local Audio
local check_dependencies = function()
    Audio = get_mod("Audio")
    if not LocalServer then
        mod:echo(
            'Required mod "Darktide Local Server" not found: Download from Nexus Mods and include in mod_load_order.txt'
        )
        mod:disable_all_hooks()
        mod:disable_all_commands()
    end
    if not Audio then
        mod:echo(
            'Required mod "Audio Plugin" not found: Download from Nexus Mods and include in mod_load_order.txt'
        )
        mod:disable_all_hooks()
        mod:disable_all_commands()
    end
end
local play_file_id = 0

mod.specials = {
    renegade_sniper = {
        file = "newtype.mp3",
        friendly_name = "Sniper"
    }
}

mod.on_all_mods_loaded = function()
    check_dependencies()

    mod:hook_require("scripts/extension_systems/unit_data/minion_unit_data_extension", function(instance)
        mod:hook_safe(instance, "init", function(self, extension_init_context, unit, extension_init_data, ...)
            local breed = extension_init_data.breed
            if mod.specials[breed.name] and not Audio.is_file_playing(play_file_id) then
                mod:echo(mod.specials[breed.name].friendly_name .. " spawn detected")
                play_file_id = Audio.play_file("SpecialSpawnAnnouncer/audio/" .. mod.specials[breed.name].file,
                    { audio_type = "sfx", volume = settings_volume, speechnorm = "e=50:r=0.0001:l=1", track_status = true })
            end
        end)
    end)
end
