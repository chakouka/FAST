//
//  AMInvoiceCaseTableViewSection.m
//  AramarkFSP
//
//  Created by FYH on 7/28/14.
//  Copyright (c) 2014 PWC Inc. All rights reserved.
//

#import "AMInvoiceCaseTableViewSection.h"

@implementation AMInvoiceCaseTableViewSection

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [AMUtilities refreshFontInView:self];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
