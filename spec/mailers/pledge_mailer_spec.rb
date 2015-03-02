require 'rails_helper'

describe PledgeMailer do
  let(:fan) { FactoryGirl.create(:fan) }
  let(:artist) { FactoryGirl.create(:artist) }
  let(:pledge) { FactoryGirl.create(:pledge, fan: fan, artist: artist) }

  describe 'notify_fan' do
    let(:mail) {PledgeMailer.notify_fan(pledge)}

    it 'renders the subject' do
      expect(mail.subject).to eql("You have pledged $#{pledge.price}/month to #{artist.name}")
    end

    it 'renders the receiver email' do
      expect(mail.to).to eql([fan.email])
    end

    it 'renders the sender email' do
      expect(mail.from).to eql(['info@bandfund.com'])
    end
  end

  describe 'notify_artist' do
    let(:mail) {PledgeMailer.notify_artist(pledge)}

    it 'renders the subject' do
      expect(mail.subject).to eql("A fan has pledged $#{pledge.price}/month")
    end

    it 'renders the receiver email' do
      expect(mail.to).to eql([artist.email])
    end

    it 'renders the sender email' do
      expect(mail.from).to eql(['info@bandfund.com'])
    end
  end
end