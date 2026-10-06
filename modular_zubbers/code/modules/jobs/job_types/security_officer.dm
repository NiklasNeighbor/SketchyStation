/datum/job/security_officer
	total_positions = 8 //Handled in /datum/controller/occupations/proc/setup_officer_positions()
	spawn_positions = 8 //Handled in /datum/controller/occupations/proc/setup_officer_positions()

	family_heirlooms = list(/obj/item/book/manual/wiki/security_space_law, /obj/item/clothing/head/beret/sec)

//I hope this works and doesn't just overwrite the regular security after_latejoin_spawn proc
/datum/job/security_officer/after_latejoin_spawn(mob/living/spawning)
	. = ..()
	if(GLOB.families_handler) // If Families is active, put this guy in the Security Family.
		var/datum/antagonist/gang/security/security_gangster_datum = new
		security_gangster_datum.handler = GLOB.families_handler
		spawning.mind.add_antag_datum(security_gangster_datum)

/datum/outfit/job/security
	suit_store = /obj/item/gun/energy/e_gun/advtaser
	glasses = /obj/item/clothing/glasses/hud/security
	backpack_contents = list(
		/obj/item/evidencebag = 1,
		/obj/item/flashlight/seclite = 1)
