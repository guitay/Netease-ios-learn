//
//  main.m
//  NetEase-iOS-Study
//
//  Created by NongFei on 16/10/28.
//  Copyright © 2016年 NongFei. All rights reserved.
//


/* 输出
 Launcher
 ├─ Xcode
 │  ├─ Simulator
 │  │  ├─ S1
 │  │  │  └─ S2
 │  │  └─ S3
 │  └─ Debugger
 ├─ Finder
 └─ QQ
 */


#import <Foundation/Foundation.h>
#import "Exam.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Process* s1 = [[Process alloc] initWithName:@"S1" children:@[[[Process alloc] initWithName:@"S2" children:nil]]];
        Process* s2 = [[Process alloc] initWithName:@"S3" children:nil];
        Process* xcode = [[Process alloc] initWithName:@"Xcode"
                                              children:@[[[Process alloc] initWithName:@"Simulator" children:@[s1,s2]],[[Process alloc] initWithName:@"Debugger" children:nil]]];
        Process* finder = [[Process alloc] initWithName:@"Finder" children:nil];
        Process* qq = [[Process alloc] initWithName:@"QQ" children:nil];
        Process* launcher = [[Process alloc] initWithName:@"Launcher" children:@[xcode, finder, qq]];
        
        NSString* content = [launcher dump];
        NSLog(@"\nProcess* to DumpString ----> %@", content);

        Process* process = [launcher initFromDumpString:content];
        NSLog(@"\nDumpString to Process* %@",process);
    }
    return 0;
}
