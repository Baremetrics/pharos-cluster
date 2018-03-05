require 'fugit'
require 'dry-validation'

module Kupo

  class ConfigSchema

    # @return [Dry::Validation::Schema]
    def self.build
      Dry::Validation.Form do
        required(:hosts).each do
          schema do
            required(:address).filled
            required(:role).filled
            optional(:private_address).filled
            optional(:user).filled
            optional(:ssh_key_path).filled
          end
        end
        optional(:network).schema do
          optional(:ipalloc_range).filled(:str?)
          optional(:trusted_subnets).each(type?: String)
        end
        optional(:addons).filled
      end
    end
  end
end