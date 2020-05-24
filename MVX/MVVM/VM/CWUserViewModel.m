//
//  CWUserViewModel.m
//  MVX
//
//  Created by caowei on 2020/5/4.
//  Copyright © 2020 caowei. All rights reserved.
//

#import "CWUserViewModel.h"
#import "CWUserModel.h"

@interface CWUserViewModel ()
//本地数据源
@property (nonatomic, strong) NSMutableArray *localDataArray;
@property (nonatomic, strong) NSMutableArray<CWUserCellViewModel *> *cellViewModelArray;
@property (nonatomic, strong) RACSignal *requestSignal;
@end

@implementation CWUserViewModel

#pragma mark - life cycle

- (instancetype)init
{
    self = [super init];
    if (self) {
        WEAKSELF
        self.requestSignal = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
            //模拟请求
            [weakSelf requestData];
            [subscriber sendCompleted];
            return nil;
        }];
    }
    return self;
}

#pragma mark - private UI

#pragma mark - overwrite

#pragma mark - public

#pragma mark - private

#pragma mark - request

//模拟请求数据
- (void)requestData {
    //省略实际开发接口请求
    //接口请求成功后的回调
    NSMutableArray *array = @[].mutableCopy;
    for (NSDictionary *dic in self.localDataArray) {
        CWUserModel *model = [[CWUserModel alloc] initWithDic:dic];
        [array addObject:model];
    }
    for (CWUserModel *model in array) {
        CWUserCellViewModel *cellViewModel = [CWUserCellViewModel viewModelWithModel:model];
        [self.cellViewModelArray addObject:cellViewModel];
    }
}
#pragma mark - delegate

#pragma mark - notification

#pragma mark - event response

#pragma mark - getter and setter

- (NSArray<CWUserCellViewModel *> *)dataArray {
    return self.cellViewModelArray;
}

- (NSMutableArray<CWUserCellViewModel *> *)cellViewModelArray {
    if (!_cellViewModelArray) {
        _cellViewModelArray = [NSMutableArray array];
    }
    return _cellViewModelArray;
}

- (NSMutableArray *)localDataArray {
    if (!_localDataArray) {
        _localDataArray = @[@{@"title": @"标题1",
                         @"isSupport": @"1",
                         @"supportCount": @"10"
                        },
                       @{@"title": @"标题2",
                         @"isSupport": @"0",
                         @"supportCount": @"8"
                        },
                       @{@"title": @"标题3",
                         @"isSupport": @"0",
                         @"supportCount": @"9"
                         },
                       @{@"title": @"标题4",
                         @"isSupport": @"0",
                         @"supportCount": @"10"
                         },
                       @{@"title": @"标题5",
                         @"isSupport": @"1",
                         @"supportCount": @"10"
                         },
                       @{@"title": @"标题6",
                         @"isSupport": @"1",
                         @"supportCount": @"8"
                         },
                       @{@"title": @"标题7",
                         @"isSupport": @"0",
                         @"supportCount": @"9"
                         },
                       @{@"title": @"标题8",
                         @"isSupport": @"0",
                         @"supportCount": @"10"
                         },
                       @{@"title": @"标题9",
                         @"isSupport": @"0",
                         @"supportCount": @"9"
                         },
                       @{@"title": @"标题10",
                         @"isSupport": @"0",
                         @"supportCount": @"10"
                         }
                       ].mutableCopy;
    }
    return _localDataArray;
}
@end
