///Component that should be applied to all humans to detect when they change their clothing, so the HUD responsible for showing which gang they represent updates
/datum/component/gang_rep_detection
	var/datum/gang_handler/handler
	var/datum/team/gang/repped_gang

/datum/component/gang_rep_detection/Initialize(...)
	. = ..()
	if(!ishuman(parent))
		return COMPONENT_INCOMPATIBLE
	RegisterSignal(parent, COMSIG_MOB_EQUIPPED_ITEM, PROC_REF(update_representation))
	RegisterSignal(parent, COMSIG_MOB_UNEQUIPPED_ITEM, PROC_REF(update_representation))


/datum/component/gang_rep_detection/proc/update_representation()
	SIGNAL_HANDLER

	var/datum/antagonist/gang/new_gang_rep
	for(var/datum/antagonist/gang/gang in handler.involved_gangs)
		if(gang.matches_uniform(parent))
			new_gang_rep = gang
			break
	if(new_gang_rep == repped_gang)
		return
	repped_gang = new_gang_rep
	//TODO: have this tell all gangsters to update their image for this person
