#import <Foundation/Foundation.h>
#import "Vehicle.h"

@implementation Vehicle
-(void) drive
{
	NSLog(@"drive the vehicle.");
}
-(void) startEngine
{
	NSLog(@"start the engine.");
}
-(void) stopEngine
{
	NSLog(@"start the engine.");
}
-(int) getEngineStatu
{
	int statuCode = 0;
	NSLog(@"the engine statu is %i",statuCode);
	return statuCode;
}
-(void) breakDown
{
	NSLog(@"break down the vehicle.");
}
@end


@implementation Boat
@end

@implementation Motocycle
@end