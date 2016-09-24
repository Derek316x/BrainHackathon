//
//  ViewController.h
//  MuscleDemo
//
//  Created by Z on 9/24/16.
//  Copyright © 2016 dereknetto. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "ORSSerialPort/ORSSerialPort.h"
#import "ORSSerialPort/ORSSerialPortManager.h"

@interface ViewController : NSViewController <ORSSerialPortDelegate, NSUserNotificationCenterDelegate>

@property (nonatomic, strong) ORSSerialPortManager *serialPortManager;
@property (nonatomic, strong) ORSSerialPort *serialPort;
@property (nonatomic, strong) NSArray *availableBaudRates;
@property (nonatomic) NSMutableArray *dataBuffer;

- (void)serialPort:(ORSSerialPort *)serialPort didReceiveData:(NSData *)data;

@end

