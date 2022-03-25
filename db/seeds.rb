# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
puts "Creating recruiter..."
recruiter = Recruiter.update_or_create!(
  { email: 'user@user.com' },
  name: "user", password: '123456'
)
puts "Recruiter created!\n"
puts "Creating job..."
job = Job.update_or_create!(
  { id: 10 },
  "title": "Vaga estágio", "description": "descrição teste",
  "skills": "programador ruby", "status": "ativo",
  "start_date": "24/03/2022", "end_date": "30/06/2022",
  "recruiter_id": recruiter.id
)
puts "Job created!\n"
puts "Creating submission..."
submission = Submission.update_or_create!(
  { id: 10 },
  "name": "rafael", "email": "rafael@rafael.com",
  "mobile_phone": "+55 21 9 9999 9999",
  "resume": "Resumo das experiencias",
  "job_id": job.id
)
puts "Submission created!\n"
# Job.__elasticsearch__.create_index!
# Job.import
