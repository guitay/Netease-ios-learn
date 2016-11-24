//
//  ArticleView.h
//  MyBlog
//
//  Created by NongFei on 2016/11/19.
//  Copyright © 2016年 NongFei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ArticleView : UIView
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;

@end
