//
//  Complex.m
//  NetEase-iOS-Study
//
//  Created by NongFei on 2016/10/9.
//  Copyright © 2016年 NongFei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Complex.h"

@implementation Complex

double aa;
double bb;

-(void) setReal: (double) a
{
    aa = a;
}
-(void) setImaginary: (double) b
{
    bb = b;
}
-(void) print // display as a + bi
{
    NSLog(@"%g+%gi",aa,bb);
}
-(double) real
{
    return aa;
}
-(double) imaginary
{
    return bb;
}
-(void) add
{
    NSLog(@"aa+bb = %g",aa+bb);
}
-(void) subtract
{
    NSLog(@"aa-bb = %g",aa-bb);
}
-(void) multiply
{
    NSLog(@"aa*bb = %g",aa*bb);
}
-(void) divide
{
    NSLog(@"aa/bb = %g",(aa/bb));
}


@end