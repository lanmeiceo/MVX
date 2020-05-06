//
//  CWTableViewPresenter.h
//  MVX
//
//  Created by caowei on 2020/5/4.
//  Copyright © 2020 caowei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CWUserCellPresenter.h"

NS_ASSUME_NONNULL_BEGIN
@class CWTableViewPresenter;

@protocol CWTableViewPresenterCallBack <NSObject>

@optional

- (void)refreshTableView:(CWTableViewPresenter *)presenter;

@end

@interface CWTableViewPresenter : NSObject

@property (nonatomic, weak) id <CWTableViewPresenterCallBack> view;

- (NSArray <CWUserCellPresenter *> *)dataArray;

- (void)requestData;

@end

NS_ASSUME_NONNULL_END
