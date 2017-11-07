puts '-' * 20
puts '-' * 20


class Book
  @@on_shelf = []
  @@on_loan = []

  def initialize(titl, auth, isb)
    @title = titl
    @author = auth
    @isbn = isb
  end

  def self.shelf
    @@on_shelf
  end

# Class methods:  create, current_due_date, overdue_books, borrowed, available, browse

  def self.create(titl, auth, isb)
    new_book = Book.new(titl, auth, isb)
    @@on_shelf << new_book
    return new_book
  end


  def current_due_date
    return (Time.now + 2592000).to_a
  end



  def self.available
    return @@on_shelf.inspect
  end

  def self.borrowed
    return @@on_loan.inspect
  end

  def self.browse
    return @@on_shelf.sample.inspect
  end



  def reader_due_date
    @due_date
  end

  def writer_due_date
    @due_date
  end

  #borrow, return to library, lent out?

  def borrow(booker)
    if lent_out?(booker) == true
      return false
    else
      @due_date = current_due_date
      return true
    end
  end

  def return_to_library

  end

  def self.lent_out?(booker)
    if @@on_loan[booker]
      return true
    else
      return false
    end
  end

end


Book.create('Chicken Factory', 'Greenspan', 1636454679991)
Book.create('Unforgivable', 'Halaballu', 5555555666666)
Book.create('The Toronto Inquisition', 'Galfoltz', 2222222999006)
Book.create('Unquenchable', 'Merbles', 4737485394851)
Book.create("Perils of Drinking and Driving Golf Carts", 'Fraterson', 7771112225558)

puts Book.lent_out?(5555555666666)

puts '-' * 20
puts '-' * 20
