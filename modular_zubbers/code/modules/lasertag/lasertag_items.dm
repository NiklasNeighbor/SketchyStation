/obj/item/gun/energy/laser/tag_armcannon
	name = "laser tag arm cannon"
	icon_state = "redtag"
	desc = "A lasertag cannon implanted into a person's arm. For when you need to always be ready to fight the enemy!"
	ammo_type = list(/obj/item/ammo_casing/energy/laser/redtag)
	item_flags = NONE
	clumsy_check = FALSE
	pin = /obj/item/firing_pin/tag/red
	ammo_x_offset = 2
	selfcharge = TRUE
	gun_flags = NOT_A_REAL_GUN



/obj/item/gun/energy/laser/tag_armcannon/proc/sync_with_component(mob/living/carbon/human/user)
	if(!user)
		return
	var/datum/component/lasertag/comp = user.GetComponent(/datum/component/lasertag)
	if(!comp)
		return
	to_chat(user, span_yellow("DEBUG: Synching with component"))
	if(comp.team_color == LASERTAG_TEAM_RED)
		icon_state = "redtag"
		ammo_type = list(/obj/item/ammo_casing/energy/laser/redtag)
		pin = /obj/item/firing_pin/tag/red
	else
		icon_state = "bluetag"
		ammo_type = list(/obj/item/ammo_casing/energy/laser/bluetag)
		pin = /obj/item/firing_pin/tag/blue

/obj/item/gun/energy/laser/tag_armcannon/Entered(atom/newloc, ...)
	. = ..()
	to_chat(newloc, span_yellow("DEBUG: Synching because entered"))
	if(ishuman(newloc))
		var/mob/living/carbon/human/H = newloc
		sync_with_component(H)

// Fallback in case it’s deployed directly from an implant
/obj/item/gun/energy/laser/tag_armcannon/Initialize(mapload)
	. = ..()
	if(ishuman(loc))
		var/mob/living/carbon/human/H = loc
		RegisterSignal(H, COMSIG_TAG_ARMCANNON_TOGGLE, PROC_REF(debug_signalhandler)) //FIX: Fuck me, this still doesn't work
		to_chat(H, span_yellow("DEBUG: Registered signal handler on [H]"))


/obj/item/gun/energy/laser/tag_armcannon/proc/debug_signalhandler()
	SIGNAL_HANDLER
	to_chat(loc, span_yellow("DEBUG: Signal received"))
	visible_message("A message was received", "I've received a message")
