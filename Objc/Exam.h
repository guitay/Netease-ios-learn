//
//  Exam.h
//  NetEase-iOS-Study
//
//  Created by NongFei on 16/10/28.
//  Copyright © 2016年 NongFei. All rights reserved.
//

@interface Process : NSObject
    @property (nonatomic) NSString *name;   // 进程名
    @property (nonatomic) NSArray<Process *> *children; // 子进程
- (instancetype)initWithName:(NSString*)name children:(NSArray<Process *> *)children ;
- (instancetype)initFromDumpString:(NSString*)dump;
- (NSString*)dump ;
@end
