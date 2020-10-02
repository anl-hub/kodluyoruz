require 'json'
file = File.read('grades.json')
grades=JSON.parse(file)

$totalGrades = 0
for i in 0..grades.size-1
	$totalGrades += grades[i]["grade"]
end
averageGrades =$totalGrades /grades.size
puts "Average grade is #{averageGrades}"

passList=""
failList=""
for i in 0..grades.size-1
	if grades[i]["grade"]>=averageGrades
	   if passList == ""
			passList +=grades[i]["name"]
	   else
			passList+="," +grades[i]["name"]
	   end
	else 
	   if failList == ""
		 failList +=grades[i]["name"]
	   else
		 failList += ", "+grades[i]["name"]
	   end
	end
end

puts "#{failList} are failed"
puts "#{passList} are passed"