# frozen_string_literal: true

module EtdaUtilities
  class Partner
    VALID_IDS = %w[graduate honors milsch sset].freeze

    def self.current
      new(ENV.fetch('PARTNER'))
    end

    def initialize(id)
      unless VALID_IDS.include?(id)
        raise ArgumentError, "Unknown partner id #{id.inspect}"
      end

      @id = id
    end

    attr_reader :id

    def email_list
      attributes['email']['list']
    end

    def email_address
      attributes['email']['address']
    end

    def name
      attributes['name']
    end

    def slug
      attributes['slug']
    end

    def program_label
      attributes['program']['label']
    end

    def committee_label
      attributes['committee']['label']
    end

    def committee_list_label
      attributes['committee']['list']['label']
    end

    def header_title
      attributes['header_title']
    end

    def graduate?
      id == 'graduate'
    end

    def honors?
      id == 'honors'
    end

    def milsch?
      id == 'milsch'
    end

    def sset?
      id == 'sset'
    end

    private

      def attributes
        file_path = File.join(File.dirname(__FILE__), 'partner.yml')
        YAML.load_file(file_path.to_s)[id]
      end
  end
end
