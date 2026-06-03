/datum/species/voidwalker_avatar
	id = SPECIES_VOIDWALKER //Species define unused in tg since they made them simple mobs
	name = "Voidwalker Avatar"
	inherent_traits = list(
		TRAIT_NO_UNDERWEAR,
		TRAIT_RESISTCOLD,
		TRAIT_NOBREATH,
		TRAIT_RESISTHIGHPRESSURE,
		TRAIT_RESISTLOWPRESSURE,
		TRAIT_RADIMMUNE,
		TRAIT_VIRUSIMMUNE,
		TRAIT_PIERCEIMMUNE,
		TRAIT_NODISMEMBER,
		TRAIT_NOHUNGER,
		TRAIT_NOBLOOD,
		TRAIT_NO_DNA_COPY,
		TRAIT_NODISMEMBER,
		TRAIT_NEVER_WOUNDED,
		TRAIT_NOCRITDAMAGE,
		TRAIT_NODEATH,
		TRAIT_SPACEWALK,
		TRAIT_MADNESS_IMMUNE,
		TRAIT_HARD_SOLES,
	)

/datum/species/voidwalker_avatar/on_species_gain(mob/living/carbon/human/human_who_gained_species, datum/species/old_species, pref_load, regenerate_icons)
	. = ..()
	human_who_gained_species.gain_trauma(/datum/brain_trauma/voided/avatar)

