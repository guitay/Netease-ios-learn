#import "TabBarViewController.h"
#import "IndexViewController.h"
#import "ClientViewController.h"
#import "PerformanceViewController.h"
#import "MeNavigationController.h"

@implementation TabBarViewController


-(IndexViewController*)getIndexViewController{
    IndexViewController* viewControll = [[UIStoryboard storyboardWithName:@"Index" bundle:nil] instantiateViewControllerWithIdentifier:@"IndexViewController"];
//    [self presentViewController:viewControll animated:YES completion:^{;}];
    
    return viewControll;
    
}

-(ClientViewController*)getClientViewController{
    ClientViewController* viewControll = [[UIStoryboard storyboardWithName:@"Client" bundle:nil] instantiateViewControllerWithIdentifier:@"ClientViewController"];
    //    [self presentViewController:viewControll animated:YES completion:^{;}];
    
    return viewControll;
    
}


-(PerformanceViewController*)getPerformanceViewController{
    PerformanceViewController* viewControll = [[UIStoryboard storyboardWithName:@"Performance" bundle:nil] instantiateViewControllerWithIdentifier:@"PerformanceViewController"];
    //    [self presentViewController:viewControll animated:YES completion:^{;}];
    
    return viewControll;
    
}

-(MeNavigationController*)getMeNavigationController{
    MeNavigationController* viewControll = [[UIStoryboard storyboardWithName:@"Me" bundle:nil] instantiateViewControllerWithIdentifier:@"MeNavigationController"];
    //    [self presentViewController:viewControll animated:YES completion:^{;}];
    
    return viewControll;
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    IndexViewController *indexView = [self getIndexViewController];
    ClientViewController *clientView = [self getClientViewController];
    PerformanceViewController *performaceView = [self getPerformanceViewController];
    MeNavigationController *meView = [self getMeNavigationController];
    
    self.viewControllers = @[indexView, clientView, performaceView, meView];
    
    indexView.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"首页" image:[UIImage imageNamed:@"foot_index"] selectedImage:nil];
    clientView.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"客户" image:[UIImage imageNamed:@"foot_client" ] selectedImage:nil];
    performaceView.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"绩效" image:[UIImage imageNamed:@"foot_performance"] selectedImage:nil];
    meView.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"我" image:[UIImage imageNamed:@"foot_me"] selectedImage:[UIImage imageNamed:@"foot_me_selected"]];

    self.delegate = self;
    
//    self.tabBar.tintColor = [UIColor redColor]; 

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
