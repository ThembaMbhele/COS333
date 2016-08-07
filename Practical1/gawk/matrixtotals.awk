BEGIN	{ 	
			matrixTotal = 0
			rowCount = 0
			print "==================================\nRectangular matrix totals\n==================================\n\nInput file: ", ARGV[1], "\n"
		}
		{	
			columnCount = 0
			for(i = 0; i < length($0); ++i)
			{
				if(substr($0, i+1, 1) != ",")
				{
					k = 0
					while(substr($0, i+1+k, 1) != "," && k !=(length($0)-1))
						++k
						
					rowTotals[rowCount]+=substr($0, i+1, k)
					columnTotals[columnCount]+=substr($0, i+1, k)
					++columnCount
					i+=k
				}
			}
			matrixTotal+=rowTotals[rowCount]
			++rowCount
		}
END 	{
			for(i in rowTotals)
				print "Total for row ", i+1, ": ", rowTotals[i]
			
			print ""
			
			for(i in columnTotals)
				print "Total for column ", i+1, ": ", columnTotals[i]
			
			print ""
			print "Total for entire matrix: ", matrixTotal
		}
	
		
