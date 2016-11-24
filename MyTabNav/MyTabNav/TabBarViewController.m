//
//  TabBarViewController.m
//  MyTabNav
//
//  Created by NongFei on 2016/11/20.
//  Copyright © 2016年 NongFei. All rights reserved.
//

#import "TabBarViewController.h"

@interface TabBarViewController ()

@end

@implementation TabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tabBar.tintColor = [UIColor redColor];
    
    UITabBarItem *index = self.tabBar.items[0];
    UITabBarItem *active = self.tabBar.items[1];
    UITabBarItem *catalog = self.tabBar.items[2];
    UITabBarItem *cart = self.tabBar.items[3];
    UITabBarItem *kola = self.tabBar.items[4];

    [index setImage:[UIImage imageNamed:@"index_normal"]];
    [index setSelectedImage:[UIImage imageNamed:@"index_selected"]];
    
    [active setImage:[UIImage imageNamed:@"active_normal"]];
    [active setBadgeColor:[UIColor redColor]];
    [active setBadgeValue:@""];
    [active setSelectedImage:[UIImage imageNamed:@"active_selected"]];
    
    [catalog setImage:[UIImage imageNamed:@"catalog_normal"]];
    [catalog setSelectedImage:[UIImage imageNamed:@"catalog_selected"]];
    
    [cart setImage:[UIImage imageNamed:@"cart_normal"]];
    [cart setSelectedImage:[UIImage imageNamed:@"cart_selected"]];
    
    [kola setImage:[UIImage imageNamed:@"kola_normal"]];
    [kola setSelectedImage:[UIImage imageNamed:@"kola_selected"]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
