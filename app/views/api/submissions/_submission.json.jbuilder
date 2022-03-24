json.extract! submission, :id, :name, :email, :mobile_phone, :resume, :job_id, :created_at, :updated_at
json.url api_submission_url(submission, format: :json)
