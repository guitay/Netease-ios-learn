//
//  ViewController.m
//  MyNav
//
//  Created by NongFei on 2016/11/19.
//  Copyright © 2016年 NongFei. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *searchResult;

@property (strong, nonatomic) UITextField *searchTxtField;
@property (weak, nonatomic) IBOutlet UILabel *scanLabel;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"First View";
    
    [_scanLabel setHidden:YES];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"qrIcon"] style:UIBarButtonItemStylePlain target:self action:@selector(scanQrAction)];
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"comment"] style:UIBarButtonItemStylePlain target:self action:@selector(commentAction)];
    
    
    [self setSearchTxtField];
    //添加到导航栏中
    self.navigationItem.leftBarButtonItems = @[leftItem];
    
    self.navigationItem.rightBarButtonItems = @[rightItem];
    
    [_searchResult setNumberOfLines:2];
    
}

-(void)scanQrAction{
    NSLog(@"scanQr.......");
    if([_scanLabel isHidden]){
        [_scanLabel setHidden:NO];
    }else{
        [_scanLabel setHidden:YES];
    }

}

-(void)commentAction{
    NSLog(@"commentAction....");
    [self gotoSecond:self];
}

- (void)setSearchTxtField {
    
    [self.searchResult setHidden:YES];
//    UITextField *searchTxtField=[[UITextField alloc]init];
    _searchTxtField=[[UITextField alloc]init];
    _searchTxtField.frame=CGRectMake(0, 0, 300, 35);
    //    [self.navigationController.navigationBar setBackgroundColor:[UIColor blackColor]];
    //设置背景图片
    [_searchTxtField setTextAlignment:NSTextAlignmentLeft];
    [_searchTxtField setBorderStyle:UITextBorderStyleRoundedRect];
    [_searchTxtField setPlaceholder:@"在千万海外商品中搜索"];
    [_searchTxtField setBackgroundColor:[UIColor clearColor]];

    //设置左边的放大镜
    UIButton *searchBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
    [searchBtn setBackgroundImage:[UIImage imageNamed:@"zoom"] forState:UIControlStateNormal];
    _searchTxtField.leftView=searchBtn;
    _searchTxtField.leftViewMode=UITextFieldViewModeAlways;
    //设置放大镜距离左边的间距，设置leftView的内容居中
    searchBtn.contentMode=UIViewContentModeCenter;
    
    //设置文字内容垂直居中
    _searchTxtField.contentVerticalAlignment=UIControlContentVerticalAlignmentCenter;
    
    [searchBtn addTarget:self action:@selector(searchAction:) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.titleView = _searchTxtField;

}

-(void)searchAction:(NSString*) key{
    NSLog(@"search......");
    [self.searchResult setHidden:NO];
    
    NSDate *currentDate = [NSDate date];
    NSDateFormatter *dateFormater = [[NSDateFormatter alloc]init];
    [dateFormater setDateFormat:@"YYYY-MM-dd HH:mm:ss.SS"];
    NSString* dateString = [dateFormater stringFromDate:currentDate];
    
    NSString *result = [NSString stringWithFormat:@"搜索结果：%@ \n搜索时间：%@",[_searchTxtField text],dateString];
    [self.searchResult setText:result];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)gotoSecond:(id)sender {
    SecondViewController* secondView = [[SecondViewController alloc]init];
    [self.navigationController pushViewController:secondView animated:YES];
}

@end
