json.extract! submission, :id, :name, :email, :mobile_phone, :resume, :job_id, :created_at, :updated_at
json.url api_public_submission_url(submission, format: :json)
