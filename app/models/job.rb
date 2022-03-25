class Job < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  belongs_to :recruiter

  settings do
    mappings dynamic: false do
      indexes :id, index: :not_analyzed
      indexes :title, type: :text, analyzer: :english
      indexes :description, type: :text, analyzer: :english
      indexes :skills, type: :text, analyzer: :english
    end
  end
end
