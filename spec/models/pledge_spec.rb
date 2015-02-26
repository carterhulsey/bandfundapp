require 'rails_helper'

describe Pledge do
  let(:fan) { FactoryGirl.create(:fan) }
  let(:artist) { FactoryGirl.create(:artist) }
  subject { FactoryGirl.build(:pledge, fan: fan, artist: artist) }

  describe '.send_notifications' do
    it 'delivers email notifications after create' do
      expect_any_instance_of(PledgeMailer).to receive(:notify_fan).with(subject)
      expect_any_instance_of(PledgeMailer).to receive(:notify_artist).with(subject)
      subject.save
    end
  end

end