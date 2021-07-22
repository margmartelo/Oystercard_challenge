require 'station'

describe Station do
    subject { described_class.new("Oxford Circus", 1) }
    it "should have a name" do
        expect(subject.name).to eq "Oxford Circus"
    end

    it "should have a zone" do
        expect(subject.zone).to eq 1
    end
end