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
    it 'should return Programme class instance' do
      expect(Programme.find_by_name('idol')).to be_a Programme
    end
  end
end
