#import <Foundation/Foundation.h>

void exercise42(double f)
{
	//formula:C = (F - 32) / 1.8
    double result = ((f-32)/1.8);
	NSLog(@"%f F equals %f C ",f, result);
}

void exercise43()
{
	char c, d;
	c = 'd';
	d = c;
	NSLog (@"d = %c", d); //output:d=d
}

void exercise44(double x)
{
	//3x 3 - 5x 2 + 6
	//for x = 2.55
    double result = (3*x*x*x-5*x*x+6);
	NSLog (@"3x 3 - 5x 2 + 6 = %f", result); //output
}
void exercise45()
{
	//(3.31 x 10 -8 + 2.01 x 10 -7 ) / (7.16 x 10 -6 + 2.01 x 10 -8 )
    NSLog(@"(3.31 x 10 -8 + 2.01 x 10 -7 ) / (7.16 x 10 -6 + 2.01 x 10 -8 )=%f",(3.31e-8+2.01e-7)/(7.16e-6+2.01e-8 ));
}
