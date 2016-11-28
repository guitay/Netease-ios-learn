#import "MeTableCell.h"

@implementation MeTableCell

-(instancetype) initWithTitle:(NSString*) title image:(NSString*) imageName target:(NSString*) targetView
{
	_title = title;
	_imageName = imageName;
	_targetView = targetView;
	return self;
}

@end