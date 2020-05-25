//
//  CWMVVMViewController.m
//  MVX
//
//  Created by caowei on 2020/5/2.
//  Copyright © 2020 caowei. All rights reserved.
//

#import "CWMVVMViewController.h"
#import "CWMVVMTableView.h"

@interface CWMVVMViewController ()

@property (nonatomic, strong) CWMVVMTableView *tableView;

@end

@implementation CWMVVMViewController

#pragma mark - life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"MVVM";
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
    [[self.tableView.requestDataCommand execute:nil] subscribeError:^(NSError * _Nullable error) {
        
    } completed:^{
        
    }];

}

#pragma mark - delegate

#pragma mark - notification

#pragma mark - event response

#pragma mark - getter and setter

- (CWMVVMTableView *)tableView {
    if (!_tableView) {
        _tableView = [[CWMVVMTableView alloc] init];
    }
    return _tableView;
}

@end
