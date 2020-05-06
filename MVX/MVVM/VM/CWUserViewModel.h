//
//  CWUserViewModel.h
//  MVX
//
//  Created by caowei on 2020/5/4.
//  Copyright © 2020 caowei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CWUserCellViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface CWUserViewModel : NSObject

- (NSArray<CWUserCellViewModel *> *)dataArray;
- (RACSignal *)requestSignal;
@end

NS_ASSUME_NONNULL_END
