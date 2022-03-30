require 'spec_helper'

shared_examples_for "Filterable" do |attributes_hash|
  let(:model) { described_class } # the class that includes the concern

  describe "scopes" do
    describe ".by_attribute" do
      let(:included_object) { create(model.to_s.underscore.to_sym, :valid, attributes_hash) }
      let(:attribute_hash) { attributes_hash.to_a.sample(1).to_h }
      let(:attribute) { attribute_hash.keys[0] }
      let(:term) { attribute_hash.values[0] }
      before do
        included_object
      end
      it { expect(model.by_attribute(attribute, term)).to include(included_object)}
    end
  end
  describe "methods" do
    describe "#filter" do
      let(:included_object) { create(model.to_s.underscore.to_sym, :valid, attributes_hash) }
      before do
        included_object
      end
      it { expect(model.filter(attributes_hash)).to include(included_object)}
    end
  end
end