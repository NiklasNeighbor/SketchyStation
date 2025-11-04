/obj/item/organ/cyberimp/brain/lasertag_core
	name = "Lasertag Team Core"
	desc = "An implant that makes the users body react as if they were wearing a lasertag vest. Also allows the user to intuitively recognize other valid targets for lasertag"
	icon = 'modular_skyrat/modules/implants/icons/internal_HA.dmi'
	icon_state = "internal_HA"
	actions_types = list()
	w_class = WEIGHT_CLASS_SMALL
	slot = ORGAN_SLOT_LASERTAG
	var/lasertag_team = LASERTAG_TEAM_NEUTRAL

/obj/item/organ/cyberimp/brain/lasertag_core/Insert(mob/living/carbon/receiver, special, movement_flags)
	. = ..()
	receiver.AddComponentFrom(REF(src), /datum/component/lasertag, lasertag_team)

/obj/item/organ/cyberimp/brain/lasertag_core/Remove(mob/living/carbon/organ_owner, special, movement_flags)
	. = ..()
	organ_owner.RemoveComponentSource(REF(src), /datum/component/lasertag)

/obj/item/organ/cyberimp/brain/lasertag_core/redtag
	lasertag_team = LASERTAG_TEAM_RED

/obj/item/organ/cyberimp/brain/lasertag_core/bluetag
	lasertag_team = LASERTAG_TEAM_BLUE
