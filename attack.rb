ATTACKS =  # GRASS TYPE MOVES
            { grass:    [ { name: 'Razor Leaf', power: 60, PP: 15, accuracy: 10, type: 'grass' },
                          { name: 'Vine Whip', power: 80, PP: 10, accuracy: 9.5, type: 'grass' },
                          { name: 'Petal Dance', power: 100, PP: 8, accuracy: 8, type: 'grass' },
                          { name: 'Solar Beam', power: 150, PP: 5, accuracy: 5, type: 'grass' } ],
            # FIRE TIME MOVES
              fire:     [ { name: 'Ember', power: 60, PP: 15, accuracy: 10, type: 'fire' },
                          { name: 'FlameThrower', power: 80, PP: 10, accuracy: 9.5, type: 'fire' },
                          { name: 'Flame Wheel', power: 100, PP: 8, accuracy: 8, type: 'fire' },
                          { name: 'Fire Blast', power: 150, PP: 5, accuracy: 5, type: 'fire' } ],
            # ELECTRIC TYPE MOVES
              electric: [ { name: 'Thunder Shock', power: 60, PP: 15, accuracy: 10, type: 'electric' },
                          { name: 'Thunder Bolt', power: 80, PP: 10, accuracy: 9.5, type: 'electric' },
                          { name: 'Thunder Punch', power: 100, PP: 8, accuracy: 8, type: 'electric' },
                          { name: 'Thunder', power: 150, PP: 5, accuracy: 5, type: 'electric' } ],
            # WATER TYPE MOVES
              water:    [ { name: 'Bubbles', power: 60, PP: 15, accuracy: 10, type: 'water' },
                          { name: 'Aqua Tail', power: 80, PP: 10, accuracy: 9.5, type: 'water' },
                          { name: 'Water Gun', power: 100, PP: 8, accuracy: 8, type: 'water' },
                          { name: 'Hydropump', power: 150, PP: 5, accuracy: 5, type: 'water' } ],
            # GROUND TYPE MOVES
              ground:   [ { name: 'Mud Slap', power: 60, PP: 15, accuracy: 10, type: 'ground' },
                          { name: 'Bulldoze', power: 80, PP: 10, accuracy: 9.5, type: 'ground' },
                          { name: 'Earthquake', power: 100, PP: 8, accuracy: 8, type: 'ground' },
                          { name: 'Fissure', power: 150, PP: 5, accuracy: 5, type: 'ground' } ],
            # FLYING TYPE MOVES
              flying:   [ { name: 'Gust', power: 60, PP: 15, accuracy: 10, type: 'flying' },
                          { name: 'Air Cutter', power: 80, PP: 10, accuracy: 9.5, type: 'flying' },
                          { name: 'Fly', power: 100, PP: 8, accuracy: 8, type: 'flying' },
                          { name: 'Sky Attack', power: 150, PP: 5, accuracy: 5, type: 'flying' } ],
            # BUG TYPE MOVES
              bug:   [ { name: 'Bug Bite', power: 60, PP: 15, accuracy: 10, type: 'bug' },
                          { name: 'U-Turn', power: 80, PP: 10, accuracy: 9.5, type: 'bug' },
                          { name: 'Bug Buzz', power: 100, PP: 8, accuracy: 8, type: 'bug' },
                          { name: 'Mega Horn', power: 150, PP: 5, accuracy: 5, type: 'bug' } ],
            # NORMAL TYPE MOVES
              normal:   [ { name: 'Stomp', power: 60, PP: 15, accuracy: 10, type: 'normal' },
                          { name: 'Mega Punch', power: 80, PP: 10, accuracy: 9.5, type: 'normal' },
                          { name: 'Take Down', power: 100, PP: 8, accuracy: 8, type: 'normal' },
                          { name: 'Hyper Beam', power: 150, PP: 5, accuracy: 5, type: 'normal' } ],
            # POISON TYPE MOVES
              poison:   [ { name: 'Poison Fang', power: 60, PP: 15, accuracy: 10, type: 'poison' },
                          { name: 'Poison Jab', power: 80, PP: 10, accuracy: 9.5, type: 'poison' },
                          { name: 'Gunk Shot', power: 100, PP: 8, accuracy: 8, type: 'poison' },
                          { name: 'Sludge Bomb', power: 150, PP: 5, accuracy: 5, type: 'poison' } ],
            # FIGHTING TYPE MOVES
              fighting: [ { name: 'Karate Chop', power: 60, PP: 15, accuracy: 10, type: 'fighting' },
                          { name: 'Submission', power: 80, PP: 10, accuracy: 9.5, type: 'fighting' },
                          { name: 'Cross Chop', power: 100, PP: 8, accuracy: 8, type: 'fighting' },
                          { name: 'Focus Punch', power: 150, PP: 5, accuracy: 5, type: 'fighting' } ],
            # FIGHTING TYPE MOVES
              psychic:  [ { name: 'Confusion', power: 60, PP: 15, accuracy: 10, type: 'psychic' },
                          { name: 'Extrasensory', power: 80, PP: 10, accuracy: 9.5, type: 'psychic' },
                          { name: 'Psychic', power: 100, PP: 8, accuracy: 8, type: 'psychic' },
                          { name: 'Prismatic Laser', power: 150, PP: 5, accuracy: 5, type: 'psychic' } ],
            # ROCK TYPE MOVES
              rock:     [ { name: 'Rock Throw', power: 60, PP: 15, accuracy: 10, type: 'rock' },
                          { name: 'Rock Slide', power: 80, PP: 10, accuracy: 9.5, type: 'rock' },
                          { name: 'Stone Edge', power: 100, PP: 8, accuracy: 8, type: 'rock' },
                          { name: 'Head Smash', power: 150, PP: 5, accuracy: 5, type: 'rock' } ],
            # ICE TYPE MOVES
              ice:      [ { name: 'Ice Shard', power: 60, PP: 15, accuracy: 10, type: 'ice' },
                          { name: 'Ice Punch', power: 80, PP: 10, accuracy: 9.5, type: 'ice' },
                          { name: 'Ice Beam', power: 100, PP: 8, accuracy: 8, type: 'ice' },
                          { name: 'Blizzard', power: 150, PP: 5, accuracy: 5, type: 'ice' } ],
            # GHOST TYPE MOVES
              ghost:    [ { name: 'Lick', power: 60, PP: 15, accuracy: 10, type: 'ghost' },
                          { name: 'Shadow Punch', power: 80, PP: 10, accuracy: 9.5, type: 'ghost' },
                          { name: 'Phantom Force', power: 100, PP: 8, accuracy: 8, type: 'ghost' },
                          { name: 'Shadow Force', power: 150, PP: 5, accuracy: 5, type: 'ghost' } ],
            # GHOST TYPE MOVES
              dragon:   [ { name: 'Twiter', power: 60, PP: 15, accuracy: 10, type: 'dragon' },
                          { name: 'Dragon Claw', power: 80, PP: 10, accuracy: 9.5, type: 'dragon' },
                          { name: 'Dragon Hammer', power: 100, PP: 8, accuracy: 8, type: 'dragon' },
                          { name: 'Outrage', power: 150, PP: 5, accuracy: 5, type: 'dragon' } ] }
