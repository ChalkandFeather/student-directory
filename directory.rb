@students = [] #my empty array accessbile to all methods as class variable

#menu to provide user with list of options
def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list of students.csv"
  puts "4. Load the list from students.csv"
  puts "9 Exit"
  #read the input and save it into a variable (selection)
end

 #print the menu and ask the user to choose action
def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

#do what the user has asked  
def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students  
    when "4"
      load_students  
    when "9"
    exit #this will cause the program to terminate
    else
    puts "I don't know what you meant, try again"  
   end   
end 

  def input_students
    puts "Please enter the names of the students"
    puts "To finish, just hit return twice"
    #create an empty array
   # get the first name
    name = STDIN.gets.delete("\n").capitalize
    #while the name is not empty,repeat this code
  while !name.empty? do
   # add the student hash to the array
    @students << {name: name, cohort: :november}
   # get another name from the user
    if @students.count == 1
      puts "Now we have #{@students.count} student. Enter the next student's name, or hit return."
    else
      puts "Now we have #{@students.count} students. Enter the next student's name, or hit return."
    end
    name = STDIN.gets.chomp 
  end  
  end

  #method to show the students  
def show_students 
  print_header
  print_students_list
  print_footer
end 

def print_header
  puts ("The students of Villains Academy").center(75)
  puts ("-------------").center(75)
end

def print_students_list
count = 0
  while count < @students.length do 
    @students.each.with_index(1) do |student, index|
    puts "#{index}. #{student[:name]}. (#{student[:cohort]} cohort)"
    count += 1
    end
  end
end 

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

def save_students
  #open the file for writing
  file = File.open("students.csv", "w")
  #iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    #will look like Dr. Hannibal Lecter,november
    csv_line = student_data.join(",")
    #will be joined as follows ["Dr. Hannibal Lecter", :november]
    file.puts csv_line
    #puts writes the above line to the file
  end
  file.close
  #everytime a file is opened -it needs to be closed.
end 

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
end

def try_load_students
  filename = ARGV.first #first arguement from the command line
  return if filename.nil? #get out of the method if it isn't given
  if File.exist?(filename) # if file exists
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else #if it doesn't exist.
    puts "Sorry, #{filename} doesn't exist."
    exit # quit the program
  end
end    

#it's necessary to call the method to invoke the block of code
try_load_students
interactive_menu