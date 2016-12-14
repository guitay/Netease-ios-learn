//
//  fruits.h
//  NetEase-iOS-Study
//
//  Created by NongFei on 16/10/6.
//  Copyright © 2016年 NongFei. All rights reserved.
//

#ifndef fruits_h
#define fruits_h


#endif /* fruits_h */
#import <Foundation/Foundation.h>

@interface Fruit : NSObject
@property double price;
-(void) getPrice:(NSNumber*) price
            name:(NSString*) name;
-(NSArray<NSNumber *> *) sorted:(NSArray<NSNumber *> *)array;
@end
