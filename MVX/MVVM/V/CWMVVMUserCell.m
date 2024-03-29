//
//  CWMVVMUserCell.m
//  MVX
//
//  Created by caowei on 2020/5/4.
//  Copyright © 2020 caowei. All rights reserved.
//

#import "CWMVVMUserCell.h"

@interface CWMVVMUserCell ()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIButton *supportButton;
//KVO
@property (nonatomic, strong) FBKVOController *KVOController;

@end

@implementation CWMVVMUserCell


#pragma mark - life cycle

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
        [self autoLayout];
//        [self bindViewModel_RAC];
        [self bindViewModel_KVO];
        
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

//View绑定ViewModel-RAC写法
- (void)bindViewModel_RAC {
    WEAKSELF
    //RAC写法
    RAC(self.titleLabel,text) = RACObserve(self, self.viewModel.titltLableText);
    RAC(self.supportButton,selected) = [RACObserve(self, self.viewModel.isSupport) ignore:nil];//忽略nil否则会崩
    [RACObserve(self,self.viewModel.buttonTitle) subscribeNext:^(NSString *title) {
        [weakSelf.supportButton setTitle:title forState:UIControlStateNormal];
    }];
}

//View绑定ViewModel-KVO写法
- (void)bindViewModel_KVO {
    WEAKSELF
    self.KVOController = [FBKVOController controllerWithObserver:self];
    [self.KVOController observe:self keyPath:@"viewModel.titltLableText" options:NSKeyValueObservingOptionNew block:^(id  _Nullable observer, id  _Nonnull object, NSDictionary<NSKeyValueChangeKey,id> * _Nonnull change) {
        weakSelf.titleLabel.text = change[NSKeyValueChangeNewKey];
    }];
    
    [self.KVOController observe:self keyPath:@"viewModel.isSupport" options:NSKeyValueObservingOptionNew block:^(id  _Nullable observer, id  _Nonnull object, NSDictionary<NSKeyValueChangeKey,id> * _Nonnull change) {
        if ([change[NSKeyValueChangeNewKey] integerValue] == 1) {
            weakSelf.supportButton.selected = YES;
        } else {
            weakSelf.supportButton.selected = NO;
        }
    }];
    
    [self.KVOController observe:self keyPath:@"viewModel.buttonTitle" options:NSKeyValueObservingOptionNew block:^(id  _Nullable observer, id  _Nonnull object, NSDictionary<NSKeyValueChangeKey,id> * _Nonnull change) {
        [weakSelf.supportButton setTitle:change[NSKeyValueChangeNewKey] forState:UIControlStateNormal];
    }];
}

#pragma mark - request

#pragma mark - delegate

#pragma mark - notification

#pragma mark - event response

- (void)supportClick {
    [[self.viewModel.supportCommand execute:nil] subscribeError:^(NSError *error) {
        NSLog(@"error:%@",error.domain);
    }];
}

#pragma mark - getter and setter

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
