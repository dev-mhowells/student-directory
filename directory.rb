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
    
    while !name.empty? do
        students << {name: name, cohort: :november}
        puts "Now we have #{students.count} students"
        name = gets.chomp
    end
    
    students
end

def print_header
  puts "The students of Villains Academy"
  puts "------------"
end

def print(names)
  names.each do |student|
  puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

def interactive_menu
    students = []
    loop do
        puts "1. Input the students"
        puts "2. Show the students"
        puts "9. Exit"
        
        selection = gets.chomp
        
        case selection
            when "1"
                students = input_students
            when "2"
                print_header
                print(students)
                print_footer(students)
            when "9"
                exit
            else
                puts "I don't know what you meant, try again"
        end
        
    end
end

# students = input_students

# print_header
# print(students)
# print_footer(students)
interactive_menu
