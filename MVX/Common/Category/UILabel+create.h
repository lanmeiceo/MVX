//
//  UILabel+create.h
//  XTrip
//
//  Created by 张胜瀚 on 16/3/29.
//  Copyright © 2016年 xiafeitu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (create)

+ (UILabel  *)creatNormalLabel:(UIColor *)textColor align:(NSTextAlignment)textAlignment font:(UIFont *)textFont text:(NSString *)text;
@end
