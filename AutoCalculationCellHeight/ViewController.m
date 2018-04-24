//
//  ViewController.m
//  AutoCalculationCellHeight
//
//  Created by 孟庆洪 on 2018/4/24.
//  Copyright © 2018年 mqhong. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"
#import "UITableView+FDTemplateLayoutCell.h"
#import "MM_Cell.h"
#import "MM_CellModel.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView  *tableView;

@property (nonatomic,strong) NSMutableArray  *tableViewArr;

@property (nonatomic,strong) NSArray *nameArr;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.nameArr = @[@"樱木花道",@"赤木刚宪",@"三井寿",@"流川枫",@"宫城良田"];
    self.tableViewArr = [self createTableViewArr];
    [self.tableView registerClass:[MM_Cell class] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
}

#pragma mark create modelArr
-(NSMutableArray *)createTableViewArr{
    NSMutableArray *marr  = [NSMutableArray array];
    for (int i = 0; i < 100; i++) {
        NSInteger time = arc4random() % 200;
        NSString *name = self.nameArr[time % 5];
        NSString *nowStr = name;
        for (int k = 0; k < time; k++) {
            nowStr = [NSString stringWithFormat:@"%@-%@",nowStr,name];
        }
        MM_CellModel *model = [MM_CellModel new];
        model.nameStr = name;
        model.imageStr = name;
        model.Des = nowStr;
        
        [marr addObject:model];
    }
    return marr;
}

#pragma mark tableview delegate and datasource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.tableViewArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MM_Cell *cell= [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[MM_Cell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    }
    [self configureCell:cell atIndexPath:indexPath];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    MM_CellModel *entity = self.tableViewArr[indexPath.row];
    return [tableView fd_heightForCellWithIdentifier:@"cell" cacheByIndexPath:indexPath configuration:^(MM_Cell *cell) {
        [self configureCell:cell atIndexPath:indexPath];
    }];
}

- (void)configureCell:(MM_Cell *)cell atIndexPath:(NSIndexPath *)indexPath {
    cell.fd_enforceFrameLayout = YES; 
//    if (indexPath.row % 2 == 0) {
//        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
//    } else {
//        cell.accessoryType = UITableViewCellAccessoryCheckmark;
//    }
    cell.model = self.tableViewArr[indexPath.row];
}

-(UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor whiteColor];
    }
    return _tableView;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
//    [self.tableViewArr addObjectsFromArray:self.tableViewArr];
//    [self.tableView reloadData];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
