class CreateJobs < ActiveRecord::Migration[6.0]
  def change
    create_table :jobs do |t|
      t.string :title
      t.text :description
      t.datetime :start_date
      t.datetime :end_date
      t.integer :status, default: 0
      t.text :skills
      t.references :recruiter, null: false, foreign_key: true

      t.timestamps
    end
  end
end
