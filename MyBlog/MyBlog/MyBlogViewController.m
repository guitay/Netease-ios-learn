//
//  MyBlogViewController.m
//  MyBlog
//
//  Created by NongFei on 2016/11/8.
//  Copyright © 2016年 NongFei. All rights reserved.
//

#import "MyBlogViewController.h"
#import "ArticleView.h"

@interface MyBlogViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *textBgImageView;
@property (weak, nonatomic) IBOutlet UITextField *blogTextField;
@property (weak, nonatomic) IBOutlet UIButton *deployButton;
@property (weak, nonatomic) IBOutlet UIView *articleContentView;

@end

@implementation MyBlogViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIImage* inputBgImage = [_textBgImageView.image resizableImageWithCapInsets:UIEdgeInsetsMake(12, 22, 12, 22) resizingMode:UIImageResizingModeStretch];
    [_textBgImageView setImage:inputBgImage];
    
    UIImage* buttonBgImage = [[UIImage imageNamed:@"button-green"] resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10, 10, 10) resizingMode:UIImageResizingModeStretch];
    [_deployButton setBackgroundImage:buttonBgImage forState:UIControlStateNormal];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)postButtonAction:(id)sender {
    [self.view endEditing:YES];
    if(_blogTextField.text.length==0){
        return;
    }
    NSDate *currentDate = [NSDate date];
    NSDateFormatter *dateFormater = [[NSDateFormatter alloc]init];
    [dateFormater setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    NSString* dateString = [dateFormater stringFromDate:currentDate];
    
    ArticleView* view = [[[UINib nibWithNibName:@"ArticleView" bundle:nil]instantiateWithOwner:nil options:nil]firstObject];
    [view.nameLabel setText:@"我"];
    [view.dateLabel setText:dateString];
    [view.contentLabel setText:_blogTextField.text];
    [_articleContentView addSubview:view];
    [self updateLastArticleViewFrame];
}

- (void)updateLastArticleViewFrame
{
    
    ArticleView* view = [_articleContentView.subviews lastObject];
    CGFloat offsetY=0;
    if(_articleContentView.subviews.count==1){
        offsetY = 12.f;
    }else{
        NSArray* viewArray = _articleContentView.subviews;
        UIView* preView = viewArray[viewArray.count-2];
//        offsetY = preView.frame.origin.y+preView.frame.size.height+12;
        offsetY = CGRectGetMaxY(preView.frame)+12;
    }
    
    CGFloat contentLabelHeight=[view.contentLabel sizeThatFits:CGSizeMake(CGRectGetWidth(_articleContentView.bounds)-46.f, CGFLOAT_MAX)].height;
    CGRect frame = CGRectMake(0, offsetY, CGRectGetWidth(_articleContentView.bounds), 39+contentLabelHeight);
    [view setFrame:frame];
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
