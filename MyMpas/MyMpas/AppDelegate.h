//
//  AppDelegate.h
//  MyMpas
//
//  Created by NongFei on 2016/11/28.
//  Copyright © 2016年 NongFei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

