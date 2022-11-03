#first we print the list of students
# students = [
# {name: "Dr. Hanibal Lecter", cohort: :november},
# {name: "Darth Vader", cohort: :november},
# {name: "Nurse Ratched", cohort: :november},
# {name: "Michael Corleone", cohort: :november},
# {name: "Alex DeLarge", cohort: :november},
# {name: "The Wicked Witch of the West", cohort: :november},
# {name: "Terminator", cohort: :november},
# {name: "Freddy Kreger", cohort: :november},
# {name: "The Joker", cohort: :november},
# {name: "Jeoffrey Baratheon", cohort: :november},
# {name: "Norman Bates", cohort: :november}
# ]

def input_students
    puts "Please enter the names of the students"
    puts "To finish, just hit return twice"
    
    students = []
    
    name = gets.chomp
    # puts "what is #{name}'s cohort?"
    # cohort = gets.chomp
    
    while !name.empty? do
        students << {name: name, cohort: :november, hobby: :learning}
        puts "Now we have #{students.count} #{students.count > 1 ? 'students' : 'student'}"
        name = gets.chomp
        # puts "what is #{name}'s cohort?"
        # cohort = gets.chomp
    end
    
    puts names_cohorts
    
    students
end

def print_header
  puts "The students of Villains Academy"
  puts "------------"
end

def print(names)
  # names.each_with_index do |student, index|
  #   if student[:name][0] == 'b'&& student[:name].length < 12
  #     puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
  #   end
  # end
  count = 0
  while count < names.length do
    puts "#{count + 1}. #{names[count][:name]} (#{names[count][:cohort]} cohort)".center(100)
    count += 1
  end  
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

students = input_students

print_header
print(students)
print_footer(students)
