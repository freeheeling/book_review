class Book
  attr_reader :book_title,
              :author,
              :genres

  def initialize(attrs = {})
    @book_title = attrs[:title_suggest]
    @author = attrs[:author_name]
    @genres = attrs[:subject] || 'undefined'
  end
end
