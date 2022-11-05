
require 'csv'
@students = []

def show_my_code
    my_code = File.read($0)
    puts my_code
end

def add_student(name, cohort = :november)
    @students << {name: name, cohort: cohort}
end

def input_students
    puts "Please enter the names of the students"
    puts "To finish, just hit return twice"
    
    name = STDIN.gets.chomp
    
    while !name.empty? do
        # @students << {name: name, cohort: :november}
        add_student(name)
        puts "Now we have #{@students.count} students"
        name = STDIN.gets.chomp
    end
    
    @students
end

def print_header
  puts "The students of Villains Academy"
  puts "------------"
end

def print_students_list(names)
  names.each do |student|
  puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

def print_menu
    puts "1. Input the students"
    puts "2. Show the students"
    puts "3. Save the list to students.csv"
    puts "4. Load the list to students.csv"
    puts "5. Show your code"
    puts "9. Exit"
end

def show_students
    print_header
    print_students_list(@students)
    print_footer(@students)
end

def display_choice(option)
    puts "You chose option #{option}"
end

def process(selection)
    case selection
    when "1"
        display_choice(1)
        @students = input_students
    when "2"
        display_choice(2)
        show_students
    when "3"
        display_choice(3)
        save_students
    when "4"
        display_choice(4)
        load_students
    when "5"
        show_my_code
    when "9"
        display_choice(9)
        exit
    else
        puts "I don't know what you meant, try again"
    end
end

def interactive_menu

    loop do
        print_menu
        process(STDIN.gets.chomp)
    end
end

@filename

def name_file
    puts "please choose your file"
    name = gets.chomp
    @filename = "#{name}.csv"
end

def save_students
    # open file to write to
    # file = File.open("students.csv", "w")
    name_file
    # file = File.open(@filename, "w")
    
    # @students.each do |student|
    #     student_data = [student[:name], student[:cohort]]
    #     csv_line = student_data.join(",")
    #     file.puts csv_line
    # end
    # file.close
    
    f = File.open(@filename, "w") do |f|
        
        @students.each do |student|
            student_data = [student[:name], student[:cohort]]
            csv_line = student_data.join(",")
            f.puts csv_line
        end
    end
end

#  while !name.empty? do
#         students << {name: name, cohort: :november}
#         puts "Now we have #{students.count} students"
#         name = STDIN.gets.chomp
#     end

def load_students(filename = "students.csv")
    name_file
    # file = File.open(@filename, "r")
    # file.readlines.each do |line|
    #     name, cohort = line.chomp.split(',')
    #     # @students << {name: name, cohort: cohort.to_sym}
    #     add_student(name, cohort.to_sym)
    # end
    # file.close
    
    # f = File.open(@filename, "r") do |f|
    #     f.readlines.each do |line|
    #         name, cohort = line.chomp.split(',')
    #         add_student(name, cohort.to_sym)
    #     end
    # end
    
    CSV.foreach("students.csv") do |line|
        name, cohort = line
        add_student(name, cohort.to_sym)
    end
    
end

def try_load_students
    filename = ARGV.first #first argument from command line
    return if filename.nil?
    if File.exist?(filename)
        load_students(filename)
        puts "Loaded #{@students.count} from #{filename}"
    else
        puts "Sorry, #{filename} doesn't exist."
        exit
    end
end

try_load_students
interactive_menu
