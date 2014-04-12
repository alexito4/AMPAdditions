//
//  AMPMacros.h
//
//  Created by Alejandro Martínez on 12/12/11.
//  Originally on https://github.com/alexito4/SupportMacros
//


#pragma mark - System Version

#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)


#pragma mark - Degrees

#define degreesToRadians( degrees ) ( ( degrees ) / 180.0 * M_PI )
#define radiansToDegrees( radians ) ( ( radians ) * ( 180.0 / M_PI ) )

#pragma mark -

#define pixelsToPoints(pixels) (pixels/[UIScreen mainScreen].scale)

#define TICK NSDate *amp_tickStartTime = [NSDate date]
#define TOCK NSLog(@"Elapsed time: %f", -[amp_tickStartTime timeIntervalSinceNow])
