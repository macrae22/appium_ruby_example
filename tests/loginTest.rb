require '../scenarios/login/login_scenarios.rb'

describe 'Login' do

  it 'via email' do

    # Login natively
    LoginScenarios.login()

  end
end