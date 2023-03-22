# frozen_string_literal: true

module EtdaUtilities
  class Hosts
    class << self
      def workflow_url(partner = nil, host = nil)
        if ENV['WORKFLOW_HOST']
          "https://#{ENV['WORKFLOW_HOST']}"
        else
          raise ArgumentError, "_partner and _host are required arguments" if partner.nil? || host.nil?

          "https://#{new.workflow_submit_host(partner, host)}"
        end
      end

      def explore_url(partner = nil, host = nil)
        if ENV['EXPLORE_HOST']
          "https://#{ENV['EXPLORE_HOST']}"
        else
          raise ArgumentError, "_partner and _host are required arguments" if partner.nil? || host.nil?

          "https://#{new.explore_host(partner, host)}"
        end
      end
    end

    def workflow_submit_host(partner, environment = 'prod')
      host_builder(partner, environment, true)
    end

    def explore_host(partner, environment = 'prod')
      host_builder(partner, environment, false)
    end

    private

      def host_builder(partner, environment, is_workflow)
        return nil if partner.nil?

        return 'localhost' if environment == 'development'

        location_environment = "#{host_application(is_workflow)}-#{environment}" if environment != 'prod'
        "#{host_prefix(is_workflow)}#{partner_host(partner)}#{location_environment}.libraries.psu.edu"
      end

      def host_prefix(is_workflow = false)
        return '' unless is_workflow

        'submit-'
      end

      def host_application(is_workflow = false)
        return '' if is_workflow

        '-explore'
      end

      def partner_host(partner)
        host_hash = { 'graduate' => "etda", 'honors' => "honors", 'milsch' => "millennium-scholars", 'sset' => "sset" }
        host_hash[partner]
      end
  end
end
