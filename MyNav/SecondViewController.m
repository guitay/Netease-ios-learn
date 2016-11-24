//
//  SecondViewController.m
//  MyNav
//
//  Created by NongFei on 2016/11/19.
//  Copyright © 2016年 NongFei. All rights reserved.
//

#import "SecondViewController.h"
#import "LastViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"美食-饮料清仓专场";
    // Do any additional setup after loading the view from its nib.
    
    
    UIBarButtonItem *leftItem1 = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"back"] style:UIBarButtonItemStylePlain target:self action:@selector(goback)];
    
    UIBarButtonItem *leftItem2 = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"close"] style:UIBarButtonItemStylePlain target:self action:@selector(gotoRootView)];
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"detailShare"] style:UIBarButtonItemStylePlain target:self action:@selector(gotoLast:)];

    //添加到导航栏中
    self.navigationItem.leftBarButtonItems = @[leftItem1,leftItem2];
    
    self.navigationItem.rightBarButtonItems = @[rightItem];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)gotoLast:(id)sender {
    LastViewController * lastView = [[LastViewController alloc]init];
    [self.navigationController pushViewController:lastView animated:YES];
}

-(void)goback{
    [self.navigationController popViewControllerAnimated:YES];
}


-(void)gotoRootView{
    [self.navigationController popToRootViewControllerAnimated:YES];
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
