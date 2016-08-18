#include<stdio.h>

void populateMatrix(int matrix[5][5], int userInput);
int main()
{
	int rowTotal = 5, colTotal = 5, initializeCount = 1;
	
	//create 5x5 array
	int matrix[rowTotal][colTotal];
	
	//initialize matrix
	for(int row = 0; row < rowTotal; ++row)
	{
		for(int col = 0; col < colTotal; ++col)
		{
			if(row == 2 && col == 0)
				initializeCount = 16;
			
			matrix[row][col] = initializeCount++;
		}
	}
	
	populateMatrix(matrix, 0);
	printf("test: %d \n", matrix[0][0]);
}

void populateMatrix(int matrix[5][5], int userInput)
{
	matrix[0][0] = 100;
}