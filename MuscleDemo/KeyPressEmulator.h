//
//  KeyPressEmulator.h
//  MuscleDemo
//
//  Created by Z on 9/24/16.
//  Copyright © 2016 dereknetto. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KeyPressEmulator : NSObject

-(void)keyDown:(char)k;
-(void)keyUp:(char)k;
-(void)keyTap:(char)k;

-(int)toKeyCode:(char)k;

@end
