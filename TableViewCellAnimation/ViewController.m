//
//  ViewController.m
//  TableViewCellAnimation
//
//  Created by FrankLiu on 15/10/7.
//  Copyright © 2015年 FrankLiu. All rights reserved.
//

#import "ViewController.h"
#import "AnimationCell.h"

static NSString *AnimatedCellFlag = @"AnimatedCellFlag";

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView    *m_tableView;
@property (nonatomic, strong) NSMutableArray *m_dataArray;
@property (nonatomic, strong) NSMutableArray *m_selectedCellArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // 初始化数据源
    self.m_dataArray         = [NSMutableArray array];
    self.m_selectedCellArray = [NSMutableArray array];
    
    [_m_dataArray addObject:@"NoZuoNoDie"];
    [_m_dataArray addObject:@"FrankLiu"];
    [_m_dataArray addObject:@"LifeIsCoding"];
    
    [_m_selectedCellArray addObject:@(NO)];
    [_m_selectedCellArray addObject:@(NO)];
    [_m_selectedCellArray addObject:@(NO)];
    
    // 初始化TableView
    self.m_tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.view addSubview:_m_tableView];
    
    _m_tableView.dataSource     = self;
    _m_tableView.delegate       = self;
    _m_tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [_m_tableView registerClass:[AnimationCell class] forCellReuseIdentifier:AnimatedCellFlag];
}

#pragma mark - TableView 
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return _m_dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    AnimationCell *cell = (AnimationCell*)[tableView dequeueReusableCellWithIdentifier:AnimatedCellFlag];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    cell.m_nameLabel.text = _m_dataArray[indexPath.row];
    
    if ([_m_selectedCellArray[indexPath.row] boolValue] == NO) {
        
        [cell hideIconAnimated:NO];
        
    } else {
    
        [cell showIconAnimated:NO];
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    return 80;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    AnimationCell *cell = (AnimationCell*)[tableView cellForRowAtIndexPath:indexPath];
    
    [cell showSelectedAnimation];
    
    if ([_m_selectedCellArray[indexPath.row] boolValue] == NO) {
        
        [_m_selectedCellArray replaceObjectAtIndex:indexPath.row withObject:@(YES)];
        [cell showIconAnimated:YES];
        
    } else {
        
        [_m_selectedCellArray replaceObjectAtIndex:indexPath.row withObject:@(NO)];
        [cell hideIconAnimated:YES];
    }
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
