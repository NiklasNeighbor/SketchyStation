/datum/species/human/somnari
	name = "\improper Somnari"
	id = SPECIES_SOMNARI
	inherent_traits = list(
		TRAIT_MUTANT_COLORS, // More customization options.
	)
	//mutantbrain = /obj/item/organ/brain/lycan

/datum/species/human/somnari/get_species_description()
	return list(
		"The Somnari resemble sheep and are known to sleep for nearly half of their lifetime. Thanks to a special brain structure, \
		their dreams are linked together and they retain a pseudo-lucid state, allowing them to socialize and spent their time asleep for recreational purposes.",
		"Though among other species they are largely seen as lazy, when they are awake they possess abilities which make them useful station assets \
		despite their high needs for sleep."
	)

/datum/species/human/somnari/get_species_lore()
	return list(placeholder_lore)

/datum/species/human/somnari/create_pref_unique_perks()
	var/list/to_add = list()

	to_add += list(
		list(
			SPECIES_PERK_TYPE = SPECIES_NEGATIVE_PERK,
			SPECIES_PERK_ICON = FA_ICON_BED,
			SPECIES_PERK_NAME = "Sleepy Sheepy",
			SPECIES_PERK_DESC = "You have an extremely high need for sleep and will spend roughly half of your time dreaming instead of working."
		),
		list(
			SPECIES_PERK_TYPE = SPECIES_POSITIVE_PERK,
			SPECIES_PERK_ICON = FA_ICON_WAND_MAGIC_SPARKLES,
			SPECIES_PERK_NAME = "Dream Magic",
			SPECIES_PERK_DESC = "When you are awake and well rested, you gain access to a couple of magical abilities!",
		),
		list(
			SPECIES_PERK_TYPE = SPECIES_POSITIVE_PERK,
			SPECIES_PERK_ICON = FA_ICON_SMILE_BEAM,
			SPECIES_PERK_NAME = "Comfy Rest",
			SPECIES_PERK_DESC = "When sleeping with a plushy, you slowly recover from injuries",
		),
		list(
			SPECIES_PERK_TYPE = SPECIES_NEUTRAL_PERK,
			SPECIES_PERK_ICON = FA_ICON_CLOUD,
			SPECIES_PERK_NAME = "Dreamscape",
			SPECIES_PERK_DESC = "When falling asleep on a proper surface for sleep, your mind is transported to \
			the dreamscape where you can play with other somnari. You can even pull others along into the Dreamscape.",
		),
	)

	return to_add

/datum/species/human/somnari/prepare_human_for_preview(mob/living/carbon/human/somnari)
	var/main_color = "#22201f"
	var/secondary_color = "#a6a2a2"
	var/tertiary_color = "#CCF6E2"
	somnari.set_species(SPECIES_SOMNARI)
	somnari.dna.features["mcolor"] = main_color
	somnari.dna.features["mcolor2"] = secondary_color
	somnari.dna.features["mcolor3"] = tertiary_color
	somnari.dna.mutant_bodyparts["horns"] = list(MUTANT_INDEX_NAME = "Ram", MUTANT_INDEX_COLOR_LIST = list(main_color, secondary_color, tertiary_color))
	somnari.dna.features["legs"] = "Plantigrade legs"
	somnari.set_haircolor("#b8b8b8", update = FALSE) // white
	somnari.set_hairstyle("Fluffball", update = TRUE)
	regenerate_organs(somnari, src, visual_only = TRUE)
	somnari.update_body(TRUE)

/datum/species/human/somnari/on_species_gain(mob/living/carbon/human/gainer, datum/species/old_species, pref_load, regenerate_icons = TRUE)
	. = ..()
	//TODO: Add ability to fall asleep and go to the Dreamscape
	//TODO: Add Sleep Need
	//TODO: Add Magic that requires the somnari to be rested to use

/datum/species/human/somnari/on_species_loss(mob/living/carbon/human/loser, datum/species/new_species, pref_load)
	. = ..()
	//remove what was added in on_species_gain
