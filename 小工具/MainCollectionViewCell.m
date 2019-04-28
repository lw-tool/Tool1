//
//  MainCollectionViewCell.m
//  小工具
//
//  Created by liuwei on 2019/4/28.
//  Copyright © 2019 com.LW. All rights reserved.
//

#import "MainCollectionViewCell.h"
#import "Masonry/Masonry.h"

@interface MainCollectionViewCell()

@property (nonatomic, strong) UIView * backView;

@property (nonatomic, strong) UIImageView * topImage;

@property (nonatomic, strong) UILabel * titleLbl;
@end


@implementation MainCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}


-(void)setupUI{
    [self.contentView addSubview: self.backView];
    [self.backView addSubview:self.topImage];
    [self.backView addSubview:self.titleLbl];
    [_backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    
    [_topImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.backView.mas_centerX);
        make.top.mas_equalTo(15);
//        make.width.height.mas_equalTo(self.mas_width).offset(-50);
        make.width.height.mas_equalTo(64);
    }];
    
    [_titleLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.topImage.mas_centerX);
        make.top.mas_equalTo(self.topImage.mas_bottom).offset(10);
        make.width.mas_equalTo(self.topImage.mas_width);
        make.bottom.mas_equalTo(self.backView.mas_bottom);
    }];
}


#pragma mark getter
-(UIView *)backView{
    if (!_backView) {
        _backView = [[UIView alloc] init];
        _backView.backgroundColor = [UIColor whiteColor];
        _backView.userInteractionEnabled = YES;
        _backView.layer.borderColor = [UIColor lightGrayColor].CGColor;
        _backView.layer.borderWidth = 1;
    }
    return _backView;
}

-(UIImageView *)topImage{
    if (!_topImage) {
        _topImage = [[UIImageView alloc] init];
        _topImage.contentMode = UIViewContentModeScaleAspectFit;
        _topImage.userInteractionEnabled = YES;
    }
    return _topImage;
}

-(UILabel *)titleLbl{
    if (!_titleLbl) {
        _titleLbl = [[UILabel alloc] init];
        _titleLbl.textColor = [UIColor blackColor];
        _titleLbl.font = [UIFont systemFontOfSize:14];
        _titleLbl.textAlignment = NSTextAlignmentCenter;
        _titleLbl.numberOfLines = 0;
    }
    return _titleLbl;
}


#pragma mark reload method
-(void)printCell:(NSString *)image title:(NSString *)title{
    self.topImage.image = [UIImage imageNamed:image];
    self.titleLbl.text = title;
}
@end
