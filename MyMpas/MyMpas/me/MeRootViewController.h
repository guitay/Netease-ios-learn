#import <UIKit/UIKit.h>
#import "models.h"

//“我”标签页根视图
@interface MeRootViewController : UITableViewController

@property (nonatomic, strong) NSArray *sections;
@property (strong,nonatomic) NSArray<MeTableCell*> *rows;

@end
