require 'rails_helper'

RSpec.describe Users::AppointmentsController, type: :controller do
  let(:user) { create(:user) }
  let(:doctor) { create(:doctor, :valid) }

  describe 'POST #create' do
    before { login(user) }

    context 'with valid attributes' do
      it 'save the appointment in the database' do
        expect { post :create, params: { doctor: } }.to change(Appointment, :count).by(1)
      end

      it 'redirect to show users_appointment_path' do
        post :create, params: { doctor: }
        expect(response).to redirect_to users_appointments_path
      end
    end

    context 'with invalid attributes' do
      it 'does not save the appointment in the database' do
        expect { post :create, params: {} }.to_not change(Appointment, :count)
      end

      it 'render to search_doctor' do
        post :create, params: {}
        expect(response).to redirect_to search_doctor_path
      end
    end
  end
end
