//
//  CWUserCellViewModel.m
//  MVX
//
//  Created by caowei on 2020/5/4.
//  Copyright © 2020 caowei. All rights reserved.
//

#import "CWUserCellViewModel.h"

@interface CWUserCellViewModel ()

@property (nonatomic, strong) CWUserModel *model;
@property (nonatomic, strong) RACCommand *supportCommand;

@end

@implementation CWUserCellViewModel

#pragma mark - life cycle

#pragma mark - private UI

#pragma mark - overwrite

#pragma mark - public

+ (instancetype)viewModelWithModel:(CWUserModel *)model {
    return [[CWUserCellViewModel alloc] initWithModel:model];
}

#pragma mark - private

- (instancetype)initWithModel:(CWUserModel *)model {
    if (self = [super init]) {
        self.model = model;
        [self dealCommand];
    }
    return self;
}

#pragma mark - request

#pragma mark - delegate

#pragma mark - notification

#pragma mark - event response
//处理View中的事件
- (void)dealCommand {
    WEAKSELF
    self.supportCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
        weakSelf.isSupport = !weakSelf.isSupport;
        if (weakSelf.isSupport) {
            weakSelf.buttonTitle = weakSelf.model.supportCount + 1;
        } else {
            weakSelf.buttonTitle = weakSelf.model.supportCount - 1;
        }
        return  [RACSignal empty];
    }];
}

#pragma mark - getter and setter

- (NSString *)titltLableText {
    return self.model.title;
}

-(NSString *)buttonTitle {
    return [NSString stringWithFormat:@"支持数%ld",self.model.supportCount];
}

- (void)setButtonTitle:(NSInteger)buttonTitle {
    self.model.supportCount = buttonTitle;
}

- (BOOL)isSupport {
    return self.model.isSupport;
}

- (void)setIsSupport:(BOOL)isSupport {
    self.model.isSupport = isSupport;
}

@end
