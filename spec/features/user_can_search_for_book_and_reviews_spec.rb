require 'rails_helper'

RSpec.describe 'As a User' do
  it 'can search for a book and review' do
    visit root_path

    fill_in :title, with: 'Normal People'

    click_on 'Find Book'

    expect(current_path).to eq(search_path)
    expect(page).to have_content('Title: Normal People')
    expect(page).to have_content('Author: Sally Rooney')
    expect(page).to have_content('Genres: ["Psychophysiology", "Emotions"]')
    expect(page).to have_content('This book has 2 reviews from the New York Times')
    expect(page).to have_content("Review 1: Rooney’s second novel tracks two gifted but troubled teenagers across four years of friendship and occasional romance.")
    expect(page).to have_content("Review Publication Date: 2019-04-08")
    expect(page).to have_content("Review 2: Like “Conversations With Friends,” “Normal People” also traces a young romance in Ireland.")
    expect(page).to have_content("Review Publication Date: 2019-04-15")
  end
end

# As a user
# When I visit "/"
# And I input "the man who saw everything" into the form
# (Note: Use the existing search form)
# And I click "Find Book"
# Then I should be on page "/search"
# Then I should see the book's info
# For that book I should see
# - Title
# - Author
# - Genres
# (Note: genres is referred to as "subjects" in the book search response)
# I should also see:
# - This book has 2 reviews from the New York Times
#   (Note: reviews are the "summary" in the book review response)
# - Review 1: ""The Man Who Saw Everything,"" which was longlisted for the Booker Prize, looks at masculinity through the perspective of a young historian who sneers at "authoritarian old men.""
# Review Publication Date: 2019-10-09
# - Review 2: "Deborah Levy's latest novel, "The Man Who Saw Everything," experiments with time travel, history and the endless complications of love."
# Review Publication Date: 2019-10-15
# man who saw everything does not have a subject
