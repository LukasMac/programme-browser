require "rails_helper"

feature 'Participants index page' do
  let(:programme_endpoint) { "http://api.tv4play.se/site/programs" }

  before do
    stub_request(:get, "#{programme_endpoint}/idol").
      to_return(
        :headers => { 'Content-Type' => 'application/json' },
        :body => <<-programme_json
        {
          "name":"Idol",
          "description":"Idol programme description",
          "participant_groups": [
            {
              "participants": [
                {
                  "description": "Ålder: 16 år Ort: Stockholm Sökte till Idol...",
                  "name": "Lisa Ajax",
                  "person_tag": "lisa-ajax",
                  "image": {
                    "url": "http://aman.production.s3.amazonaws.com/541c9453c45948d3ba000097/Lisa_profilbild.jpg?2"
                  }
                }
              ]
            }
          ]
        }
        programme_json
    )
  end

  # Scenario: Participants page
  #   Given I am a user
  #   When I visit the Idol programme's participants page
  #   Then I see Idol programme participants list
  scenario 'Participants page' do
    visit participants_url('idol')

    expect(page).to have_content 'Lisa Ajax'
    expect(page).to have_content 'Ålder: 16 år Ort: Stockholm Sökte till Idol...'
    expect(page).to have_xpath("//img[@src=\"http://aman.production.s3.amazonaws.com/541c9453c45948d3ba000097/Lisa_profilbild.jpg?2\"]")
  end
end
