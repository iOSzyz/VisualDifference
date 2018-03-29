//
//  GW_AdCell.h
//  testAd
//
//  Created by zhangyazhe on 2018/3/27.
//  Copyright © 2018年 zhangyazhe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GW_AdCell : UITableViewCell

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *height;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *width;
@property (weak, nonatomic) IBOutlet UIScrollView *sc;
@property (weak, nonatomic) IBOutlet UIImageView *img;

@end
