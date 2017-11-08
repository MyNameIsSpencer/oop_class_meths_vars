puts '-' * 20
puts '-' * 20

class Vampire

  @@coven = []

  def initialize(name, age)
    @name = name
    @age = age
    @in_coffin = false
    @drank_blood_today = false
  end

  def self.create(name, age)
    new_vampire = Vampire.new(name, age)
    @@coven << new_vampire
    return new_vampire
  end

  def self.reader_coven
    return @@coven
  end


  def reader_drank_blood
    return @drank_blood_today
  end

  def reader_in_coffin
    return @in_coffin
  end


  def self.sunrise

    @@coven.each do |v|
       p "0909090909090909090909909"
      # puts v.reader_drank_blood
      puts v.reader_in_coffin
      # p "0909090909090909090"
      if (!v.reader_in_coffin) || (!v.reader_drank_blood)
        p "*^*^*^*^*^*^*^*^*^*^*^*^"
        puts v.reader_drank_blood
        puts v.reader_in_coffin
        p "*^*^*^*^*^*^*^*^*^*^*^*^"
        @@coven.delete(v)
      end
    end
    @@coven.count
  end



  def drink_blood
    if reader_in_coffin == true
      return "Too late for blood now"
    else
      @drank_blood_today = true
    end
  end


  def sunset
    @drank_blood_today = false
    @in_coffin = false
  end

  def go_home
    @in_coffin = true
  end



end


nosveratu = Vampire.create('Nosveratu', '777')
vivaldi = Vampire.create('Vivaldi', '121')
pavlov = Vampire.create('Pavlov', '200')
elvis = Vampire.create('Elvis','67')
#puts Vampire.reader_coven.count

 nosveratu.drink_blood
 vivaldi.go_home

 pavlov.drink_blood

#puts Vampire.reader_coven.count

 nosveratu.go_home

 vivaldi.drink_blood
 pavlov.drink_blood

puts Vampire.reader_coven.inspect

#puts '-' * 20
#puts "-------------0000222444444422000---------"

puts Vampire.sunrise

#puts '-' * 20
#puts "-------------0000225555522000---------"

#puts Vampire.reader_coven.count





puts '-' * 20
puts '-' * 20
