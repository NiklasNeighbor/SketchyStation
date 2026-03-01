/datum/antagonist/worshipers_god
	name = "\improper God"
	roundend_category = "worshipers"
	antagpanel_category = ANTAG_GROUP_ABOMINATIONS
	show_to_ghosts = TRUE
	show_in_antagpanel = FALSE
	pref_flag = ROLE_WORSHIPER_GOD
	ui_name = "AntagInfoBlob" //DEBUG: Temporary
	stinger_sound = 'sound/music/antag/bloodcult/bloodcult_halos.ogg'
	antag_hud_name = "blob" //DEBUG: Temporary

/datum/antagonist/worshipers_god/on_gain()
	. = ..()
	var/mob/eye/worshipers_god/divinity = owner.current
	divinity.influence = 0
	divinity.setup_deity()




/datum/antagonist/worshipers_follower
	name = "\improper Worshiper"
	roundend_category = "worshipers"
	antagpanel_category = ANTAG_GROUP_ABOMINATIONS
	show_to_ghosts = TRUE
	show_in_antagpanel = FALSE
	pref_flag = ROLE_WORSHIPER
	ui_name = "AntagInfoBlob" //DEBUG: Temporary
	stinger_sound = 'sound/music/antag/bloodcult/bloodcult_gain.ogg'
	antag_hud_name = "blob" //DEBUG: Temporary

	var/datum/action/cooldown/worshiper_prayer/pray_ability = /datum/action/cooldown/worshiper_prayer

	var/mob/eye/worshipers_god/deity

/datum/antagonist/worshipers_follower/proc/setup_abilities()
	pray_ability = new pray_ability(src)
	pray_ability.Grant(src)
	pray_ability.deity = deity

