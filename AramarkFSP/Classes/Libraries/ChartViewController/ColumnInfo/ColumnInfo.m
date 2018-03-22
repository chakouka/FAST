//
//  ColumnInfo.m
//  ChartTest
//
//  Created by PwC on 5/28/14.
//  Copyright (c) 2014 PwC. All rights reserved.
//

#import "ColumnInfo.h"

@implementation ColumnInfo
@synthesize strIndex;
@synthesize strBottomInfo;
@synthesize iHeight;

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@ : %@ : %ld",self.strIndex,self.strBottomInfo,(long)self.iHeight];
}

@end
