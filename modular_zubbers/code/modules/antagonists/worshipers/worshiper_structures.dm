/obj/structure/worshipers/worshiper_nexus
	name = "Divine Nexus"
	desc = "The thing that gives a divine presence form. If it is destroyed, so is the god."
	icon_state = "thingspike"
	density = TRUE
	anchored = TRUE
	var/mob/eye/worshipers_god/divinity

/obj/structure/worshipers/construction_site
	name = "Construction site"
	desc = "Looks like the worshipers are building something here..."
	icon_state = "thingspike"
	density = TRUE
	anchored = TRUE
	///The thing this will become after construction has finished
	var/obj/structure/worshipers/building
	///a list of all the items that are still needed for construction to be completed
	var/list/obj/item/remaining_materials = list()
