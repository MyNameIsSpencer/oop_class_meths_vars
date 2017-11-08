puts '-' * 20
puts '-' * 20


class Book
  @@on_shelf = []
  @@on_loan = []

  def initialize(titl, auth, isbn)
    @title = titl
    @author = auth
    @isbn = isbn
    @due_date = nil
  end

  def self.shelf
    @@on_shelf
  end

# Class methods:  create, current_due_date, overdue_books, borrowed, available, browse

  def self.create(titl, auth, isbn)
    new_book = Book.new(titl, auth, isbn)
    @@on_shelf << new_book
    return new_book
  end


  def self.current_due_date
      return Time.now + 2592000

  end



  def self.available
    return @@on_shelf
  end

  def self.borrowed
    return @@on_loan
  end

  def self.browse
    return @@on_shelf.sample.inspect
  end



  def reader_due_date
    @due_date
  end

  def writer_due_date
    @due_date = Book.current_due_date
  end

  def nil_due_date
    @due_date = nil
  end

  #borrow, return to library, lent out?

  def self.borrow(booker)
    if Book.lent_out?(booker)
      return false
    else
      booker.writer_due_date
      @@on_loan << booker
      @@on_shelf.delete(booker)
      return true

    end
  end

  def self.return_to_library(booker)
    if Book.lent_out?(booker)
      booker.nil_due_date
      @@on_shelf << booker
      @@on_loan.delete(booker)
      return true
    else
      return false
    end
  end

  def self.overdue_books
    overdue = []
    Book.borrowed.each do |booker|
      if booker.reader_due_date < Time.now
        overdue << booker
      end
        puts "Not due until #{booker.reader_due_date}"
    end
    return overdue
    puts "overdue books #{overdue}"
  end

  def self.lent_out?(booker)
    if @@on_loan.include? booker
      return true
    else
      return false
    # elsif @@on_loan[booker] == false
    #   return false
    end
  end

end


first = Book.create('Chicken Factory', 'Greenspan', 1636454679991)
second = Book.create('Unforgivable', 'Halaballu', 5555555666666)
third = Book.create('The Toronto Inquisition', 'Galfoltz', 2222222999006)
fourth = Book.create('Unquenchable', 'Merbles', 4737485394851)
fifth = Book.create("Perils of Drinking and Driving Golf Carts", 'Fraterson', 7771112225558)


puts Book.lent_out?(first)

puts Book.borrow(third)
puts Book.lent_out?(third)
puts third.reader_due_date.strftime("%m/%d/%Y")
puts Book.borrow(fourth)
puts Book.borrow(second)
puts Book.borrowed.inspect
puts Book.return_to_library(fifth)
puts Book.return_to_library(third)
puts Book.return_to_library(second)
puts '---BORROWED---'
puts Book.borrowed.inspect
puts '----AVAILABLE----'
puts Book.available.inspect
puts '---OVERDUE---'
Book.overdue_books

# puts Book.current_due_date
# puts Book.shelf.inspect



puts '-' * 20
puts '-' * 20
puts '-' * 20


puts Book.borrowed.inspect


puts '-' * 20
puts '-' * 20
