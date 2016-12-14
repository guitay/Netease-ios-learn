//
//  Exam.m
//  NetEase-iOS-Study
//
//  Created by NongFei on 16/10/28.
//  Copyright © 2016年 NongFei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Exam.h"

@implementation Process
- (instancetype)initWithName:(NSString*)name children:(NSArray<Process *> *)children {
    if (self = [super init]) {
        _name = name;
        _children = children;
    }
    return self;
}

- (NSMutableArray* )getNodeNames:(NSString *)dump {
    NSArray* pieces = [dump componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"├└"]];
    NSMutableArray* nodeNames = [[NSMutableArray alloc]initWithArray:pieces];
    for(int i=0;i<nodeNames.count;i++){
        NSString* nodeName = nodeNames[i];
        [nodeNames replaceObjectAtIndex:i withObject:[[[[nodeName stringByReplacingOccurrencesOfString:@"\n" withString:@""] stringByReplacingOccurrencesOfString:@"─" withString:@""]stringByReplacingOccurrencesOfString:@"│" withString:@""]stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]  ]
        ;
    }
    
    NSLog(@"\n nodeNames = %@",nodeNames);
    return nodeNames;
    
}


- (NSMutableString *)replaceNodeData:(NSString *)dump nodeNames:(NSMutableArray *)nodeNames {
    NSMutableString* dump2 = [[NSMutableString alloc] initWithString:dump];
    for(NSString * nodeName in nodeNames){
        dump2 = [[dump2 stringByReplacingOccurrencesOfString:nodeName withString:@"N"] mutableCopy];
    }
    NSLog(@"\n Replace dump with 'N' = %@",dump2);

    return dump2;
}

- (void)getIndexes:(NSMutableArray *)newLineIndexes nodeIndexes:(NSMutableArray *)nodeIndexes dump:(NSMutableString *)dump {
    for(int i=0;i<dump.length;i++){
        char c=[dump characterAtIndex:i];
        if(c=='N'){
            [nodeIndexes addObject:[NSNumber numberWithInt:i]];
        }
        if(c=='\n'){
            [newLineIndexes addObject:[NSNumber numberWithInt:i]];
        }
    }
    
    NSLog(@"\n nodeIndexes=%@",nodeIndexes);
    NSLog(@"\n newLineIndexes=%@",newLineIndexes);
}

- (void)getLevelValue:(NSMutableArray<NSNumber*> *)levelValues
          nodeIndexes:(NSMutableArray<NSNumber*> *)nodeIndexes
       newLineIndexes:(NSMutableArray<NSNumber*> *)newLineIndexes{
    for(int i=0;i<nodeIndexes.count;i++){
        int levelValue = [nodeIndexes[i] integerValue]-[newLineIndexes[i] integerValue];
        [levelValues addObject:[NSNumber numberWithInt:levelValue]];
    }
    NSLog(@"\n levelValues = %@",levelValues);
}

-(void) getChild2ParentMapping:(NSMutableDictionary<NSNumber*,NSNumber*>*)child2ParentMapping     levelValues : (NSMutableArray*) levelValues{
    int lvlValueSize = [levelValues count];
    for(int i=lvlValueSize-1;i>=0;i--){
        int levelValue = [levelValues[i] integerValue];
        for(int j=i-1;j>=0;j--){//从后向前遍历
            int backwardLevelValue = [levelValues[j] integerValue];
            if(levelValue>backwardLevelValue){//第一个小于levelValue的为父级
                NSNumber* child = [NSNumber numberWithInt:j];
                NSNumber* parent = [NSNumber numberWithInt:i];
                [child2ParentMapping setObject:child forKey:parent];
                break;
            }
        }
    }
    NSLog(@"\n child2ParentMapping = %@",child2ParentMapping);
}


-(void) getParent2ChildMapping:(NSMutableDictionary<NSNumber*,NSMutableArray<NSNumber*>*>*) parent2ChildMapping
          child2ParentMapping : (NSMutableDictionary<NSNumber*,NSNumber*>*)child2ParentMapping {
    for (NSNumber* child in child2ParentMapping) {
        id parent = child2ParentMapping[child];
        
        NSMutableArray<NSNumber*>* pcmObj = parent2ChildMapping[parent];
        if(pcmObj==nil){
            NSMutableArray<NSNumber*>* childrenList = [[NSMutableArray alloc]init];
            [childrenList addObject:child];
            [parent2ChildMapping setObject:childrenList forKey:parent];
        }else{
            [pcmObj addObject:child];
        }
    }
    NSLog(@"\n parent2ChildMapping = %@",parent2ChildMapping);

}

-(Process*) getProcessObj:(NSMutableDictionary<NSNumber*,NSMutableArray<NSNumber*>*>* )parent2ChildMapping
                nodeNames:(NSMutableArray*) nodeNames{
    NSNumber* rootIndex = [NSNumber numberWithInt:0];
//    NSMutableArray<NSNumber*>* rootChildren = parent2ChildMapping[rootIndex];
    Process* rootProcess = [[Process alloc]init];
    rootProcess.name=nodeNames[0];
    [self getProcessChildren:rootProcess parentNodeIndex:@0 parent2ChildMapping:parent2ChildMapping nodeNames:nodeNames];
    
    return rootProcess;
    
}


-(void)getProcessChildren:(Process*)parent
          parentNodeIndex:(NSNumber*)parentNodeIndex
      parent2ChildMapping:(NSMutableDictionary<NSNumber*,NSMutableArray<NSNumber*>*>* )parent2ChildMapping
                nodeNames:(NSMutableArray*) nodeNames
{
    NSMutableArray<Process*>* children = [[NSMutableArray alloc]init];
    NSMutableArray<NSNumber*>* childrenArray= parent2ChildMapping[parentNodeIndex];
    for(NSNumber* childInt in childrenArray){
        Process* childP = [[Process alloc]init];
        childP.name=[nodeNames objectAtIndex:[childInt integerValue] ];
        [children addObject:childP];
        if(parent2ChildMapping[childInt]!=nil){
            [self getProcessChildren: childP parentNodeIndex:childInt parent2ChildMapping:parent2ChildMapping nodeNames:nodeNames];
            
        }
    }
    [parent setChildren:children];
}


- (instancetype)initFromDumpString:(NSString*)dump {
    NSMutableArray* nodeNames = [self getNodeNames:dump];//取得所有节点名字
    NSMutableString *dump2 = [self replaceNodeData:dump nodeNames:nodeNames];//将所有节点文字替换为"N"
    NSMutableArray* nodeIndexes = [[NSMutableArray alloc] init];//节点index
    NSMutableArray* newLineIndexes = [[NSMutableArray alloc] init];//换行符index
    [self getIndexes:newLineIndexes nodeIndexes:nodeIndexes dump:dump2];
    
    NSMutableArray* levelValues = [[NSMutableArray alloc] init];//节点级别值
    [self getLevelValue:levelValues nodeIndexes:nodeIndexes newLineIndexes:newLineIndexes];//计算节点级别值
    
    NSMutableDictionary<NSNumber*,NSNumber*>* child2ParentMapping = [[NSMutableDictionary alloc]init];//子节点到父节点映射
    [self getChild2ParentMapping:child2ParentMapping levelValues:levelValues];//计算子节点到父节点映射
    NSMutableDictionary<NSNumber*,NSMutableArray<NSNumber*>*>* parent2ChildMapping = [[NSMutableDictionary alloc]init];//父节点到子节点映射
    [self getParent2ChildMapping:parent2ChildMapping child2ParentMapping:child2ParentMapping];//计算父节点到子节点映射
    
    Process* process = [self getProcessObj:parent2ChildMapping nodeNames:nodeNames];
    
    return process;
}

- (NSString*)dump {
    NSMutableString * mstr = [[NSMutableString alloc] initWithFormat:@"\n%@",_name];
    NSInteger count = [_children count];
    
    for(int i=0;i<count;i++){
        Process * child = _children[i];
        NSString* childStr;
        if(i==count-1){
            childStr =[[NSString alloc]initWithFormat: @"\n└─ %@",child.name];
        }else{
            childStr = [[NSString alloc]initWithFormat:@"\n├─ %@",child.name];
        }
        
        [mstr appendString:childStr];
        
        if([[child children] count] > 0){
            NSString* childRet = [child dump];
            NSRange range = [childRet rangeOfString:child.name];
            NSString* string1 = [childRet substringFromIndex:(range.location+child.name.length)];
            string1=[string1 stringByReplacingOccurrencesOfString:@"\n" withString:@"\n│  "];
            [mstr appendString:string1];
        }
    }
    return [[NSString alloc ] initWithString:mstr];
}
@end
