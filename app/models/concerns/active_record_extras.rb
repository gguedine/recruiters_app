module ActiveRecordExtras
  def update_or_create!(unique_hash_attributes, **other_attributes_hash)
    object = where(unique_hash_attributes).first_or_create!(other_attributes_hash)
    object.update!(other_attributes_hash)
    object
  end

  def update_or_create(unique_hash_attributes, **other_attributes_hash)
    object = where(unique_hash_attributes).first_or_create(other_attributes_hash)
    object.update(other_attributes_hash)
    object
  end
end

ActiveRecord::Base.include(ActiveRecordExtras)
