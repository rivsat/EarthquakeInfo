//
//  EarthquakeViewModel.h
//  EarthquakeInfo
//
//  Created by Tasvir H Rohila on 14/10/2015.
//  Copyright © 2015 Tasvir H Rohila. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EarthquakeDataModel.h"

@class EarthquakeViewModel;

@protocol EarthquakeViewModelDelegate <NSObject>

- (void) didFinishLoadingData: (NSError *) error;

@end

@interface EarthquakeViewModel : NSObject

@property (nonatomic, retain) EarthquakeDataModel* earthquakeDataModel;

@property (nonatomic, retain) id<EarthquakeViewModelDelegate> delegate;

+ (EarthquakeViewModel*)sharedInstance;
- (void) searchEarthquakeData;

- (NSUInteger) getDataCount;
- (NSString *) getDateTime: (NSInteger) index;
- (NSString *) getLocation: (NSInteger) index;
- (NSString *) getLat: (NSInteger) index;
- (NSString *) getLon: (NSInteger) index;
- (NSArray *) getallLocations;

@end
