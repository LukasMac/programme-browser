require "rails_helper"

RSpec.describe Programme, :type => :model do
  let(:programme_hash) do
    {
      "name" => "programme_name",
    }
  end

  describe '#name' do
    it 'should return correct programme name' do
      programme = Programme.new(programme_hash)
      expect(programme.name).to eq 'programme_name'
    end
  end
end
