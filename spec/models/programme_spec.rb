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

  describe '#name' do
    it 'should return correct programme name' do
      programme = Programme.new(programme_hash)
      expect(programme.name).to eq 'programme_name'
    end
  end

  describe '#description' do
    it 'should return correct programme description' do
      programme = Programme.new(programme_hash)
      expect(programme.description).to eq 'programme_description'
    end
  end

  describe '#image' do
    it 'should return correct programme image' do
      programme = Programme.new(programme_hash)
      expect(programme.image).to eq 'image.jpg'
    end
  end
end
