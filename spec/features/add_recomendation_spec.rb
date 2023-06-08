require 'rails_helper'

feature 'Add recomendation to user', %(
  In order to close appointment
  As doctor
  I want to give user recomendation
) do
  given(:user) { create(:user) }
  given(:category) { create(:category) }
  given(:doctor) { create(:doctor, :valid, category:) }
  given!(:appointment) { create(:appointment, user:, doctor:) }

  background do
    sign_in(doctor)
  end

  scenario 'Authenticated user creates question', js: true do
    click_on 'Patients'
    fill_in 'Recomendation', with: 'Test Recomendation'
    click_on 'Confirm'

    expect(page).to have_content 'Appointment was successfully closed.'
  end
end
