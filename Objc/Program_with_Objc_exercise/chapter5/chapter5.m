#import <Foundation/Foundation.h>

/*Chapter 5 Exercise 1 (5.Ex1)*/
void exercise51(){
	NSLog(@"__n__  __n^2__")
	for(int i=1;i<=10;i++){
		NSLog(@"__ %i __  __  %i __",i,i^2);
	}
}

void exercise52(){
	//triangularNumber = n (n + 1) / 2
	int triangularNumber;
	for(int n=5;n<=50;n+=5){
		triangularNumber = n (n + 1) / 2;
		NSLog(@"%i ",triangularNumber);
	}
}

void exercise53(){
	int result=1;
	int i;
	scanf(@"%i",&i);
	
	for(;i<=1;--i){
		result* =i; 
	}
	NSLog(@"%i!=",result);
}

void exercise54(){
	NSLog(@"__n__  __n^2__")
	for(int i=1;i<=10;i++){
		NSLog(@"%-2i         %i\n",i,i^2);
	}
}


void exercise55(){
	int times = 1;
	int n;
	do{
		scanf("%i",&n);
		int triangularNumber = n (n + 1) / 2;
		NSLog(@"input number is %i.triangularNumber = n (n + 1) / 2 = %i",n,triangularNumber);
		++times;
	}while(times<=5)
}