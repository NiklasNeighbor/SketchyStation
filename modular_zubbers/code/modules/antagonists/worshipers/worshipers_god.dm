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
	pass_flags = list(PASSCLOSEDTURF, PASSGLASS, PASSMOB, PASSSTRUCTURE, PASSDOORS,)
	faction = list(ROLE_WORSHIPER)

	lighting_cutoff_red = 0
	lighting_cutoff_green = 35
	lighting_cutoff_blue = 20
	hud_type = /datum/hud/worshipers_god
	var/atom/movable/screen/worshiper_influence_display/influence_hud

	var/obj/structure/worshipers/worshiper_nexus/nexus
	var/influence = 0
	var/list/mob/living/carbon/human/worshipers = list()

	///The ability which lets us convert a target to our religion
	var/datum/action/cooldown/spell/pointed/enlighten_worshiper/enlighten_ability = /datum/action/cooldown/spell/pointed/enlighten_worshiper

	var/datum/action/cooldown/spell/list_target/telepathy/whisper_ability = /datum/action/cooldown/spell/list_target/telepathy

/mob/eye/worshipers_god/proc/setup_deity()
	//not implemented
	add_traits(list(TRAIT_SPACEWALK, TRAIT_SIXTHSENSE, TRAIT_FREE_HYPERSPACE_MOVEMENT, TRAIT_SEE_BLESSED_TILES), INNATE_TRAIT)
	adjust_influence(0) //to make sure the numbers render
	enlighten_ability = new enlighten_ability(src)
	enlighten_ability.Grant(src)
	enlighten_ability.deity = src

	whisper_ability = new whisper_ability(src)
	whisper_ability.Grant(src)


/mob/eye/worshipers_god/proc/place_nexus()
	//TODO: add placement validity checks
	if(isnull(nexus))
		var/obj/structure/worshipers/worshiper_nexus/new_nexus = new(get_turf(src), src, 1)
		new_nexus.divinity = src
		nexus = new_nexus
		passive_influence_gain()

///changes the amount of influence the god has by the given amount. accepts negative and positive numbers.
/mob/eye/worshipers_god/proc/adjust_influence(points)
	influence += points
	influence_hud.maptext = MAPTEXT("<div align='center' valign='middle' style='position:relative; top:0px; left:6px'><font color='#e36600'>[round(influence)]</font></div>")

/mob/eye/worshipers_god/proc/passive_influence_gain()
	var/increase = 1 + worshipers.len
	adjust_influence(increase)
	addtimer(CALLBACK(src, PROC_REF(passive_influence_gain)), 1 MINUTES)



//lifted this code straight from the Revenant
/mob/eye/worshipers_god/say(message, bubble_type, list/spans, sanitize, datum/language/language, ignore_spam, forced, filterproof, message_range, datum/saymode/saymode, list/message_mods)
	if(!message)
		return

	if(client)
		if(client.prefs.muted & MUTE_IC)
			to_chat(src, span_boldwarning("You cannot send IC messages (muted)."))
			return
		if (!(ignore_spam || forced) && client.handle_spam_prevention(message, MUTE_IC))
			return

	if(sanitize)
		message = trim(copytext_char(sanitize(message), 1, MAX_MESSAGE_LEN))

	log_talk(message, LOG_SAY)
	var/rendered = span_deadsay("<b>DIVINITY: [src]</b> says, \"[message]\"")
	relay_to_list_and_observers(rendered, GLOB.revenant_relay_mobs, src)
	to_chat(src, rendered)
