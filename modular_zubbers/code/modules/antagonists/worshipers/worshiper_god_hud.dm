/mob/eye/worshipers_god/create_mob_hud()
	. = ..()
	if(!.)
		return
	influence_hud = new(null, src)
	hud_used.infodisplay += influence_hud
	hud_used.show_hud(hud_used.hud_version)


/atom/movable/screen/worshiper
	icon = 'icons/hud/blob.dmi'
	mouse_over_pointer = MOUSE_HAND_POINTER

/atom/movable/screen/worshiper/MouseEntered(location,control,params)
	. = ..()
	openToolTip(usr,src,params,title = name,content = desc, theme = "blob")

/atom/movable/screen/worshiper/MouseExited()
	closeToolTip(usr)



/atom/movable/screen/worshiper/order_construction
	icon_state = "ui_tonode"
	name = "Order Construction"
	desc = "Summon a construction site at your location"

/atom/movable/screen/worshiper/order_construction/Click(location, control, params)
	. = ..()
	//TODO: make this open a popup to select a building, then create a construction site upon selection

/atom/movable/screen/worshiper/summon_minion
	icon_state = "ui_tonode"
	name = "Summon Minion"
	desc = "Create life in the form of a minion that will fight all non-believers"

/atom/movable/screen/worshiper/summon_minion/Click(location, control, params)
	. = ..()
	//TODO: make this open a popup to select a minion, then let that minion be summoned

/atom/movable/screen/worshiper_influence_display
	name = "god influence"
	icon_state = "block"
	screen_loc = ui_health
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT
	plane = ABOVE_HUD_PLANE

/atom/movable/screen/worshiper/jump_to_nexus
	icon_state = "ui_tonode"
	name = "Jump to Nexus"
	desc = "Moves your camera to your Nexus."

/atom/movable/screen/worshiper/jump_to_nexus/Click(location, control, params)
	. = ..()
	var/mob/eye/worshipers_god/divinity = usr
	divinity.place_nexus()

/datum/hud/worshipers_god/New(mob/owner)
	..()
	var/atom/movable/screen/using

	using = new /atom/movable/screen/worshiper/jump_to_nexus(null, src)
	using.screen_loc = ui_zonesel
	static_inventory += using

	using = new /atom/movable/screen/worshiper/order_construction(null, src)
	using.screen_loc = ui_hand_position(LEFT_HANDS)
	static_inventory += using

	using = new /atom/movable/screen/worshiper/summon_minion(null, src)
	using.screen_loc = ui_hand_position(RIGHT_HANDS)
	static_inventory += using
