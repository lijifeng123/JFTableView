//
//  UITableView+jf_TableViewEmpty.h
//  TableViewTest
//
//  Created by 闪电科技 on 2018/12/25.
//  Copyright © 2018年 闪电科技. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ConfigEmptyViewDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface UITableView (jf_TableViewEmpty)

@property (nonatomic,weak) id <ConfigEmptyViewDelegate> jf_configEmptyDelegate;

@end

NS_ASSUME_NONNULL_END
