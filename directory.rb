# first we print the list of students
students = [
"Dr. Hanibal Lecter",
"Darth Vader",
"Nurse Ratched",
"Michael Corleone",
"Alex DeLarge",
"The Wicked Witch of the West",
"Terminator",
"Freddy Kreger",
"The Joker",
"Jeoffrey Baratheon",
"Norman Bates"
]

puts "The students of Villains Academy"
puts "------------"

students.each do |student|
    puts student
end

# then we print the number of students
puts "Overall, we have #{students.count} great students"