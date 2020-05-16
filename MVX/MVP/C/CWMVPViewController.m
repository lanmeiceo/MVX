//
//  CWMVPViewController.m
//  MVX
//
//  Created by caowei on 2020/5/2.
//  Copyright © 2020 caowei. All rights reserved.
//

#import "CWMVPViewController.h"
#import "CWMVPTableView.h"
#import "CWTableViewPresenter.h"

@interface CWMVPViewController ()

@property (nonatomic, strong) CWMVPTableView *tableView;
@property (nonatomic, strong) CWTableViewPresenter *presenter;

@end

@implementation CWMVPViewController

#pragma mark - life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"MVP";
    self.view.backgroundColor = [UIColor whiteColor];
    self.presenter = [[CWTableViewPresenter alloc] init];
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
    //数据请求在P层
    [self.presenter requestData];
}

#pragma mark - delegate

#pragma mark - notification

#pragma mark - event response

#pragma mark - getter and setter
- (CWMVPTableView *)tableView {
    if (!_tableView) {
        _tableView = [[CWMVPTableView alloc] init];
        //PV绑定
        self.presenter.view = (id)_tableView;
    }
    return _tableView;
}

@end
