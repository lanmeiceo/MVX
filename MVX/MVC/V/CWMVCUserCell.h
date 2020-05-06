//
//  CWMVCUserCell.h
//  MVX
//
//  Created by caowei on 2020/5/3.
//  Copyright © 2020 caowei. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CWMVCUserCell : UITableViewCell
//设置Label文字
- (void)setTitle:(NSString*)title;
//设置按钮文字
- (void)setButtonTitle:(NSString*)title;
//设置按钮颜色
- (void)setButtonIsSuport:(BOOL)isSuport;
//按钮点击
- (void)setSupportClickBlock:(void(^)(void))supportClickBlock;

@end

NS_ASSUME_NONNULL_END
