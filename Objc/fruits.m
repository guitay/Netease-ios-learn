//
//  fruits.m
//  NetEase-iOS-Study
//
//  Created by NongFei on 16/10/6.
//  Copyright © 2016年 NongFei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "fruits.h"
@implementation Fruit
@synthesize price;
-(void)getPrice:(NSNumber*) price
           name:(NSString*) name
{
    //    NSLog(@"%s s price is ",name);
}

-(NSArray<NSNumber *> *) sorted:(NSArray<NSNumber *> *)array {
    NSInteger count = array.count;
    NSMutableArray<NSNumber *>* na = [[NSMutableArray alloc] initWithArray:array];
    NSLog(@"init na=%@",na);
    for(int i=0;i<count;i++){
        for(int j=0;j<count;j++){
            NSNumber* n1 = [na objectAtIndex:i];
            NSNumber* n2 = [na objectAtIndex:j];
            NSNumber* temp = [[NSNumber alloc]init];
            if([n1 isGreaterThan:n2]){
                temp = n1;
                n1=n2;
                n2=temp;
            }
            [na setObject:n1 atIndexedSubscript:i];
            [na setObject:n2 atIndexedSubscript:j];
        }
        NSLog(@"i=%i number array:%@",i,na);
    }
    
    return [[NSArray alloc] initWithArray:na];
}

@end
