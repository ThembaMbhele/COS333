#include<stdio.h>
#include<stdbool.h>

void populateMatrix(int matrix[5][5], int userInput, int rowTotal, int colTotal);
void print(int matrix[5][5], int rowTotal, int colTotal);
void search(int matrix[5][5], int rowTotal, int colTotal, int item);
int main()
{
	int rowTotal = 5, colTotal = 5, initializeCount = 1;
	
	//create 5x5 array
	int matrix[5][5] = 
	{
		{1,2,3,4,5},
		{6,7,8,9,10},
		{16,17,18,19,20},
		{21,22,23,24,25},
		{26,27,28,29,30}
	};
	
	int userInput = 0;
	printf("Enter number in the range 1 - 10: ");
	scanf("%d", &userInput);
	populateMatrix(matrix, userInput, rowTotal, colTotal);
	printf("Enter item to search for: ");
	scanf("%d", &userInput);
	search(matrix, rowTotal, colTotal, userInput);
	print(matrix, rowTotal, colTotal);
}

void print(int matrix[5][5], int rowTotal, int colTotal)
{
	for(int row = 0; row < rowTotal; ++row)
	{
		for(int col = 0; col < colTotal; ++col)
			printf("%d ", matrix[row][col]);
		
		printf("\n");
	}
}

void search(int matrix[5][5], int rowTotal, int colTotal, int item)
{
	int x, y;
	bool canBreak = false, found = false;
	for(int row = 0; row < rowTotal; ++row)
	{
		for(int col = 0; col < colTotal; ++col)
		{
			if(matrix[row][col] == item)
			{
				x = row;
				y = col;
				canBreak = true;
				found = true;
				break;
			}
		}
		if(canBreak)
			break;
	}
	
	if(found)
	{
		printf("Row: ");
		for(int i = 0; i < colTotal; ++i)
			printf("%d ", matrix[x][i]);
		
		printf("\n");
		printf("Column: ");
		for(int i = 0; i < rowTotal; ++i)
			printf("%d ", matrix[i][y]);
		printf("\n");
	}
	else
		print(matrix, rowTotal, colTotal);
}

void populateMatrix(int matrix[5][5], int userInput, int rowTotal, int colTotal)
{
	int total = 0;
	int diagonalOne = 0, diagonalTwo = 0;
	switch(userInput)
	{
		case 1:
			for(int col = 0; col < colTotal; ++col)
			{
				for(int row = 0; row < rowTotal; ++row)
					total += matrix[row][col];
				
				for(int i = 0; i < colTotal; ++i)
					matrix[i][col] = total;
				
				total = 0;
			}
			break;
		case 2:
			for(int row = 0; row < rowTotal; ++row)
			{
				for(int col = 0; col < colTotal; ++col)
					total += matrix[row][col];
				
				for(int i = 0; i < rowTotal; ++i)
					matrix[row][i] = total;
				
				total = 0;
			}
			break;
		case 4:
			for(int i = 0; i < colTotal; ++i)
			{
				diagonalOne += matrix[i][i];
				diagonalTwo += matrix[i][colTotal-(i+1)];
			}
			
			for(int i = 0; i < colTotal; ++i)
			{
				matrix[i][i] = diagonalOne+diagonalTwo;
				matrix[i][colTotal-(i+1)] = diagonalOne+diagonalTwo;
			}
			break;
		case 8:
			for(int row = 0; row < rowTotal; ++row)
			{
				for(int col = 0; col < colTotal; ++col)
				{
					if(matrix[row][col]%2 == 0)
						matrix[row][col] = matrix[row][col]*matrix[row][col];
					else if(matrix[row][col]%2 != 0)
						matrix[row][col] = matrix[row][col]*matrix[row][col]*matrix[row][col];
				}
			}
	}
}