/datum/round_event_control/worshipers
	name = "Worshipers"
	typepath = /datum/round_event/ghost_role/worshipers
	track = EVENT_TRACK_GHOSTSET
	tags = list(TAG_DESTRUCTIVE, TAG_COMBAT, TAG_CHAOTIC, TAG_COMMUNAL)
	weight = 0
	max_occurrences = 0
	min_players = 20
	category = EVENT_CATEGORY_ENTITIES
	description = "Spawns a new god for the crew to worship"

/datum/round_event/ghost_role/worshipers
	announce_chance = 0
	role_name = "Worshiped God"

/datum/round_event/ghost_role/worshipers/spawn_role()
	if(!GLOB.blobstart.len)
		return MAP_ERROR
	var/icon/blob_icon = icon('icons/mob/nonhuman-player/blob.dmi', icon_state = "blob_core") //DEBUG: Temporary
	var/image/blob_image = image(blob_icon) //DEBUG: Temporary
	var/mob/chosen_one = SSpolling.poll_ghost_candidates(check_jobban = ROLE_BLOB, role = ROLE_BLOB, alert_pic = blob_image, role_name_text = role_name, amount_to_pick = 1, chat_text_border_icon = blob_image) //DEBUG: Temporary
	if(isnull(chosen_one))
		return NOT_ENOUGH_PLAYERS
	var/mob/dead/observer/new_god = chosen_one
	var/mob/eye/worshipers_god/divinity = new_god.become_divine_presence()
	spawned_mobs += divinity
	message_admins("[ADMIN_LOOKUPFLW(divinity)] has been made into a divine presence by an event.")
	divinity.log_message("was spawned as a divine presence by an event.", LOG_GAME)
	return SUCCESSFUL_SPAWN

/mob/proc/become_divine_presence()
	var/mob/eye/worshipers_god/divinity = new /mob/eye/worshipers_god(get_turf(src))
	divinity.PossessByPlayer(key)
	. = divinity
	qdel(src)
