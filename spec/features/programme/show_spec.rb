require "rails_helper"

feature 'Programme show page' do
  let(:programme_endpoint) { "http://api.tv4play.se/site/programs" }

  before do
    stub_request(:get, "#{programme_endpoint}/idol").
      to_return(
        :body => '{"name":"Idol","description":"Idol programme description","program_image":{"path": "http://image.jpg"}}',
        :headers => { 'Content-Type' => 'application/json' },
    )
  end

  # Scenario: Programme page
  #   Given I am a user
  #   When I visit the Idol programme page
  #   Then I see Idom programme metadata
  scenario 'Show progamme metadata' do
    visit programme_url('idol')

    expect(page).to have_content 'Idol'
    expect(page).to have_content 'Idol programme description'
    expect(page).to have_xpath("//img[@src=\"http://image.jpg\"]")
  end
end
