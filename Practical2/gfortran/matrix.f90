program matrix
	implicit none
	Integer :: row
	INTEGER :: col
	integer :: initializeCount
	integer :: userInput
	integer, dimension(5,5) :: myMatrix

	initializeCount = 1

	do row = 1, 5
		do col = 1, 5
			if(row == 3 .and. col == 1) then
				initializeCount = 16
			end if
			myMatrix(row,col) = initializeCount
			initializeCount = initializeCount + 1
		end do
	end do
	
	print *, "Enter number in the range 1-10: "
	read *, userInput
	
	if(userInput == 3) then
		userInput = 1
	end if
	
	if(userInput == 5 .or. userInput == 6 .or.  userInput ==7) then
		userInput = 4
	end if
	
	if(userInput == 9 .or. userInput == 10) then
		userInput = 8
	end if
	
	call populateMatrix(myMatrix, userInput)
	call printMatrix(myMatrix)
	call searchMatrix(myMatrix, 16)
end program matrix

subroutine printMatrix(m)
implicit none
	integer, dimension(5,5) :: m
	integer :: row
	integer :: col
	
	do row = 1, 5
		print *, (m(row,col), col = 1, 5)
	end do
end subroutine printMatrix

subroutine searchMatrix(m, item)
implicit none
	integer, dimension(5,5) :: m
	integer :: row
	integer :: col
	integer :: x
	integer :: y
	integer :: item
	logical :: found
	
	searchLoop: do row = 1, 5
				do col = 1, 5
					if(m(row,col) == item) then
						x = row
						y = col
						found = .true.
						exit searchLoop
					end if
				end do
			end do searchLoop
			
	if(found) then
		print *, "row:"
		print *, (m(x,col), col = 1,5)
		print *, "col:"
		print *, (m(row,y), row = 1,5)
	end if
end subroutine

subroutine populateMatrix(m, userInput)
implicit none
	integer, dimension(5,5) :: m
	integer  :: userInput
	integer  :: total
	integer  :: row
	integer  :: col
	integer  :: i
	integer  :: diagonalOne
	integer  :: diagonalTwo
	
	total = 0
	diagonalOne = 0
	diagonalTwo = 0
	
	select case (userInput)
		case (1)
			do col = 1, 5
				do row = 1, 5
					total = total + m(row,col)
				end do
				do i = 1, 5
					m(i,col) = total
				end do
				total = 0
			end do
		case (2)
			do row = 1, 5
				do col = 1, 5
					total = total + m(row,col)
				end do
				do i = 1, 5
					m(row,i) = total
				end do
				total = 0
			end do
		case (4)
			do i = 1, 5
				diagonalOne = diagonalOne + m(i,i)
				diagonalTwo = diagonalTwo + m(i,6-i)
			end do
			do i = 1, 5
				m(i,i) = diagonalOne + diagonalTwo
				m(i,6-i) = diagonalOne + diagonalTwo
			end do
		case (8)
			do row = 1, 5
				do col = 1, 5
					if(mod(m(row,col), 2) == 0) then
						m(row,col) = m(row,col)*m(row,col)
					else
						m(row,col) = m(row,col)*m(row,col)*m(row,col)
					end if
				end do
			end do
	end select
end subroutine