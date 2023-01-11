def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  #create an empty array
  students = []
  # get the first name
  #name = gets.chomp.capitalize
  name = gets.delete("\n").capitalize
  #while not empty 
  #while the name is not empty,repeat this code
while !name.empty? do
  puts "Add student hobby: "
  hobby = gets.chomp
  puts "Enter student's favourite sound: "
  sound = gets.chomp
  puts "Please enter your cohort"
  cohort = gets.chomp.capitalize
  
  cohort = :november if cohort.empty?

    until cohort_spelling(cohort) == true
      puts "Please ensure you have correct spelling for your cohort month"
      cohort = gets.chomp
  end
  # add the student hash to the array
  students << {name: name, hobby: hobby, sound: sound, cohort: cohort}
 # get another name from the user
  if students.count == 1
    puts "Now we have #{students.count} student. Enter the next student's name, or hit return."
  else
    puts "Now we have #{students.count} students. Enter the next student's name, or hit return."
  end
  name = gets.chomp 
end  
  # return the array of students
  students
end


def cohort_spelling(month)
  require "date"
  Date::MONTHNAMES.include?(month)
end


def print_header
  puts ("The students of Villains Academy").center(75)
  puts ("-------------").center(75)
end

#while array
 
def print(students)
count = 0
  while count < students.length do 
    students.each.with_index(1) do |student, index|
    puts "#{index}. #{student[:name]}. Their hobby is #{student[:hobby]}, and their favourite sound is #{student[:sound]}. (#{student[:cohort]} cohort.)"
    count += 1
    end
  end
end  

# method to identify students with name starting with a selected letter
def initial_letter_match(students)
  puts "Select an intitial to see student's names starting with it. Or return"
   first_letter = gets.chomp.upcase
   students.each.with_index(1) do |student, index|
     if student[:name][0] == first_letter
     puts "#{index}. #{student[:name]} (#{student[:cohort]} cohort)"
     end
   end
  end  
#currently puts'ing "Overall we have .... " How do I eliminate the puts'ing of both 
#Overall statements.
def short_name(students)
  short_names = []
  puts "This is a list of students whose names are shorter than 12 characters."
   students.each.with_index(1) do |student, index|
     if student[:name].length < 12 
      short_names << (student[:name])
     puts "#{index}. #{student[:name]} (#{student[:cohort]} cohort)"
     puts "Overall we have #{short_names.count} great students"
    end
   end
  end  
  ###would like to do cohort groups with a months array? rather than individual months conditionals
  ##currently puts'ing for individual student. "From February cohort, we have name, name"
  def cohort_group(students)
    cohort_array = []
    puts "Students arranged into cohorts"
    students.each do |student|
      cohort_array << (student[:name])
      if student[:cohort] == "January"
    puts "From the January cohort, we have #{student[:name]}."
  elsif student[:cohort] == "February"
    puts "From the February cohort, we have  #{student[:name]}."
  elsif student[:cohort] == "March"
    puts "From the March cohort, we have #{student[:name]}."
  elsif student[:cohort] == "April"
    puts "From the April cohort, we have #{student[:name]}."
  elsif student[:cohort] == "May"
    puts "From the May cohort, we have #{student[:name]}."
  elsif student[:cohort] == "June"
    puts "From the June cohort, we have #{student[:name]}."
  elsif student[:cohort] == "July"
    puts "From the July cohort, we have  #{student[:name]}."
  elsif student[:cohort] == "August"
    puts "From the August cohort, we have #{student[:name]}."
  elsif student[:cohort] == "September"
    puts "From the September cohort, we have #{student[:name]}."
  elsif student[:cohort] == "October"
    puts "From the October cohort, we have #{student[:name]}."
  elsif student[:cohort] == "November"
    puts "From the November cohort, we have #{student[:name]}."   
  elsif student[:cohort] == "December"
    puts "From the December cohort, we have #{student[:name]}."   
end
end
end

#to run short name_students method would require edit to print_footer so not to print overall students
#message(because the count refers to all students- not just short_names) 
def print_footer(students)
  if students.count == 1
    puts ("Overall we have #{students.count} great student").center(75)
  elsif
    puts ("Overall we have #{students.count} great students").center(75)
  end  
end
#it's necessary to call the method to invoke the block of code
students = input_students
short_name(students)
print(students)
print_header
print_footer(students)