class SearchController < ApplicationController
  def index
    title = params[:title]

    conn = Faraday.new(url: 'http://openlibrary.org') do |f|
      f.adapter Faraday.default_adapter
      f.params['title'] = title
    end

    response = conn.get('/search.json')

    require "pry"; binding.pry
  end
end
