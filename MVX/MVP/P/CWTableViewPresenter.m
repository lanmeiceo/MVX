//
//  CWTableViewPresenter.m
//  MVX
//
//  Created by caowei on 2020/5/4.
//  Copyright © 2020 caowei. All rights reserved.
//

#import "CWTableViewPresenter.h"

@interface CWTableViewPresenter ()

//本地数据源
@property (nonatomic, strong) NSMutableArray *localDataArray;
//存放CWUserCellPresenter的数组
@property (nonatomic, strong) NSMutableArray<CWUserCellPresenter *> *cellPresenterArray;

@end

@implementation CWTableViewPresenter

#pragma mark - life cycle

#pragma mark - private UI

#pragma mark - overwrite

#pragma mark - public

#pragma mark - private

#pragma mark - request

//模拟请求
- (void)requestData {
    //省略实际开发接口请求
    //接口请求成功后的回调
    [self.cellPresenterArray removeAllObjects];
    NSMutableArray *array = @[].mutableCopy;
    for (NSDictionary *dic in self.localDataArray) {
        CWUserModel *model = [[CWUserModel alloc] initWithDic:dic];
        [array addObject:model];
    }
    for (CWUserModel *model in array) {
        CWUserCellPresenter *cellPresenter = [CWUserCellPresenter presenterWithModel:model];
        [self.cellPresenterArray addObject:cellPresenter];
    }
    //V层刷新
    if (self.view && [self.view respondsToSelector:@selector(refreshTableView:)]) {
        [self.view refreshTableView:self];
    }
}

#pragma mark - delegate

#pragma mark - notification

#pragma mark - event response

#pragma mark - getter and setter

- (NSArray<CWUserCellPresenter *> *)dataArray {
    return self.cellPresenterArray;
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

- (NSMutableArray<CWUserCellPresenter *> *)cellPresenterArray {
    if (!_cellPresenterArray) {
        _cellPresenterArray = @[].mutableCopy;
    }
    return _cellPresenterArray;
}

@end
