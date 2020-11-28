# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Instructors
instructor_ids = []
5.times do |n|
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  email = "#{first_name}.#{last_name}@school.com"
  identifier = "#{first_name}#{last_name}"
  role = "Instructor"
  password = "password"
  user = User.create!(
    first_name: first_name,
    last_name: last_name,
    email: email,
    password: password,
    identifier: identifier,
    role: role)
  instructor_ids.push(user.id)
end

# Students
student_ids = []
100.times do |n|
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  email = "#{first_name}.#{last_name}@school.com"
  identifier = "#{first_name}#{last_name}"
  role = "Student"
  password = "password"
  user = User.create!(
    first_name: first_name,
    last_name: last_name,
    email: email,
    password: password,
    identifier: identifier,
    role: role)
  student_ids.push(user.id)
end

user_counter = 0;

# Courses
course_prefixes = ["MATH", 'CS', 'SE', 'SOC', 'LS', 'CHEM', 'BIO', 'PHYS']
2.times do |n|
  5.times do |m|
    identifier = "#{course_prefixes.sample}#{Faker::Number.between(from: 100, to: 499)}"
    term = 'Fall 2020'
    name = "Course #{n * m}"
    description = Faker::Lorem.paragraph(sentence_count: 2)
    professor = User.find(instructor_ids[n*m])
    start_date = Date.today
    course = Course.create!(
      identifier: identifier,
      term: term,
      name: name,
      description: description,
      professor: professor,
      start_date: start_date)
    10.times do |n|
      Enrollment.create!(
        course: course,
        user: User.find(student_ids[user_counter])
      )
      if user_counter == 99
        user_counter = 0
      else 
        user_counter = user_counter + 1
      end
    end
  end
end

user_counter = 0;
# Lectures
10.times do |n|
  10.times do |m|
    title = "Lecture #{n + 1}"
    description = Faker::Lorem.paragraph(sentence_count: 2)
    video_link = "https://www.youtube.com/watch?v=dQw4w9WgXcQ&ab_channel=RickAstleyVEVO"
    course = Course.find(n + 1)
    user = User.find(course.professor.id)
    visible_on = Date.today
    lecture = Lecture.create!(
      title: title,
      description: description,
      video_link: video_link,
      course: course,
      user: user,
      visible_on: visible_on)
  end
end

# Views
User.all.each do |u|
  u.courses.each do |c|
    c.lectures.each do |l|
      View.create!(
        lecture: l,
        user: u
      )
    end
  end
end