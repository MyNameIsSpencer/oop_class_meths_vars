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
      strength = @@max_strength
    end
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


end

Zombie.spawn
puts Zombie.all.count
Zombie.new_day
puts Zombie.all.count
puts Zombie.plaguer






puts '-' * 20
puts '-' * 20
