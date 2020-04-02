module NetSuite
  module Records
    class CustomerSubsidiaryRelationship
      include Support::Fields
      include Support::RecordRefs
      include Support::Records
      include Support::Actions
      include Namespaces::ListRel

      actions :get, :get_list, :add, :update, :delete, :search, :upsert

      fields :is_primary_sub

      record_refs :entity, :primary_currency, :subsidiary

      attr_reader :internal_id
      attr_accessor :external_id
      attr_accessor :search_joins

      def initialize(attributes = {})
        @internal_id = attributes.delete(:internal_id) || attributes.delete(:@internal_id)
        @external_id = attributes.delete(:external_id) || attributes.delete(:@external_id)
        initialize_from_attributes_hash(attributes)
      end

    end
  end
end
