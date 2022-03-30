module Filterable
  def self.included(base)
    base.class_eval do

      scope :by_attribute, ->(attribute, term){
        where("#{attribute} like :term",{term: "%#{term}%"})
      }

      def self.filter(filtering_params)
        results = self.all
        filtering_params.each do |key,value|
          results = results.by_attribute(key,value) if value.present?
        end
        results
      end

    end
  end
end