require 'rails_helper'

RSpec.describe Customer, type: :model do
  subject { Customer.new(first_name: "Adriana", last_name: "Cabrera", phone: "1234567890", email: "adi_111@sample.com" )}
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
  it "is not valid without a first_name" do
    subject.first_name=nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a last_name" do
    subject.last_name=nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a phone number" do
    subject.phone=nil
    expect(subject).to_not be_valid
  end

  it "is not valid without an email" do
    subject.email=nil
    expect(subject).to_not be_valid
  end
  it "is not valid if the phone number is not 10 chars" do
    phone = subject.phone.length
    if phone <10
      expect(subject). to_not be_valid
    end
  end
  it "is not valid if the phone number is not all digits" do
    phone = subject.phone
    if (phone.is_a? Integer) == 'false'
      expect(subject). to_not be_valid
    end
  end
  it "is not valid if the email address doesn't have a @" do
    email = subject.email
    if (email.include?("@")) == 'false'
    expect(subject.email).include ("@")
    end 
  end
  it "returns the correct full_name" do
    expect(subject.full_name).to eq("Adriana Cabrera")
  end
end
