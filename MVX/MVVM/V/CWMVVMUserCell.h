//
//  CWMVVMUserCell.h
//  MVX
//
//  Created by caowei on 2020/5/4.
//  Copyright © 2020 caowei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CWUserCellViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface CWMVVMUserCell : UITableViewCell

@property (nonatomic, strong) CWUserCellViewModel *viewModel;

@end

NS_ASSUME_NONNULL_END
