module NetSuite
  module Records
    class SalesTaxItem
      include Support::Fields
      include Support::RecordRefs
      include Support::Records
      include Support::Actions
      include Namespaces::ListAcct

      actions :get, :get_list, :get_all, :get_select_value, :add, :delete,
        :update, :upsert, :search

      fields :item_id, :display_name, :description, :rate, :is_inactive,
        :effective_from, :valid_until, :include_children, :eccode,
        :reverse_charge, :service, :exempt, :is_default,
        :exclude_from_tax_reports, :available, :export, :county, :city, :state,
        :zip

      field :custom_field_list, CustomFieldList

      record_refs :tax_type, :tax_agency, :tax_account, :purchase_account,
        :sale_account, :parent, :nexus_country

      attr_reader :internal_id
      attr_accessor :external_id
      attr_accessor :search_joins

      def initialize(attributes = {})
        @internal_id = attributes.delete(:internal_id) || attributes.delete(:@internal_id)
        @external_id = attributes.delete(:external_id) || attributes.delete(:@external_id)
        initialize_from_attributes_hash(attributes)
      end

      def self.search_class_name
        "Item"
      end
    end
  end
end
