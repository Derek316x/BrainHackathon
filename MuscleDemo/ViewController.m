//
//  ViewController.m
//  MuscleDemo
//
//  Created by Z on 9/24/16.
//  Copyright © 2016 dereknetto. All rights reserved.
//


#import "ViewController.h"

//EMG Spiker Shield
#define kEMG_THRESHOLD 150

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
    [self setup];
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

- (void) setup {
    //EMG
    self.serialPort = [ORSSerialPort serialPortWithPath:@"/dev/cu.usbmodem1411"]; //left port on macbook
    self.serialPort.baudRate = @9600;
    self.serialPort.delegate = self;
    [self.serialPort open];
    self.dataBuffer = [NSMutableArray arrayWithCapacity:50];

    //emulated input
    self.KPE = [[KeyPressEmulator alloc] init];
}

- (void)serialPort:(ORSSerialPort *)serialPort didReceiveData:(NSData *)data
{
    uint8_t byteArray[[data length]];
    [data getBytes:&byteArray];
    
    NSMutableString *myString = [[NSMutableString alloc] init];
    for (int i = 0; i<[data length]; i++) {
        char byte = byteArray[i];
        if (isdigit(byte)){
            NSString *s = [[NSString alloc] initWithCString:&byte encoding:NSUTF8StringEncoding];
            myString = [myString stringByAppendingString:s];
        }
    }
    NSLog(@"%ld",(long)[self sanitizeIntegerString:myString]);
    
    if ([self sanitizeIntegerString:myString] > kEMG_THRESHOLD) {
       // [self pressSpace];
    }
}

- (NSInteger) sanitizeIntegerString:(NSString *)string
{
    NSString *newString = [[string componentsSeparatedByCharactersInSet:
                            [[NSCharacterSet decimalDigitCharacterSet] invertedSet]]
                           componentsJoinedByString:@""];
    return [newString integerValue];
}

#pragma mark - debug

- (void) pressSpace
{
    [self.KPE keyTap:' '];
}


@end
