//
//  CWMVPUserCell.h
//  MVX
//
//  Created by caowei on 2020/5/4.
//  Copyright © 2020 caowei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CWUserCellPresenter.h"
NS_ASSUME_NONNULL_BEGIN

@interface CWMVPUserCell : UITableViewCell

@property (nonatomic, strong) CWUserCellPresenter *presenter;
//按钮点击
- (void)setSupportClickBlock:(void(^)(void))supportClickBlock;

@end

NS_ASSUME_NONNULL_END
