--[[
=====================================================================
** More Blocks **
By Calinou, with the help of ShadowNinja and VanessaE.

Copyright (c) 2011-2017 Hugo Locurcio and contributors.
Licensed under the zlib license. See LICENSE.md for more information.
=====================================================================
--]]

moreblocks = {}
moreblocks.modname = minetest.get_current_modname()
moreblocks.modpath = minetest.get_modpath(moreblocks.modname)

-- Load support for intllib.
local MP = moreblocks.modpath
local S = dofile(MP .. "/intllib.lua")

moreblocks.intllib = S

function moreblocks.check_protection(pos, name, tool, text)
	if minetest.is_protected(pos, name) then
		minetest.log("action", (name ~= "" and name or "A mod")
			.. " tried to " .. text
			.. " at protected position "
			.. minetest.pos_to_string(pos)
			.. " with a " .. (tool or ""))
		minetest.record_protection_violation(pos, name)
		return true
	end
	return false
end

-- Load mod's modules
dofile(MP .. "/config.lua")
dofile(MP .. "/circular_saw.lua")
dofile(MP .. "/stairsplus/init.lua")
dofile(MP .. "/nodes.lua")
dofile(MP .. "/redefinitions.lua")
dofile(MP .. "/crafting.lua")
dofile(MP .. "/aliases.lua")
dofile(MP .. "/sweeper.lua")

if minetest.settings:get_bool("log_mods") then
	minetest.log("action", S("[MOD] moreblocks loaded."))
end
