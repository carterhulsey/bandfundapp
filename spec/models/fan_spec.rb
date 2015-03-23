require 'rails_helper'

describe Fan do
  subject { FactoryGirl.build(:fan) }

  describe '.send_welcome_message' do
    it 'delivers welcome email after create' do
      expect_any_instance_of(WelcomeMailer).to receive(:fan).with(subject)
      subject.save
    end
  end

end