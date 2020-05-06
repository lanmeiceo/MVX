//
//  CWMVPTableView.m
//  MVX
//
//  Created by caowei on 2020/5/4.
//  Copyright © 2020 caowei. All rights reserved.
//

#import "CWMVPTableView.h"
#import "CWTableViewPresenter.h"
#import "CWMVPUserCell.h"

@interface CWMVPTableView ()<UITableViewDelegate,UITableViewDataSource,CWTableViewPresenterCallBack>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) CWTableViewPresenter *presenter;

@end

@implementation CWMVPTableView

#pragma mark - life cycle

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
        [self autoLayout];
    }
    return self;
}

#pragma mark - private UI

- (void)setupUI {
    [self addSubview:self.tableView];
}

- (void)autoLayout {
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
}
#pragma mark - overwrite

#pragma mark - public

#pragma mark - private

#pragma mark - request

#pragma mark - delegate

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.presenter.dataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CWMVPUserCell *cell = CWCreateCell(CWMVPUserCell);
    cell.presenter = self.presenter.dataArray[indexPath.row];
    __weak typeof(cell) weakCell = cell;
    [cell setSupportClickBlock:^{
        //cell的按钮点击交给P层来实现
        [weakCell.presenter supportClick];
    }];
    return cell;
}

#pragma mark - UITableViewDelegate

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 64;
}

#pragma mark - CWTableViewPresenterCallBack

-(void)refreshTableView:(CWTableViewPresenter *)presenter {
    self.presenter = presenter;
    [self.tableView reloadData];
}

#pragma mark - notification

#pragma mark - event response

#pragma mark - getter and setter

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.backgroundColor = [UIColor whiteColor];
    }
    return _tableView;
}

@end
