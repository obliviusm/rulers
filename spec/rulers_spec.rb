require_relative './dummy/config/application.rb'

RSpec.describe Rulers do
  def app
    Dummy::Application.new
  end

  it "has a version number" do
    expect(Rulers::VERSION).not_to be nil
  end

  it "responds to " do
    response = get '/quote/show'
    expect(response).to be_ok
    expect(response.body).to include('There is nothing')
  end
end
