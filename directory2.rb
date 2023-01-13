students = [
  {name: "Dr. Hannibal Lecter", cohort: :november},
  {name: "Darth Vader", cohort:  :november},
  {name: "Nurse Ratched", cohort:  :november},
   {name: "Michael Corleone", cohort:  :november},
   {name: "Alex DeLarge", cohort:  :november},
   {name: "The wicked Wicth of the West", cohort:  :november},
   {name: "Terminator", cohort:  :november},
   {name: "freddy Krueger", cohort:  :november},
   {name: "The Joker", cohort:  :november},
   {name: "Joffrey Baratheon", cohort:  :november},
   {name: "Norman Bates", cohort:  :november}
]

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
     # add the student hash to the array
     students << {name: name, cohort: :november}
     puts "Now we have #{students.count} students"
    #get another name
    name = gets.chomp.capitalize
    end
    students
  end  
   
   # get another name from the user




def print_header
  puts ("The students of Villains Academy").center(75)
  puts ("-------------").center(75)
end

def print(students)
  count = 0
    while count < students.length do 
      students.each.with_index(1) do |student, index|
      puts "#{index}. #{student[:name]}. (#{student[:cohort]} cohort.)"
      count += 1
      end
    end
  end 

  method to identify students with name starting with a selected letter
  def initial_letter_match(students)
    puts "Select an intitial to see student's names starting with it. Or return"
     first_letter = gets.chomp.upcase
     @students.each.with_index(1) do |student, index|
       if student[:name][0] == first_letter
       puts "#{index}. #{student[:name]} (#{student[:cohort]} cohort)"
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

students = input_students
print_header
print(students)
print_footer(students)