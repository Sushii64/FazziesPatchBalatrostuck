function Balatrostuck.INIT.Jokers.j_yaldabaoth()
    SMODS.Joker{
        name = "Yaldabaoth",
        key = "yaldabaoth",
        config = {
            extra = {
                levels = 2,
            }
        },
        loc_txt = {
            ['name'] = 'Yaldabaoth',
            ['text'] = {
                '{C:attention}+#1#{} levels in',
                'current {C:aspect}Aspect'
            }
        },
        pos = {
            x = 0,
            y = 9
        },
        cost = 20,
        rarity = 4,
        blueprint_compat = true,
        eternal_compat = true,
        unlocked = true,
        atlas = 'HomestuckJokers',
        soul_pos = {
            x = 5,
            y = 9
        },
        in_pool = function(self,args)
            return G.GAME.slab
        end,

        add_to_deck = function(self, card, from_debuff)
            if G.GAME.slab then
                    local aspect = string.gsub(G.GAME.slab.key, "slab_bstuck_", "")
                    aspect = string.upper(aspect)
                    color = G.C[aspect]
                    local anspect = string.gsub(G.GAME.slab.key, "slab_bstuck_", "")
                    G.GAME.BALATROSTUCK.current_aspect = anspect
                    add_slab(Slab('slab_bstuck_' .. anspect),2)
                end
        end,

        calculate = function(self,card,context)
            if context.aspect_level then
                return {amount=card.ability.extra.levels}
            end
        end,

        remove_from_deck = function(self, card, from_debuff)
            if G.GAME.slab then
                    local aspect = string.gsub(G.GAME.slab.key, "slab_bstuck_", "")
                    aspect = string.upper(aspect)
                    color = G.C[aspect]
                    local anspect = string.gsub(G.GAME.slab.key, "slab_bstuck_", "")
                    G.GAME.BALATROSTUCK.current_aspect = anspect
                    add_slab(Slab('slab_bstuck_' .. anspect),-2)
                end
        end,

        loc_vars = function(self, info_queue, card)
            art_credit('akai', info_queue)
            return { vars = {card.ability.extra.levels}}
        end
    }
end