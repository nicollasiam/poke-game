RELATIONS = { grass:    { relations:  { high: ['ground', 'rock', 'water'],
                                        low:  ['dragon', 'fire', 'bug', 'flying', 'grass', 'poison'],
                                        none: [] } },

              fire:     { relations:  { high: ['bug', 'grass', 'ice'],
                                        low:  ['dragon', 'fire', 'rock', 'water'],
                                        none: [] } },

              electric: { relations:  { high: ['flying', 'water'],
                                        low:  ['dragon', 'electric', 'grass'],
                                        none: ['ground'] } },

              water:    { relations:  { high: ['fire', 'ground', 'rock'],
                                        low:  ['dragon', 'grass', 'water'],
                                        none: [] } },

              ground:   { relations:  { high: ['fire', 'electric', 'rock', 'poison'],
                                        low:  ['bug', 'grass'],
                                        none: ['flying'] } },

              flying:   { relations:  { high: ['bug', 'fighting', 'grass'],
                                        low:  ['electric', 'rock'],
                                        none: [] } },

              bug:      { relations:  { high: ['poison', 'psychic', 'grass'],
                                        low:  ['fighting', 'fire', 'flying', 'ghost'],
                                        none: [] } },

              normal:   { relations:  { high: [],
                                        low:  ['rock'],
                                        none: ['ghost'] } },

              poison:   { relations:  { high: ['bug', 'grass'],
                                        low:  ['poison', 'ground', 'rock', 'ghost'],
                                        none: [] } },

              fighting: { relations:  { high: ['normal', 'rock', 'ice'],
                                        low:  ['poison', 'flying', 'bug', 'psychic'],
                                        none: ['ghost'] } },

              psychic:  { relations:  { high: ['fighting', 'poison'],
                                        low:  ['psychic'],
                                        none: [] } },

              rock:     { relations:  { high: ['bug', 'fire', 'flying', 'ice'],
                                        low:  ['fighting', 'ground'],
                                        none: [] } },

              ice:      { relations:  { high: ['dragon', 'grass', 'flying', 'ground'],
                                        low:  ['ice', 'water'],
                                        none: [] } },

              ghost:    { relations:  { high: ['ghost'],
                                        low:  [],
                                        none: ['normal', 'psychic'] } },

              dragon:   { relations:  { high: ['dragon'],
                                        low:  [],
                                        none: [] } } }
