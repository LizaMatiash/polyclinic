require 'rails_helper'

RSpec.describe Doctor, type: :model do
  describe 'phone validation' do
    let(:doctor) { create(:doctor, :valid) }
    let(:invalid_doctor1) { Doctor.new(phone: 'pzzaz', password: '1111122222') }
    let(:invalid_doctor2) { Doctor.new(phone: nil, password: '1111122222') }
    let(:invalid_doctor3) { Doctor.new(phone: '12345678901234', password: '1111122222') }

    context 'with correct number' do
      it 'is valid' do
        expect(doctor).to be_valid
      end
    end

    context 'with incorrect number' do
      it 'is invalid by letters' do
        expect(invalid_doctor1).to_not be_valid
      end

      it 'is invalid by nil' do
        expect(invalid_doctor2).to_not be_valid
      end

      it 'is invalid by overflow' do
        expect(invalid_doctor3).to_not be_valid
      end
    end
  end
end
