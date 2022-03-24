json.extract! recruiter, :id, :name, :email, :password_digest, :created_at, :updated_at
json.token local_assigns[:token] if local_assigns[:token].present?
json.url api_recruiter_url(recruiter, format: :json)
