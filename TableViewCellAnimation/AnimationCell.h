//
//  AnimationCell.h
//  TableViewCellAnimation
//
//  Created by FrankLiu on 15/10/7.
//  Copyright © 2015年 FrankLiu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AnimationCell : UITableViewCell

@property (nonatomic, strong) UILabel *m_nameLabel;

- (void)showIconAnimated:(BOOL)animated;
- (void)hideIconAnimated:(BOOL)animated;

- (void)showSelectedAnimation;

@end
