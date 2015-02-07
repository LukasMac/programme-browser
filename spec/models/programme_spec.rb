require "rails_helper"

RSpec.describe Programme, :type => :model do
  let(:programme_hash) do
    {
      "name" => "programme_name",
      "description" => "programme_description",
      "program_image" =>  {
        "path" =>  "image.jpg"
      },
    }
  end

  before do
    @programme = Programme.new(programme_hash)
  end

  describe '#name' do
    it 'should return correct programme name' do
      expect(@programme.name).to eq 'programme_name'
    end

    it 'should raise error if name key is not present' do
      programme = Programme.new({})
      expect { programme.name }.to raise_error
    end
  end

  describe '#description' do
    it 'should return correct programme description' do
      expect(@programme.description).to eq 'programme_description'
    end
  end

  describe '#image' do
    it 'should return correct programme image' do
      expect(@programme.image).to eq 'image.jpg'
    end
  end

  describe '.find_by_name' do
    let(:programme_endpoint) { "http://api.tv4play.se/site/programs" }

    before do
      stub_request(:get, "#{programme_endpoint}/idol").
         to_return(
           :body => '{"name":"Idol","description":"programme description"}',
           :headers => { 'Content-Type' => 'application/json' },
         )
    end

    it 'should return Programme class instance' do
      expect(Programme.find_by_name('idol')).to be_a Programme
    end

    it 'should make a http call to TV4 API programme endpoint' do
      Programme.find_by_name('idol')
      assert_requested :get, "#{programme_endpoint}/idol"
    end

    it 'should return Programme with http request data' do
      expect(Programme.find_by_name('idol').name).to eq 'Idol'
    end
  end
end
