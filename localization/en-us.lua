return {
    descriptions = {
        Mod = {
            PerkeoPlus = {
                name = "Perkeo+",
                text = {
                    "Adds a brand new and cooler",
                    "{X:dark_edition,C:white,E:2,s:1.5}Perkeo{}",
                },
            },
        },

        ---@type { [string]: { name: string | string[], text: string[] | string[][] } }
        Joker = {
            j_pkpl_perkeo = {
                name = "Perkeo+",
                text = {
                    "Creates a {C:dark_edition}Negative{} copy of",
                    "{C:attention}#1#{} random {C:attention}#2#{}",
                    "card in your possession",
                    "at the end of the {C:attention}shop",
                    "{C:inactive,s:0.8}(Max 8 cards created at once){}",
                },
            },

            j_pkpl_perkeo_info = {
                name = "Perkeo+",
                text = {
                    "Creates a {C:dark_edition}Negative{} copy of",
                    "{C:attention}1{} random {C:attention}Joker{}",
                    "card in your possession",
                    "at the end of the {C:attention}shop",
                    "{C:inactive,s:0.8}(Max 8 cards created at once){}",
                },
            },
        },

        ---@type { [string]: { name: string | string[], text: string[] | string[][] } }
        Spectral = {
            c_pkpl_perkeo_food = {
                name = "PerkeoFood",
                text = {
                    { "Feed your {C:attention}Perkeo+{}" },
                    { "Increase all {C:attention}Perkeo+{}s card creation amount", "by {C:green}fixed{} {C:attention}1{}" },
                },
            },
        },

        Back = {
            b_pkpl_perkeo_deck = {
                name = "Perkeo's Deck",
                text = {
                    "Start with a {C:attention}Perkeo+{}",
                    "and {C:attention}2{} {C:dark_edition}Negative{} {C:attention}PerkeoFood{}",
                },
            },
        },
    },
}
