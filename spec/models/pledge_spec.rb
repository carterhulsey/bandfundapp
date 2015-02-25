require 'rails_helper'

describe Pledge do
  let(:fan) { FactoryGirl.create(:fan) }
  let(:artist) { FactoryGirl.create(:artist) }
  subject { FactoryGirl.build(:pledge, fan: fan, artist: artist) }

  describe '.send_notifications' do
    it 'delivers email notifications after create' do
      expect{ subject.save }.to change { ActionMailer::Base.deliveries.count }.by(2)
    end
  end

end