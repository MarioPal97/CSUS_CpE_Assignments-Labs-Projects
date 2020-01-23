/*-------------------------------------------------*/
/* Mario Palacios                                */
/* Lab 4                                           */
/* Figure the perimeter and area of a polygon      */
/* surrounded by a circle                          */

#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#define FILE_IN "lab4.dat"
//#define FILE_IN "lab4sample.dat"
#define DisplayLine "%7.2f%6s%7.2f%6s%9.4f%5s%9.4f\n"


int main(void)
{
    double radius, nSides, perimeter, area = 0;
    FILE *input_file;
    FILE *answer_file;

    input_file = fopen(FILE_IN,"r");
    if (input_file == NULL)
    {
		printf("Error on opening the data file\n");
        exit (EXIT_FAILURE);
    }

    answer_file = fopen ("lab4.out","w");
    if (answer_file == NULL)
    {
		printf("Error on opening the output file\n");
        exit (EXIT_FAILURE);
    }

	fprintf(answer_file, "\nMario Palacios.  Lab 4.\n\n");
	fprintf(answer_file, "            Number      Perimeter      Area Of  \n");
	fprintf(answer_file, " Radius    Of Sides    Of Polygon      Polygon  \n");
	fprintf(answer_file, "--------   --------   ------------   ----------- \n");
    
    while ((fscanf(input_file, "%lf %lf", &radius, &nSides)) == 2)
    {
        perimeter = (2.0*nSides*radius) * sin(M_PI/nSides);
        area = (0.5*nSides) * pow(radius,2.0) * sin((2.0*M_PI)/nSides);
        fprintf (answer_file,DisplayLine,radius,"",nSides,"",perimeter,"",area);
    }
  
    fclose(input_file);
    fclose(answer_file);

    return EXIT_SUCCESS;
    	
}
/*------------------------------------------------------------------*/
