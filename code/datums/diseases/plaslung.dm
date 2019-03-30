/datum/disease/plaslung
	name = "Plasmamans' Lung"
	max_stages = 4
	stage_prob = 1
	spread_text = "On contact"
	spread_flags = DISEASE_SPREAD_BLOOD | DISEASE_SPREAD_CONTACT_SKIN | DISEASE_SPREAD_CONTACT_FLUIDS
	cure_text = "Plasma & Sulfur"
	cures = list("plasma","sulfur")
	cure_chance = 15//higher chance to cure, since two reagents are required
	agent = "Plasmicrobes"
	viable_mobtypes = list(/mob/living/carbon/human)
	disease_flags = CAN_CARRY|CAN_RESIST|CURABLE
	permeability_mod = 1
	severity = DISEASE_SEVERITY_BIOHAZARD

/datum/disease/plaslung/stage_act()
	..()
	switch(stage)
		if(2)
			if(prob(5))
				affected_mob.emote("cough")
		if(3)
			if(prob(5))
				affected_mob.emote("cough")
				to_chat(affected_mob, "<span class='danger'>You cough up purple mist</span>")
				affected_mob.atmos_spawn_air("plasma=5;TEMP=22")
			if(prob(10))
				to_chat(affected_mob, "<span class='danger'>You cough up a large purple miasma!</span>")
				affected_mob.atmos_spawn_air("plasma=15;TEMP=22")
		if(4)
			to_chat(affected_mob, "<span class='userdanger'>A great infernal flame begins to pour out of every orifice and you suddenly explode into plasma!</span>")
			if(prob(50))
				affected_mob.atmos_spawn_air("plasma=100;TEMP=1000")
				affected_mob.gib()

		else
			return






//var/temp = holder ? holder.chem_temp : T20C
//	O.atmos_spawn_air("plasma=[reac_volume];TEMP=[temp]")
//
//	T.atmos_spawn_air("plasma=60")

//atmos_spawn_air("plasma=500;TEMP=1000")
//	var/mob/living/carbon/M = A.affected_mob
//var/turf/simulated/T = get_turf(A.affected_mob)