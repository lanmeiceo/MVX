//
//  CWMVPUserCell.m
//  MVX
//
//  Created by caowei on 2020/5/4.
//  Copyright © 2020 caowei. All rights reserved.
//

#import "CWMVPUserCell.h"

@interface CWMVPUserCell ()<CWUserCellPresenterCallBack>

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIButton *supportButton;
@property (nonatomic, copy) void (^supportClickBlock)(void);

@end

@implementation CWMVPUserCell

#pragma mark - life cycle

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
        [self autoLayout];
    }
    return self;
}

#pragma mark - private UI

- (void)setupUI {
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.supportButton];
}

- (void)autoLayout {
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.left.mas_equalTo(15);
        make.height.mas_equalTo(20);
    }];
    [self.supportButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.right.mas_equalTo(- 15);
        make.height.mas_equalTo(20);
    }];
}

#pragma mark - overwrite

#pragma mark - public

#pragma mark - private

#pragma mark - request

#pragma mark - delegate

#pragma mark - CWUserCellPresenterCallBack

- (void)reloadCellData:(CWUserCellPresenter *)cellPresenter {
    self.supportButton.selected = cellPresenter.isSupport;
    [self.supportButton setTitle:cellPresenter.buttonTitle forState:UIControlStateNormal];
}

#pragma mark - notification

#pragma mark - event response

- (void)supportClick {
    !self.supportClickBlock ?: self.supportClickBlock();
}

#pragma mark - getter and setter

- (void)setPresenter:(CWUserCellPresenter *)presenter {
    _presenter = presenter;
    //PV绑定
    presenter.view = self;
    
    self.titleLabel.text = presenter.titltLableText;
    self.supportButton.selected = presenter.isSupport;
    [self.supportButton setTitle:presenter.buttonTitle forState:UIControlStateNormal];
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont systemFontOfSize:16];
    }
    return _titleLabel;
}

- (UIButton *)supportButton {
    if (!_supportButton) {
        _supportButton = [[UIButton alloc] init];
        _supportButton.titleLabel.font = [UIFont systemFontOfSize:16];
        [_supportButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_supportButton setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        [_supportButton addTarget:self action:@selector(supportClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _supportButton;
}

@end
