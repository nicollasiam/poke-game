require_relative 'attack'
require_relative 'relations'

require 'pry'

class Pokemon
  attr_reader :name, :attacks, :current_hp, :type, :def, :hp, :spd, :atk, :image_front, :image_back

  def initialize(name, type)
    @name = name
    @type = type
    @attacks = sort_attacks(type) # Array
    @hp = 100
    @current_hp = @hp
    @atk = 100
    @def = 100
    @spd = 100
    @level = 100

    @image_front = "media/#{@name.downcase}-front.png"
    @image_back = "media/#{@name.downcase}-back.png"
  end

  def sort_attacks(type)
    @attacks = []
    loop do
      attack = ATTACKS[type.downcase.to_sym].sample
      @attacks << attack unless @attacks.include?(attack)

      break if @attacks.length == 4
    end
    attacks.sort_by { |attack| attack[:power] }
  end

  def attack(atk, defender_defense_stat)
    if (rand.round(2) * 10) < atk[:accuracy] # Acertou
      # Damage calculation formula in https://bulbapedia.bulbagarden.net/wiki/Damage
      # NO STAB INCLUDED
      damage = (((42 * atk[:power] * (@atk.to_f / defender_defense_stat)) / 50) + 2).round(2)
    else # Errou, retorna 0
      damage = 0
    end

    damage
  end

  def defend(atk, damage)
    effectiveness = 0
    if RELATIONS[atk[:type].to_sym][:relations][:high].include?(@type.downcase)
      effectiveness = 1
      @current_hp -= damage * 2
    elsif RELATIONS[atk[:type].to_sym][:relations][:low].include?(@typedowncase)
      effectiveness = -1
      @current_hp -= damage / 2
    elsif RELATIONS[atk[:type].to_sym][:relations][:none].include?(@typedowncase)
      effectiveness = -2
    else
      @current_hp -= damage
    end

    effectiveness
  end

  def reduce_pp(attack_index)
    @attacks[attack_index][:PP] -= 1
  end

  def has_pp_left(attack_index)
    @attacks[attack_index][:PP] > 0
  end
end
