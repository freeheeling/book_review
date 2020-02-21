class BookSearch
  attr_reader :title

  def initialize(title)
    @title = title
  end

  def books
    conn = Faraday.new(url: 'http://openlibrary.org') do |f|
      f.adapter Faraday.default_adapter
      f.params['title'] = title
    end
    response = conn.get('/search.json')

    book_search_data = JSON.parse(response.body, symbolize_names: true)[:docs]
    require "pry"; binding.pry

    book_search_data.map do |book_data|
      Book.new(book_data)
    end
  end

end
