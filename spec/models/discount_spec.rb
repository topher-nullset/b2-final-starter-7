require 'rails_helper'

RSpec.describe Discount, type: :model do
  describe "validations" do
    it { should validate_presence_of :percentage }
    it { should validate_presence_of :threshold }
    it { should validate_presence_of :merchant_id}
  end

  describe "relationships" do
    it { should belong_to :merchant }
  end
end