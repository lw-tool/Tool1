//
//  MainTableViewCell.m
//  TestDEMO
//
//  Created by liuwei on 2019/4/22.
//  Copyright © 2019年 com.LW. All rights reserved.
//

#import "MainTableViewCell.h"
#import "Masonry/Masonry.h"

@interface MainTableViewCell()

@property(nonatomic, strong) UILabel * mainLbl;
@end

@implementation MainTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.mainLbl];
        [_mainLbl mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(20);
            make.right.mas_equalTo(-20);
            make.height.mas_equalTo(80);
        }];
    }
    return self;
}



-(UILabel *)mainLbl{
    if (!_mainLbl) {
        _mainLbl = [[UILabel alloc] init];
        _mainLbl.layer.cornerRadius = 6;
        _mainLbl.layer.masksToBounds = YES;
//        _mainLbl.layer.borderColor = [UIColor blackColor].CGColor;
//        _mainLbl.layer.borderWidth = 1;
        _mainLbl.textAlignment =  NSTextAlignmentCenter;
        _mainLbl.textColor = [UIColor blackColor];
        _mainLbl.font = [UIFont systemFontOfSize:16];
//        _mainLbl.backgroundColor = [UIColor colorWithRed:142.0/255 green:207.0/255 blue:247.0/255 alpha:1];
        _mainLbl.backgroundColor = [UIColor colorWithRed:237.0/255 green:80.0/255 blue:86.0/255 alpha:1];
    }
    return _mainLbl;
}


-(void)reloadCell:(NSString *)title{
    self.mainLbl.text = title;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
