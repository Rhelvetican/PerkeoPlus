SMODS.Atlas({
    key  = "consumable",
    px   = 71,
    py   = 95,
    path = "consumable.png",
})

---@generic T
---@param tbl  T[]
---@param pred fun(item: T): boolean
---@return boolean
local function __ipairs_any(tbl, pred)
    for _, v in ipairs(tbl) do
        if pred(v) then
            return true
        end
    end

    return false
end

---@generic T
---@param tbl  T[]
---@param pred fun(item: T): boolean
---@return T[]
local function __ipairs_filter(tbl, pred)
    ---@type T[]
    local __tbl__ = {}

    for _, v in ipairs(tbl) do
        if pred(v) then
            table.insert(__tbl__, v)
        end
    end

    return __tbl__
end

SMODS.Joker({
    key = "perkeo",

    blueprint_compat = true,
    rarity           = 4,
    cost             = 20,

    pos      = { x = 7, y = 8 },
    soul_pos = { x = 7, y = 9 },

    config = { extra = { amount = 1 } },

    loc_vars = function(_, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.e_negative

        return { vars = { math.min(card.ability.extra.amount, 8), (math.min(card.ability.extra.amount, 8) == 1) and "Joker" or "Jokers" } }
    end,

    calculate = function(_, card, ctx)
        if ctx.ending_shop and __ipairs_any(G.jokers.cards, function(item) return item.config.center.key ~= "j_pkpl_perkeo" end) then
            local copied, _ = pseudorandom_element(__ipairs_filter(G.jokers.cards, function(item) return item.config.center.key ~= "j_pkpl_perkeo" end), G.SEED .. "_" .. G.TIMERS.REAL)
            if copied ~= nil then
                for _ = 1, math.min(card.ability.extra.amount, 8) do
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            local _c = SMODS.copy_card(copied)
                            _c:set_edition("e_negative", true)

                            return true
                        end,
                    }))
                end
            end
        end

        if ctx.using_consumeable then
            if ctx.consumeable.config.center.key == "c_pkpl_perkeo_food" then
                SMODS.scale_card(card, {
                    ref_table = card.ability.extra,
                    ref_value = "amount",
                    scalar_value = "inc",
                    scalar_table = { inc = 1 },
                })
            end

            if ctx.consumeable.config.center.key == "c_pkpl_perkeo_food" then
                while card.ability.extra.amount < 8 do
                    SMODS.scale_card(card, {
                        ref_table = card.ability.extra,
                        ref_value = "amount",
                        scalar_value = "inc",
                        scalar_table = { inc = 1 },
                    })
                end
            end
        end
    end,
})

SMODS.Consumable({
    key = "perkeo_food",
    set = "Spectral",
    atlas = "consumable",

    pos      = { x = 0, y = 0 },
    soul_pos = { x = 2, y = 0, extra = { x = 1, y = 0 } },

    can_use = function(_, _)
        return __ipairs_any(G.jokers.cards, function(item) return item.config.center.key == "j_pkpl_perkeo" end)
    end,

    loc_vars = function(_, info_queue, _)
        info_queue[#info_queue + 1] = { key = "j_pkpl_perkeo_info", set = "Joker" }
    end,
})

SMODS.Consumable({
    key = "perkeo_food_pro",
    set = "Spectral",
    atlas = "consumable",

    pos      = { x = 0, y = 0 },
    soul_pos = { x = 2, y = 0, extra = { x = 1, y = 0 } },

    can_use = function(_, _)
        return __ipairs_any(G.jokers.cards, function(item) return item.config.center.key == "j_pkpl_perkeo" end)
    end,

    loc_vars = function(_, info_queue, _)
        info_queue[#info_queue + 1] = { key = "j_pkpl_perkeo_info", set = "Joker" }
    end,
})

SMODS.Back({
    key = "perkeo_deck",
    pos = { x = 0, y = 0 },

    apply = function(self)
        G.E_MANAGER:add_event(Event({
            func = function()
                if G.jokers then
                    G.jokers:emplace(SMODS.create_card({
                        key  = "j_pkpl_perkeo",
                        area = G.jokers,
                    }))
                end

                if G.consumeables then
                    G.consumeables:emplace(SMODS.create_card({
                        key     = "c_pkpl_perkeo_food",
                        area    = G.consumeables,
                        edition = "e_negative",
                    }))

                    G.consumeables:emplace(SMODS.create_card({
                        key     = "c_pkpl_perkeo_food",
                        area    = G.consumeables,
                        edition = "e_negative",
                    }))
                end

                return (G.jokers ~= nil and G.consumeables ~= nil)
            end,
        }))
    end,
})
