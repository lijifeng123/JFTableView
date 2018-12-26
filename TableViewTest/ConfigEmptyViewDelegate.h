//
//  ConfigEmptyViewDelegate.h
//  TableViewTest
//
//  Created by 闪电科技 on 2018/12/26.
//  Copyright © 2018年 闪电科技. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ConfigEmptyViewDelegate <NSObject>

- (NSString *)alertMessage;
- (NSString *)showImageName;

@end

NS_ASSUME_NONNULL_END
