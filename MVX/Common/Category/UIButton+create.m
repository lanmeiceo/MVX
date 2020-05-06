//
//  UIButton+create.m
//  XTrip
//
//  Created by 张胜瀚 on 16/3/29.
//  Copyright © 2016年 xiafeitu. All rights reserved.
//

#import "UIButton+create.h"

@implementation UIButton (create)
+ (UIButton  *)creatNormalButton:(UIColor *)titleColor contentAlig:(UIControlContentHorizontalAlignment)contentAlig font:(UIFont *)titleFont title:(NSString *)title
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    if (titleColor != nil) {
        [btn setTitleColor:titleColor forState:UIControlStateNormal];
    }
    btn.contentHorizontalAlignment = contentAlig;
    if (title != nil) {
        [btn setTitle:title forState:UIControlStateNormal];
    }
    if (titleFont != nil) {
        btn.titleLabel.font = titleFont;
    }
    return btn;
}

- (void)setImagePosition:(ZXImagePosition)postion spacing:(CGFloat)spacing {
    [self needGetFrame];
    CGFloat imgW = self.imageView.image.size.width;
    CGFloat imgH = self.imageView.image.size.height;
    CGSize origLabSize = self.titleLabel.bounds.size;
    CGFloat orgLabW = origLabSize.width;
    CGFloat orgLabH = origLabSize.height;
    
    CGSize trueSize = [self.titleLabel sizeThatFits:CGSizeMake(MAXFLOAT, MAXFLOAT)];
    CGFloat trueLabW = trueSize.width;
    
    //image中心移动的x距离
    CGFloat imageOffsetX = orgLabW/2 ;
    //image中心移动的y距离
    CGFloat imageOffsetY = orgLabH/2 + spacing/2;
    //label左边缘移动的x距离
    CGFloat labelOffsetX1 = imgW/2 - orgLabW/2 + trueLabW/2;
    //label右边缘移动的x距离
    CGFloat labelOffsetX2 = imgW/2 + orgLabW/2 - trueLabW/2;
    //label中心移动的y距离
    CGFloat labelOffsetY = imgH/2 + spacing/2;
    
    switch (postion) {
        case ZXImagePositionLeft:
            self.imageEdgeInsets = UIEdgeInsetsMake(0, -spacing/2, 0, spacing/2);
            self.titleEdgeInsets = UIEdgeInsetsMake(0, spacing/2, 0, -spacing/2);
            break;
            
        case ZXImagePositionRight:
            self.imageEdgeInsets = UIEdgeInsetsMake(0, orgLabW + spacing/2, 0, -(orgLabW + spacing/2));
            self.titleEdgeInsets = UIEdgeInsetsMake(0, -(imgW + spacing/2), 0, imgW + spacing/2);
            break;
            
        case ZXImagePositionTop:
            self.imageEdgeInsets = UIEdgeInsetsMake(-imageOffsetY, imageOffsetX, imageOffsetY, -imageOffsetX);
            self.titleEdgeInsets = UIEdgeInsetsMake(labelOffsetY, -labelOffsetX1, -labelOffsetY, labelOffsetX2);
            break;
            
        case ZXImagePositionBottom:
            self.imageEdgeInsets = UIEdgeInsetsMake(imageOffsetY, imageOffsetX, -imageOffsetY, -imageOffsetX);
            self.titleEdgeInsets = UIEdgeInsetsMake(-labelOffsetY, -labelOffsetX1, labelOffsetY, labelOffsetX2);
            break;
            
        default:
            break;
    }
    
}
- (void)needGetFrame{
    if (self.bounds.size.width <= 0 || self.bounds.size.height <= 0) {
        [self layoutIfNeeded];
    }
}
@end
