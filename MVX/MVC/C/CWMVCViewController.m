//
//  CWMVCViewController.m
//  MVX
//
//  Created by caowei on 2020/5/2.
//  Copyright © 2020 caowei. All rights reserved.
//

#import "CWMVCViewController.h"
#import "CWMVCTableView.h"
#import "CWUserModel.h"

@interface CWMVCViewController ()

@property (nonatomic, strong) CWMVCTableView *tableView;
//本地数据源
@property (nonatomic, strong) NSMutableArray *localDataArray;
@end

@implementation CWMVCViewController

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"MVC";
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupUI];
    [self autoLayout];
    [self requestData];
}

#pragma mark - private UI
- (void)setupUI {
    if (@available(iOS 11.0, *)) {
    } else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    [self.view addSubview:self.tableView];
}

- (void)autoLayout {
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

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
    self.tableView.dataArray = array;
}

#pragma mark - delegate

#pragma mark - notification

#pragma mark - event response

#pragma mark - getter and setter

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
                            }].mutableCopy;
    }
    return _localDataArray;
}


- (CWMVCTableView *)tableView {
    if (!_tableView) {
        _tableView = [[CWMVCTableView alloc] init];
    }
    return _tableView;
}

@end
