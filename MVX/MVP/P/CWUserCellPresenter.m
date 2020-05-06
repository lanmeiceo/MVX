//
//  CWUserCellPresenter.m
//  MVX
//
//  Created by caowei on 2020/5/4.
//  Copyright © 2020 caowei. All rights reserved.
//

#import "CWUserCellPresenter.h"

@interface CWUserCellPresenter ()

@property (nonatomic, strong) CWUserModel *model;

@end

@implementation CWUserCellPresenter

#pragma mark - life cycle

#pragma mark - private UI

#pragma mark - overwrite

#pragma mark - public

+ (instancetype)presenterWithModel:(CWUserModel *)model {
    CWUserCellPresenter *presenter = [[CWUserCellPresenter alloc] init];
    presenter.model = model;
    return presenter;
}

#pragma mark - private

#pragma mark - request

#pragma mark - delegate

#pragma mark - notification

#pragma mark - event response

- (void)supportClick {
    self.model.isSupport = !self.model.isSupport;
    if (self.model.isSupport) {
        self.model.supportCount ++;
    } else {
        self.model.supportCount --;
    }
    if (self.view && [self.view respondsToSelector:@selector(reloadCellData:)]) {
        [self.view reloadCellData:self];
    }
}

#pragma mark - getter and setter

- (NSString *)titltLableText {
    return self.model.title;
}

-(NSString *)buttonTitle {
    return [NSString stringWithFormat:@"支持数%ld",self.model.supportCount];
}

- (BOOL)isSupport {
    return self.model.isSupport;
}

@end
