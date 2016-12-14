@interface Vehicle : NSObject 
-(void) drive;
-(void) startEngine;
-(void) stopEngine;
-(int) getEngineStatu;
-(void) breakDown;
@end

@interface Boat : Vehicle

@end


@interface Motocycle : Vehicle

@end