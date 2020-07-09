module NetSuite
  module Support
    module Attributes

      def attributes
        @attributes ||= {}
      end

      def attributes=(attributes)
        @attributes = attributes
      end
      def initiation_attributes
        @initiation_attributes ||= {}
      end

      def initiation_attributes=(initiation_attributes)
        @initiation_attributes = initiation_attributes
      end

      def initialize_from_attributes_hash(attributes = {})
        self.initiation_attributes = attributes
        attributes.select { |k,v| self.class.fields.include?(k) }.each do |k,v|
          send("#{k}=", v)
        end
        self.klass = attributes[:class] if attributes[:class]
      end
      def method_missing(m, *args, &block)
        rv = initiation_attributes[m]
        if rv.nil?
          super 
        end
        return rv
      end
    end
  end
end
