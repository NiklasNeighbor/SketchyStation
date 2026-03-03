/datum/action/cooldown/worshiper_prayer
	name = "Pray"
	desc = "Pray to your god in hopes that he may act upon your prayers! Don't expect an answer though."
	cooldown_time = 10 SECONDS
	button_icon_state = "ghost"
	var/mob/eye/worshipers_god/deity

//TODO: Make prayer work and give it to cultists

/datum/action/cooldown/spell/pointed/enlighten_worshiper
	name = "Enlighten"
	desc = "Enlighten a target, allowing them to join your religion. This has a long cooldown, so make sure they actually want to join"
	cooldown_time = 5 MINUTES
	button_icon_state = "ghost"
	spell_requirements = SPELL_REQUIRES_NO_ANTIMAGIC
	aim_assist = TRUE
	var/mob/eye/worshipers_god/deity

/datum/action/cooldown/spell/pointed/enlighten_worshiper/cast(atom/cast_on)
	. = ..()
	var/mob/living/carbon/human/convertee = cast_on
	if (cast_on == deity)
		to_chat(owner, span_warning("You cant join your own cult! DEBUG: [convertee]"))
		ResetCooldown()
		return FALSE
	if (isnull(convertee))
		to_chat(owner, span_warning("Only humanoids can worship you! DEBUG: [convertee]"))
		ResetCooldown()
		return FALSE
	if (tgui_alert(convertee, "So you want to become a Worshiper of the Divine Presence?", "Become a Worshiper?", list("Join", "Do Not"), timeout = 30 SECONDS) != "Join")
		to_chat(owner, span_warning("This one doesn't want to worship you! DEBUG: [convertee]"))
		return FALSE

	var/datum/antagonist/worshipers_follower/new_follower = convertee.mind.add_antag_datum(/datum/antagonist/worshipers_follower)
	new_follower.deity = deity
	new_follower.setup_abilities()
	return TRUE

