class BookSearch
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

    book_search_data.map do |book_data|
      Book.new(book_data)
    end
  end

  private

  attr_reader :title
end
