require 'oystercard'

describe Oystercard do
    it "should have an initial default balance of 0" do
      expect(subject.balance).to eq 0
    end
end
