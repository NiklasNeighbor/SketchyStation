/mob/living/basic/voidwalker
	/// What kind of form we are taking
	var/datum/void_sprite/current_look
	/// Press this to change your void form
	var/datum/action/cooldown/void_shapeshift/form_select
	gender = PLURAL

/mob/living/basic/voidwalker/unique_setup()
	. = ..()
	form_select = new(src)
	form_select.Grant(src)
	pick_random_look()

/// Randomise how we look on init
/mob/living/basic/voidwalker/proc/pick_random_look()
	var/list/valid_starting_styles = list()
	for (var/datum/void_sprite/style_path as anything in subtypesof(/datum/void_sprite))
		if (!initial(style_path.allow_random))
			continue
		valid_starting_styles += new style_path()
	if (!length(valid_starting_styles))
		return
	current_look = pick(valid_starting_styles)
	current_look.apply(src)

/datum/action/cooldown/void_shapeshift
	name = "Void Transformation"
	desc = "You are no longer bound to only one appearance, so change it at will."
	check_flags = AB_CHECK_CONSCIOUS
	cooldown_time = 10 SECONDS
	melee_cooldown_time = 0 SECONDS
	button_icon = 'icons/mob/actions/actions_spells.dmi'
	button_icon_state = "exit_possession"
	background_icon_state = "bg_clock"
	overlay_icon_state = "bg_clock_border"

/datum/action/cooldown/void_shapeshift/Grant(mob/granted_to)
	. = ..()
	var/mob/living/basic/voidwalker/walker = owner
	if (!istype(walker))
		owner.balloon_alert(owner, "not a voidwalker!")
		qdel(src)
		return

/datum/action/cooldown/void_shapeshift/Activate(atom/target)
	var/mob/living/basic/voidwalker/walker = owner
	if (!istype(walker))
		owner.balloon_alert(owner, "not a voidwalker!")
		qdel(src)
		return

	var/list/options = list()
	var/list/picks_to_instances = list()
	var/list/void_sprites = subtypesof(/datum/void_sprite)
	for (var/style_path in void_sprites)
		var/datum/void_sprite/style = new style_path()
		var/datum/radial_menu_choice/choice = style.get_radial_select()
		options += list("[choice.name]" = choice)
		picks_to_instances[choice.name] = style

	var/pick = show_radial_menu(owner, owner, options, require_near = TRUE)
	if (!pick)
		return

	var/datum/void_sprite/chosen = picks_to_instances[pick]
	if (walker.current_look.name == chosen.name)
		owner.balloon_alert(owner, "nothing to change!")
		return

	var/turf/origin = get_turf(owner)
	owner.balloon_alert_to_viewers("morphing...")

	if (!do_after(owner, 1 SECONDS, target = origin))
		owner.balloon_alert(owner, "interrupted!")
		return

	walker.current_look = chosen
	walker.current_look.apply(owner)
	return ..()

/// Decides how voidwalkers can look
/datum/void_sprite/
	var/name = ""
	var/icon = 'modular_zubbers/icons/mob/simple/voidwalkerAlts.dmi'
	var/allow_random = TRUE
	var/icon_state_living

/// Provides radial menu data
/datum/void_sprite/proc/get_radial_select()
	var/datum/radial_menu_choice/choice = new()
	choice.name = name
	choice.image = image(icon = icon, icon_state = icon_state_living)
	return choice

/// Make yourself look like this
/datum/void_sprite/proc/apply(mob/living/basic/void_target)
	var/mob/living/basic/voidwalker/walker = void_target
	var/datum/component/space_camo/camo_comp
	void_target.icon = icon
	void_target.icon_living = icon_state_living
	void_target.icon_state = icon_state_living
	//TODO: Insert code to change the sprites used for space_dive and space_camo components
	if(!isnull(walker))
		camo_comp = walker.GetComponent(/datum/component/space_camo)
		camo_comp.position_indicator = image(void_target.icon, void_target.icon_state + "_stealthed", ABOVE_LIGHTING_PLANE)
		to_chat(void_target, span_yellow("DEBUG: Camo Icon changed to [void_target.icon_state + "_stealthed"]"))

	void_target.update_appearance(updates = UPDATE_ICON)

/datum/void_sprite/femwalker
	name = "femwalker"
	icon_state_living = "femwalker"


/datum/void_sprite/voidwalker
	name = "voidwalker"
	icon_state_living = "voidwalker"
