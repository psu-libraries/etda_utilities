# frozen_string_literal: true

RSpec.describe EtdaUtilities::Partner, type: :model do
  context "when ENV['PARTNER'] is graduate" do
    let(:current_partner) { described_class.current }

    before do
      partner_set_env('graduate')
    end

    it 'sets current.id to graduate' do
      expect(current_partner.id).to eql('graduate')
    end

    it 'responds to graduate?' do
      expect(current_partner).to be_graduate
    end

    it 'returns partner name' do
      expect(current_partner.name).to eq("Graduate School")
    end

    it 'returns partner email' do
      expect(current_partner.email_address).to eq("gradthesis@psu.edu")
    end

    it 'returns partner email list' do
      expect(current_partner.email_list).to eq('ul-etda-graduate-admin@pennstateoffice365.onmicrosoft.com')
    end

    it 'returns partner slug' do
      expect(current_partner.slug).to eq("eTD")
    end

    it 'returns partner label' do
      expect(current_partner.program_label).to eq("Graduate Program")
    end

    it 'returns partner committee label' do
      expect(current_partner.committee_label).to eq("Committee Member")
    end

    it 'returns partner committee list label' do
      expect(current_partner.committee_list_label).to eq("Committee Members")
    end

    it 'returns partner header title' do
      expect(current_partner.header_title).to eq("Electronic Theses and Dissertations for Graduate School")
    end
  end

  context "when ENV['PARTNER'] is honors" do
    let(:current_partner) { described_class.current }

    before do
      partner_set_env('honors')
    end

    it 'sets current.id to honors' do
      expect(current_partner.id).to eql('honors')
    end

    it 'responds to honors?' do
      expect(current_partner).to be_honors
    end

    it 'returns partner name' do
      expect(current_partner.name).to eq("Schreyer Honors College")
    end

    it 'returns partner email' do
      expect(current_partner.email_address).to eq("SHCAcademics@psu.edu")
    end

    it 'returns partner email list' do
      expect(current_partner.email_list).to eq('ul-etda-honors-admin@pennstateoffice365.onmicrosoft.com')
    end

    it 'returns partner slug' do
      expect(current_partner.slug).to eq("eHT")
    end

    it 'returns partner label' do
      expect(current_partner.program_label).to eq("Area of Honors")
    end

    it 'returns partner committee label' do
      expect(current_partner.committee_label).to eq("Thesis Supervisor")
    end

    it 'returns partner committee list label' do
      expect(current_partner.committee_list_label).to eq("Thesis Supervisors")
    end

    it 'returns partner header title' do
      expect(current_partner.header_title).to eq("Electronic Theses for Schreyer Honors College")
    end
  end

  context "when ENV['PARTNER'] is milsch" do
    let(:current_partner) { described_class.current }

    before do
      partner_set_env('milsch')
    end

    it 'sets current.id to milsch' do
      expect(current_partner.id).to eql('milsch')
    end

    it 'responds to milsch?' do
      expect(current_partner).to be_milsch
    end

    it 'returns partner name' do
      expect(current_partner.name).to eq("Millennium Scholars Program")
    end

    it 'returns partner email' do
      expect(current_partner.email_address).to eq("millennium@psu.edu")
    end

    it 'returns partner email list' do
      expect(current_partner.email_list).to eq('ul-etda-milsch-admin@pennstateoffice365.onmicrosoft.com')
    end

    it 'returns partner slug' do
      expect(current_partner.slug).to eq("MSPT")
    end

    it 'returns partner label' do
      expect(current_partner.program_label).to eq("Millennium Scholars Program")
    end

    it 'returns partner committee label' do
      expect(current_partner.committee_label).to eq("Thesis Supervisor")
    end

    it 'returns partner committee list label' do
      expect(current_partner.committee_list_label).to eq("Thesis Supervisor")
    end

    it 'returns partner header title' do
      expect(current_partner.header_title).to eq("Electronic Theses for Millennium Scholars Program")
    end
  end

  context "when ENV['PARTNER'] is sset" do
    let(:current_partner) { described_class.current }

    before do
      partner_set_env('sset')
    end

    it 'sets current.id to sset' do
      expect(current_partner.id).to eql('sset')
    end

    it 'responds to sset?' do
      expect(current_partner).to be_sset
    end

    it 'returns partner name' do
      expect(current_partner.name).to eq("School of Science, Engineering, and Technology")
    end

    it 'returns partner email' do
      expect(current_partner.email_address).to eq("sset@psu.edu")
    end

    it 'returns partner email list' do
      expect(current_partner.email_list).to eq('ul-etda-sset-admin@pennstateoffice365.onmicrosoft.com')
    end

    it 'returns partner slug' do
      expect(current_partner.slug).to eq("SSETT")
    end

    it 'returns program label' do
      expect(current_partner.program_label).to eq("Program")
    end

    it 'returns partner committee label' do
      expect(current_partner.committee_label).to eq("Committee Member")
    end

    it 'returns partner committee list label' do
      expect(current_partner.committee_list_label).to eq("Committee Members")
    end

    it 'returns partner header title' do
      expect(current_partner.header_title).to eq("Final Papers for the School of Science, Engineering, and Technology")
    end
  end

  context "when ENV['PARTNER'] is not a valid partner" do
    before do
      partner_set_env('boguspartner')
    end

    it 'reports an error' do
      expect { described_class.current.id }.to raise_error(ArgumentError)
    end
  end

  context "when ENV['PARTNER'] is not set" do
    before do
      ENV.delete('PARTNER')
    end

    it 'reports an error' do
      expect { described_class.current.id }.to raise_error(KeyError)
    end
  end
end
