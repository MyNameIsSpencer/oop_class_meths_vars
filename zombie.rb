puts '-' * 20
puts '-' * 20

class Zombie

  @@horde = []
  @@plague_level = 100
  @@max_speed = 10
  @@max_strength = 10
  @@default_speed = 3
  @@default_strength = 4

  def initialize(speed, strength)
    if speed < @@max_speed
      @speed = speed
    else
      @speed = @@default_speed
    end
    if strength < @@max_strength
      @strength = strength
    else
      strength = @@default_strength
    end
  end



  def reader_max_speed
    return @@max_speed
  end

  def reader_max_strength
    return @@max_strength
  end

  def self.all
    return @@horde
  end

  def self.plaguer
    return @@plague_level
  end

  def self.spawn
    rando_zombies = rand(@@plague_level)
    (1..rando_zombies).each do
      speed = rand(1..@@max_speed)
      strength = rand(1..@@max_strength)
      @@horde << Zombie.new(speed, strength)

    end
  end

  def self.some_die_off
    @@horde.shift(rand(25))
  end

  def self.increase_plague_level
    @@plague_level += (rand(@@plague_level * 0.25))
  end

  def self.new_day
    Zombie.some_die_off
    Zombie.spawn
    Zombie.increase_plague_level
  end

  def outrun_zombie?
    player_speed = rand(@@max_speed)
    if player_speed > @speed
      return true
    else
      return false
    end
  end

  def survive_attack?
    player_strength = rand(@@max_strength)
    if player_strength > @strength
      return true
    else
      return false
    end
  end

  def encounter
    if survive_attack? == false
      return "You dead"
    else
      if outrun_zombie? == false
        return "You are now a zombie"
      else
        return "You got away, you're safe"
      end
    end
  end

end

Zombie.spawn
puts Zombie.all.count
Zombie.new_day
puts Zombie.all.count
puts Zombie.plaguer

puts "-" * 20

puts Zombie.all.count # []
Zombie.new_day
puts Zombie.all.count # [#<Zombie:0x005626ecc5ebd0 @speed=4, @strength=0>, #<Zombie:0x005626ecc5eba8 @speed=0, @strength=4>, #<Zombie:0x005626ecc5eb80 @speed=4, @strength=4>]
zombie1 = Zombie.all[0]
zombie2 = Zombie.all[1]
zombie3 = Zombie.all[2]
puts zombie1.encounter # You are now a zombie
puts zombie2.encounter # You died
puts zombie3.encounter # You died
Zombie.new_day
puts Zombie.all.count # [#<Zombie:0x005626ecc5e1f8 @speed=0, @strength=0>, #<Zombie:0x005626ecc5e180 @speed=3, @strength=3>, #<Zombie:0x005626ecc5e158 @speed=1, @strength=2>, #<Zombie:0x005626ecc5e090 @speed=0, @strength=4>]
zombie1 = Zombie.all[0]
zombie2 = Zombie.all[1]
zombie3 = Zombie.all[2]
puts zombie1.encounter # You got away
puts zombie2.encounter # You are now a zombie
puts zombie3.encounter # You died







puts '-' * 20
puts '-' * 20
