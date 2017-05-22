//
//  BundleId.m
//  IPV4转IPV6Demo
//
//  Created by lby on 17/3/24.
//  Copyright © 2017年 lby. All rights reserved.
//

#import "IPConvert.h"

@implementation IPConvert

+ (instancetype)sharedIPConvert
{
    static IPConvert *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[IPConvert alloc] init];
    });
    return instance;
}

- (NSString *)getIPv6WithServerHost:(const char *)serverHost withServerPort:(const char *)serverPort
{
    if( nil == serverHost )
        return NULL;
    const char *newChar = "No";
//    const char *cause = NULL;
    struct addrinfo* res0;
    struct addrinfo hints;
    struct addrinfo* res;
    int n, s;
    
    memset(&hints, 0, sizeof(hints));
    
    hints.ai_flags = AI_DEFAULT;
    hints.ai_family = PF_UNSPEC;
    hints.ai_socktype = SOCK_STREAM;
    
    if((n=getaddrinfo(serverHost, "http", &hints, &res0))!=0)
    {
        printf("getaddrinfo error: %s\n",gai_strerror(n));
        return NULL;
    }
    
    struct sockaddr_in6* addr6;
    struct sockaddr_in* addr;
    NSString * NewStr = NULL;
    char ipbuf[32];
    s = -1;
    for(res = res0; res; res = res->ai_next)
    {
        if (res->ai_family == AF_INET6)
        {
            addr6 =( struct sockaddr_in6*)res->ai_addr;
            newChar = inet_ntop(AF_INET6, &addr6->sin6_addr, ipbuf, sizeof(ipbuf));
            NSString * TempA = [[NSString alloc] initWithCString:(const char*)newChar
                                                        encoding:NSASCIIStringEncoding];
            NSString * TempB = [NSString stringWithUTF8String:"&&ipv6"];
            
            NewStr = [TempA stringByAppendingString: TempB];
            NSLog(@"%s",newChar);
        }
        if (res->ai_family == AF_INET)
        {
            addr =( struct sockaddr_in*)res->ai_addr;
            newChar = inet_ntop(AF_INET, &addr->sin_addr, ipbuf, sizeof(ipbuf));
            NSString * TempA = [[NSString alloc] initWithCString:(const char*)newChar
                                                        encoding:NSASCIIStringEncoding];
            NSString * TempB = [NSString stringWithUTF8String:"&&ipv4"];
            
            NewStr = [TempA stringByAppendingString: TempB];
            NSLog(@"%s",newChar);
        }
        break;
    }
    
    freeaddrinfo(res0);
    
    NSLog(@"getaddrinfo OK");
    
    NSString * mIPaddr = NewStr;
    return mIPaddr;
}


@end
