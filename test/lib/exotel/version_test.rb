require_relative '../../test_helper'
 
describe Exotel do
  it "must be defined" do
    Exotel::VERSION.wont_be_nil
  end
end
