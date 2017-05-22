//
//  BundleId.h
//  IPV4转IPV6Demo
//
//  Created by lby on 17/3/24.
//  Copyright © 2017年 lby. All rights reserved.
//

#import <Foundation/Foundation.h>
#include <sys/socket.h>
#include <netdb.h>
#include <arpa/inet.h>
#include <err.h>
@interface IPConvert : NSObject

+ (instancetype)sharedIPConvert;

/**
 通过服务器的IP和端口号获取IPv6地址

 @param serverHost 服务器IP
 @param serverPort 服务器端口
 @return 服务器的IPv6地址
 */
- (NSString *)getIPv6WithServerHost:(const char *)serverHost withServerPort:(const char *)serverPort;

@end
