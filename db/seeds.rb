# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)

Product.delete_all

Product.create(
  :title => 'Programming Ruby 1.9',
  :description => %{
    Ruby is a language of careful balance. Its creator, Yukihiro matz Matsumoto, blended parts of his favorite languages (Perl, Smalltalk, Eiffel, Ada, and Lisp) to form a new language that balanced functional programming with imperative programming.
  },
  :image_url => 'ruby.png',
  :price => 79.9
)

Product.create(
  :title => 'Introduction to algorithms',
  :description => %{
    Introduction to Algorithms is a book by Thomas H. Cormen, Charles E. Leiserson, Ronald L. Rivest, and Clifford Stein. It is used as the textbook for algorithms courses at many universities. It is also one of the most commonly cited references for algorithms in published papers,[citation needed] with over 4900 citations documented on CiteSeerX.[1] The book sold half a million copies during its first 20 years.
  },
  :image_url => 'clrs.png',
  :price => 49.9
)
