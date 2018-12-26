//
//  JFRefreshTableView.h
//  TableViewTest
//
//  Created by 闪电科技 on 2018/12/25.
//  Copyright © 2018年 闪电科技. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UITableView+jf_TableViewEmpty.h"

typedef NS_ENUM(NSInteger , RefreshType){
    /** 上拉刷新 */
    RefreshTypeUp,
    /** 下拉刷新 */
    RefreshTypeDown
};

@protocol JFRefreshDelegaete <NSObject>

- (void)jf_tableViewRefresh:(RefreshType)type pageNum:(NSInteger)pageNum;

@end

NS_ASSUME_NONNULL_BEGIN

@interface JFRefreshTableView : UITableView

@property (nonatomic,weak) id <JFRefreshDelegaete> jf_tableViewDelegate;

- (void)jf_endRefresh;

@end

NS_ASSUME_NONNULL_END
