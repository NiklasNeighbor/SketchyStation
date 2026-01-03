/datum/action/cooldown/spell/bloodwriting
	name = "Bloodwriting"
	desc = "Write messages on the ground. In BLOOD!!"
	button_icon = 'icons/effects/blood.dmi'
	button_icon_state = "bubblegumfoot"
	cooldown_time = 5 SECONDS
	spell_requirements = SPELL_REQUIRES_NO_ANTIMAGIC
	///The crayon used for the bloodwriting
	var/obj/item/toy/crayon/red/bloodwriter
	///used to check if the ability is active
	var/active = FALSE

/datum/action/cooldown/spell/bloodwriting/Grant(mob/grant_to)
	. = ..()
	bloodwriter = new()

/datum/action/cooldown/spell/bloodwriting/cast(atom/cast_on)
	. = ..()
	active = !active
	if (active == FALSE)
		return
	bloodwriter.ui_interact(owner) //doesnt actually open the crayon UI and calling attack_self doesnt work either
