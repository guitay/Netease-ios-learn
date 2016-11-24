//
//  LoginViewController.m
//  MyBlog
//
//  Created by NongFei on 2016/11/8.
//  Copyright © 2016年 NongFei. All rights reserved.
//

#import "LoginViewController.h"
#import "MyBlogViewController.h"


@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *accountTextBgImageView;
@property (weak, nonatomic) IBOutlet UITextField *accountTextField;
@property (weak, nonatomic) IBOutlet UIImageView *passwordTextBgImageView;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UIImageView *tipImageView;
@property (weak, nonatomic) IBOutlet UILabel *tipMsgLabel;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *loadingIndicatorView;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIImage* inputBgImage = [_accountTextBgImageView.image resizableImageWithCapInsets:UIEdgeInsetsMake(12, 22, 12, 22) resizingMode:UIImageResizingModeStretch];
    [_accountTextBgImageView setImage:inputBgImage];
    [_passwordTextBgImageView setImage:inputBgImage];
    
    UIImage* buttonBgImage = [[UIImage imageNamed:@"button-green"] resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10, 10, 10) resizingMode:UIImageResizingModeStretch];
    [_loginButton setBackgroundImage:buttonBgImage forState:UIControlStateNormal];
    [_loginButton setBackgroundImage:buttonBgImage forState:UIControlStateHighlighted];
    [_loginButton setBackgroundImage:buttonBgImage forState:UIControlStateDisabled];
    [_loginButton setTitle:@"" forState:UIControlStateDisabled];
    
    
    [_tipImageView setHidden:YES];
    [_tipMsgLabel setHidden:YES];
    [_loadingIndicatorView stopAnimating ];
    
    

//    [_loginButton addTarget:self action:@selector(loginButtonPressed) forControlEvents:UIControlEventTouchUpInside];
}

- (IBAction)loginButtonAction:(id)sender {
    [self.view endEditing:YES];
    [_loginButton setEnabled:NO];
    [_loadingIndicatorView startAnimating];
    [_loadingIndicatorView setAlpha:0.5f];
    
    [UIView animateWithDuration:1.0f animations:^{
        [_loadingIndicatorView setAlpha:1.f];
    } completion:^(BOOL finished){
        [_loadingIndicatorView stopAnimating];
        if([_accountTextField.text isEqualToString:@"admin"]&& [_passwordTextField.text isEqualToString:@"test"]) {
            //验证成功
            [_tipImageView setHidden:YES];
            [_tipMsgLabel setHidden:YES];
//            [_loginButton setEnabled:YES];
            [self showBlogViewController];
        }else{
            NSString* errTip = @"";
            if(_accountTextField.text.length==0){
                errTip = @"请输入用户名";
            }else if(_passwordTextField.text.length==0){
                errTip = @"请输入密码";
            }else{
                errTip = @"用户名密码有误";
            }
            [_tipImageView setHidden:NO];
            [_tipMsgLabel setHidden:NO];
            [_tipMsgLabel setText:errTip];
            [_loginButton setEnabled:YES];
        }

    }];
}
-(void)showBlogViewController{
    MyBlogViewController* viewControll = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"MyBlogViewController"];
    [self presentViewController:viewControll animated:YES completion:^{;}];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)canlogin{
    if([_accountTextField.text isEqualToString:@"admin"]&& [_passwordTextField.text isEqualToString:@"test"]) {
        //验证成功
        [_tipImageView setHidden:YES];
        [_tipMsgLabel setHidden:YES];
        //            [_loginButton setEnabled:YES];
        [self showBlogViewController];
        return YES;
    }else{
        NSString* errTip = @"";
        if(_accountTextField.text.length==0){
            errTip = @"请输入用户名";
        }else if(_passwordTextField.text.length==0){
            errTip = @"请输入密码";
        }else{
            errTip = @"用户名密码有误";
        }
        [_tipImageView setHidden:NO];
        [_tipMsgLabel setHidden:NO];
        [_tipMsgLabel setText:errTip];
        [_loginButton setEnabled:YES];
    }
    return NO;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void)performSegueWithIdentifier:(NSString *)identifier sender:(id)sender{
}

-(BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender{
    return NO;
}

@end
