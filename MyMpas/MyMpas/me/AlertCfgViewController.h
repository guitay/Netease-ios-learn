#import <UIKit/UIKit.h>

@interface AlertCfgViewController:UIViewController
@property (weak,nonatomic) IBOutlet UITextField *depositAlert;//存款变化预警金额
@property (weak,nonatomic) IBOutlet UITextField *isAlert;//设置提醒
@property (weak,nonatomic) IBOutlet UITextField *isUpdateAlert;//业绩更新提醒
@property (weak,nonatomic) IBOutlet UIButton *saveBtn;//保存按钮
@end
