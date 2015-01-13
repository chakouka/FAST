//
//  AMDBLocation.h
//  AramarkFSP
//
//  Created by Haipeng ZHAO on 7/31/2014.
//  Copyright (c) 2014 PWC Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface AMDBLocation : NSManagedObject

@property (nonatomic, retain) NSString * accountID;
@property (nonatomic, retain) NSString * addtionalNotes;
@property (nonatomic, retain) NSNumber * badgeNeeded;
@property (nonatomic, retain) NSNumber * cabinetHeight;
@property (nonatomic, retain) NSString * city;
@property (nonatomic, retain) NSString * country;
@property (nonatomic, retain) NSString * createdBy;
@property (nonatomic, retain) NSDate * createdDate;
@property (nonatomic, retain) NSNumber * dockAvailable;
@property (nonatomic, retain) NSNumber * doorsRemoved;
@property (nonatomic, retain) NSNumber * doorwayWidth;
@property (nonatomic, retain) NSNumber * electricalInPlace;
@property (nonatomic, retain) NSNumber * electricity3ft;
@property (nonatomic, retain) NSString * electricOutlet;
@property (nonatomic, retain) NSNumber * elevatorSize;
@property (nonatomic, retain) NSString * elevatorStairs;
@property (nonatomic, retain) NSString * fakeID;
@property (nonatomic, retain) NSNumber * freightElevator;
@property (nonatomic, retain) NSString * lastModifiedBy;
@property (nonatomic, retain) NSDate * lastModifiedDate;
@property (nonatomic, retain) NSString * location;
@property (nonatomic, retain) NSString * locationID;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * personalProtection;
@property (nonatomic, retain) NSNumber * roomMeasurement;
@property (nonatomic, retain) NSNumber * safetyTraining;
@property (nonatomic, retain) NSNumber * siteLevel;
@property (nonatomic, retain) NSDate * siteSurveyDate;
@property (nonatomic, retain) NSString * specialNotes;
@property (nonatomic, retain) NSString * state;
@property (nonatomic, retain) NSString * street;
@property (nonatomic, retain) NSString * typeFlooring;
@property (nonatomic, retain) NSString * userID;
@property (nonatomic, retain) NSNumber * visitByServiceDep;
@property (nonatomic, retain) NSNumber * waterSource;
@property (nonatomic, retain) NSNumber * dataStatus;

@end
