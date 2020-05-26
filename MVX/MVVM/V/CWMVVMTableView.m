//
//  CWMVVMTableView.m
//  MVX
//
//  Created by caowei on 2020/5/4.
//  Copyright © 2020 caowei. All rights reserved.
//

#import "CWMVVMTableView.h"
#import "CWMVVMUserCell.h"
#import "CWUserViewModel.h"

@interface CWMVVMTableView ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) CWUserViewModel *viewModel;
@property (nonatomic, strong) RACCommand *requestDataCommand;
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation CWMVVMTableView


#pragma mark - life cycle

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.viewModel = [[CWUserViewModel alloc]init];
        [self setupUI];
        [self autoLayout];
        [self dealCommand];
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

- (void)dealCommand {
    WEAKSELF
    self.requestDataCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
        RACSubject *subject = [RACSubject subject];
        //调viewmdoel的请求
        [weakSelf.viewModel.requestSignal subscribeError:^(NSError * _Nullable error) {
            [subject sendError:error];
        } completed:^{
            [self.tableView reloadData];
            [subject sendCompleted];
        }];
        return subject;
    }];
}

#pragma mark - delegate

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.viewModel.dataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CWMVVMUserCell *cell = CWCreateCell(CWMVVMUserCell);
    cell.viewModel = self.viewModel.dataArray[indexPath.row];
    return cell;
}

#pragma mark - UITableViewDelegate

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 64;
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
