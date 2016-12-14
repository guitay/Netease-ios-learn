//
//  Complex.h
//  NetEase-iOS-Study
//
//  Created by NongFei on 2016/10/9.
//  Copyright © 2016年 NongFei. All rights reserved.
//

#ifndef Complex_h
#define Complex_h


#endif /* Complex_h */

@interface Complex : NSObject

-(void) setReal: (double) a;
-(void) setImaginary: (double) b;
-(void) print; // display as a + bi
-(double) real;
-(double) imaginary;

-(void) add;
-(void) subtract;
-(void) multiply;
-(void) divide;

@end
