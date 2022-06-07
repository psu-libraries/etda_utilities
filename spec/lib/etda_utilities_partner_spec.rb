# frozen_string_literal: true

RSpec.describe EtdaUtilities::Partner, type: :model do
  describe 'current_partner.id' do
    context "when ENV['PARTNER'] is graduate" do
      let(:subject) { described_class.current }
      before do
        partner_set_env('graduate')
      end

      it 'sets current.id to graduate' do
        expect(subject.id).to eql('graduate')
      end
      it 'responds to graduate?' do
        expect(subject).to be_graduate
      end
      it 'returns partner name' do
        expect(subject.name).to eq("Graduate School")
      end
      it 'returns partner email' do
        expect(subject.email_address).to eq("gradthesis@psu.edu")
      end
      it 'returns partner email list' do
        expect(subject.email_list).to eq('ul-etda-graduate-admin@pennstateoffice365.onmicrosoft.com')
      end
      it 'returns partner slug' do
        expect(subject.slug).to eq("eTD")
      end
      it 'returns partner label' do
        expect(subject.program_label).to eq("Graduate Program")
      end
      it 'returns partner committee label' do
        expect(subject.committee_label).to eq("Committee Member")
      end
      it 'returns partner committee list label' do
        expect(subject.committee_list_label).to eq("Committee Members")
      end
    end

    context "when ENV['PARTNER'] is honors" do
      let(:subject) { described_class.current }
      before do
        partner_set_env('honors')
      end

      it 'sets current.id to honors' do
        expect(subject.id).to eql('honors')
      end
      it 'responds to honors?' do
        expect(subject).to be_honors
      end
      it 'returns partner name' do
        expect(subject.name).to eq("Schreyer Honors College")
      end
      it 'returns partner email' do
        expect(subject.email_address).to eq("SHCAcademics@psu.edu")
      end
      it 'returns partner email list' do
        expect(subject.email_list).to eq('ul-etda-honors-admin@pennstateoffice365.onmicrosoft.com')
      end
      it 'returns partner slug' do
        expect(subject.slug).to eq("eHT")
      end
      it 'returns partner label' do
        expect(subject.program_label).to eq("Area of Honors")
      end
      it 'returns partner committee label' do
        expect(subject.committee_label).to eq("Thesis Supervisor")
      end
      it 'returns partner committee list label' do
        expect(subject.committee_list_label).to eq("Thesis Supervisors")
      end
    end

    context "when ENV['PARTNER'] is milsch" do
      let(:subject) { described_class.current }
      before do
        partner_set_env('milsch')
      end

      it 'sets current.id to milsch' do
        expect(subject.id).to eql('milsch')
      end
      it 'responds to milsch?' do
        expect(subject).to be_milsch
      end
      it 'returns partner name' do
        expect(subject.name).to eq("Millennium Scholars Program")
      end
      it 'returns partner email' do
        expect(subject.email_address).to eq("millennium@psu.edu")
      end
      it 'returns partner email list' do
        expect(subject.email_list).to eq('ul-etda-milsch-admin@pennstateoffice365.onmicrosoft.com')
      end
      it 'returns partner slug' do
        expect(subject.slug).to eq("MSPT")
      end
      it 'returns partner label' do
        expect(subject.program_label).to eq("Millennium Scholars Program Name")
      end
      it 'returns partner committee label' do
        expect(subject.committee_label).to eq("Thesis Supervisor")
      end
      it 'returns partner committee list label' do
        expect(subject.committee_list_label).to eq("Thesis Supervisor")
      end
    end

    context "when ENV['PARTNER'] is sset" do
      let(:subject) { described_class.current }
      before do
        partner_set_env('sset')
      end

      it 'sets current.id to sset' do
        expect(subject.id).to eql('sset')
      end
      it 'responds to sset?' do
        expect(subject).to be_sset
      end
      it 'returns partner name' do
        expect(subject.name).to eq("School of Science, Engineering, and Technology")
      end
      it 'returns partner email' do
        expect(subject.email_address).to eq("sset@psu.edu")
      end
      it 'returns partner email list' do
        expect(subject.email_list).to eq('ul-etda-sset-admin@pennstateoffice365.onmicrosoft.com')
      end
      it 'returns partner slug' do
        expect(subject.slug).to eq("SSETT")
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
end
