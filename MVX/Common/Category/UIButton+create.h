//
//  UIButton+create.h
//  XTrip
//
//  Created by 张胜瀚 on 16/3/29.
//  Copyright © 2016年 xiafeitu. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, ZXImagePosition) {
    ZXImagePositionLeft     = 0,            //图片在左，文字在右，默认
    ZXImagePositionRight    = 1,            //图片在右，文字在左
    ZXImagePositionTop      = 2,            //图片在上，文字在下
    ZXImagePositionBottom   = 3,            //图片在下，文字在上
};

@interface UIButton (create)
/**
 *  利用UIButton的titleEdgeInsets和imageEdgeInsets来实现文字和图片的自由排列
 *  注意：在设置图片和文字之后，并且button的size不能为0调用本方法才能计算出正确的偏移量。
 本次更新此方法已经适配了button的宽度小于 imageView+titleLable宽度和的情况，但是button的大小至少要大于图片的大小。
 每次修改button文字后都要再调用一下该方法，否则排版可能会混乱。
 *
 *  @param spacing 图片和文字的间隔
 */
- (void)setImagePosition:(ZXImagePosition)postion spacing:(CGFloat)spacing;

+ (UIButton  *)creatNormalButton:(UIColor *)titleColor contentAlig:(UIControlContentHorizontalAlignment)contentAlig font:(UIFont *)titleFont title:(NSString *)title;
@end
