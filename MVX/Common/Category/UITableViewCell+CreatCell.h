//
//  UITableViewCell+CreatCell.h
//  MVX
//
//  Created by caowei on 2020/5/3.
//  Copyright © 2020 caowei. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

#define CWCreateCell(Calss)   (Calss *)[Calss cellGetTableView:tableView];

@interface UITableViewCell (CreatCell)

//根据tableView、identifer创建对应的cell
+ (UITableViewCell *)cellGetTableView:(UITableView *)tableView;

@end

NS_ASSUME_NONNULL_END
