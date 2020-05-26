//
//  CWMVCTableView.m
//  MVX
//
//  Created by caowei on 2020/5/2.
//  Copyright © 2020 caowei. All rights reserved.
//

#import "CWMVCTableView.h"
#import "CWMVCUserCell.h"
#import "CWUserModel.h"

@interface CWMVCTableView ()<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) UITableView *tableView;

@end

@implementation CWMVCTableView

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
    return self.dataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CWMVCUserCell *cell = CWCreateCell(CWMVCUserCell);
    CWUserModel *model = self.dataArray[indexPath.row];
    [cell setButtonTitle:[NSString stringWithFormat:@"支持数:%ld",model.supportCount]];
    [cell setTitle:model.title];
    [cell setButtonIsSuport:model.isSupport];
    __weak typeof(cell) weakCell = cell;
    [cell setSupportClickBlock:^{
        model.isSupport = !model.isSupport;
        if (model.isSupport) {
            model.supportCount ++;
        } else {
            model.supportCount --;
        }
        [weakCell setButtonIsSuport:model.isSupport];
        [weakCell setButtonTitle:[NSString stringWithFormat:@"支持数%ld",model.supportCount]];
    }];
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

- (void)setDataArray:(NSMutableArray *)dataArray {
    _dataArray = dataArray;
    [self.tableView reloadData];
}

@end
