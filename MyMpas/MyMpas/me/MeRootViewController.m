#import "MeRootViewController.h"
#import "models.h"

@implementation MeRootViewController 


- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"我";
    
    _sections=@[@"我"];

    MeTableCell *cell1 = [[MeTableCell alloc]initWithTitle:@"最新消息" image:@"" target:@"NewsViewController"];
    MeTableCell *cell2 = [[MeTableCell alloc]initWithTitle:@"提醒设置" image:@"" target:@"AlertCfgViewController"];
    MeTableCell *cell3 = [[MeTableCell alloc]initWithTitle:@"意见反馈" image:@"" target:@"FeedBackViewController"];
    MeTableCell *cell4 = [[MeTableCell alloc]initWithTitle:@"关于我们" image:@"" target:@"AboutUsViewController"];

    _rows=@[@[ cell1,cell2,cell3,cell4],];

    self.title=@"我";
    [self genTableFooterView];
    // self.tableView.editing = YES;
}

-(void)genTableFooterView{
    //    self.tableView.separatorColor = [UIColor redColor];
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    NSLog(@"%f",self.view.frame.size.height);

    UIView* footerView = [[UIView alloc] initWithFrame:CGRectMake(0,self.view.frame.size.height, 320, 200)];
    [footerView setBackgroundColor:[UIColor whiteColor]];
    
    UIButton *logoutBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 0, 30)];
    [logoutBtn setTitle:@"退出系统" forState:UIControlStateNormal];
    [logoutBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [logoutBtn setBackgroundColor:[UIColor blueColor]];

    UIImage *qrcode = [UIImage imageNamed:@"qrcode"];


//    [NSLayoutConstraint constraintWithItem:logoutBtn
//    											attribute:NSLayoutAttributeWidth
//    											relatedBy:NSLayoutRelationEqual 
//    											toItem:logoutBtn
//    											attribute:NSLayoutAttributeWidth
//    											multiplier:1.f 
//    											constant:self.view.frame.size.width];
//    [[NSLayoutConstraint constraintWithItem:qrcode 
//    											attribute:Top 
//    											relatedBy:NSLayoutRelationEqual 
//    											toItem:logoutBtn
//    											attribute:Bottom 
//    											multiplier:1.f 
//    											constant:Standard] active];
//    [[NSLayoutConstraint constraintWithItem:qrcode 
//    											attribute:NSLayoutLeading 
//    											relatedBy:NSLayoutRelationEqual 
//    											toItem:qrcode 
//    											attribute:NSLayoutLeading 
//    											multiplier:1.f 
//    											constant:[(self.view.frame.size.width-qrcode.width)/2]] active];

    [footerView addSubview:logoutBtn];
    [footerView addSubview:qrcode];
    self.tableView.tableFooterView =footerView;

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.sections.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *rowArray = self.rows[section];
    return rowArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
   NSArray<MeTableCell*> *rowArray = self.rows[indexPath.section];
   NSString *title = rowArray[indexPath.row].title;
   NSString *imageName = rowArray[indexPath.row].imageName;
   NSString *targeView = rowArray[indexPath.row].targetView;
    
   UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
   cell.textLabel.text = title;
   cell.textLabel.numberOfLines = 0;
//    cell.detailTextLabel.text=@"扫地机器人家用吸尘器全自动智能拖地机";
   cell.accessoryType = UITableViewCellAccessoryDetailButton;
   cell.imageView.image = [UIImage imageNamed:imageName];
   [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator ];
//   [cell setAccessoryView:<#(UIView * _Nullable)#>:@select(referenceTime)];
    
   return cell;
}

-(void) referenceTime
{
 UIAlertView *al = [[UIAlertView alloc] initWithTitle:@"hi" message:@"hi" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil];
 [al show];
}
@end