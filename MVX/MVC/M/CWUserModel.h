//
//  CWUserModel.h
//  MVX
//
//  Created by caowei on 2020/5/3.
//  Copyright © 2020 caowei. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CWUserModel : NSObject

- (instancetype)initWithDic:(NSDictionary *)dic;
//标题
@property (nonatomic, copy) NSString *title;
//我是否点赞
@property (nonatomic, assign) BOOL isSupport;
//点赞数量
@property (nonatomic, assign) NSUInteger supportCount;

@end

NS_ASSUME_NONNULL_END
