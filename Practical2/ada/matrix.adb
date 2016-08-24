with Ada.Text_IO, Ada.Integer_TEXT_IO;
use Ada.Text_IO, Ada.Integer_TEXT_IO;

procedure matrix is
	matrix : array(INTEGER range 0..4, INTEGER range 0..4) of INTEGER;
	initializeCount : INTEGER;
	userInput : String(1..80);
	finalInput : Integer;
	last : Natural;
	procedure printMatrix is 
		begin
			for row in 0..4 loop
				for col in 0..4 loop
					Put(matrix(row,col), 8);
				end loop;
				New_Line;
			end loop;
		end printMatrix;
			
	procedure searchMatrix(item : Integer) is
		found : Boolean;
		x : Integer;
		y : Integer;
	
		begin
			found := false;
			for row in 0..4 loop
				for col in 0..4 loop
					if(matrix(row,col) = item) then
						found := true;
						x := row;
						y := col;
						exit;
					end if;
				end loop;
				if(found) then
					exit;
				end if;
			end loop;
				
			if(found) then
				put_line("Row: ");
				for col in 0..4 loop
					Put(Matrix(x,col), 8);
				end loop;
				new_line(1);	
				put_line("Col: ");
				for row in 0..4 loop
					Put(Matrix(row,y), 8);
				end loop;
			else
				printMatrix;
			end if;
	end searchMatrix;
			
	procedure populateMatrix(userInput : INTEGER) is
		total : Integer;
		diagonalOne : Integer;
		diagonalTwo : Integer;
		begin
			total := 0;
			diagonalOne := 0;
			diagonalTwo := 0;
			case userInput is
				when 1 =>	for col in 0..4 loop
								for row in 0..4 loop
									total := total + matrix(row,col);
								end loop;
								for i in 0..4 loop
									matrix(i,col) := total;
								end loop;
								total := 0;
							end loop;
				when 2 =>	for row in 0..4 loop
								for col in 0..4 loop
									total := total + matrix(row, col);
								end loop;
								for i in 0..4 loop
										matrix(row,i) := total;
								end loop;
								total := 0;
							end loop;
				when 4 =>	for i in 0..4 loop
								diagonalOne := diagonalOne + matrix(i,i);
								diagonalTwo := diagonalTwo + matrix(i, 4-i);
							end loop;
							for i in 0..4 loop
								matrix(i,i) := diagonalOne + diagonalTwo;
								matrix(i, 4-i) := diagonalOne + diagonalTwo;
							end loop;
				when 8 => 	for row in 0..4 loop
								for col in 0..4 loop
									if(matrix(row,col) mod 2 = 0) then
										matrix(row,col) := matrix(row,col)*matrix(row,col);
									else
										matrix(row,col) := matrix(row,col)*matrix(row,col)*matrix(row,col);
									end if;
								end loop;
							end loop;
				when others => Ada.Text_IO.Put_Line("Halla!!Bye");
			end case;
		end populateMatrix;
			
begin
	initializeCount := 1;
	for row in 0..4 loop
		for col in 0..4 loop
			if row = 2 and col = 0 then
				initializeCount := 16;
			end if;
			matrix(row,col) := initializeCount;
			initializeCount := initializeCount + 1;
		end loop;
	end loop;
	
	Ada.Text_IO.Put_Line("Enter number in the range 1 - 10: ");
	Ada.Text_IO.Get_Line(userInput, last);
	--Ada.Text_IO.Put_Line(userInput (1..last));
	
	if(userInput(1..last) = "3" or userInput(1..last) = "1") then
		populateMatrix(1);
	end if;
	if(userInput(1..last) = "2") then
		populateMatrix(2);
	end if;
	if(userInput(1..last) = "4" or userInput(1..last) = "5" or userInput(1..last) = "6" or userInput(1..last) = "7") then
		populateMatrix(4);
	end if;
	if(userInput(1..last) = "8" or userInput(1..last) = "9" or userInput(1..last) = "10") then
		populateMatrix(8);
	end if;
	Ada.Text_IO.Put_Line("Enter item to search for: ");
	Ada.Text_IO.Get_Line(userInput, last);
	finalInput := Integer'Value(userInput(1..last));
	searchMatrix(finalInput);
	new_line(2);
	printMatrix;
end matrix;