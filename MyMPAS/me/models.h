#import <UIKit>

@interface MeTableCell

@property (strong,noatomic) NSString *title;
@property (strong,noatomic) NSString *imageName;
@property (strong,noatomic) NSString *targetView;

-(instanttype) initWithTitle:(NSString*) title image:(NSString*) imageName target:(NSString*) targetView;

@end