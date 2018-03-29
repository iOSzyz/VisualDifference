//
//  ViewController.m
//  testAd
//
//  Created by zhangyazhe on 2018/3/27.
//  Copyright © 2018年 zhangyazhe. All rights reserved.
//

#import "ViewController.h"
#import "GW_AdCell.h"

#define HEIGHT 150

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 30;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 15 || indexPath.row ==5) {
        return HEIGHT;
    }
    return 100;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 15 || indexPath.row ==5) {
        static NSString *cellID = @"GW_AdCell";
        GW_AdCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
        if (!cell) {
            cell = [[NSBundle mainBundle] loadNibNamed:cellID owner:nil options:nil][0];
        }
        UIImage *bg = [UIImage imageNamed:@"a.jpg"];
        CGFloat scW = [UIScreen mainScreen].bounds.size.width;
        
        cell.width.constant = scW;
        cell.height.constant = [UIScreen mainScreen].bounds.size.height;
        cell.img.image = bg;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else{
        static NSString *cellID = @"cellId";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
        if (!cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        }
        cell.textLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
}

-(void)scrollViewDidScroll:(UITableView *)scrollView{
    NSArray *visCells = scrollView.visibleCells;
    [visCells enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:[GW_AdCell class]]) {
            GW_AdCell *adCell = obj;
            CGFloat maxOff = adCell.height.constant - HEIGHT;
            CGFloat scrollOff = scrollView.contentOffset.y - adCell.frame.origin.y + [UIScreen mainScreen].bounds.size.height - HEIGHT ;
            if (maxOff <= scrollOff) {
                [adCell.sc setContentOffset:CGPointMake(0,0)];
            }else if (scrollOff < 0){
                [adCell.sc setContentOffset:CGPointMake(0,maxOff)];
                
            } else{
                [adCell.sc setContentOffset:CGPointMake(0,(maxOff - scrollOff))];
            }
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
