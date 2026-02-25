/mob/eye/worshipers_god
	name = "Eye of God"
	real_name = "Eye of God"
	desc = "The god that these poor doomed people worship"
	icon = 'icons/mob/eyemob.dmi'
	icon_state = "marker"
	mouse_opacity = MOUSE_OPACITY_ICON
	move_on_shuttle = TRUE
	invisibility = INVISIBILITY_OBSERVER
	layer = FLY_LAYER
	plane = ABOVE_GAME_PLANE
	see_invisible = SEE_INVISIBLE_LIVING
	pass_flags = PASSCLOSEDTURF
	faction = list(ROLE_WORSHIPER)

	lighting_cutoff_red = 0
	lighting_cutoff_green = 35
	lighting_cutoff_blue = 20
	hud_type = /datum/hud/blob_overmind

	var/obj/structure/worshipers/worshiper_nexus/nexus
	var/influence = 0

/mob/eye/worshipers_god/proc/setup_deity()
	//not implemented
