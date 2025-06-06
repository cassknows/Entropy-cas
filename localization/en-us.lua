local decs = {
	descriptions = {
		Enhanced = {
			m_entr_flesh = {
				name = "Flesh Card",
				text = {
					"{C:green}#1# in #2#{} chance to",
					"destroy this card when {C:attention}discarded{}"
				}
			},
			m_entr_disavowed = {
				name = "Disavowed",
				text = {
					"Cannot change enhancements"
				}
			}
		},
		Joker = {

			j_cry_circus = {
				name = "Circus",
				text = {
					"{C:red}Rare{} Jokers each give {X:mult,C:white} X#1# {} Mult",
					"{C:cry_epic}Epic{} Jokers each give {X:mult,C:white} X#2# {} Mult",
					"{C:legendary}Legendary{} Jokers each give {X:mult,C:white} X#3# {} Mult",
					"{C:cry_exotic}Exotic{} Jokers each give {X:mult,C:white} X#4# {} Mult",
					"{C:red}Entropic {}jokers each give {X:mult,C:white} X#5# {} Mult"
				},
				unlock = {
					"Obtain a {C:red}Rare{},",
					"{C:cry_epic}Epic{} and {C:legendary}Legendary{}",
					"Joker before {C:attention}Ante 9",
				},
			},
			j_entr_stillicidium = {
				name = "Stillicidium",
				text = {
					"Transform {C:attention}jokers{} to the right",
					"and all {C:attention}consumables{} into the",
					"card that precedes them in the",
					"collection at the end of the shop",
					"Reduce the rank of {C:attention}scored cards{} by 1",
					"reduce blind sizes by {C:attention}30%{}"
				}
			},
			j_entr_ruby = {
				name = "Ruby",
				text = {
					"{V:1,E:1}You may never lose.{}",
					"{C:inactive}(#1#){}",
					"{C:inactive}(Prevents losing unconditionally)"
				}
			},
			j_entr_surreal_joker = {
				name = "Surreal Joker",
				text = {
 					"Mult {X:entr_eqmult,C:white} = #1#{}"
				}
			},
			j_entr_tesseract = {
				name = "Tesseract",
				text = {
 					"Rotates mult by {X:dark_edition,C:white}#1#{}",
					"degrees counterclockwise",
					"and chips by {X:dark_edition,C:white}#1#{}",
					"degrees clockwise"
				}
			},
			j_entr_acellero = {
				name = "Epitachyno",
				text = {
 					"{X:dark_edition,C:white}^#1#{} to all other joker values",
					"at the end of the {C:attention}shop{}",
					"then increase {C:attention}exponent{} by {X:dark_edition,C:white}#2#{}"
				}
			},
			j_entr_helios= {
				name = "Helios",
				text = {
 					"{X:dark_edition,C:white}Infinite{} {C:attention}card selection limit{}",
					"Ascension formula is now {X:dark_edition,C:white}X(#1#^^#2#n){}",
					"{C:attention}All cards{} contribute to {C:Attention}Ascension power{}"
				}
			},
			j_entr_xekanos = {
				name = "Xekanos",
				text = {
 					"{X:dark_edition,C:white}#1#X{} {C:attention}ante gain{}",
					"increases by {X:dark_edition,C:white}#2#{}",
					"when the ante changes",
					"{X:dark_edition,C:white}Halve{} this value when",
					"a {C:attention}rare{} or higher rarity {C:attention}joker{}",
					"is sold"
				}
			},
			j_entr_ieros = {
				name = "Ieros",
				text = {
 					"{X:dark_edition,C:white}33%{} chance to upgrade",
					"joker {C:attention}rarities{} in the shop recursively",
					"Gain {X:dark_edition,C:white}^^Chips{} when buying a joker",
					"Based on the jokers {C:attention}rarity{}",
					"{C:inactive}(Currently: {}{X:dark_edition,C:white}^^#1#{}{C:inactive}){}",
				}
			},
			j_entr_dekatria = {
				name = "Dekatria",
				text = {
 					"{X:dark_edition,C:white}#1#{} Mult",
					"All cards are {C:dark_edition}Jolly{}",
					"Increase operator once for every",
					"{C:attention}#2#{} pairs in hand",
					"{C:inactive}(Currently: #3#){}"
				}
			},
			j_entr_perkeo = {
				name = "Oekrep",
				text = {
					"Destroy a {C:attention}random{} consumable and",
					"create a corresponding {C:dark_edition}Negative{}",
					"mega booster pack at the end of the {C:attention}shop{}"
				}
			},
			j_entr_yorick = {
				name = "Kciroy",
				text = {
					"{C:dark_edition}X#1#{} Hand size, {C:dark_edition}+#2#{} card selection limit",
					"This joker gains {X:dark_edition,C:white}^#3#{} Chips every",
					"{C:attention}#4#{} {C:inactive}[#5#]{} cards discarded",
					"{C:inactive}(Currently{} {X:dark_edition,C:white}^#6#{} {C:inactive}Chips){}"
				}
			},
			j_entr_chicot = {
				name = "Tocihc",
				text = {
					"Create the {C:attention}current{} blind's skip",
					"tag when blind is selected",
					"reduce non-boss blind sizes by {C:attention}80%{}",
					"{C:inactive}(Currently: #1#){}"
				}
			},
			j_entr_triboulet = {
				name = "Teluobirt",
				text = {
					"Scored {C:attention}jacks{} give {X:chips,C:white}XChips{}",
					"equal to the {C:attention}number{} of played jacks in the hand",
					"retrigger {C:attention}scored{} jacks based on their",
					"order in the played hand"
				}
			},
			j_entr_canio = {
				name = "Oinac",
				text = {
					"This joker gains {X:dark_edition,C:white}^#1#{} Chips",
					"when a {C:attention}face{} card is destroyed",
					"{C:attention}played{} playing cards are destroyed",
					"and a card with +1 rank is drawn to the {C:attention}hand{}",
					"{C:inactive}(Currently: {}{X:dark_edition,C:white}^#2#{} {C:inactive}Chips){}"
				}
			},
			j_entr_solarflare = {
				name = "Solar Flare",
				text = {
					"Other {C:dark_edition}Solar{} cards",
					"each give {X:gold,C:white}X#1#{} Ascension Power",
				},
			},
			j_entr_burnt_m= {
				name = "Burnt M",
				text = {
					"If played hand {C:attention}contains{} a pair",
					"apply {C:dark_edition}solar{} to the first card",
					"apply {C:dark_edition}solar{} to 1 more card for",
					"each {C:dark_edition}Jolly{} Joker"
				},
			},
			j_entr_anaptyxi= {
				name = "Anaptyxi",
				text = {
					"Scaling jokers scale as a quadratic",
					"Scaling jokers scale all other jokers by",
					"{X:dark_edition,C:white}X#1#{} the same amount then increase ",
					"this by {X:dark_edition,C:white}X#2#{} at the end of round",
					"{C:inactive}(Anaptyxi exlcuded){}",
				},
			},
			j_entr_chaos= {
				name = "Chaos",
				text = {
					"When a card is {C:attention}created{}",
					"instead create a card of",
					"a {C:attention}random type{}"
				},
			},
			j_entr_parakmi = {
				name = "Parakmi",
				text = {
					"{C:attention}Anything{} can appear",
					"in the place of any card"
				}
			},
			j_entr_exousia = {
				name = "Exousia",
				text = {
					"{C:attention}Ascends{} all tags",
					"Gain {C:attention}#1#{} skip tags when",
					"any blind is selected"
				}
			},
			j_entr_akyros = {
				name = "Akyros",
				text = {
					"Joker Slots can be {C:attention}bought{}",
					"for {C:gold}$#1#{} and {C:attention}sold{} for {C:gold}$#2#{}",
					"Gain money based on how many",
					"empty joker slots you have",
					"{C:inactive}(Currently{} {X:gold,C:white}#3#{}{C:inactive}){}"
				}
			}
		},
		Blind = {
			bl_entr_red = {
				name = "Red Room",
				text = {
					"???"
				}
			},
			bl_entr_scarlet_sun = {
				name = "Scarlet Sun",
				text = {
					"All cards add Ascension Power",
					"-1X Ascension Power"
				}
			},
			bl_entr_burgundy_baracuda = {
				name = "Burgundy Baracuda",
				text = {
					"1 in 2 played cards are destroyed",
				}
			},
			bl_entr_diamond_dawn = {
				name = "Diamond Dawn",
				text = {
					"remove the rank and suit",
					"of all discarded cards"
				}
			},
			bl_entr_olive_orchard = {
				name = "Olive Orchard",
				text = {
					"discarded and played cards become disavowed",
				}
			},
			bl_entr_citrine_comet = {
				name = "Citrine Comet",
				text = {
					"selected cards destroy adjacent cards",
				}
			},
			bl_entr_endless_entropy_phase_one = {
				name = "Burning Brimstone",
				text = {
					"???",
				}
			},
			bl_entr_endless_entropy_phase_two = {
				name = "Deceitful Decay",
				text = {
					"All you know shall crumble,",
					"Dust to dust.",
					"(Joker values decay over time)"
				}
			},
			bl_entr_endless_entropy_phase_three = {
				name = "Nameless Nadir",
				text = {
					"Void subsumes you,",
					"there is no escape.",
					"(Debuff leftmost joker slot)"
				}
			},
			bl_entr_endless_entropy_phase_four = {
				name = "Endless Entropy",
				text = {
					"You are but a speck of dust",
					"in the face of the universe.",
					"(Applies all showdown effects)"
				}
			},
		},
		Edition = {
			e_entr_solar = {
				name = "Solar",
				text = {
					"{X:gold,C:white}X#1#{} Ascension Power",
				},
			},
		},
		Back = {
			b_entr_twisted = {
				name = "Twisted Deck",
				text =  {
								"All {C:red}invertable{} consumables",
								"are automatically {C:red}inverted{}",
							}
			},
			b_entr_ccd2 = {
				name = "Redefined Deck",
				text =  {
								"Every card is also a random",
								"{C:attention}Joker{}, {C:attention}booster pack{},",
								"{C:attention}voucher{}, or {C:attention}consumable{}"
							}
			},
			b_entr_doc = {
				name = "Deck of Containment",
				text =  {
								"{C:red}Beyond{} has higher chances of showing",
								"up and {X:blue,C:white}Chips{} are lowered",
								"based on how high your {X:dark_edition,C:white}Entropy{} is",
								"Gain {X:dark_edition,C:white}Entropy{} when playing",
								"editioned/enhanced cards, secret hands",
								"or using consumables"
							}
			},
			b_entr_crafting = {
				name = "Deck of Destiny",
				text =  {
					"Jokers may no longer appear naturally",
					"Start with an {C:dark_edition}Absolute, Negative{} destiny",
					"Cards have a higher chance to be enhanced"
				}
			}
		},
		Sleeve = {
			sleeve_entr_twisted = {
				name = "Twisted Sleeve",
				text = {
					"All {C:red}invertable{} consumables",
					"are automatically {C:red}inverted{}",
				},
			},
			sleeve_entr_ccd2 = {
				name = "Redefined Sleeve",
				text = {
					"Every card is also a random",
					"{C:attention}Joker{}, {C:attention}booster pack{},",
					"{C:attention}voucher{}, or {C:attention}consumable{}"
				},
			},
			sleeve_entr_doc = {
				name = "Anomalous Sleeve",
				text = {
					"{C:red}Beyond{} has higher chances of showing up and",
					"{X:blue,C:white}Chips{} are lowered based on how high",
					"your {X:dark_edition,C:white}Entropy{} is, Gain {X:dark_edition,C:white}Entropy{}",
					"when playing editioned/enhanced cards, secret hands",
					"or using consumables"
				},
			},
		},
		RTarot = {
			c_entr_fool = {
				name = "The Fool?",
				text = {
					"Reverse {C:attention}1{} selected",
					"tarot or reverse tarot"
				}
			}
			
		},
		Voucher = {
			v_entr_marked = {
				name = "Marked Cards",
				text = {
					"{C:red}Inverted{} consumables have a",
					"fixed {C:red}10%{} chance to replace",
					"their regular counterparts"
				},
			},
			v_entr_trump_card = {
				name = "Trump Card",
				text = {
					"{C:red}Flipside{} can appear in",
					"{C:attention}Planet{}, {C:attention}Tarot{}, and {C:attention}Code{} packs",
				},
			},
			v_entr_supersede = {
				name = "Supersede",
				text = {
					"{C:red}Twisted{} booster packs have a",
					"fixed {C:red}20%{} chance to replace",
					"any other booster pack in the shop"
				},
			},
		},
		RCode = {
			c_entr_memory_leak = {
				name = "(~)$ memoryleak",
				text = {
					"{C:red}int *m = new int{}",
				}
			},
			c_entr_root_kit = {
				name = "(~)$ rootkit",
				text = {
					"For the next defeated blind",
					"spare hands give {C:red}$#1#{}",
				}
			},
			c_entr_break = {
				name = "(~)$ break;",
				text = {
					"Return to the {C:red}blind selection{} screen",
					"The {C:red}current blind{} is still upcoming",
				}
			},
			c_entr_interference = {
				name = "(~)$ interference",
				text = {
					"{C:red}Randomizes{} {C:attention}played hands{}, {C:attention}blind size{}",
					"and {C:attention}payout{} for the remainder of",
					"the {C:red}current round{}"
				}
			},
			c_entr_fork = {
				name = "(~)$ fork",
				text = {
					"create a {C:red}glitched{} copy of",
					"a selected {C:attention}playing card{} with",
					"a new {C:red}random enhancement{}"
				}
			},
			c_entr_push = {
				name = "(~)$ push -f",
				text = {
					"{C:red}Destroy{} all held {C:attention}Jokers{} {C:red}create{} a",
					"new {C:attention}joker{} based on their {C:red}rarities{}",
					
				}
			},
			c_entr_increment = {
				name = "(~)$ increment",
				text = {
					"{C:red}+1{} {C:attention}Shop Slots{}",
					"for the remainder of {C:attention}this ante{}",
				}
			},
			c_entr_decrement = {
				name = "(~)$ decrement",
				text = {
					"Transform {C:red}#1#{} selected {C:attention}Joker#2#{}",
					"to the {C:red}Joker{} that appears",
					"before #3# in the {C:red}collection{}"
				}
			},
			c_entr_cookies = {
				name = "(~)$ cookies",
				text = {
					"Create a {C:dark_edition}Negative{} {C:red}Candy Joker{}",
				}
			},
			c_entr_overflow = {
				name = "(~)$ overflow",
				text = {
					"{C:red}Infinite{} {C:attention}card selection limit{}",
					"until the end of the {C:red}current blind{}",
				}
			},
			c_entr_refactor = {
				name = "(~)$ refactor",
				text = {
					"Apply the {C:attention}edition of a selected",
					"{C:red}Joker{} to a random {C:red}Joker{}",
				}
			},
			c_entr_ctrl_x = {
				name = "(~)$ ctrl+x",
				text = {
					"{C:red}#1#{} #2# {C:attention}card{},",
					"{C:attention}booster{}, or {C:attention}voucher{}",
					"{C:inactive}(Currently: #3#){}"
				}
			},
			c_entr_segfault = {
				name = "(~)$ segfault",
				text = {
					"Create a random {C:attention}playing card{}",
					"with a {C:red}random{} {C:attention}consumable{}, {C:attention}joker{},",
					"{C:attention}booster pack{}, or {C:attention}voucher{} applied",
					"as an {C:red}enhancement{}",
					"then put it in the {C:attention}deck{}"
				}
			},
			c_entr_sudo = {
				name = "(~)$ sudo",
				text = {
					"{C:red}Permanently{} modify {C:attention}one{} selected",
					"{C:red}poker hand{} to always score as",
					"{C:attention}another{} {C:red}poker hand{}"
				}
			},
			c_entr_constant = {
				name = "(~)$ constant",
				text = {
					"Convert all {C:red}cards{} with the same",
					"rank as {C:attention}1{} selected card into",
					"the {C:red}selected card{}"
				}
			},
			c_entr_new = {
				name = "(~)$ new()",
				text = {
					"Adds an {C:attention}extra{} {C:red}Red Room{} blind",
					"before the next {C:attention}upcoming{} blind",
				}
			},
			c_entr_multithread = {
				name = "(~)$ multithread",
				text = {
					"Create temporary {C:dark_edition}negative{} copies",
					"of all {C:red}selected{} cards in {C:red}hand{}",
				}
			},
			c_entr_invariant = {
				name = "(~)$ invariant",
				text = {
					"Apply an {C:red}invariant{} sticker to",
					"1 selected card in the {C:red}shop{}",
				}
			},
			c_entr_inherit = {
				name = "(~)$ inherit",
				text = {
					"Convert {C:red}all{} cards with the same",
					"{C:red}enhancement{} as 1 selected card",
					"into a {C:red}chosen enhancement",
				}
			},
			c_entr_autostart = {
				name = "(~)$ autostart",
				text = {
					"Gain {C:red}#1#{} random skip tags",
					"obtained {C:red}previously{} in the run",
				}
			},
			c_entr_quickload = {
				name = "(~)$ quickload",
				text = {
					"{C:red}Retrigger{} the payout screen",
					"with {C:red}no{} blind money",
				}
			},
			c_entr_hotfix = {
				name = "(~)$ hotfix",
				text = {
					"Apply a {C:red}hotfix{} sticker to",
					"1 selected card",
				}
			},
			c_entr_pseudorandom = {
				name = "(~)$ pseudorandom",
				text = {
					"Apply a {C:red}pseudorandom{} sticker to",
					"{C:red}all{} cards on screen",
				}
			},
			c_entr_bootstrap = {
				name = "(~)$ bootstrap",
				text = {
					"The final {C:blue}chips{} and {C:red}mult{} of",
					"{C:red}this{} hand are applied to the",
					"base {C:blue}chips{} and {C:red}mult{} of the next hand"
				}
			},
			c_entr_local = {
				name = "(~)$ local",
				text = {
					"Apply {C:red}Temporary{} to",
					"#1# selected playing cards"
				}
			}
		},
		RPlanet = {
			c_entr_pluto = {
				name = "Regulus",
				text = {
					"{S:0.8}({S:0.8,V:1}lvl.#1#{}{S:0.8,C:gold}#2#{}{S:0.8}){} Level up",
					"{C:attention}#3#",
					"{C:gold}+#4#{} Ascension Power"
				}
			},
			c_entr_mercury = {
				name = "CZ Hydrae",
				text = {
					"{S:0.8}({S:0.8,V:1}lvl.#1#{}{S:0.8,C:gold}#2#{}{S:0.8}){} Level up",
					"{C:attention}#3#",
					"{C:gold}+#4#{} Ascension Power"
				}
			},
			c_entr_venus = {
				name = "Vega",
				text = {
					"{S:0.8}({S:0.8,V:1}lvl.#1#{}{S:0.8,C:gold}#2#{}{S:0.8}){} Level up",
					"{C:attention}#3#",
					"{C:gold}+#4#{} Ascension Power"
				}
			},
			c_entr_earth = {
				name = "Polaris",
				text = {
					"{S:0.8}({S:0.8,V:1}lvl.#1#{}{S:0.8,C:gold}#2#{}{S:0.8}){} Level up",
					"{C:attention}#3#",
					"{C:gold}+#4#{} Ascension Power"
				}
			},
			c_entr_mars = {
				name = "Rho Cassiopeiae",
				text = {
					"{S:0.8}({S:0.8,V:1}lvl.#1#{}{S:0.8,C:gold}#2#{}{S:0.8}){} Level up",
					"{C:attention}#3#",
					"{C:gold}+#4#{} Ascension Power"
				}
			},
			c_entr_jupiter = {
				name = "UU Pegasi",
				text = {
					"{S:0.8}({S:0.8,V:1}lvl.#1#{}{S:0.8,C:gold}#2#{}{S:0.8}){} Level up",
					"{C:attention}#3#",
					"{C:gold}+#4#{} Ascension Power"
				}
			},
			c_entr_saturn = {
				name = "RS Persei",
				text = {
					"{S:0.8}({S:0.8,V:1}lvl.#1#{}{S:0.8,C:gold}#2#{}{S:0.8}){} Level up",
					"{C:attention}#3#",
					"{C:gold}+#4#{} Ascension Power"
				}
			},
			c_entr_uranus = {
				name = "RT Ophiuchi",
				text = {
					"{S:0.8}({S:0.8,V:1}lvl.#1#{}{S:0.8,C:gold}#2#{}{S:0.8}){} Level up",
					"{C:attention}#3#",
					"{C:gold}+#4#{} Ascension Power"
				}
			},
			c_entr_neptune = {
				name = "V349 Carinae",
				text = {
					"{S:0.8}({S:0.8,V:1}lvl.#1#{}{S:0.8,C:gold}#2#{}{S:0.8}){} Level up",
					"{C:attention}#3#",
					"{C:gold}+#4#{} Ascension Power"
				}
			},
			c_entr_ceres = {
				name = "Procyon B",
				text = {
					"{S:0.8}({S:0.8,V:1}lvl.#1#{}{S:0.8,C:gold}#2#{}{S:0.8}){} Level up",
					"{C:attention}#3#",
					"{C:gold}+#4#{} Ascension Power"
				}
			},
			c_entr_planet_x = {
				name = "Tauri",
				text = {
					"{S:0.8}({S:0.8,V:1}lvl.#1#{}{S:0.8,C:gold}#2#{}{S:0.8}){} Level up",
					"{C:attention}#3#",
					"{C:gold}+#4#{} Ascension Power"
				}
			},
			c_entr_eris = {
				name = "Sirius B",
				text = {
					"{S:0.8}({S:0.8,V:1}lvl.#1#{}{S:0.8,C:gold}#2#{}{S:0.8}){} Level up",
					"{C:attention}#3#",
					"{C:gold}+#4#{} Ascension Power"
				}
			},
			c_entr_universe = {
				name = Cryptid_config.family_mode and "Multiverse" or "The Multiverse In Its Fucking Entirety",
				text = {
					"{S:0.8}({S:0.8,V:1}lvl.#1#{}{S:0.8,C:gold}#2#{}{S:0.8}){} Level up",
					"{C:attention}#3#",
					"{C:gold}+#4#{} Ascension Power"
				}
			},
			c_entr_marsmoons = {
				name = "Mizar & Alcor",
				text = {
					"{S:0.8}({S:0.8,V:1}lvl.#1#{}{S:0.8,C:gold}#2#{}{S:0.8}){} Level up",
					"{C:attention}#3#",
					"{C:gold}+#4#{} Ascension Power"
				}
			},
			c_entr_void = {
				name = "Dark Matter",
				text = {
					"{S:0.8}({S:0.8,V:1}lvl.#1#{}{S:0.8,C:gold}#2#{}{S:0.8}){} Level up",
					"{C:attention}#3#",
					"{C:gold}+#4#{} Ascension Power"
				}
			},
			c_entr_asteroidbelt = {
				name = "Dyson Swarm",
				text = {
					"{S:0.8}({S:0.8,V:1}lvl.#1#{}{S:0.8,C:gold}#2#{}{S:0.8}){} Level up",
					"{C:attention}#3#",
					"{C:gold}+#4#{} Ascension Power"
				}
			},
			c_entr_planetlua = {
				name = "Star.lua",
				text = {
					"{C:green}#1# in #2#{} chance to",
					"upgrade every",
					"{C:legendary,E:1}poker hand{}",
					"{C:gold}+#3#{} Ascension Power",
				}
			},
			c_entr_nstar = {
				name = "Strange Star",
				text = {
					"Upgrade a random",
					"{C:legendary,E:1}poker hand{}",
					"{C:attention}+#2#{} {C:gold}Ascension Power{} for each",
					"{C:attention}Strange Star{} used",
					"in this run",
					"{C:inactive}(Currently{C:attention} #1#{C:inactive}){}",
				}
			},
			c_entr_sunplanet = {
				name = "Nemesis",
				text = {
					"{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){}",
					"Increase exponent of",
					"{C:attention}Ascended{} hands by {X:gold,C:white}+X#2#{}",
					"{C:inactive}(Currently {X:gold,C:white}X(#3#^#4#asc){C:inactive})",
				}
			},
			c_entr_Sydan = {
				name = "Paras",
				text = {
					"({V:1}lvl.#4#{}{C:gold}#8#{})({V:2}lvl.#5#{}{C:gold}#9#{})({V:3}lvl.#6#{}{C:gold}#10#{})",
					"Level up",
					"{C:attention}#1#{},",
					"{C:attention}#2#{},",
					"and {C:attention}#3#{}",
					"{C:gold}+#7#{} Ascension Power"
				},
			},
			c_entr_Timantti = {
				name = "Jatka",
				text = {
					"({V:1}lvl.#4#{}{C:gold}#8#{})({V:2}lvl.#5#{}{C:gold}#9#{})({V:3}lvl.#6#{}{C:gold}#10#{})",
					"Level up",
					"{C:attention}#1#{},",
					"{C:attention}#2#{},",
					"and {C:attention}#3#{}",
					"{C:gold}+#7#{} Ascension Power"
				},
			},
			c_entr_Klubi = {
				name = "Roua",
				text = {
					"({V:1}lvl.#4#{}{C:gold}#8#{})({V:2}lvl.#5#{}{C:gold}#9#{})({V:3}lvl.#6#{}{C:gold}#10#{})",
					"Level up",
					"{C:attention}#1#{},",
					"{C:attention}#2#{},",
					"and {C:attention}#3#{}",
					"{C:gold}+#7#{} Ascension Power"
				},
			},
			c_entr_Lapio = {
				name = "Assa",
				text = {
					"({V:1}lvl.#4#{}{C:gold}#8#{})({V:2}lvl.#5#{}{C:gold}#9#{})({V:3}lvl.#6#{}{C:gold}#10#{})",
					"Level up",
					"{C:attention}#1#{},",
					"{C:attention}#2#{},",
					"and {C:attention}#3#{}",
					"{C:gold}+#7#{} Ascension Power"
				},
			},
			c_entr_Kaikki = {
				name = "Kivi",
				text = {
					"({V:1}lvl.#4#{}{C:gold}#8#{})({V:2}lvl.#5#{}{C:gold}#9#{})({V:3}lvl.#6#{}{C:gold}#10#{})",
					"Level up",
					"{C:attention}#1#{},",
					"{C:attention}#2#{},",
					"and {C:attention}#3#{}",
					"{C:gold}+#7#{} Ascension Power"
				},
			},
		},
		RSpectral = {
			c_entr_define = {
				name = "#1#define",
				text = {
					"Replace all future instances of",
					"a {V:1}selected card{} with",
					"a card of {V:1}your choice{}",
					"{C:inactive}(Rare consumables and{}",
					"{C:inactive}>=Exotic jokers excluded){}"
				}
			},
			c_entr_beyond = {
				name = "Beyond",
				text = {
					"Create a random",
					"{V:1,E:1}Entropic {}Joker",
					"banish all other held jokers"
				}
			},
			c_entr_fervour={
                name="Fervour",
                text={
                    "Creates a",
                    "{V:1,E:1}Legendary? {}Joker",
                    "{C:inactive}(Must have room)",
                },
            },
			c_entr_pulsar = {
				name = "Pulsar",
				text = {
					"Upgrade every",
					"{C:legendary,E:1}poker hand{}",
					"{C:gold}+#1#{} Ascension Power",
				}
			},
			c_entr_quasar = {
				name = "Quasar",
				text = {
					"Upgrade your most played",
					"{C:legendary,E:1}poker hand{} based",
					"on its current level",
					"{C:gold}+#1#{} Ascension Power",
				}
			},

			c_entr_weld = {
				name = "Weld",
				text = {
					"Apply {C:legendary,E:1}Absolute{} and {C:dark_edition}Negative{}",
					"to {C:attention}#1#{} selected joker",
					"{C:red}#2#{} discard"
				}
			},
			c_entr_cleanse = {
				name = "Cleanse",
				text = {
					"{C:attention}Strip{} the suit and rank",
					"from {C:attention}all{} cards in hand",
					"{C:gold}$#1#{} for each chip taken"
				}
			},

			c_entr_insignia = {
				name = "Insignia",
				text = {
					"Adds a {V:1}Silver Seal{}",
					"to #1# selected card",
				}
			},
			c_entr_rendezvous = {
				name = "Rendezvous",
				text = {
					"Adds a {V:1}Crimson Seal{}",
					"to #1# selected card",
				}
			},
			c_entr_eclipse = {
				name = "Veil",
				text = {
					"Adds a {V:1}Sapphire Seal{}",
					"to #1# selected card",
				}
			},
			c_entr_calamity = {
				name = "Calamity",
				text = {
					"Adds a {V:1}Pink Seal{}",
					"to #1# selected card",
				}
			},
			c_entr_downpour = {
				name = "Downpour",
				text = {
					"Adds a {V:1}Cerulean Seal{}",
					"to #1# selected card",
				}
			},
			c_entr_script = {
				name = "Script",
				text = {
					"Adds a {V:1}Verdant Seal{}",
					"to #1# selected card",
				}
			},
			c_entr_inscribe = {
				name = "Inscribe",
				text = {
					"Multiply the {C:attention}base{} chips",
					"of number cards in hand by {X:chips,C:white}X#1#{}",
					"then {C:attention}debuff{} all number cards",
					"in hand"
				}
			},
			c_entr_siphon = {
				name = "Siphon",
				text = {
					"Destroy 1 selected {C:attention}editioned{}",
					"joker then apply the {C:attention}previous{} edition",
					"to all cards in hand",
					"{C:inactive}(Currently: #1#){}"
				}
			},
			c_entr_changeling = {
				name = "Changeling",
				text = {
					"Convert {C:attention}#1#{} cards in hand",
					"to {C:attention}random{} editioned face cards",
				}
			},
			c_entr_ward = {
				name = "Ward",
				text = {
					"Destroy {C:attention}all{} jokers then",
					"Give {X:gold,C:white}X#1#{} their buy",
					"value in dollars"
				}
			},
			c_entr_ichor = {
				name = "Ichor",
				text = {
					"Banish a {C:attention}random{} held",
					"{C:dark_edition}negative{} joker",
					"{C:dark_edition}+#1#{} joker slots"
				}
			},
			c_entr_pact = {
				name = "Pact",
				text = {
					"{C:attention}Link{} up to {C:attention}#1#{}",
					"cards together, all modifications",
					"affect all of the linked cards"
				}
			},
			c_entr_rend = {
				name = "Rend",
				text = {
					"Convert up to {C:attention}#1#{}",
					"selected cards to",
					"{C:attention}Flesh{} cards"
				}
			},
			c_entr_rejuvenate = {
				name = "Rejuvenate",
				text = {
					"Add a random {C:attention}seal{},",
					"{C:attention}enhancement{}, and {C:attention}edition{}",
					"to 1 selected card then",
					"convert {C:attention}#1#{} other cards",
					"into this card, {C:gold}#2#{}",
				}
			},
			c_entr_crypt = {
				name = "Crypt",
				text = {
					"Select {C:attention}#1#{} jokers",
					"convert the {C:attention}left{} joker",
					"into the {C:attention}right{} joker",
					"then {C:attention}strip{} all modifications",
				}
			},
			c_entr_charm = {
				name = "Charm",
				text = {
					"Apply {C:attention}astral{} and",
					"{C:attention}eternal{} to a selected",
					"joker then {C:attention}banish{}",
					"a random other joker",
				}
			},
			c_entr_entropy = {
				name = "Entropy",
				text = {
					"Completely {C:attention}randomize{}",
					"up to #1# selected cards",
				}
			},
			c_entr_fusion = {
				name = "Fusion",
				text = {
					"{C:attention}#1#{} random cards in hand",
					"become random cards of 1",
					"selected cards type"
				}
			},
			c_entr_substitute = {
				name = "Substitute",
				text = {
					"{C:attention}Unredeem{} a random voucher",
					"and all lower tiers then redeem the next",
					"tier of voucher"
				}
			},
			c_entr_evocation = {
				name = "Evocation",
				text = {
					"{C:attention}Upgrade{} #1# selected jokers",
					"rarity then destroy all other jokers",
					"{C:blue}#2#{} hands"
				}
			},
			c_entr_mimic = {
				name = "Mimic",
				text = {
					"Create a {C:attention}banana perishable{} copy",
					"of #1# selected cards",
				}
			},
			c_entr_superego = {
				name = "Project",
				text = {
					"Apply a {C:attention}projected{}",
					"sticker to 1 selected Joker then",
					"debuff it"
				}
			},
			c_entr_engulf = {
				name = "Engulf",
				text = {
					"Apply {C:dark_edition}Solar{} effect",
					"to {C:attention}1{} selected card",
					"in hand"
				}
			},
			c_entr_offering = {
				name = "Offering",
				text = {
					"All Jokers become {C:attention}rental{}",
					"{X:gold,C:white}X#1#{} shop costs",
				}
			},
			c_entr_entomb = {
				name = "Entomb",
				text = {
					"Create a {C:attention}mega{} booster pack",
					"corresponding to the type of #1# selected",
					"consumable"
				}
			},
			c_entr_conduct = {
				name = "Conduct",
				text = {
					"Apply the {C:attention}previous{} edition",
					"to adjacent cards of 1 selected card",
					"consumable",
					"{C:inactive}(Currently: #1#){}"
				}
			},
			c_entr_disavow = {
				name = "Disavow",
				text = {
					"Boost cards held in {C:attention}hand{} based",
					"on their enhancement then strip their",
					"enhancement {C:attention}permanently{}",
				}
			},
		},
		Spectral = {
			c_entr_flipside = {
				name = "Flipside",
				text = {
					"Converts #1#{C:attention}#2#{}#3#",
					"Into an {C:red}Inverted{} variant",
				}
			},
			c_entr_destiny = {
				name = "Destiny",
				text = {
					"Sacrifice 5 playing cards to craft",
					"one joker based on their enhancements",
					"{C:inactive}(Currently: #1#){}"
				}
			},
		},
		Stake = {
			stake_entr_entropic = {
				name = "Entropic Stake",
				colour = "Ascendant",
				text = {
					"{C:red}Entropic{} joker blind scaling",
					"{C:red}always{} applies"
				},
			},
			stake_entr_zenith = {
				name = "Zenith Stake",
				colour = "Ascendant",
				text = {
					"{E:1,C:red}All blinds are endless entropy{}",
				},
			},
		},
		Tag= {
			tag_entr_dog = {
				name = "Dog Tag",
				text = { "Woof.", "{C:inactive}Level {C:dark_edition}#1#" },
			},
			tag_entr_solar = {
				name = "Solar Tag",
				text = { 
					"Next base edition shop",
					"Joker is free and",
					"becomes {C:dark_edition}solar{}"	
				},
			},
			tag_entr_ascendant_rare_tag = {
				name = "{C:gold}Rare Tag{}",
				text = { "Shop has a free", "{C:rare}Rare Joker{}" },
			},
			tag_entr_ascendant_epic_tag = {
				name = "{C:gold}Epic Tag{}",
				text = { "Shop has a free", "{C:cry_epic}Epic Joker{}" },
			},
			tag_entr_ascendant_legendary_tag = {
				name = "{C:gold}Legendary Tag{}",
				text = { "Shop has a free", "{C:legendary}Legendary Joker{}" },
			},
			tag_entr_ascendant_exotic_tag = {
				name = "{C:gold}Exotic Tag{}",
				text = { "Shop has a free", "{C:cry_exotic}Exotic Joker{}" },
			},
			tag_entr_ascendant_entropic_tag = {
				name = "{C:gold}Entropic Tag{}",
				text = { "Shop has a free", "{C:red}Entropic Joker{}" },
			},
			tag_entr_ascendant_copying_tag = {
				name = "{C:gold}Duplicate Tag{}",
				text = { "Gives {C:attention}#1#{} copies of the", "next selected tag", "{C:inactive}(Copying tags excluded){}" },
			},
			tag_entr_ascendant_voucher_tag = {
				name = "{C:gold}Golden Voucher Tag{}",
				text = { "Adds one Tier {C:attention}3{} Voucher", "to the next shop" },
			},
			tag_entr_ascendant_better_voucher_tag = {
				name = "{C:gold}Pristine Voucher Tag{}",
				text = { "Adds 2 Tier {C:attention}3{} Vouchers", "to the next shop" },
			},
			tag_entr_ascendant_saint_tag = {
				name = "{C:gold}Saint Tag{}",
				text = { "Shop has a free", "{C:attention}Editioned Candy Joker{}" },
			},
			tag_entr_ascendant_negative_tag = {
				name = "{C:gold}Negative Tag{}",
				text = { "{C:attention}All{} shop items are {C:dark_edition}Negative{}" },
			},
			tag_entr_ascendant_foil_tag = {
				name = "{C:gold}Foil Tag{}",
				text = { "{C:attention}All{} shop items are {C:dark_edition}Foil{}" },
			},
			tag_entr_ascendant_holo_tag = {
				name = "{C:gold}Holographic Tag{}",
				text = { "{C:attention}All{} shop items are {C:dark_edition}Holographic{}" },
			},
			tag_entr_ascendant_poly_tag = {
				name = "{C:gold}Polychrome Tag{}",
				text = { "{C:attention}All{} shop items are {C:dark_edition}Polychrome{}" },
			},
			tag_entr_ascendant_glass_tag = {
				name = "{C:gold}Fragile Tag{}",
				text = { "{C:attention}All{} shop items are {C:dark_edition}Fragile{}" },
			},
			tag_entr_ascendant_glitched_tag = {
				name = "{C:gold}Glitched Tag{}",
				text = { "{C:attention}All{} shop items are {C:dark_edition}Glitched{}" },
			},
			tag_entr_ascendant_gold_tag = {
				name = "{C:gold}Golden Tag{}",
				text = { "{C:attention}All{} shop items are {C:dark_edition}Golden{}" },
			},
			tag_entr_ascendant_blurry_tag = {
				name = "{C:gold}Blurred Tag{}",
				text = { "{C:attention}All{} shop items are {C:dark_edition}Blurred{}" },
			},
			tag_entr_ascendant_m_tag = {
				name = "{C:gold}M Tag{}",
				text = { "{C:attention}All{} shop items are {C:dark_edition}Joly{}", "{C:inactive}M{}" },
			},
			tag_entr_ascendant_mosaic_tag = {
				name = "{C:gold}Mosaic Tag{}",
				text = { "{C:attention}All{} shop items are {C:dark_edition}Mosaic{}" },
			},
			tag_entr_ascendant_astral_tag = {
				name = "{C:gold}Astral Tag{}",
				text = { "{C:attention}All{} shop items are {C:dark_edition}Astral{}" },
			},
			tag_entr_ascendant_oversat_tag = {
				name = "{C:gold}Oversaturated Tag{}",
				text = { "{C:attention}All{} shop items are {C:dark_edition}Oversaturated{}" },
			},
			tag_entr_ascendant_solar_tag = {
				name = "{C:gold}Solar Tag{}",
				text = { "{C:attention}All{} shop items are {C:dark_edition}Solar{}" },
			},
			tag_entr_ascendant_infdiscard_tag = {
				name = "{C:gold}Discard Tag{}",
				text = { "{C:attention}+3{} discards", "next round" },
			},
			tag_entr_ascendant_cat_tag = {
				name = "{C:gold}Cat Tag{}",
				text = { "{C:gold}Meow.{}", "{C:inactive}Level {C:dark_edition}#1#" },
			},
			tag_entr_ascendant_dog_tag = {
				name = "{C:gold}Dog Tag{}",
				text = { "{C:red}woof.{}", "{C:inactive}Level {C:dark_edition}#1#" },
			},
			tag_entr_ascendant_canvas_tag = {
				name = "{C:gold}Canvas Tag{}",
				text = { "Shop has a", "{C:attention}Canvas{}" },
			},
			tag_entr_ascendant_unbounded_tag = {
				name = "{C:gold}Unbounded Tag{}",
				text = {"Gives a free {C:spectral}Spectral Pack",
				"with {C:green,E:1}Pointer{} and {C:cry_exotic,E:1}Beyond{}", },
			},
			tag_entr_ascendant_ejoker_tag = {
				name = "{C:gold}Buffoon Tag{}",
				text = { "Gives a free editioned", "{C:attention}Mega Buffoon Pack{}" },
			},
			tag_entr_ascendant_universal_tag = {
				name = "{C:gold}Universal Tag{}",
				text = { "Level up {C:attention}#1#{}", "{C:gold}+6{} Ascension Power" },
			},
			tag_entr_ascendant_ebundle_tag = {
				name = "{C:gold}Bundle Tag{}",
				text = {"Create a {C:attention}Console Tag{}, {C:attention}Ethereal Tag{},",
				"{C:attention}Twisted Tag{}, and {C:attention}Bundle Tag{}", },
			},
			tag_entr_ascendant_twisted_tag = {
				name = "{C:gold}Twisted Tag{}",
				text = {"Gives a free","{C:red}Twisted Pack{}", },
			},
			tag_entr_ascendant_stock_tag = {
				name = "{C:gold}Stock Tag{}",
				text = {"2.5Xs your money", },
			},
			tag_entr_ascendant_blind_tag = {
				name = "{C:gold}Blind Tag{}",
				text = {"Gives a free","{C:attention}Blind Pack{}", },
			},
			tag_entr_ascendant_reference_tag = {
				name = "{C:gold}Reference Tag{}",
				text = {"Gives a free","{C:green}Reference Pack{}", },
			},
			tag_entr_ascendant_cavendish_tag = {
				name = "{C:gold}Cavendish Tag{}",
				text = {"Gives a free","{C:attention}Cavendish{}", },
			},
			tag_entr_ascendant_credit_tag = {
				name = "{C:gold}Credit Tag{}",
				text = {"Initial cards and", "booster packs in the next", "shop are free", "rerolls start at {C:gold}-$5{}" },
			},

			tag_entr_ascendant_topup_tag = {
				name = "{C:gold}Top-Up Tag{}",
				text = {
					"Creates up to {C:attention}3{}",
					"{C:green}Uncommon{} Jokers",
					"{C:inactive}(Must have room){}",
				},
			},
			tag_entr_ascendant_better_topup_tag = {
				name = "{C:gold}Better Top-Up Tag{}",
				text = {
					"Creates up to {C:attention}3{}",
					"{C:red}Rare{} Jokers",
					"{C:inactive}(Must have room){}",
				},
			},
			tag_entr_ascendant_booster_tag = {
				name = "{C:gold}Booster Tag{}",
				text = {
					"Next {C:cry_code}Booster Pack{} has",
					"{C:attention}triple{} cards and",
					"{C:attention}triple{} choices",
				},
			},
			tag_entr_ascendant_effarcire_tag = {
				name = "{C:gold}Infinite Tag{}",
				text = {
					"Draw {C:green}full deck{} to hand", "next round"
				},
			},
		},
		Other = {
			inversion_allowed = {
				name = "Flipside",
				text = {
					"Can be {C:red}inverted{}"
				}
			},
			p_entr_twisted_pack_normal = { 
				name = "Twisted Pack",
				group_name = "Inverted Card",
				text={
					"Choose {C:attention}#1#{} of up to",
					"{C:attention}#2#{V:1} Inverted{} cards to",
					"be used immediately or taken",
				}
			},
			p_entr_twisted_pack_jumbo = { 
				name = "Jumbo Twisted Pack",
				group_name = "Inverted Card",
				text={
					"Choose {C:attention}#1#{} of up to",
					"{C:attention}#2#{V:1} Inverted{} cards to",
					"be used immediately or taken",
				},
			},
			p_entr_twisted_pack_mega = { 
				name = "Mega Twisted Pack",
				group_name = "Inverted Card",
				text={
					"Choose {C:attention}#1#{} of up to",
					"{C:attention}#2#{V:1} Inverted{} cards to",
					"be used immediately or taken",
				},
			},
			p_entr_blind = { 
				name = "Blind Pack",
				group_name = "Blinds",
				text={
					"Choose {C:attention}#1#{} of up to",
					"{C:attention}#2#{} {C:attention}Blinds{} to",
					"be used immediately or taken",
				}
			},
			p_entr_unbounded = {
				name = "Unbounded Pack",
				text = {
					"Choose {C:attention}#1#{} of up to",
					"{C:attention}#2#{C:spectral} Spectral{} card#<s>2#",
					"{s:0.8,C:inactive}(Generated by Unbounded Tag)",
				},
			},
			p_entr_reference_pack = { 
				name = "Reference Pack",
				group_name = "Inverted Card",
				text={
					"Choose {C:attention}#1#{} of up to",
					"{C:attention}#2#{} {C:attention}Reference Jokers{}",
				}
			},
			entr_pinned = {
				name = "Invariant",
				text = {
					"{C:attention}Cannot{} be rerolled",
					"{C:attention}returns{} in the next",
					"round's shop"
				}
			},
			entr_hotfix = {
				name = "Hotfix",
				text = {
					"{C:attention}Cannot{} be debuffed",
				}
			},
			entr_pseudorandom = {
				name = "Pseudorandom",
				text = {
					"All {C:red}probabilities{} are",
					"{C:red}guaranteed{} until the",
					"next round"
				}
			},
			temporary = {
				name = "Temporary",
				text = {
					"{C:red}Destroyed{} at the end",
					"of the round"
				}
			},
			superego = {
				name = "Projected",
				text = {
					"Create {C:attention}#1#{} copies",
					"of this card when sold",
					"increase every 2 rounds"
				}
			},
			entr_entropic_sticker = {
                ['name'] = 'Entropic Sticker',
                ['text'] = {
                    [1] = 'Used this Joker',
                    [2] = 'to win on {C:attention}Entropic',
                    [3] = '{C:attention}Stake{} difficulty'
                }
            },
			entr_crimson_seal = {
				name = "Crimson Seal",
				text = {
					"Retrigger this",
					"card {C:attention}2{} times",
					"triggers at the {C:attention}end{}",
					"of scoring instead"
				}
			},
			entr_sapphire_seal = {
				name = "Sapphire Seal",
				text = {
					"Create the {C:purple}Star{} card",
					"for played hand if this",
					"card is {C:attention}part{}",
					"of the poker hand",
					"{C:inactive}(Must have room){}"
        		}
			},
			entr_silver_seal = {
				name = "Silver Seal",
				text = {
					"Gives {C:gold}$4{} if",
					"card is {C:attention}played{}",
					"and {C:attention}unscoring{}",
        		}
			},
			entr_pink_seal = {
				name = "Pink Seal",
				text = {
					"Creates an {C:red}Inversed{}",
					"card when discarded",
					"and is then {C:attention}destroyed{}",
					"{C:inactive}(Must have room){}"
				}
			},
			entr_verdant_seal = {
				name = "Verdant Seal",
				text = {
					"Creates a {C:red}Code?{}",
					"card when played {C:attention}if{}",
					"this is the {C:attention}only{}",
					"scored card"
				}
			},
			entr_cerulean_seal = {
				name = "Cerulean Seal",
				text = {
					"Create 3 {C:dark_edition}Negative{} {C:purple}Star{} cards",
					"for played hand if this",
					"card is {C:attention}part{}",
					"of the poker hand",
					"then {C:attention}destroy{}",
					"the played hand"
				}
			},
			link = {
				name = "Linked",
				text = {
					"shares modifications",
					"with other cards that",
					"share the same link",
					"{C:inactive}(#1#){}"
				}
			},
			xmult_bonus = {
				name = "Bonus Mult",
				text = {
					"{X:red,C:white}X#1#{} extra",
					"mult"
				}
			},
		}
	},
	misc = {
		achievement_names = {
			ach_entr_unstable_concoction = "Unstable Concoction"
		},
		achievement_descriptions = {
			ach_entr_unstable_concoction = "Use define to turn obelisk into sob"
		},
		suits_plural = {
			entr_nilsuit = "Nil",
		},
		suits_singular = {
			entr_nilsuit = "Nil",
		},
		ranks = {
			entr_nilrank = "Nil"
		},
		dictionary = {
			k_entr_hyper_exotic = "Entropic",
			k_entr_reverse_legendary = "Legendary?",
			k_entr_zenith = "Zenith",
			k_rtarot = "Tarot?",
			k_rtarot_pack = "Tarot Pack?",
			b_rtarot_cards = "Tarot Cards?",

			k_rcode = "Code?",
			k_rcode_pack = "Code Pack?",
			b_rcode_cards = "Code Cards?",

			k_rspectral = "Spectral?",
			k_rspectral_pack = "Spectral Pack?",
			b_rspectral_cards = "Spectral Cards?",

			a_eqmult = { "Mult = #1#" },

			b_select_custom = "Take",

			k_inverted = "Inverted",
			k_inverted_pack = "Twisted Pack",
			b_inverted_cards = "Twisted Cards",

			entr_code_sudo = "OVERRIDE",
			entr_code_sudo_previous = "OVERRIDE AS PREVIOUS",
			k_saved_ruby_1 = "The power of friendship saves you",
			k_saved_ruby_2 = "You believe in yourself",
			k_saved_ruby_3 = "All deaths retconned",
			k_saved_ruby_4 = "Dont eat that apple",
			k_saved_ruby_5 = "Is there poker in eden?",
			k_saved_ruby_6 = "Deny your fate",
			k_saved_ruby_7 = "Thanks for playing!",
			k_saved_ruby_8 = "",

			k_entr_faster_ante_scaling = "Scale blind scores quicker if you have an Entropic joker",
			k_entr_entropic_music = "Entropic Jokers (Joker in Greek by gemstonez)",

			k_rplanet = "Star",
			b_rplanet_cards = "Star Cards?",	
			k_planet_multiverse = Cryptid_config.family_mode and "Multiverse" or "The Actual Fucking Multiverse",
			k_planet_binary_star = "Binary Star System",
			k_planet_dyson_swarm = "Stellar Megastructure",

			k_entropy = "Entropy",

			k_cblind = "Blind Token",
			b_cblind_cards = "Blind Tokens",
			k_entr_base = "Base",

			k_blind_pack = "Blind Pack",
			b_blind_cards = "Blinds",

			k_reference_pack = "Reference Pack",
			b_reference_cards = "Reference Jokers",
			b_buy_slot = "+Joker Slot",
			b_sell_slot = "-Joker Slot",
			
			b_cant_reroll="Dont even try",

			ph_blind_score_less_than="Score less than"
		},
		v_dictionary = {
			card_art = "Card Art: #1#",
			shader = "Shader: #1#"
		},
		labels = {
			entr_pinned = "Invariant",
			entr_hotfix = "Hotfixed",
			temporary = "Temporary",
			entr_pseudorandom = "Pseudorandom",
			link = "Linked",
			superego = "Projected",
			entr_solar = "Solar",

			entr_crimson_seal = "Crimson Seal",
			entr_sapphire_seal = "Sapphire Seal",
			entr_silver_seal = "Silver Seal",
			entr_pink_seal = "Pink Seal",
			entr_verdant_seal = "Verdant Seal",
			entr_cerulean_seal = "Cerulean Seal",
		},
		poker_hands = {
			["entr_All"] = Cryptid_config.family_mode and "All" or "Literally Fucking Everything",
		},
		poker_hand_descriptions = {
			entr_All = {
				"A hand that contains every single",
				"card found in a 52-card deck.",
				"plus an entire full set of Optics",
				"and Nils, plus one Nil rank of each suit",
				Cryptid_config.family_mode and "God is Dead" or "Fuck You, God is Dead",
			}
		}
	},
}
local CBlind = {}
for i, v in pairs(decs.descriptions.Blind) do 
	local text = {}
	for i2, v2 in pairs(v.text or {}) do text[#text+1]=v2 end
	CBlind["c_entr_"..i] = {
		name=v.name,
		text={
			--text,
			{"Use to change the upcoming blind"},
		}
	}
end
for i, v in pairs(G.localization.descriptions.Blind) do 
	local text = {}
	for i2, v2 in pairs(v.text or {}) do text[#text+1]=v2 end
	CBlind["c_entr_"..i] = {
		name=v.name,
		text={
			--text,
			{"Use to change the upcoming blind"},
		}
	}
end
decs.descriptions.CBlind = CBlind
return decs