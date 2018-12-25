//
//  JF_tableViewEmptyView.m
//  TableViewTest
//
//  Created by 闪电科技 on 2018/12/25.
//  Copyright © 2018年 闪电科技. All rights reserved.
//

#import "JF_tableViewEmptyView.h"

@interface JF_tableViewEmptyView ()

@property (nonatomic,strong) UIImageView *imageView;
@property (nonatomic,strong) UILabel *messageLabel;

@end

@implementation JF_tableViewEmptyView

- (instancetype)init{
    
    self = [super init];
    if (self) {
//        self.backgroundColor = [UIColor redColor];
//        [self configUI];
    }
    return self;
}

- (void)configUI{
    

}

- (void)layoutSubviews{
    
    [self addSubview:self.imageView];
    [self addSubview:self.messageLabel];
}

- (UIImageView *)imageView{
    if (!_imageView) {
        _imageView = [[UIImageView alloc]initWithFrame:CGRectMake((self.bounds.size.width - 100)/2 , (self.bounds.size.height - 100)/2 - 50, 100, 100)];
        _imageView.image = [UIImage imageNamed:@"SDAlertSuccess"];
        _imageView.contentMode = UIViewContentModeCenter;
    }
    return _imageView;
}

- (UILabel *)messageLabel{
    if (!_messageLabel) {
        _messageLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, (self.bounds.size.height - 100)/2 + 70, self.bounds.size.width, 30)];
//        _messageLabel.backgroundColor = [UIColor greenColor];
        _messageLabel.textAlignment = NSTextAlignmentCenter;
        _messageLabel.text = @"没数据是为啥？咋心里一点b数没有";
    }
    return _messageLabel;
}

@end
