require "rails_helper"

describe WelcomeMailer do
  describe "fan" do
    let(:fan) { FactoryGirl.create(:fan) }
    let(:mail) { WelcomeMailer.fan(fan) }

    it 'renders the subject' do
      expect(mail.subject).to eql("Welcome to BandFund")
    end

    it 'renders the receiver email' do
      expect(mail.to).to eql([fan.email])
    end

    it 'renders the sender email' do
      expect(mail.from).to eql(['info@bandfund.com'])
    end
  end

  describe "artist" do
    let(:artist) { FactoryGirl.create(:artist) }
    let(:mail) { WelcomeMailer.artist(artist) }

    it 'renders the subject' do
      expect(mail.subject).to eql("Welcome to BandFund")
    end

    it 'renders the receiver email' do
      expect(mail.to).to eql([artist.email])
    end

    it 'renders the sender email' do
      expect(mail.from).to eql(['info@bandfund.com'])
    end
  end

end
