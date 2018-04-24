//
//  MM_Cell.h
//  AutoCalculationCellHeight
//
//  Created by 孟庆洪 on 2018/4/24.
//  Copyright © 2018年 mqhong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MM_CellModel.h"
@interface MM_Cell : UITableViewCell
@property (nonatomic,strong) MM_CellModel  *model;
@property (nonatomic,copy) NSString  *nameStr;
@end
