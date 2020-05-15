//
//  CWUserCellViewModel.h
//  MVX
//
//  Created by caowei on 2020/5/4.
//  Copyright © 2020 caowei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CWUserModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface CWUserCellViewModel : NSObject

+ (instancetype)viewModelWithModel:(CWUserModel *)model;

//@property (nonatomic,copy) NSString *titltLableText;
//@property (nonatomic,copy) NSString *buttonTitle;
//@property (nonatomic,assign) BOOL isSupport;

- (NSString *)titltLableText;
- (NSString *)buttonTitle;
- (BOOL)isSupport;

- (RACCommand *)supportCommand;

@end

NS_ASSUME_NONNULL_END
