//
//  UITableViewCell+CreatCell.m
//  MVX
//
//  Created by caowei on 2020/5/3.
//  Copyright © 2020 caowei. All rights reserved.
//

#import "UITableViewCell+CreatCell.h"

@implementation UITableViewCell (CreatCell)
#pragma mark - public

//根据tableView、identifer创建对应的cell
+ (UITableViewCell *)cellGetTableView:(UITableView *)tableView
{
    NSString *identifer = NSStringFromClass([self class]);
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifer];
    if (!cell) {
        cell = [[NSClassFromString(identifer) alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifer];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}


@end
