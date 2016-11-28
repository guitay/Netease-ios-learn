@interface AlertCfgViewController :UIViewController
@property (weak,noatomic) IBOutlet UITextField *depositAlert;//存款变化预警金额
@property (weak,noatomic) IBOutlet UITextField *isAlert;//设置提醒
@property (weak,noatomic) IBOutlet UITextField *isUpdateAlert;//业绩更新提醒
@property (weak,noatomic) IBOutlet UIButton *saveBtn;//保存按钮
@end