module TeamsHelper

	def create_teams
		# this tells us how many teams we want
	    @num_teams = params[:num]

	    # now get all the students. divide the num of students by the num of teams
	    @students = Student.all

	    # create an array of student ids
	    student_arr = Array.new

	    @students.each do |student|
	      student_arr.push(student.id)
	    end

	    # how many students per team? is there a remainder
	    students_per_team = @students.length.to_i / @num_teams.to_i

	    # create an array of team ids depending on many teams we have
	    team_arr = Array.new

	    for i in 1..@num_teams.to_i
	      team_arr.push(i)
	    end

	    # now that we have an array that contains our students, and an array that contains our teams, 
	    # we need to go back and loop through the students one more time and start assigning them to 
	    # teams. we will need a new HASH that will tell us if each team has enough students
	    # if a team has enough students, we won't add to that team
	    
	    #**********************
	    # note: code below here is untested and unfinished

	    #**********************

	    hash_counter = create_empty_hash @num_teams

		studentsstr = ''
	    team_arr.each do |team_num|

	    	for i in 1..students_per_team
	    		rand_num = rand(student_arr.length)

	    		student_id = student_arr[rand_num]

	    		studentsstr = student_id.to_s + ', ' + studentsstr

	    		# remove this from the student array so it's not used again
	    		student_arr.delete(rand_num)
	    		puts "array!"
	    		puts student_arr
	    	end
	    	
	    	# increment our team counter by 1. when we're at or above, the quota
	    	# we'll break out of this loop

	    end
	    
	    render :text => studentsstr
	end
	def create_empty_hash num_teams
      empty_hash = Hash.new


      for i in 1..@num_teams.to_i
        empty_hash[i] = 0
      end
     
      empty_hash
    end
end
