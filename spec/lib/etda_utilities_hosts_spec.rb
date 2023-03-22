# frozen_string_literal: true

RSpec.describe EtdaUtilities::Hosts, type: :model do
  describe '#workflow_submit_host' do
    it 'returns the correct production host for workflow graduate' do
      expect(subject.workflow_submit_host('graduate')).to eq('submit-etda.libraries.psu.edu')
    end

    it 'returns the correct production host for workflow honors' do
      expect(subject.workflow_submit_host('honors')).to eq('submit-honors.libraries.psu.edu')
    end

    it 'returns the correct production host for workflow millennium scholars' do
      expect(subject.workflow_submit_host('milsch')).to eq('submit-millennium-scholars.libraries.psu.edu')
    end

    it 'returns the correct production host for workflow sset' do
      expect(subject.workflow_submit_host('sset')).to eq('submit-sset.libraries.psu.edu')
    end

    it 'returns the correct QA host for workflow graduate' do
      expect(subject.workflow_submit_host('graduate', 'qa')).to eq('submit-etda-qa.libraries.psu.edu')
    end

    it 'returns the correct QA host for workflow honors' do
      expect(subject.workflow_submit_host('honors', 'qa')).to eq('submit-honors-qa.libraries.psu.edu')
    end

    it 'returns the correct QA host for workflow millennium scholars' do
      expect(subject.workflow_submit_host('milsch', 'qa')).to eq('submit-millennium-scholars-qa.libraries.psu.edu')
    end

    it 'returns the correct QA host for workflow sset' do
      expect(subject.workflow_submit_host('sset', 'qa')).to eq('submit-sset-qa.libraries.psu.edu')
    end

    it 'returns the correct host for workflow if environment is development' do
      expect(subject.workflow_submit_host('graduate', 'development')).to eq('localhost')
    end
  end

  describe '#explore_host' do
    it 'returns the correct production host for explore graduate' do
      expect(subject.explore_host('graduate')).to eq('etda.libraries.psu.edu')
    end

    it 'returns the correct production host for explore honors' do
      expect(subject.explore_host('honors')).to eq('honors.libraries.psu.edu')
    end

    it 'returns the correct production host for explore millennium scholars' do
      expect(subject.explore_host('milsch')).to eq('millennium-scholars.libraries.psu.edu')
    end

    it 'returns the correct production host for explore sset' do
      expect(subject.explore_host('sset')).to eq('sset.libraries.psu.edu')
    end

    it 'returns the correct QA host for explore graduate' do
      expect(subject.explore_host('graduate', 'qa')).to eq('etda-explore-qa.libraries.psu.edu')
    end

    it 'returns the correct QA host for explore honors' do
      expect(subject.explore_host('honors', 'qa')).to eq('honors-explore-qa.libraries.psu.edu')
    end

    it 'returns the correct QA host for explore millennium scholars' do
      expect(subject.explore_host('milsch', 'qa')).to eq('millennium-scholars-explore-qa.libraries.psu.edu')
    end

    it 'returns the correct QA host for explore sset' do
      expect(subject.explore_host('sset', 'qa')).to eq('sset-explore-qa.libraries.psu.edu')
    end

    it 'returns the correct host for explore if environment is development' do
      expect(subject.explore_host('graduate', 'development')).to eq('localhost')
    end
  end

  describe '#workflow_url' do
    context 'when WORKFLOW_HOST is defined' do
      it 'uses the WORKFLOW_HOST to create the url' do
        ENV['WORKFLOW_HOST'] = 'workflow_url.libraries.psu.edu'
        expect(described_class.workflow_url).to eq('https://workflow_url.libraries.psu.edu')
      end
    end

    context 'when WORKFLOW_HOST is not defined and no arguments are given' do
      it 'raises and ArgumentError' do
        ENV['WORKFLOW_HOST'] = nil
        expect { described_class.workflow_url }.to raise_error(ArgumentError)
      end
    end

    context 'when WORKFLOW_HOST is not defined and QA host and sset partner are arguments' do
      it 'returns the correct QA url for workflow sset' do
        ENV['WORKFLOW_HOST'] = nil
        expect(described_class.workflow_url('sset', 'qa')).to eq('https://submit-sset-qa.libraries.psu.edu')
      end
    end
  end

  describe '#explore_url' do
    context 'when EXPLORE_HOST is defined' do
      it 'uses the EXPORE_HOST to create the url' do
        ENV['EXPLORE_HOST'] = 'explore_url.libraries.psu.edu'
        expect(described_class.explore_url).to eq('https://explore_url.libraries.psu.edu')
      end
    end

    context 'when EXPLORE_HOST is not defined and no arguments are given' do
      it 'raises and ArgumentError' do
        ENV['EXPLORE_HOST'] = nil
        expect { described_class.explore_url }.to raise_error(ArgumentError)
      end
    end

    context 'when EXPLORE_HOST is not defined and QA host and sset partner are arguments' do
      it 'returns the correct QA url for explore sset' do
        ENV['EXPLORE_HOST'] = nil
        expect(described_class.explore_url('sset', 'qa')).to eq('https://sset-explore-qa.libraries.psu.edu')
      end
    end
  end
end
