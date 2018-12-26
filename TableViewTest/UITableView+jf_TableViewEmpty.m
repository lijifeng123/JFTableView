//
//  UITableView+jf_TableViewEmpty.m
//  TableViewTest
//
//  Created by 闪电科技 on 2018/12/25.
//  Copyright © 2018年 闪电科技. All rights reserved.
//

#import "UITableView+jf_TableViewEmpty.h"
#import <objc/runtime.h>
#import "JF_tableViewEmptyView.h"


@implementation UITableView (jf_TableViewEmpty)

+ (void)load{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Method reloadData = class_getInstanceMethod(self, @selector(reloadData));
        Method jf_reloadData = class_getInstanceMethod(self, @selector(jf_reloadData));
        method_exchangeImplementations(reloadData, jf_reloadData);
    });
}

- (void)jf_reloadData{
    
    [self jf_reloadData];
    
    BOOL havingData = 0;
    NSInteger sectionCount = [self numberOfSections];
    for (int i = 0; i < sectionCount; i ++) {
       NSInteger rowCount = [self numberOfRowsInSection:i];
        if (rowCount > 0) {
            havingData = 1;
            break;
        }
    }
    
    [self showEmptyView:havingData];
}

- (void)showEmptyView:(BOOL)havingData{
    
    
    if (!havingData) {
        JF_tableViewEmptyView *emptyView = [[JF_tableViewEmptyView alloc]init];
        if ([self.jf_configEmptyDelegate respondsToSelector:@selector(alertMessage)]) {
            emptyView.delegate = self.jf_configEmptyDelegate;
        }
        NSLog(@"%@",self.jf_configEmptyDelegate);
        emptyView.frame = self.bounds;
        self.tableFooterView = emptyView;
    }else{
        self.tableFooterView = [UIView new];
    }
    
}

- (void)setJf_configEmptyDelegate:(id<ConfigEmptyViewDelegate>)jf_configEmptyDelegate{
    
    objc_setAssociatedObject(self, @"hhh", jf_configEmptyDelegate, OBJC_ASSOCIATION_ASSIGN);
}

- (id<ConfigEmptyViewDelegate>)jf_configEmptyDelegate{
    
    return objc_getAssociatedObject(self, @"hhh");
}

@end
