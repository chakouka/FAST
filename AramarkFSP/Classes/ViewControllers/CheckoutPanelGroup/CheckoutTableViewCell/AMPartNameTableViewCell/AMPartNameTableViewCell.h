//
//  AMPartNameTableViewCell.h
//  AramarkFSP
//
//  Created by PwC on 5/21/14.
//  Copyright (c) 2014 PWC Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AMPartNameTableViewCell : UITableViewCell

//@property (weak, nonatomic) IBOutlet UIButton *btnQuantity;
@property (weak, nonatomic) IBOutlet UIButton *btnPartsName;
@property (weak, nonatomic) IBOutlet UITextField *textFieldPartsName;
@property (weak, nonatomic) IBOutlet UITextField *textFieldQuantity;
@property (weak, nonatomic) IBOutlet UILabel *labelTQuantity;
- (void)refreshData:(NSMutableDictionary *)dicInfo;

@end
