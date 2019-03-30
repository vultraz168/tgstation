/datum/disease/fedora
	name = "Increased Fedora"
	max_stages = 5
	spread_text = "On contact"
	spread_flags = DISEASE_SPREAD_BLOOD | DISEASE_SPREAD_CONTACT_SKIN | DISEASE_SPREAD_CONTACT_FLUIDS
	cure_text = "Spaceacillin"
	cures = list("spaceacillin")
	cure_chance = 10
	agent = "1NC31 virion"
	viable_mobtypes = list(/mob/living/carbon/human, /mob/living/carbon/monkey)
	permeability_mod = 0.75
	desc = "Causes the subject to speak and feel the intense physical rigors of virginity."
	severity = DISEASE_SEVERITY_MEDIUM

datum/disease/fedora/stage_act()
	..()
	switch(stage)
		if(2,3,4,5)
			if(prob(5))
				affected_mob.say( pick( list("*tips fedora", "*nods respectfully in your direction", "ugh, fundies.", "Want to see my hat tricks?", "In this moment I feel euphoric.", "Hellooooooo Ladies!!", "M'lady!!") ) , forced = "increased fedora")
			if(prob(5))
				to_chat(affected_mob, "<span class='danger'>You feel heartache from a lack of female attention.</span>")
				affected_mob.take_bodypart_damage(1)
			if(prob(5))
				to_chat(affected_mob, "<span class='danger'>Religious themes poison your mind.</span>")
				affected_mob.adjustToxLoss(1)
				affected_mob.updatehealth()
