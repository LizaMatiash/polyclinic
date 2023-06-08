module FeatureHelpers
  def sign_in(doctor)
    visit new_doctor_session_path
    fill_in 'Phone', with: doctor.phone
    fill_in 'Password', with: doctor.password
    click_on 'Log in'
  end
end
