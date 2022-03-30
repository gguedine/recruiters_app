class AddIndexJobIdEmailToSubmission < ActiveRecord::Migration[6.0]
  def change
    add_index :submissions, [:job_id, :email], unique: true
  end
end
