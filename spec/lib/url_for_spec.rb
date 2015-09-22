RSpec.describe UrlFor do
  it "falls back on url_for" do
    UrlFor.call Object.new
  end
end
