//
//  ViewController.m
//  MuscleDemo
//
//  Created by Z on 9/24/16.
//  Copyright © 2016 dereknetto. All rights reserved.
//


#import "ViewController.h"

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
    self.serialPort = [ORSSerialPort serialPortWithPath:@"/dev/cu.usbmodem1411"];
    self.serialPort.baudRate = @9600;
    self.serialPort.delegate = self;
    [self.serialPort open];
    
    self.dataBuffer = [NSMutableArray arrayWithCapacity:50];
}

- (void)serialPort:(ORSSerialPort *)serialPort didReceiveData:(NSData *)data
{
    uint8_t byteArray[[data length]];
    [data getBytes:&byteArray];
    
    NSMutableString *myString = [[NSMutableString alloc] init];
    for (int i = 0; i<[data length]; i++) {
        char byte = byteArray[i];
        if (isdigit(byte)){
            //NSLog(@"%c",byte);
            NSString *s = [[NSString alloc] initWithCString:&byte encoding:NSUTF8StringEncoding];
            myString = [myString stringByAppendingString:s];
        }
    }
    NSLog(@"%@",myString);
}


@end
