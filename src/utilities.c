//
//  utilities.c
//  Applepihpsdr
//
//  Created by Michael Papp on 8/11/25.
//

#include "utilities.h"

#include <stdio.h> // Required for printf
#include <limits.h> // Required for INT_MIN and INT_MAX

// Function to convert a long long to an int
int convertLongLongToInt(long long value)
{
	int		result;
	
	// Check if the value is within the range of an int
	if (value < INT_MIN)
	{
		result = INT_MIN;
	}
	else if (value > INT_MAX)
	{
		result = INT_MAX;
	}
	else	// Explicitly cast the long long value to an int
	{
		result = (int)value;
	}
	return result;
}

