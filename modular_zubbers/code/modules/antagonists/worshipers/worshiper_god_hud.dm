/atom/movable/screen/worshiper
	icon = 'icons/hud/blob.dmi'
	mouse_over_pointer = MOUSE_HAND_POINTER

/atom/movable/screen/worshiper/MouseEntered(location,control,params)
	. = ..()
	openToolTip(usr,src,params,title = name,content = desc, theme = "blob")

/atom/movable/screen/worshiper/MouseExited()
	closeToolTip(usr)

/atom/movable/screen/worshiper/jump_to_nexus
	icon_state = "ui_tonode"
	name = "Jump to Nexus"
	desc = "Moves your camera to your Nexus."

/atom/movable/screen/worshiper/jump_to_nexus/Click(location, control, params)
	. = ..()
	//Not Implemented

/datum/hud/worshipers_god/New(mob/owner)
	..()
	var/atom/movable/screen/using

	using = new /atom/movable/screen/worshiper/jump_to_nexus(null, src)
	using.screen_loc = ui_inventory
	static_inventory += using
