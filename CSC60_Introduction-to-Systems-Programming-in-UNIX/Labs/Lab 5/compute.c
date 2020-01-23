/*This code will compute the area and the 
 * circumference of a circle*/

#include "lab5.h"
#include <math.h>

void compute(double radius, double *area, double *cir)
{
        *area = areaCalc(radius);
        *cir =  circumCalc(radius);
}

double areaCalc(double radius) 
{
        return (M_PI*(pow(radius,2.0)));
}

double circumCalc(double radius)
{       
        return (2.0*M_PI*radius);
}
