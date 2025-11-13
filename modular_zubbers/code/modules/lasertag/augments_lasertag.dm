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

/obj/item/organ/cyberimp/arm/toolkit/tag_armcannon
	name = "Laser tag arm cannon"
	desc = "A lasertag cannon implanted into a person's arm. For when you need to always be ready to fight the enemy!"
	items_to_create = list(/obj/item/gun/energy/laser/tag_armcannon)
	actions_types = list(/datum/action/item_action/organ_action/toggle/tag_armcannon)

/obj/item/organ/cyberimp/arm/toolkit/tag_armcannon/left
	name = "Left Laser tag arm cannon"
	zone = BODY_ZONE_L_ARM
	slot = ORGAN_SLOT_LEFT_ARM_AUG

/obj/item/organ/cyberimp/arm/toolkit/tag_armcannon/right
	name = "Right Laser tag arm cannon"
	zone = BODY_ZONE_R_ARM
	slot = ORGAN_SLOT_RIGHT_ARM_AUG

/datum/action/item_action/organ_action/toggle/tag_armcannon
	name = "Deploy Laser tag Arm cannon"
	desc = "Deploy the laser tag cannon imbedded in your arm"
	var/obj/item/organ/cyberimp/arm/toolkit/tag_armcannon/implant

/datum/action/item_action/organ_action/toggle/tag_armcannon/Trigger(mob/clicker, trigger_flags)
	. = ..()
	to_chat(clicker, span_yellow("DEBUG: Action Triggered!"))
	SEND_SIGNAL( owner, COMSIG_TAG_ARMCANNON_TOGGLE)
