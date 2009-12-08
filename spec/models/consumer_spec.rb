require 'spec_helper'

describe Consumer do
  subject { Factory(:consumer) }
  
  it { should validate_uniqueness_of(:url).case_insensitive }
end
