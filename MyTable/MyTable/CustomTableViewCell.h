//
//  CustomTableViewCell.h
//  MyTable
//
//  Created by NongFei on 2016/11/21.
//  Copyright © 2016年 NongFei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *productDetailLabel;
@property (weak, nonatomic) IBOutlet UILabel *productPriceLabel;
@property (weak, nonatomic) IBOutlet UILabel *productCountLabel;

@end
