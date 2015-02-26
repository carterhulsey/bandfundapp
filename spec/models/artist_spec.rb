require 'rails_helper'

describe Artist do
  subject { FactoryGirl.build(:artist) }

  describe '.send_welcome_message' do
    it 'delivers welcome email after create' do
      expect_any_instance_of(WelcomeMailer).to receive(:artist).with(subject)
      subject.save
    end
  end

end