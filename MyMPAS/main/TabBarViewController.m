#import "TabBarViewController.h"

@implementation TabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tabBar.tintColor = [UIColor redColor];
    
    UITabBarItem *index = self.tabBar.items[0];
    UITabBarItem *client = self.tabBar.items[1];
    UITabBarItem *performance = self.tabBar.items[2];
    UITabBarItem *me = self.tabBar.items[3];

    [index setImage:[UIImage imageNamed:@"index_normal"]];
    [index setSelectedImage:[UIImage imageNamed:@"index_selected"]];

    [index setImage:[UIImage imageNamed:@"client_normal"]];
    [index setSelectedImage:[UIImage imageNamed:@"client_selected"]];

    [index setImage:[UIImage imageNamed:@"performance_normal"]];
    [index setSelectedImage:[UIImage imageNamed:@"performace_selected"]];

    [index setImage:[UIImage imageNamed:@"me_normal"]];
    [index setSelectedImage:[UIImage imageNamed:@"me_selected"]];

//    [active setBadgeColor:[UIColor redColor]];
//    [active setBadgeValue:@""];
    
//    [self addBadgeView];

}

-(void) addBadgeView{

    UIView *badgeView = [[UIView alloc] init];
    badgeView.backgroundColor = [UIColor colorWithRed:0.82 green:0.16 blue:0.29 alpha:1];
    CGRect tabFrame = self.tabBar.frame;
    float percentX = (1 + 0.7)/5;
    CGFloat x = ceilf(percentX * tabFrame.size.width);
    CGFloat y = ceilf(0.1 * tabFrame.size.height);
    badgeView.frame = CGRectMake(x, y, 10, 10);
    badgeView.layer.cornerRadius = 5;
    [self.tabBar addSubview:badgeView];


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