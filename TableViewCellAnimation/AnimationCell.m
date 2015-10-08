//
//  AnimationCell.m
//  TableViewCellAnimation
//
//  Created by FrankLiu on 15/10/7.
//  Copyright © 2015年 FrankLiu. All rights reserved.
//

#import "AnimationCell.h"

#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)

@interface AnimationCell ()

@property (nonatomic, strong) UIImageView *m_iconView;
@property (nonatomic, strong) UIView      *m_lineView;
@property (nonatomic, strong) UIView      *m_rectView;

@end

@implementation AnimationCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {

    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        // 未选中时的矩形框
        self.m_rectView = [[UIView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - 60, 23, 35, 35)];
        [self addSubview:_m_rectView];
        
        _m_rectView.layer.borderWidth = 1;
        _m_rectView.layer.borderColor = [UIColor grayColor].CGColor;
        
        // 选中时的图标
        self.m_iconView = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - 58, 20, 40, 40)];
        [self addSubview:_m_iconView];
        
        _m_iconView.image = [UIImage imageNamed:@"icon.png"];
        _m_iconView.alpha = 0;
        
        // 标题
        self.m_nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(30, 10, 300, 60)];
        [self addSubview:_m_nameLabel];
        
        _m_nameLabel.font      = [UIFont fontWithName:@"HelveticaNeue-Thin" size:30];
        _m_nameLabel.textColor = [UIColor grayColor];
        
        // 强调标题的线条
        self.m_lineView = [[UIView alloc]initWithFrame:CGRectMake(30, 70, 0, 2)];
        [self addSubview:_m_lineView];
        
        _m_lineView.alpha           = 0;
        _m_lineView.backgroundColor = [UIColor redColor];
    }
    
    return  self;
}

- (void)showIconAnimated:(BOOL)animated {
    
    if (animated) {
        
        _m_iconView.transform = CGAffineTransformMake(2, 0, 0, 2, 0, 0);
        [UIView animateWithDuration:0.5
                              delay:0
             usingSpringWithDamping:1
              initialSpringVelocity:4
                            options:UIViewAnimationOptionCurveEaseInOut
                         animations:^{
                             _m_iconView.alpha = 1;
                             _m_iconView.transform = CGAffineTransformMake(1, 0, 0, 1, 0, 0);
                             
                             _m_lineView.alpha = 1;
                             _m_lineView.frame = CGRectMake(30, 70, 200, 2);
                             
                             _m_nameLabel.frame = CGRectMake(30+50, 10, 300, 60);
                             
                             _m_rectView.layer.borderColor = [UIColor redColor].CGColor;
                             _m_rectView.transform         = CGAffineTransformMake(0.8, 0, 0, 0.8, 0, 0);
                             _m_rectView.layer.cornerRadius = 4;
                             
                         }
                         completion:^(BOOL finished) {
                             
                         }];
        
    } else {
        
        _m_iconView.alpha = 1;
        _m_iconView.transform = CGAffineTransformMake(1, 0, 0, 1, 0, 0);
        
        _m_lineView.alpha = 1;
        _m_lineView.frame = CGRectMake(30, 70, 200, 2);
        
        _m_nameLabel.frame = CGRectMake(30+50, 10, 300, 60);
        
        _m_rectView.layer.borderColor = [UIColor redColor].CGColor;
        _m_rectView.transform         = CGAffineTransformMake(0.8, 0, 0, 0.8, 0, 0);
        _m_rectView.layer.cornerRadius = 4;
    }

}
- (void)hideIconAnimated:(BOOL)animated {
    
    if (animated) {
    
        [UIView animateWithDuration:0.5
                              delay:0
             usingSpringWithDamping:1
              initialSpringVelocity:4
                            options:UIViewAnimationOptionCurveEaseInOut
                         animations:^{
                             _m_iconView.alpha = 0;
                             _m_iconView.transform = CGAffineTransformMake(0.5, 0, 0, 0.5, 0, 0);
                             
                             _m_lineView.alpha = 0;
                             _m_lineView.frame = CGRectMake(30, 70, 0, 2);
                             
                             _m_nameLabel.frame = CGRectMake(30, 10, 300, 60);
                             
                             _m_rectView.layer.borderColor = [UIColor grayColor].CGColor;
                             _m_rectView.transform         = CGAffineTransformMake(1, 0, 0, 1, 0, 0);
                             _m_rectView.layer.cornerRadius = 0;
                             
                         }
                         completion:^(BOOL finished) {
                             
                         }];
        
    } else {
        
        _m_iconView.alpha = 0;
        _m_iconView.transform = CGAffineTransformMake(0.5, 0, 0, 0.5, 0, 0);
        
        _m_lineView.alpha = 0;
        _m_lineView.frame = CGRectMake(30, 70, 0, 2);
        
        _m_nameLabel.frame = CGRectMake(30, 10, 300, 60);
        
        _m_rectView.layer.borderColor = [UIColor grayColor].CGColor;
        _m_rectView.transform         = CGAffineTransformMake(1, 0, 0, 1, 0, 0);
        _m_rectView.layer.cornerRadius = 0;
    }

}

- (void)showSelectedAnimation {

    UIView *tmpView         = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 80)];
    tmpView.backgroundColor = [[UIColor yellowColor] colorWithAlphaComponent:0.30];
    tmpView.alpha           = 0.f;
    
    [self addSubview:tmpView];
    
    
    [UIView animateWithDuration:0.20 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        tmpView.alpha = 0.8f;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.20 delay:0.1 options:UIViewAnimationOptionCurveEaseOut animations:^{
            tmpView.alpha = 0.f;
        } completion:^(BOOL finished) {
            [tmpView removeFromSuperview];
        }];
    }];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
