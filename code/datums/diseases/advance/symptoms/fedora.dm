 //MLADY!
/datum/symptom/fedora
	name = "Increased Fedora"
	stealth = -2
	resistance = 0
	stage_speed = 0
	transmittable = 3
	level = 2
	var/fedora = FALSE
	severity = 3
	symptom_delay_min = 10
	symptom_delay_max = 60

/datum/symptom/fedora/Start(datum/disease/advance/A)
	if(!..())
		return
		fedora = TRUE

/datum/symptom/fedora/Activate(datum/disease/advance/A)
	if(!..())
		return
	var/mob/living/carbon/M = A.affected_mob
	var/picked_bodypart = pick(BODY_ZONE_HEAD, BODY_ZONE_CHEST, BODY_ZONE_R_ARM, BODY_ZONE_L_ARM, BODY_ZONE_R_LEG, BODY_ZONE_L_LEG)
	var/obj/item/bodypart/bodypart = M.get_bodypart(picked_bodypart)
	if(bodypart && bodypart.status == BODYPART_ORGANIC && !bodypart.is_pseudopart)	 //robotic limbs will mean less scratching overall
		var/can_tip = fedora && !M.incapacitated() && get_location_accessible(M, picked_bodypart)
		M.visible_message("[can_tip ? "<span class='warning'>[M] spins a fedora about [M.p_their()] [bodypart.name].</span>" : ""]", "<span class='warning'>Your [bodypart.name] aches with a lack of female attention. [can_tip ? " you don't feel euphoric." : ""]</span>")
		if(can_tip)
			bodypart.receive_damage(0.5)
//took some liberties as whoever made increased fedora didn't actually indent at all using tab and it was entirely spaces.
//how the fuck did it still work? Magnets.