//
//  ViewController.m
//  IPV4转IPV6Demo
//
//  Created by lby on 17/3/24.
//  Copyright © 2017年 lby. All rights reserved.
//

#import "ViewController.h"
#import "IPConvert.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *serverIP = @"118.190.95.172";
    const char *serverIPC = [serverIP UTF8String];
    NSString *iPv4Port = @"8888";
    const char *iPv4PortC = [iPv4Port UTF8String];
    NSString *iPV6Address = [[IPConvert sharedIPConvert] getIPv6WithServerHost:serverIPC withServerPort:iPv4PortC];
    
    NSLog(@"iPV6Address:%@",iPV6Address);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
