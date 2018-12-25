//
//  JFRefreshTableView.m
//  TableViewTest
//
//  Created by 闪电科技 on 2018/12/25.
//  Copyright © 2018年 闪电科技. All rights reserved.
//

#import "JFRefreshTableView.h"
#import <MJRefresh/MJRefresh.h>
#import "UITableView+jf_TableViewEmpty.h"

@interface JFRefreshTableView ()

@property (nonatomic,assign) NSInteger page;

@end

@implementation JFRefreshTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    
    self = [super initWithFrame:frame style:style];
    if (self) {
        
        [self baseConfig];
    }
    return self;
}

- (void)baseConfig{
    
    self.tableHeaderView = [UIView new];
    self.tableFooterView = [UIView new];
    
    self.page = 1;
    
    self.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        self.page = 1;
        if ([self.jf_tableViewDelegate respondsToSelector:@selector(jf_tableViewRefresh:pageNum:)]) {
            [self.jf_tableViewDelegate jf_tableViewRefresh:RefreshTypeDown pageNum:1];
        }
    }];
    
    self.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        self.page ++;
        if ([self.jf_tableViewDelegate respondsToSelector:@selector(jf_tableViewRefresh:pageNum:)]) {
            [self.jf_tableViewDelegate jf_tableViewRefresh:RefreshTypeUp pageNum:self.page];
        }
    }];
}

- (void)jf_endRefresh{
    [self reloadData];
    [self.mj_header endRefreshing];
    [self.mj_footer endRefreshing];
}

@end
