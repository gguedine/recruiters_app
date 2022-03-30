module Filterable
  def self.included(base)
    base.class_eval do
      scope :by_attribute, lambda { |attribute, term|
        where("#{attribute} like :term", { term: "%#{term}%" })
      }

      def self.filter(filtering_params)
        results = all
        filtering_params.each do |key, value|
          results = results.by_attribute(key, value) if value.present?
        end
        results
      end
    end
  end
end
