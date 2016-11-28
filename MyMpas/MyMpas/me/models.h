#import <UIKit/UIKit.h>

@interface MeTableCell:NSObject

@property (strong,nonatomic) NSString *title;
@property (strong,nonatomic) NSString *imageName;
@property (strong,nonatomic) NSString *targetView;

-(instancetype) initWithTitle:(NSString*) title image:(NSString*) imageName target:(NSString*) targetView;

@end
