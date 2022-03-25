class API::Public::JobsController < ApplicationController

  def index
    return unless query.present?

    @posts = Post.our_first_query(query)
  end

  private

  def self.our_first_query(query)
    search(
      query: {
        multi_match: {
          query: query,
          fields: %w[title body^5]
        }
      }
    )
  end
end