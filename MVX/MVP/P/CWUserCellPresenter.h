//
//  CWUserCellPresenter.h
//  MVX
//
//  Created by caowei on 2020/5/4.
//  Copyright © 2020 caowei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CWUserModel.h"

NS_ASSUME_NONNULL_BEGIN
@class CWUserCellPresenter;
@protocol CWUserCellPresenterCallBack <NSObject>

@optional
- (void)reloadCellData:(CWUserCellPresenter *)cellPresenter;

@end

@interface CWUserCellPresenter : NSObject

+ (instancetype)presenterWithModel:(CWUserModel *)model;

@property (nonatomic, weak) id <CWUserCellPresenterCallBack> view;

- (NSString *)titltLableText;
- (NSString *)buttonTitle;
- (BOOL)isSupport;
//按钮点击
- (void)supportClick;

@end

NS_ASSUME_NONNULL_END
