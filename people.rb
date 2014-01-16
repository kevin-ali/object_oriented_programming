class Person
	def initialize(name)
		@name = name
	end

	def greeting 
		puts "Hi, my name is #{@name}"
	end
end




class Student < Person
	def learn
		puts "I get it!"
	end

end


class Instructor < Person
	def teach
		puts "Everything in Ruby is an object."
	end

end

instruct = Instructor.new("Chris")
puts instruct.greeting

stud = Student.new("Christina")
puts stud.greeting

instruct.teach
stud.learn

# stud.teach 		<---- This does not work because there is no teach method under the Student class.