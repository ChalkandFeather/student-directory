def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  #create an empty array
  students = []
  # get the first name
  name = gets.chomp
  #while the name is not empty,repeat this code
while !name.empty? do
  # add the student hash to the array
  students << {name: name, cohort: :november}
  puts "Now we have #{students.count} students"
  # get another name from the user
  name = gets.chomp 
end  
  # return the array of students
  students
end


def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end


def print(students)
  students.each.with_index(1) do |student, index|
    puts "#{index}. #{student[:name]} (#{student[:cohort]} cohort)"
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

def print_footer(students)
  puts "Overall we have #{students.count} great students"
end  

students = input_students
short_name(students)
print_header
