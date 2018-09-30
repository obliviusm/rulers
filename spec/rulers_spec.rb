
class TestApp < Rulers::Application; end

RSpec.describe Rulers do
  def app
    TestApp.new
  end

  it "has a version number" do
    expect(Rulers::VERSION).not_to be nil
  end

  it "responds to " do
    response = get '/'
    expect(response).to be_ok
    expect(response.body).to include('Hello')

  end
end
