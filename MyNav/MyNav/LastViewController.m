//
//  LastViewController.m
//  MyNav
//
//  Created by NongFei on 2016/11/19.
//  Copyright © 2016年 NongFei. All rights reserved.
//

#import "LastViewController.h"

@interface LastViewController ()

@end

@implementation LastViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"分享至";
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)gobackSecond:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
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
