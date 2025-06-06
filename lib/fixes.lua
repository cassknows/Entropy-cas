G.FUNCS.flame_handler = function(e)
    G.C.UI_CHIPLICK = G.C.UI_CHIPLICK or {1, 1, 1, 1}
    G.C.UI_MULTLICK = G.C.UI_MULTLICK or {1, 1, 1, 1}
    for i=1, 3 do
      G.C.UI_CHIPLICK[i] = math.min(math.max(((G.C.UI_CHIPS[i]*0.5+G.C.YELLOW[i]*0.5) + 0.1)^2, 0.1), 1)
      G.C.UI_MULTLICK[i] = math.min(math.max(((G.C.UI_MULT[i]*0.5+G.C.YELLOW[i]*0.5) + 0.1)^2, 0.1), 1)
    end
  
    G.ARGS.flame_handler = G.ARGS.flame_handler or {
      chips = {
        id = 'flame_chips', 
        arg_tab = 'chip_flames',
        colour = G.C.UI_CHIPS,
        accent = G.C.UI_CHIPLICK
      },
      mult = {
        id = 'flame_mult', 
        arg_tab = 'mult_flames',
        colour = G.C.UI_MULT,
        accent = G.C.UI_MULTLICK
      }
    }
    for k, v in pairs(G.ARGS.flame_handler) do
      if e.config.id == v.id then 
        if not e.config.object:is(Sprite) or e.config.object.ID ~= v.ID then 
          e.config.object:remove()
          e.config.object = Sprite(0, 0, 2.5, 2.5, G.ASSET_ATLAS["ui_1"], {x = 2, y = 0})
          v.ID = e.config.object.ID
          G.ARGS[v.arg_tab] = {
              intensity = 0,
              real_intensity = 0,
              intensity_vel = 0,
              colour_1 = v.colour,
              colour_2 = v.accent,
              timer = G.TIMERS.REAL
          }      
          e.config.object:set_alignment({
              major = e.parent,
              type = 'bmi',
              offset = {x=0,y=0},
              xy_bond = 'Weak'
          })
          e.config.object:define_draw_steps({{
            shader = 'flame',
            send = {
                {name = 'time', ref_table = G.ARGS[v.arg_tab], ref_value = 'timer'},
                {name = 'amount', ref_table = G.ARGS[v.arg_tab], ref_value = 'real_intensity'},
                {name = 'image_details', ref_table = e.config.object, ref_value = 'image_dims'},
                {name = 'texture_details', ref_table = e.config.object.RETS, ref_value = 'get_pos_pixel'},
                {name = 'colour_1', ref_table =  G.ARGS[v.arg_tab], ref_value = 'colour_1'},
                {name = 'colour_2', ref_table =  G.ARGS[v.arg_tab], ref_value = 'colour_2'},
                {name = 'id', val =  e.config.object.ID},
            }}})
            e.config.object:get_pos_pixel()
        end
        local _F = G.ARGS[v.arg_tab]
        local exptime = math.exp(-0.4*G.real_dt)
        if to_big(G.ARGS.score_intensity.earned_score) >= to_big(G.ARGS.score_intensity.required_score) and to_big(G.ARGS.score_intensity.required_score) > to_big(0) then
          _F.intensity = ((G.pack_cards and not G.pack_cards.REMOVED) or (G.TAROT_INTERRUPT)) and 0 or math.max(0., math.log(G.ARGS.score_intensity.earned_score, 5)-2)
            if type(_F.intensity) == "table" then
                if _F.intensity > to_big(85) then
                    _F.intensity = 85
                else
                    _F.intensity = _F.intensity:to_number()
                end
            elseif _F.intensity > 85 then
                _F.intensity = 85
            end
        else
          _F.intensity = 0
        end
        if G.GAME.Ruby and G.hand and #G.hand.highlighted > 0 and not G.pack_cards then
            _F.intensity = 85
        end
        _F.timer = _F.timer + G.real_dt*(1 + _F.intensity*0.2)
        if _F.intensity_vel < 0 then _F.intensity_vel = _F.intensity_vel*(1 - 10*G.real_dt) end
        _F.intensity_vel = (1-exptime)*(_F.intensity - _F.real_intensity)*G.real_dt*25 + exptime*_F.intensity_vel
        _F.real_intensity = math.max(0, _F.real_intensity + _F.intensity_vel)
        
        _F.real_intensity = (G.cry_flame_override and G.cry_flame_override['duration'] > 0) and ((_F.real_intensity + G.cry_flame_override['intensity'])/2) or _F.real_intensity
        if to_big(_F.real_intensity) > to_big(85) then
            _F.real_intensity = 85
        end
        if G.GAME.Ruby and G.hand and #G.hand.highlighted > 0 and not G.pack_cards then
            _F.real_intensity = 85
        end
        _F.change = (_F.change or 0)*(1 - 4.*G.real_dt) + ( 4.*G.real_dt)*(_F.real_intensity < _F.intensity - 0.0 and 1 or 0)*_F.real_intensity
        _F.change = (G.cry_flame_override and G.cry_flame_override['duration'] > 0) and ((_F.change + G.cry_flame_override['intensity'])/2) or _F.change
      end
    end
  end


  SMODS.Joker:take_ownership('cry_Scalae', -- object key (class prefix not required)
    { -- table of properties to change from the existing object
        cry_scale_mod = function(self, card, joker, orig_scale_scale, true_base, orig_scale_base, new_scale_base)
            if joker.ability.name ~= "cry-Scalae" then
                local new_scale = lenient_bignum(
                    to_big(true_base)
                        * (
                            (
                                1
                                + (
                                    (to_big(orig_scale_scale) / to_big(true_base))
                                    ^ (to_big(1) / to_big(card.ability.extra.scale))
                                )
                            ) ^ to_big(card.ability.extra.scale)
                        )
                )
                if not Cryptid.is_card_big(joker) and to_big(new_scale) >= to_big(1e300) then
                    new_scale = 1e300
                end
                return new_scale
            end
        end
    },
    true -- silent | suppresses mod badge
)

Cryptid.big_num_blacklist["j_credit_card"] = true

function getDollarNum(num)
    if type(num) == "number" then return tostring(num) end
    if to_big(num) > to_big(1e10) then
        return BalaNotation:format(num, 10)
    else
        return tostring(num:to_number())
    end
end

function add_round_eval_row(config)
    local config = config or {}
    local width = G.round_eval.T.w - 0.51
    local num_dollars = config.dollars or 1
    local scale = 0.9

    if config.name ~= 'bottom' then
        total_cashout_rows = (total_cashout_rows or 0) + 1
        if total_cashout_rows > 7 then
            return
        end
        if config.name ~= 'blind1' then
            if not G.round_eval.divider_added then 
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',delay = 0.25,
                    func = function() 
                        local spacer = {n=G.UIT.R, config={align = "cm", minw = width}, nodes={
                            {n=G.UIT.O, config={object = DynaText({string = {'......................................'}, colours = {G.C.WHITE},shadow = true, float = true, y_offset = -30, scale = 0.45, spacing = 13.5, font = G.LANGUAGES['en-us'].font, pop_in = 0})}}
                        }}
                        G.round_eval:add_child(spacer,G.round_eval:get_UIE_by_ID(config.bonus and 'bonus_round_eval' or 'base_round_eval'))
                        return true
                    end
                }))
                delay(0.6)
                G.round_eval.divider_added = true
            end
        else
            delay(0.2)
        end

        delay(0.2)

        G.E_MANAGER:add_event(Event({
            trigger = 'before',delay = 0.5,
            func = function()
                --Add the far left text and context first:
                local left_text = {}
                if config.name == 'blind1' then
                    local stake_sprite = get_stake_sprite(G.GAME.stake or 1, 0.5)
                    local obj = G.GAME.blind.config.blind
                    local blind_sprite = AnimatedSprite(0, 0, 1.2, 1.2, G.ANIMATION_ATLAS[obj.atlas] or G.ANIMATION_ATLAS['blind_chips'], copy_table(G.GAME.blind.pos))
                    blind_sprite:define_draw_steps({
                        {shader = 'dissolve', shadow_height = 0.05},
                        {shader = 'dissolve'}
                    })
                    table.insert(left_text, {n=G.UIT.O, config={w=1.2,h=1.2 , object = blind_sprite, hover = true, can_collide = false}})
  
                    table.insert(left_text,                  
                    config.saved and 
                    {n=G.UIT.C, config={padding = 0.05, align = 'cm'}, nodes={
                        {n=G.UIT.R, config={align = 'cm'}, nodes={
                            {n=G.UIT.O, config={object = DynaText({string = {' '..(G.GAME.Ruby and localize(pseudorandom_element(Entropy.RubySaves, pseudoseed("hope"))) or localize('ph_mr_bones'))..' '}, colours = {G.C.FILTER}, shadow = true, pop_in = 0, scale = 0.5*scale*(1), silent = true, maxw = 5})}}
                        }}
                    }}
                    or {n=G.UIT.C, config={padding = 0.05, align = 'cm'}, nodes={
                        {n=G.UIT.R, config={align = 'cm'}, nodes={
                            {n=G.UIT.O, config={object = DynaText({string = {' '..localize('ph_score_at_least')..' '}, colours = {G.C.UI.TEXT_LIGHT}, shadow = true, pop_in = 0, scale = 0.4*scale, silent = true})}}
                        }},
                        {n=G.UIT.R, config={align = 'cm', minh = 0.8}, nodes={
                            {n=G.UIT.O, config={w=0.5,h=0.5 , object = stake_sprite, hover = true, can_collide = false}},
                            {n=G.UIT.T, config={text = G.GAME.blind.chip_text, scale = scale_number(G.GAME.blind.chips, scale, 100000), colour = G.C.RED, shadow = true}}
                        }}
                    }}) 
                elseif string.find(config.name, 'tag') then
                    local blind_sprite = Sprite(0, 0, 0.7,0.7, G.ASSET_ATLAS['tags'], copy_table(config.pos))
                    blind_sprite:define_draw_steps({
                        {shader = 'dissolve', shadow_height = 0.05},
                        {shader = 'dissolve'}
                    })
                    blind_sprite:juice_up()
                    table.insert(left_text, {n=G.UIT.O, config={w=0.7,h=0.7 , object = blind_sprite, hover = true, can_collide = false}})
                    table.insert(left_text, {n=G.UIT.O, config={object = DynaText({string = {config.condition}, colours = {G.C.UI.TEXT_LIGHT}, shadow = true, pop_in = 0, scale = 0.4*scale, silent = true})}})                   
                elseif config.name == 'hands' and G.GAME.RootKit then
                table.insert(left_text, {n=G.UIT.T, config={text = config.disp or config.dollars, scale = 0.8*scale, colour = G.C.RED, shadow = true, juice = true}})
                table.insert(left_text, {n=G.UIT.O, config={object = DynaText({string = {" "..localize{type = 'variable', key = 'remaining_hand_money', vars = {(G.GAME.modifiers.money_per_hand or 1)*G.GAME.RootKit}}}, colours = {G.C.UI.TEXT_LIGHT}, shadow = true, pop_in = 0, scale = 0.4*scale, silent = true})}})
                G.GAME.RootKit = nil
                elseif config.name == 'hands' then
                    table.insert(left_text, {n=G.UIT.T, config={text = config.disp or config.dollars, scale = 0.8*scale, colour = G.C.BLUE, shadow = true, juice = true}})
                    table.insert(left_text, {n=G.UIT.O, config={object = DynaText({string = {" "..localize{type = 'variable', key = 'remaining_hand_money', vars = {G.GAME.modifiers.money_per_hand or 1}}}, colours = {G.C.UI.TEXT_LIGHT}, shadow = true, pop_in = 0, scale = 0.4*scale, silent = true})}})
                elseif config.name == 'discards' then
                    table.insert(left_text, {n=G.UIT.T, config={text = config.disp or config.dollars, scale = 0.8*scale, colour = G.C.RED, shadow = true, juice = true}})
                    table.insert(left_text, {n=G.UIT.O, config={object = DynaText({string = {" "..localize{type = 'variable', key = 'remaining_discard_money', vars = {G.GAME.modifiers.money_per_discard or 0}}}, colours = {G.C.UI.TEXT_LIGHT}, shadow = true, pop_in = 0, scale = 0.4*scale, silent = true})}})
                elseif string.find(config.name, 'joker') then
                    table.insert(left_text, {n=G.UIT.O, config={object = DynaText({string = localize{type = 'name_text', set = config.card.config.center.set, key = config.card.config.center.key}, colours = {G.C.FILTER}, shadow = true, pop_in = 0, scale = 0.6*scale, silent = true})}})
                elseif config.name == 'interest_payload' then
                table.insert(left_text, {n=G.UIT.T, config={text = num_dollars, scale = 0.8*scale, colour = G.C.SECONDARY_SET.Code, shadow = true, juice = true}})
                table.insert(left_text,{n=G.UIT.O, config={object = DynaText({string = {" "..localize{type = 'variable', key = 'interest', vars = {G.GAME.interest_amount*config.payload, 5, G.GAME.interest_amount*config.payload*G.GAME.interest_cap/5}}}, colours = {G.C.SECONDARY_SET.Code}, shadow = true, pop_in = 0, scale = 0.4*scale, silent = true})}})
                elseif config.name == 'interest' then
                    table.insert(left_text, {n=G.UIT.T, config={text = getDollarNum(num_dollars), scale = 0.8*scale, colour = G.C.MONEY, shadow = true, juice = true}})
                    table.insert(left_text,{n=G.UIT.O, config={object = DynaText({string = {" "..localize{type = 'variable', key = 'interest', vars = {getDollarNum(G.GAME.interest_amount), 5, getDollarNum(G.GAME.interest_amount*G.GAME.interest_cap/5)}}}, colours = {G.C.UI.TEXT_LIGHT}, shadow = true, pop_in = 0, scale = 0.4*scale, silent = true})}})
                end
                local full_row = {n=G.UIT.R, config={align = "cm", minw = 5}, nodes={
                    {n=G.UIT.C, config={padding = 0.05, minw = width*0.55, minh = 0.61, align = "cl"}, nodes=left_text},
                    {n=G.UIT.C, config={padding = 0.05,minw = width*0.45, align = "cr"}, nodes={{n=G.UIT.C, config={align = "cm", id = 'dollar_'..config.name},nodes={}}}}
                }}
        
                if config.name == 'blind1' then
                    G.GAME.blind:juice_up()
                end
                G.round_eval:add_child(full_row,G.round_eval:get_UIE_by_ID(getDollarNum(num_dollars) and 'bonus_round_eval' or 'base_round_eval'))
                play_sound('cancel', config.pitch or 1)
                play_sound('highlight1',( 1.5*config.pitch) or 1, 0.2)
                if config.card then config.card:juice_up(0.7, 0.46) end
                return true
            end
        }))
        local dollar_row = 0
        num_dollars = num_dollars; 
        if math.abs(to_big(num_dollars):to_number()) > 60 then
            if to_big(num_dollars) < to_big(0) then --if negative
                G.E_MANAGER:add_event(Event({
                    trigger = 'before',delay = 0.38,
                    func = function()
                        G.round_eval:add_child(
                            {n=G.UIT.R, config={align = "cm", id = 'dollar_row_'..(dollar_row+1)..'_'..config.name}, nodes={
                                {n=G.UIT.O, config={object = DynaText({string = {localize('$')..getDollarNum(num_dollars)}, colours = {G.C.RED}, shadow = true, pop_in = 0, scale = 0.65, float = true})}}
                            }},
                            G.round_eval:get_UIE_by_ID('dollar_'..config.name))
                        play_sound('coin3', 0.9+0.2*math.random(), 0.7)
                        play_sound('coin6', 1.3, 0.8)
                        return true
                    end
                }))
            else --if positive
            G.E_MANAGER:add_event(Event({
                trigger = 'before',delay = 0.38,
                func = function()
                    G.round_eval:add_child(
                            {n=G.UIT.R, config={align = "cm", id = 'dollar_row_'..(dollar_row+1)..'_'..config.name}, nodes={
                                {n=G.UIT.O, config={object = DynaText({string = {localize('$')..getDollarNum(num_dollars)}, colours = {G.C.MONEY}, shadow = true, pop_in = 0, scale = 0.65, float = true})}}
                            }},
                            G.round_eval:get_UIE_by_ID('dollar_'..config.name))

                    play_sound('coin3', 0.9+0.2*math.random(), 0.7)
                    play_sound('coin6', 1.3, 0.8)
                    return true
                end
            }))
            end
        else
            local dollars_to_loop
            num_dollars = to_big(num_dollars):to_number()
            if num_dollars < 0 then dollars_to_loop = (num_dollars*-1)+1 else dollars_to_loop = num_dollars end
            for i = 1, dollars_to_loop do
                G.E_MANAGER:add_event(Event({
                    trigger = 'before',delay = 0.18 - ((num_dollars > 20 and 0.13) or (num_dollars > 9 and 0.1) or 0),
                    func = function()
                        if i%30 == 1 then 
                            G.round_eval:add_child(
                                {n=G.UIT.R, config={align = "cm", id = 'dollar_row_'..(dollar_row+1)..'_'..config.name}, nodes={}},
                                G.round_eval:get_UIE_by_ID('dollar_'..config.name))
                                dollar_row = dollar_row+1
                        end

                        local r
                        if i == 1 and num_dollars < 0 then
                            r = {n=G.UIT.T, config={text = '-', colour = G.C.RED, scale = ((num_dollars < -20 and 0.28) or (num_dollars < -9 and 0.43) or 0.58), shadow = true, hover = true, can_collide = false, juice = true}}
                            play_sound('coin3', 0.9+0.2*math.random(), 0.7 - (num_dollars < -20 and 0.2 or 0))
                        else
                            if num_dollars < 0 then r = {n=G.UIT.T, config={text = localize('$'), colour = G.C.RED, scale = ((num_dollars > 20 and 0.28) or (num_dollars > 9 and 0.43) or 0.58), shadow = true, hover = true, can_collide = false, juice = true}}
                            else r = {n=G.UIT.T, config={text = localize('$'), colour = G.C.MONEY, scale = ((num_dollars > 20 and 0.28) or (num_dollars > 9 and 0.43) or 0.58), shadow = true, hover = true, can_collide = false, juice = true}} end
                        end
                        play_sound('coin3', 0.9+0.2*math.random(), 0.7 - (num_dollars > 20 and 0.2 or 0))
                        
                        if config.name == 'blind1' then 
                            G.GAME.current_round.dollars_to_be_earned = G.GAME.current_round.dollars_to_be_earned:sub(2)
                        end

                        G.round_eval:add_child(r,G.round_eval:get_UIE_by_ID('dollar_row_'..(dollar_row)..'_'..config.name))
                        G.VIBRATION = G.VIBRATION + 0.4
                        return true
                    end
                }))
            end
        end
    else
        delay(0.4)
        G.E_MANAGER:add_event(Event({
            trigger = 'before',delay = 0.5,
            func = function()
                UIBox{
                    definition = {n=G.UIT.ROOT, config={align = 'cm', colour = G.C.CLEAR}, nodes={
                        {n=G.UIT.R, config={id = 'cash_out_button', align = "cm", padding = 0.1, minw = 7, r = 0.15, colour = G.GAME.current_round.semicolon and G.C.SET.Code or G.C.ORANGE, shadow = true, hover = true, one_press = true, button = 'cash_out', focus_args = {snap_to = true}}, nodes={
                            {n=G.UIT.T, config={text = G.GAME.current_round.semicolon and localize('k_end_blind') or (localize('b_cash_out')..": "), scale = 1, colour = G.C.UI.TEXT_LIGHT, shadow = true}},
                            {n=G.UIT.T, config={text = localize('$')..format_ui_value(config.dollars), scale = 1.2*scale, colour = G.C.WHITE, shadow = true, juice = true}}
                    }},}},
                    config = {
                      align = 'tmi',
                      offset ={x=0,y=0.4},
                      major = G.round_eval}
                }

                --local left_text = {n=G.UIT.R, config={id = 'cash_out_button', align = "cm", padding = 0.1, minw = 2, r = 0.15, colour = G.C.ORANGE, shadow = true, hover = true, one_press = true, button = 'cash_out', focus_args = {snap_to = true}}, nodes={
                --    {n=G.UIT.T, config={text = localize('b_cash_out')..": ", scale = 1, colour = G.C.UI.TEXT_LIGHT, shadow = true}},
                --    {n=G.UIT.T, config={text = localize('$')..format_ui_value(config.dollars), scale = 1.3*scale, colour = G.C.WHITE, shadow = true, juice = true}}
                --}}
                --G.round_eval:add_child(left_text,G.round_eval:get_UIE_by_ID('eval_bottom'))

                G.GAME.current_round.dollars = config.dollars
                
                play_sound('coin6', config.pitch or 1)
                G.VIBRATION = G.VIBRATION + 1
                return true
            end
        }))
    end
end
SMODS.Joker:take_ownership('cry_oil_lamp',
{
    rarity = "cry_epic"
},
true)

--local xhips = card.ability.x_chips

SMODS.Joker:take_ownership('cry_circus',
{
    config = {
		extra = { Xmult = 1 },
		immutable = {
			rare_mult_mod = 2,
			epic_mult_mod = 3,
			legend_mult_mod = 4,
			exotic_mult_mod = 20,
            entropic_mult_mod = 50,
			rarity_map = {
				[3] = "rare_mult_mod",
				[4] = "legend_mult_mod",
				["cry_epic"] = "epic_mult_mod",
				["cry_exotic"] = "exotic_mult_mod",
                ["entr_hyper_exotic"] = "entropic_mult_mod"
			},
		},
	},
    calculate = function(self, card, context)
		local function calculate_xmult(mult_mod)
			if not Talisman.config_file.disable_anims then
				G.E_MANAGER:add_event(Event({
					func = function()
						context.other_joker:juice_up(0.5, 0.5)
						return true
					end,
				}))
			end

			local xmult = lenient_bignum(math.max(1, to_big(card.ability.extra.Xmult)) * to_big(mult_mod))
			return {
				message = localize({
					type = "variable",
					key = "a_xmult",
					vars = { number_format(xmult) },
				}),
				Xmult_mod = xmult,
			}
		end

		if context.other_joker and card ~= context.other_joker then
			local mod_key = card.ability.immutable.rarity_map[context.other_joker.config.center.rarity]
			if mod_key then
				return calculate_xmult(card.ability.immutable[mod_key])
			end
		end
	end,
    loc_vars = function(self, info_queue, center)
		return {
			vars = {
				number_format(math.max(1, center.ability.extra.Xmult) * center.ability.immutable.rare_mult_mod),
				number_format(math.max(1, center.ability.extra.Xmult) * center.ability.immutable.epic_mult_mod),
				number_format(math.max(1, center.ability.extra.Xmult) * center.ability.immutable.legend_mult_mod),
				number_format(math.max(1, center.ability.extra.Xmult) * center.ability.immutable.exotic_mult_mod),
                number_format(math.max(1, center.ability.extra.Xmult) * center.ability.immutable.entropic_mult_mod),
			},
		}
	end,
},
true)

local set_editionref = Card.set_edition

function Card:set_edition(edition, immediate, silent)
    local xchips = to_big(self.ability.x_chips):to_number()
    set_editionref(self, edition, immediate, silent)
    if edition and (edition == "e_cry_glitched" or edition.cry_glitched) and math.abs(xchips - 1) < 0.01 then
        self.ability.x_chips = 1
        self.ability.h_x_chips = 1
    end
end

local load_ref = Blind.load
function Blind:load(blindTable)
    if blindTable then
        load_ref(self, blindTable)
    end 
end

function SMODS.find_card(key, count_debuffed)
    local results = {}
    if not G.jokers or not G.jokers.cards then return {} end
    for _, area in ipairs(SMODS.get_card_areas('jokers')) do
        if area and area.cards then
            for _, v in pairs(area.cards) do
                if v and type(v) == 'table' and v.config.center.key == key and (count_debuffed or not v.debuff) then
                    table.insert(results, v)
                end
            end
        end
    end
    return results
end

create_UIBox_your_collection_seals = function()
    return SMODS.card_collection_UIBox(G.P_CENTER_POOLS.Seal, {6,6}, {
        snap_back = true,
        infotip = localize('ml_edition_seal_enhancement_explanation'),
        hide_single_page = true,
        collapse_single_page = true,
        center = 'c_base',
        h_mod = 1.03,
        modify_card = function(card, center)
           card:set_seal(center.key, true)
        end,
    })
end


SMODS.calculate_individual_effect = function(effect, scored_card, key, amount, from_edition)
    if (key == 'chips' or key == 'h_chips' or key == 'chip_mod') and amount then
        if effect.card and effect.card ~= scored_card then juice_card(effect.card) end
        hand_chips = mod_chips(hand_chips + amount)
        update_hand_text({delay = 0}, {chips = hand_chips, mult = mult})
        if not effect.remove_default_message then
            if from_edition then
                card_eval_status_text(scored_card, 'jokers', nil, percent, nil, {message = localize{type = 'variable', key = amount > 0 and 'a_chips' or 'a_chips_minus', vars = {amount}}, chip_mod = amount, colour = G.C.EDITION, edition = true})
            else
                if key ~= 'chip_mod' then
                    if effect.chip_message then
                        card_eval_status_text(effect.message_card or effect.juice_card or scored_card or effect.card or effect.focus, 'extra', nil, percent, nil, effect.chip_message)
                    else
                        card_eval_status_text(effect.message_card or effect.juice_card or scored_card or effect.card or effect.focus, 'chips', amount, percent)
                    end
                end
            end
        end
        return true
    end

    if (key == 'mult' or key == 'h_mult' or key == 'mult_mod') and amount then
        if effect.card and effect.card ~= scored_card then juice_card(effect.card) end
        mult = mod_mult(mult + amount)
        update_hand_text({delay = 0}, {chips = hand_chips, mult = mult})
        if not effect.remove_default_message then
            if from_edition then
                card_eval_status_text(scored_card, 'jokers', nil, percent, nil, {message = localize{type = 'variable', key = amount > 0 and 'a_mult' or 'a_mult_minus', vars = {amount}}, mult_mod = amount, colour = G.C.DARK_EDITION, edition = true})
            else
                if key ~= 'mult_mod' then
                    if effect.mult_message then
                        card_eval_status_text(effect.message_card or effect.juice_card or scored_card or effect.card or effect.focus, 'extra', nil, percent, nil, effect.mult_message)
                    else
                        card_eval_status_text(effect.message_card or effect.juice_card or scored_card or effect.card or effect.focus, 'mult', amount, percent)
                    end
                end
            end
        end
        return true
    end

    if (key == 'p_dollars' or key == 'dollars' or key == 'h_dollars') and amount then
        if effect.card and effect.card ~= scored_card then juice_card(effect.card) end
        ease_dollars(amount)
        if not effect.remove_default_message then
            if effect.dollar_message then
                card_eval_status_text(effect.message_card or effect.juice_card or scored_card or effect.card or effect.focus, 'extra', nil, percent, nil, effect.dollar_message)
            else
                card_eval_status_text(effect.message_card or effect.juice_card or scored_card or effect.card or effect.focus, 'dollars', amount, percent)
            end
        end
        return true
    end

    if (key == 'x_chips' or key == 'xchips' or key == 'Xchip_mod') and amount ~= 1 then
        if effect.card and effect.card ~= scored_card then juice_card(effect.card) end
        hand_chips = mod_chips(hand_chips * amount)
        update_hand_text({delay = 0}, {chips = hand_chips, mult = mult})
        if not effect.remove_default_message then
            if from_edition then
                card_eval_status_text(scored_card, 'jokers', nil, percent, nil, {message = localize{type='variable',key= to_big(amount) > to_big(0) and 'a_xchips' or 'a_xchips_minus',vars={amount}}, Xchips_mod =  amount, colour =  G.C.EDITION, edition = true})
            else
                if key ~= 'Xchip_mod' then
                    if effect.xchip_message then
                        card_eval_status_text(effect.message_card or effect.juice_card or scored_card or effect.card or effect.focus, 'extra', nil, percent, nil, effect.xchip_message)
                    else
                        card_eval_status_text(effect.message_card or effect.juice_card or scored_card or effect.card or effect.focus, 'x_chips', amount, percent)
                    end
                end
            end
        end
        return true
    end

    if (key == 'x_mult' or key == 'xmult' or key == 'Xmult' or key == 'x_mult_mod' or key == 'Xmult_mod') and amount ~= 1 then
        if effect.card and effect.card ~= scored_card then juice_card(effect.card) end
        mult = mod_mult(mult * amount)
        update_hand_text({delay = 0}, {chips = hand_chips, mult = mult})
        if not effect.remove_default_message then
            if from_edition then
                card_eval_status_text(scored_card, 'jokers', nil, percent, nil, {message = localize{type='variable',key= to_big(amount) > to_big(0) and 'a_xmult' or 'a_xmult_minus',vars={amount}}, Xmult_mod =  amount, colour =  G.C.EDITION, edition = true})
            else
                if key ~= 'Xmult_mod' then
                    if effect.xmult_message then
                        card_eval_status_text(effect.message_card or effect.juice_card or scored_card or effect.card or effect.focus, 'extra', nil, percent, nil, effect.xmult_message)
                    else
                        card_eval_status_text(effect.message_card or effect.juice_card or scored_card or effect.card or effect.focus, 'x_mult', amount, percent)
                    end
                end
            end
        end
        return true
    end

    if key == 'message' then
        if effect.card and effect.card ~= scored_card then juice_card(effect.card) end
        card_eval_status_text(effect.message_card or effect.juice_card or scored_card or effect.card or effect.focus, 'extra', nil, percent, nil, effect)
        return true
    end

    if key == 'func' then
        effect.func()
        return true
    end

    if key == 'swap' then
        if effect.card and effect.card ~= scored_card then juice_card(effect.card) end
        local old_mult = mult
        mult = mod_mult(hand_chips)
        hand_chips = mod_chips(old_mult)
        update_hand_text({delay = 0}, {chips = hand_chips, mult = mult})
        return true
    end

    if key == 'level_up' then
        if effect.card and effect.card ~= scored_card then juice_card(effect.card) end
        local hand_type = effect.level_up_hand or G.GAME.last_hand_played
        level_up_hand(scored_card, hand_type, effect.instant, type(amount) == 'number' and amount or 1)
        return true
    end

    if key == 'extra' then
        return SMODS.calculate_effect(amount, scored_card)
    end

    if key == 'saved' then
        SMODS.saved = amount
        return true
    end

    if key == 'effect' then
        return true
    end
    
    if key == 'remove' or key == 'prevent_debuff' or key == 'add_to_hand' or key == 'remove_from_hand' or key == 'stay_flipped' or key == 'prevent_stay_flipped' then
        return key
    end

    if key == 'debuff' then
        return { [key] = amount, debuff_source = scored_card }
    end

    if key == 'debuff_text' then 
        return { [key] = amount }
    end
    
end

local scie = SMODS.calculate_individual_effect
function SMODS.calculate_individual_effect(effect, scored_card, key, amount, from_edition)
  -- For some reason, some keys' animations are completely removed
  -- I think this is caused by a lovely patch conflict
  --if key == 'chip_mod' then key = 'chips' end
  --if key == 'mult_mod' then key = 'mult' end
  --if key == 'Xmult_mod' then key = 'x_mult' end
  local ret = scie(effect, scored_card, key, amount, from_edition)
  if ret then
    return ret
  end
  if not smods_xchips and (key == 'x_chips' or key == 'xchips' or key == 'Xchip_mod') and amount ~= 1 then 
    if effect.card then juice_card(effect.card) end
    hand_chips = mod_chips(hand_chips * amount)
    update_hand_text({delay = 0}, {chips = hand_chips, mult = mult})
    if not effect.remove_default_message then
        if from_edition then
            card_eval_status_text(scored_card, 'jokers', nil, percent, nil, {message = "X"..amount, colour =  G.C.EDITION, edition = true})
        elseif key ~= 'Xchip_mod' then
            if effect.xchip_message then
                card_eval_status_text(scored_card or effect.card or effect.focus, 'extra', nil, percent, nil, effect.xchip_message)
            else
                card_eval_status_text(scored_card or effect.card or effect.focus, 'x_chips', amount, percent)
            end
        end
    end
    return true
  end

  if (key == 'e_chips' or key == 'echips' or key == 'Echip_mod') and amount ~= 1 then 
    if effect.card then juice_card(effect.card) end
    hand_chips = mod_chips(hand_chips ^ amount)
    update_hand_text({delay = 0}, {chips = hand_chips, mult = mult})
    if not effect.remove_default_message then
        if from_edition then
            card_eval_status_text(scored_card, 'jokers', nil, percent, nil, {message = "^"..amount, colour =  G.C.EDITION, edition = true})
        elseif key ~= 'Echip_mod' then
            if effect.echip_message then
                card_eval_status_text(scored_card or effect.card or effect.focus, 'extra', nil, percent, nil, effect.echip_message)
            else
                card_eval_status_text(scored_card or effect.card or effect.focus, 'e_chips', amount, percent)
            end
        end
    end
    return true
  end

  if (key == 'ee_chips' or key == 'eechips' or key == 'EEchip_mod') and amount ~= 1 then 
    if effect.card then juice_card(effect.card) end
    hand_chips = mod_chips(hand_chips:arrow(2, amount))
    update_hand_text({delay = 0}, {chips = hand_chips, mult = mult})
    if not effect.remove_default_message then
        if from_edition then
            card_eval_status_text(scored_card, 'jokers', nil, percent, nil, {message = "^^"..amount, colour =  G.C.EDITION, edition = true})
        elseif key ~= 'EEchip_mod' then
            if effect.eechip_message then
                card_eval_status_text(scored_card or effect.card or effect.focus, 'extra', nil, percent, nil, effect.eechip_message)
            else
                card_eval_status_text(scored_card or effect.card or effect.focus, 'ee_chips', amount, percent)
            end
        end
    end
    return true
  end

  if (key == 'eee_chips' or key == 'eeechips' or key == 'EEEchip_mod') and amount ~= 1 then 
    if effect.card then juice_card(effect.card) end
    hand_chips = mod_chips(hand_chips:arrow(3, amount))
    update_hand_text({delay = 0}, {chips = hand_chips, mult = mult})
    if not effect.remove_default_message then
        if from_edition then
            card_eval_status_text(scored_card, 'jokers', nil, percent, nil, {message = "^^^"..amount, colour =  G.C.EDITION, edition = true})
        elseif key ~= 'EEEchip_mod' then
            if effect.eeechip_message then
                card_eval_status_text(scored_card or effect.card or effect.focus, 'extra', nil, percent, nil, effect.eeechip_message)
            else
                card_eval_status_text(scored_card or effect.card or effect.focus, 'eee_chips', amount, percent)
            end
        end
    end
    return true
  end

  if (key == 'hyper_chips' or key == 'hyperchips' or key == 'hyperchip_mod') and type(amount) == 'table' then 
    if effect.card then juice_card(effect.card) end
    hand_chips = mod_chips(hand_chips:arrow(amount[1], amount[2]))
    update_hand_text({delay = 0}, {chips = hand_chips, mult = mult})
    if not effect.remove_default_message then
        if from_edition then
            card_eval_status_text(scored_card, 'jokers', nil, percent, nil, {message = (amount[1] > 5 and ('{' .. amount[1] .. '}') or string.rep('^', amount[1])) .. amount[2], colour =  G.C.EDITION, edition = true})
        elseif key ~= 'hyperchip_mod' then
            if effect.hyperchip_message then
                card_eval_status_text(scored_card or effect.card or effect.focus, 'extra', nil, percent, nil, effect.hyperchip_message)
            else
                card_eval_status_text(scored_card or effect.card or effect.focus, 'hyper_chips', amount, percent)
            end
        end
    end
    return true
  end

  if (key == 'e_mult' or key == 'emult' or key == 'Emult_mod') and amount ~= 1 then 
    if effect.card then juice_card(effect.card) end
    mult = mod_mult(mult ^ amount)
    update_hand_text({delay = 0}, {chips = hand_chips, mult = mult})
    if not effect.remove_default_message then
        if from_edition then
            card_eval_status_text(scored_card, 'jokers', nil, percent, nil, {message = "^"..amount.." Mult", colour =  G.C.EDITION, edition = true})
        elseif key ~= 'Emult_mod' then
            if effect.emult_message then
                card_eval_status_text(scored_card or effect.card or effect.focus, 'extra', nil, percent, nil, effect.emult_message)
            else
                card_eval_status_text(scored_card or effect.card or effect.focus, 'e_mult', amount, percent)
            end
        end
    end
    return true
  end

  if (key == 'ee_mult' or key == 'eemult' or key == 'EEmult_mod') and amount ~= 1 then 
    if effect.card then juice_card(effect.card) end
    mult = mod_mult(mult:arrow(2, amount))
    update_hand_text({delay = 0}, {chips = hand_chips, mult = mult})
    if not effect.remove_default_message then
        if from_edition then
            card_eval_status_text(scored_card, 'jokers', nil, percent, nil, {message = "^^"..amount.." Mult", colour =  G.C.EDITION, edition = true})
        elseif key ~= 'EEmult_mod' then
            if effect.eemult_message then
                card_eval_status_text(scored_card or effect.card or effect.focus, 'extra', nil, percent, nil, effect.eemult_message)
            else
                card_eval_status_text(scored_card or effect.card or effect.focus, 'ee_mult', amount, percent)
            end
        end
    end
    return true
  end

  if (key == 'eee_mult' or key == 'eeemult' or key == 'EEEmult_mod') and amount ~= 1 then 
    if effect.card then juice_card(effect.card) end
    mult = mod_mult(mult:arrow(3, amount))
    update_hand_text({delay = 0}, {chips = hand_chips, mult = mult})
    if not effect.remove_default_message then
        if from_edition then
            card_eval_status_text(scored_card, 'jokers', nil, percent, nil, {message = "^^^"..amount.." Mult", colour =  G.C.EDITION, edition = true})
        elseif key ~= 'EEEmult_mod' then
            if effect.eeemult_message then
                card_eval_status_text(scored_card or effect.card or effect.focus, 'extra', nil, percent, nil, effect.eeemult_message)
            else
                card_eval_status_text(scored_card or effect.card or effect.focus, 'eee_mult', amount, percent)
            end
        end
    end
    return true
  end

  if (key == 'hyper_mult' or key == 'hypermult' or key == 'hypermult_mod') and type(amount) == 'table' then 
    if effect.card then juice_card(effect.card) end
    mult = mod_mult(mult:arrow(amount[1], amount[2]))
    update_hand_text({delay = 0}, {chips = hand_chips, mult = mult})
    if not effect.remove_default_message then
        if from_edition then
            card_eval_status_text(scored_card, 'jokers', nil, percent, nil, {message = ((amount[1] > 5 and ('{' .. amount[1] .. '}') or string.rep('^', amount[1])) .. amount[2]).." Mult", colour =  G.C.EDITION, edition = true})
        elseif key ~= 'hypermult_mod' then
            if effect.hypermult_message then
                card_eval_status_text(scored_card or effect.card or effect.focus, 'extra', nil, percent, nil, effect.hypermult_message)
            else
                card_eval_status_text(scored_card or effect.card or effect.focus, 'hyper_mult', amount, percent)
            end
        end
    end
    return true
  end
end


G.FUNCS.hand_chip_UI_set = function(e)
    local new_chip_text = number_format(G.GAME.current_round.current_hand.chips)
      if new_chip_text ~= G.GAME.current_round.current_hand.chip_text then 
        G.GAME.current_round.current_hand.chip_text = new_chip_text
        e.config.object.scale = scale_number(G.GAME.current_round.current_hand.chips, 0.9, 1000)
        if string.len(new_chip_text) > 6 then
            e.config.object.scale = 0.9 / (string.len(new_chip_text)/6)
          end
        e.config.object:update_text()
        if not G.TAROT_INTERRUPT_PULSE then G.FUNCS.text_super_juice(e, math.max(0,math.floor(math.log10(type(G.GAME.current_round.current_hand.chips) == 'number' and G.GAME.current_round.current_hand.chips or 1)))) end
      end
  end
  


G.FUNCS.hand_mult_UI_set = function(e)
    local new_mult_text = number_format(G.GAME.current_round.current_hand.mult)
    if new_mult_text ~= G.GAME.current_round.current_hand.mult_text then 
      G.GAME.current_round.current_hand.mult_text = new_mult_text
      e.config.object.scale = scale_number(G.GAME.current_round.current_hand.mult, 0.9, 1000)
      if string.len(new_mult_text) > 6 then
        e.config.object.scale = 0.9 / (string.len(new_mult_text)/6)
      end
      e.config.object:update_text()
      if not G.TAROT_INTERRUPT_PULSE then G.FUNCS.text_super_juice(e, math.max(0,math.floor(math.log10(type(G.GAME.current_round.current_hand.mult) == 'number' and G.GAME.current_round.current_hand.mult or 1)))) end
    end
  end


  function Cryptid.calculate_misprint(initial, min, max, grow_type, pow_level)
	local big_initial = (type(initial) ~= "table" and to_big(initial)) or initial
	local big_min = (type(min) ~= "table" and to_big(min)) or min
	local big_max = (type(max) ~= "table" and to_big(max)) or max

	local grow = Cryptid.log_random(pseudoseed("cry_misprint" .. G.GAME.round_resets.ante), big_min, big_max)

	local calc = big_initial
	if not grow_type then
		calc = calc * grow
	elseif grow_type == "+" then
		if to_big(math.abs(initial)) > to_big(0.00001) then calc = calc + grow end
	elseif grow_type == "-" then
		calc = calc - grow
	elseif grow_type == "/" then
		calc = calc / grow
	elseif grow_type == "^" then
		pow_level = pow_level or 1
		if pow_level == 1 then
			calc = calc ^ grow
		else
			local function hyper(level, base, height)
				local big_base = (type(base) ~= "table" and to_big(base)) or base
				local big_height = (type(height) ~= "table" and to_big(height)) or height

				if height == 1 then
					return big_base
				elseif level == 1 then
					return big_base ^ big_height
				else
					local inner = hyper(level, base, height - 1)
					return hyper(level - 1, base, inner)
				end
			end

			calc = hyper(pow_level, calc, grow)
		end
	end

	if calc > to_big(-1e100) and calc < to_big(1e100) then
		calc = to_number(calc)
	end

	return calc
end


cry_error_operators = { "+", "-", "X", "/", "^", "=", ">", "<", "m", "^^", "^^^", "{0.5}", "pi", "v", "f(x)=x^", "cos " }
cry_error_numbers[#cry_error_numbers+1]="e6#66"
cry_error_numbers[#cry_error_numbers+1]="-0"
cry_error_numbers[#cry_error_numbers+1]="i"
cry_error_numbers[#cry_error_numbers+1]="2-2i"
cry_error_numbers[#cry_error_numbers+1]="2012"
cry_error_numbers[#cry_error_numbers+1]="6up"
cry_error_numbers[#cry_error_numbers+1]="One Sixbillionth"
cry_error_numbers[#cry_error_numbers+1]="0.9999..."
cry_error_numbers[#cry_error_numbers+1]="1/0"
cry_error_numbers[#cry_error_numbers+1]="Infinity"
cry_error_numbers[#cry_error_numbers+1]="naneinf"
cry_error_numbers[#cry_error_numbers+1]="413"
cry_error_msgs[#cry_error_msgs+1]={ string = "Entropy", colour = G.C.RARITY["entr_hyper_exotic"] }
cry_error_msgs[#cry_error_msgs+1]={ string = "Puppies", colour = G.C.RED }
cry_error_msgs[#cry_error_msgs+1]={ string = "Ascension Power", colour = G.C.GOLD }
cry_error_msgs[#cry_error_msgs+1]={ string = "Heart Containers", colour = G.C.RED }
cry_error_msgs[#cry_error_msgs+1]={ string = "Build Grist", colour = G.C.BLUE }
cry_error_msgs[#cry_error_msgs+1]={ string = "Moral Chemicals", colour = G.C.BLUE }
cry_error_msgs[#cry_error_msgs+1]={ string = "Inversions", colour =  G.C.RARITY["entr_reverse_legendary"] }

--im not happy about having to do it like this
local ref = Cryptid.misprintize
function Cryptid.misprintize(card, override, force_reset, stack, grow_type, pow_level)
    if G.jokers then
        local limit = G.jokers.config.card_limit
        ref(card,override,force_reset,stack,grow_type,pow_level)
        if card.edition and card.edition.negative and card.area == G.jokers then
            G.jokers.config.card_limit = G.jokers.config.card_limit + 1
        end
    else
        ref(card,override,force_reset,stack,grow_type,pow_level)
    end
end