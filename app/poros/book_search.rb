class BookSearch
  attr_reader :title

  def initialize(title)
    @title = title
  end

  def title
    books.title_suggest
  end

  def author
    books.author_name.join()
  end

  def genres
    books.subject
  end

  def books
    conn = Faraday.new(url: 'http://openlibrary.org') do |f|
      f.adapter Faraday.default_adapter
      f.params['title'] = title
    end
    response = conn.get('/search.json')

    book_search_data = JSON.parse(response.body, symbolize_names: true)[:docs].first

    book_search_data.map do |book_data|
      Book.new(book_data)
    end
  end

end
