//
//  AMPartsUsedDBManager.h
//  AramarkFSP
//
//  Created by Appledev010 on 5/24/14.
//  Copyright (c) 2014 PWC Inc. All rights reserved.
//

#import "AMObjectDBManager.h"
#import "AMPartsUsed.h"

@interface AMPartsUsedDBManager : AMObjectDBManager

+ (AMPartsUsedDBManager *)sharedInstance;
@end
