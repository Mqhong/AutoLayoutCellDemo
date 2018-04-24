//
//  MM_Cell.m
//  AutoCalculationCellHeight
//
//  Created by 孟庆洪 on 2018/4/24.
//  Copyright © 2018年 mqhong. All rights reserved.
//

#import "MM_Cell.h"
#import "Masonry.h"
@interface MM_Cell()
@property (nonatomic,strong) UILabel *nameLbl;
@property (nonatomic,strong) UIImageView  *MM_ImageView;
@property (nonatomic,strong) UILabel  *DesLbl;
@end

@implementation MM_Cell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self != nil) {
        [self _initView];
    }
    return self;
}

-(void)_initView{
    self.nameLbl = [UILabel new];
    self.nameLbl.textColor = [UIColor redColor];
    self.nameLbl.font = [UIFont boldSystemFontOfSize:16];
    [self.contentView addSubview:self.nameLbl];
    
    self.MM_ImageView = [UIImageView new];
    [self.contentView addSubview:self.MM_ImageView];
    
    self.DesLbl = [UILabel new];
    self.DesLbl.numberOfLines = 0;
    self.DesLbl.textColor = [UIColor grayColor];
    self.DesLbl.font = [UIFont systemFontOfSize:13];
    [self.contentView addSubview:self.DesLbl];
    
    [self.MM_ImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self.contentView).offset(15);
        make.width.height.equalTo(@60);
    }];
    
    [self.nameLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.MM_ImageView.mas_right).offset(15);
        make.centerY.equalTo(self.MM_ImageView.mas_centerY);
    }];
    
    [self.DesLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(15);
        make.right.equalTo(self.contentView.mas_right).offset(-15);
        make.top.equalTo(self.MM_ImageView.mas_bottom).offset(15);
    }];
}

-(void)_setDataSource:(MM_CellModel *)model{
    
    self.MM_ImageView.image = [UIImage imageNamed:model.imageStr];
//    self.MM_ImageView.backgroundColor = [UIColor grayColor];
    self.nameLbl.text = model.nameStr;
    self.DesLbl.text = model.Des;

}


-(void)setModel:(MM_CellModel *)model{
    _model = model;
    [self _setDataSource:model];
}

// If you are not using auto layout, override this method, enable it by setting
// "fd_enforceFrameLayout" to YES.
- (CGSize)sizeThatFits:(CGSize)size {
    CGFloat totalHeight = 0;
    totalHeight += 90;
    totalHeight += [self.DesLbl sizeThatFits:CGSizeMake(size.width - 30, size.height)].height;
    totalHeight += 15; // margins
    return CGSizeMake(size.width, totalHeight);
}


- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
