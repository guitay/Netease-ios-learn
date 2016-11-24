//
//  TableViewController.m
//  MyTable
//
//  Created by NongFei on 2016/11/21.
//  Copyright © 2016年 NongFei. All rights reserved.
//

#import "TableViewController.h"
#import "CustomTableViewCell.h"

@interface TableViewController ()
@property (nonatomic, strong) NSArray *sections;

@property (nonatomic, strong) NSArray *rows;

@property (nonatomic, strong) NSArray *prices;

@property (nonatomic, strong) NSArray *counts;



@end

@implementation TableViewController

//组装导航栏按钮
- (void)composeEditItems {
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    int cartItemCount=0;//购物车商品数量
    for(NSArray *arr in _rows){
        int arrLen = [[NSNumber numberWithUnsignedInteger:[arr count]] intValue];
        cartItemCount +=arrLen;
    }
    
    self.title = [NSString stringWithFormat:@"购物车(%i)",cartItemCount];
    
    UIBarButtonItem *editItem = [[UIBarButtonItem alloc]initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:nil action:nil];
    
    UIBarButtonItem *commentItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"comment"] style:UIBarButtonItemStylePlain target:nil action:nil];
    
    //添加到导航栏中
    self.navigationItem.rightBarButtonItems = @[commentItem,editItem];
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    _sections=@[@"仓库1", @"仓库2"];
    _rows=@[@[ @"商品1", @"商品2  扫地机器人家用吸尘器 全自动 智能 远程控制 高端 大气 上档次 无敌 情怀 逼格高", @"商品3" ],@[ @"商品4", @"商品5" ],];
    _prices=@[@[ @100.0f, @123.2f, @45.5f ],@[ @344.4f, @518.8f ],];
    _counts=@[@[ @1, @1, @2 ],@[ @3, @1 ],];


    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    [self composeEditItems];
    [self genTableFooterView];
    
    self.tableView.editing = YES;
    self.tableView.allowsMultipleSelectionDuringEditing = YES;


}

-(void)genTableFooterView{

    
    //    self.tableView.separatorColor = [UIColor redColor];
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    NSLog(@"%f",self.view.frame.size.height);
    UIView* footerView = [[UIView alloc] initWithFrame:CGRectMake(0,self.view.frame.size.height, 320, 60)];
    
    [footerView setBackgroundColor:[UIColor whiteColor]];
    
    UILabel *totalLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.view.frame.size.width-180, 0, 170, 60)];
    [totalLabel setText:@"总价:¥506.69"];
    [totalLabel setFont:[UIFont systemFontOfSize:14.f]];
    UIButton *sumBtn = [[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width-80, 0, 80, 60)];
    [sumBtn setTitle:@"结算" forState:UIControlStateNormal];
    [sumBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [sumBtn setBackgroundColor:[UIColor redColor]];
    //    [sumBtn addConstraint:[NSLayoutConstraint constraintWithItem:sumBtn attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:sumBtn attribute:NSLayoutAttributeTrailing multiplier:1.f constant:8.f]];
    [footerView addSubview:totalLabel];
    [footerView addSubview:sumBtn];
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
    CustomTableViewCell *customViewCell = [self genCustomCell];
    
    NSArray *rowArray = self.rows[indexPath.section];
    NSString *title = rowArray[indexPath.row];
    
    NSArray *priceArray = self.prices[indexPath.section];
    NSNumber *price = priceArray[indexPath.row];
    
    NSArray *countArray = self.counts[indexPath.section];
    NSNumber *count = countArray[indexPath.row];
    
    
//    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
//    cell.textLabel.text = title;
//    cell.textLabel.numberOfLines = 0;
//    cell.detailTextLabel.text=@"扫地机器人家用吸尘器全自动智能拖地机";
//    cell.accessoryType = UITableViewCellAccessoryDetailButton;
//    cell.imageView.image = [UIImage imageNamed:@"product"];

    [customViewCell.productDetailLabel setText:title];
    [customViewCell.productPriceLabel setText:[NSString stringWithFormat:@"%@",price]];
    [customViewCell.productCountLabel setText:[NSString stringWithFormat:@"%@",count]];
    
//    CustomTableViewCell.images.
    
    return customViewCell;
}

-(CustomTableViewCell*)genCustomCell{
    NSArray *topLevelObjects = [[NSBundle mainBundle]loadNibNamed:@"CustomTableViewCell" owner:nil options:nil];
    return [topLevelObjects objectAtIndex:0];
}

- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString *sectionTitle = self.sections[section];
//    sectionTitle = [sectionTitle stringByAppendingString:@" Header"];
    return sectionTitle;
}

- (nullable NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    NSString *sectionTitle = self.sections[section];
    sectionTitle = [sectionTitle stringByAppendingString:@" Footer"];
    return sectionTitle;
}

//- (nullable NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView
//{
//    return self.sections;
//}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        NSMutableArray *sections = [self.rows mutableCopy];
        NSMutableArray *rows = [sections[indexPath.section]mutableCopy];
        [rows removeObjectAtIndex:indexPath.row];
        sections[indexPath.section] = rows;
        self.rows = sections;
        
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
        
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/



#pragma mark - UITableViewDelegate

// Section header & footer information. Views are preferred over title should you decide to provide both

// custom view for header. will be adjusted to default or specified header height

//- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
//    return nil;
//}
// custom view for footer. will be adjusted to default or specified footer height
- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    static NSString *CellIdentifier = @"SectionFooter";
    UITableViewCell *footerView = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (footerView == nil){
        [NSException raise:@"footerView == nil.." format:@"No cells with matching CellIdentifier loaded from your storyboard"];
    }
    UILabel *label = (UILabel *)[footerView viewWithTag:8];
    [label setText:@"123"];
    
    return footerView;
    
}

-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleDelete;// | UITableViewCellEditingStyleInsert;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return YES if you want the specified item to be editable.
    return YES;
}

@end
