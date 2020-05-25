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
    [self setupUI];
    [self autoLayout];
    //PV绑定
    self.presenter.view = (id)self.tableView;
    [self requestData];
}

#pragma mark - private UI

- (void)setupUI {
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
    }
    return _tableView;
}

- (CWTableViewPresenter *)presenter {
    if (!_presenter) {
        _presenter = [[CWTableViewPresenter alloc] init];
    }
    return _presenter;
}

@end
