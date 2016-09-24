//
//  KeyPressEmulator.m
//  MuscleDemo
//
//  Created by Z on 9/24/16.
//  Copyright © 2016 dereknetto. All rights reserved.
//

#import "KeyPressEmulator.h"

@implementation KeyPressEmulator

-(void)keyDown:(char)k {
    CGEventPost(kCGHIDEventTap, CGEventCreateKeyboardEvent(NULL, [self toKeyCode:k], true));
}

-(void)keyUp:(char)k {
    CGEventPost(kCGHIDEventTap, CGEventCreateKeyboardEvent(NULL, [self toKeyCode:k], false));
}

-(void)keyTap:(char)k {
    [self keyDown:k];
    usleep(20);
    [self keyUp:k];
}

-(int)toKeyCode:(char)k {
    switch (k) {
        case 'w':
            return 0x0D;
            break;
        case 'a':
            return 0x00;
            break;
        case 's':
            return 0x01;
            break;
        case 'd':
            return 0x02;
            break;
        case ' ':
            return 0x31;
            break;
        case 'j':
            return 0x26;
            break;
        case 'k':
            return 0x28;
            break;
        default:
            break;
    }
    return 0x00;
}


@end


