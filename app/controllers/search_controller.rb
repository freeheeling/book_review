class SearchController < ApplicationController
  def index
    title = params[:title]

    ol_conn = Faraday.new(url: 'http://openlibrary.org') do |f|
      f.adapter Faraday.default_adapter
      f.params['title'] = title
    end

    ol_response = ol_conn.get('/search.json')

    ol_parsed_json = JSON.parse(ol_response.body, symbolize_names: true)
    @books = ol_parsed_json[:docs].first

    nyt_conn = Faraday.new(url: 'https://api.nytimes.com/') do |f|
      f.adapter Faraday.default_adapter
      f.params['api-key'] = ENV['NYT_KEY']
      f.params['title'] = title
    end

    nyt_response = nyt_conn.get('svc/books/v3/reviews.json')

    require "pry"; binding.pry
  end
end
