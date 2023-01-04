//
//  AMLocation.m
//  AramarkFSP
//
//  Created by Appledev010 on 5/4/14.
//  Copyright (c) 2014 Aramark FSP. All rights reserved.
//

#import "AMLocation.h"


@implementation AMLocation

@synthesize name;
@synthesize accountID;
@synthesize locationID;
@synthesize createdBy;
@synthesize createdDate;
@synthesize lastModifiedBy;
@synthesize location;
@synthesize country;
@synthesize state;
@synthesize city;
@synthesize street;
@synthesize lastModifiedDate;
@synthesize userID;
@synthesize addtionalNotes;
@synthesize badgeNeeded;
@synthesize cabinetHeight;
@synthesize dockAvailable;
@synthesize doorsRemoved;
@synthesize doorwayWidth;
@synthesize electricOutlet;
@synthesize electricity3ft;
@synthesize elevatorStairs;
@synthesize elevatorSize;
@synthesize freightElevator;
@synthesize personalProtection;
@synthesize electricalInPlace;
@synthesize visitByServiceDep;
@synthesize roomMeasurement;
@synthesize siteLevel;
@synthesize siteSurveyDate;
@synthesize specialNotes;
@synthesize safetyTraining;
@synthesize typeFlooring;
@synthesize waterSource;
@synthesize fakeID;
@synthesize clientDrilledHoles;
@synthesize coiRequired;
@synthesize followUpNeeded;
@synthesize solidSurfaceCounters;
@synthesize vaccineCardRequired;
@synthesize dimensionsProposedSpace;
@synthesize merchandiserType;
@synthesize filterType;
@synthesize dockHeight;
@synthesize hoursOfOperation;
@synthesize typeOfWalls;
@synthesize opportunityOwner;
@synthesize naSpecialRequest;
@synthesize dockAvailable2;
@synthesize doorsRemoved2;
@synthesize requiredElectrical;
@synthesize electricityWithin3ft;
@synthesize freightElevator2;
@synthesize ppeRequired;
@synthesize requiredVisit;
@synthesize siteLevel2;
@synthesize requiredSafetyTraining;
@synthesize waterSource2;
@synthesize requiredBadge;
@synthesize numberOfMerchandisers;
@synthesize numberOfWaterblocks;
@synthesize numberOfFilters;

- (NSString *)description
{
    return [NSString stringWithFormat:@"accountID : %@ | location : %@",accountID,location];
}

@end
