#import "TabBarViewController.h"
#import "IndexViewController.h"
#import "ClientViewController.h"
#import "PerformanceViewController.h"
#import "MeNavigationController.h"

@implementation TabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    id (^getViewWithStoryName) (NSString*,NSString*);
    getViewWithStoryName=^(NSString* storyName ,NSString* viewName)
    {
        return [[UIStoryboard storyboardWithName:storyName bundle:nil] instantiateViewControllerWithIdentifier:viewName];;
    };
    IndexViewController *indexView = getViewWithStoryName(@"Index" ,@"IndexViewController");
    ClientViewController *clientView = getViewWithStoryName(@"Client",@"ClientViewController");
    PerformanceViewController *performaceView = getViewWithStoryName(@"Performance",@"PerformanceViewController");
    MeNavigationController *meView = getViewWithStoryName(@"Me",@"MeNavigationController");
    self.viewControllers = @[indexView, clientView, performaceView, meView];
    
    UITabBarItem* (^getTabBarItem)(NSString*,NSString*,NSString*);
    getTabBarItem = ^(NSString* title,NSString* image,NSString* selectedImage){
        return [[UITabBarItem alloc] initWithTitle:title image:[UIImage imageNamed:image] selectedImage:[UIImage imageNamed:selectedImage] ];
    };
    indexView.tabBarItem = getTabBarItem(@"首页" ,@"foot_index",@"foot_index_selected");
    clientView.tabBarItem = getTabBarItem(@"客户" ,@"foot_client" ,@"foot_client_selected");
    performaceView.tabBarItem = getTabBarItem(@"绩效" ,@"foot_performance",@"foot_performance_selected");
    meView.tabBarItem = getTabBarItem(@"我" ,@"foot_me",@"foot_me_selected");

    self.delegate = self;

//    [self presentViewController:indexView animated:YES completion:nil];

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
