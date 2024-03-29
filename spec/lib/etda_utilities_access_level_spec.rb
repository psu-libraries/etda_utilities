# frozen_string_literal: true

RSpec.describe EtdaUtilities::AccessLevel, type: :model do
  describe 'AccessLevel' do
    describe '#ACCESS_LEVEL_KEYS' do
      it 'constant containing all access levels' do
        expect(described_class::ACCESS_LEVEL_KEYS).to contain_exactly('open_access', 'restricted_to_institution', 'restricted', '')
      end
    end

    describe '#paper_access_level_keys' do
      it '#paper_access_level_keys returns an array of access_levels' do
        expect(described_class::ACCESS_LEVEL_KEYS).to match_array(described_class.paper_access_level_keys)
      end
    end

    describe '#partner_access_level' do
      it 'returns access level information from a yml file' do
        yml_level = described_class.partner_access_levels['access_level']
        expect(yml_level['open_access']).to include('Open Access')
        expect(yml_level['restricted_to_institution']).to include('Restricted (Penn State Only)')
        expect(yml_level['restricted']).to include('Restricted')
      end
    end

    describe '#valid_levels' do
      it 'returns access_levels including no level' do
        expect(described_class.valid_levels).to match_array(described_class.paper_access_level_keys)
      end
    end

    context 'given an invalid level' do
      it 'returns nil values' do
        bad_level = described_class.new('bogusvalue')
        expect(bad_level.attributes).to be_nil
        expect(bad_level.current_access_level).to eq('')
      end
    end

    context 'given valid levels' do
      it 'returns current_access_level and attribute' do
        open_access = described_class.new('open_access')
        expect(open_access.attributes).to eq('Open Access')
        expect(open_access.current_access_level).to eq('open_access')
        restricted_to_institution = described_class.new('restricted_to_institution')
        expect(restricted_to_institution.attributes).to eq('Restricted (Penn State Only)')
        expect(restricted_to_institution.current_access_level).to eq('restricted_to_institution')
        restricted = described_class.new('restricted')
        expect(restricted.attributes).to eq('Restricted')
        expect(restricted.current_access_level).to eq('restricted')
        no_access = described_class.new('')
        expect(no_access.attributes).to be_nil
        expect(no_access.current_access_level).to eq('')
      end
    end
  end
end
