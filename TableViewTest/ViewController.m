//
//  ViewController.m
//  TableViewTest
//
//  Created by 闪电科技 on 2018/12/25.
//  Copyright © 2018年 闪电科技. All rights reserved.
//

#import "ViewController.h"
#import "JFRefreshTableView.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,JFRefreshDelegaete>

@property (nonatomic,assign) NSInteger rowNum;
@property (nonatomic,strong) JFRefreshTableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.rowNum = 10;
    [self.view addSubview:self.tableView];
}

- (JFRefreshTableView *)tableView{
    if (!_tableView) {
        _tableView = [[JFRefreshTableView alloc]initWithFrame:CGRectMake(0, 0, 375, 667) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.jf_tableViewDelegate = self;
    }
    return _tableView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.rowNum;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"section = %ld, row = %ld", indexPath.section,indexPath.row];
    return cell;
}

- (void)jf_tableViewRefresh:(RefreshType)type pageNum:(NSInteger)pageNum{
    
    NSLog(@"type: %ld",type);
    NSLog(@"pageNum: %ld",pageNum);
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.tableView jf_endRefresh];//数据请求成功调用
    });
}



- (IBAction)showEmptyPage:(UIBarButtonItem *)sender {
    
    self.rowNum = 0;
    [self.tableView reloadData];
}
- (IBAction)showTableViewCell:(UIBarButtonItem *)sender {
    
    self.rowNum = 5;
    [self.tableView reloadData];
}

@end
