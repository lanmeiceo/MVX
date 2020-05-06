//
//  CWUserModel.m
//  MVX
//
//  Created by caowei on 2020/5/3.
//  Copyright © 2020 caowei. All rights reserved.
//

#import "CWUserModel.h"

@implementation CWUserModel

-(instancetype)initWithDic:(NSDictionary *)dic {
    self = [super init];
    if (self) {
        self.title = dic[@"title"];
        self.isSupport = [dic[@"isSupport"] boolValue];
        self.supportCount = [dic[@"supportCount"] integerValue];
    }
    return self;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
}

@end
