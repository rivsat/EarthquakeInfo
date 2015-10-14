//
//  EarthquakeDataModel.h
//  EarthquakeInfo
//
//  Created by Alex Louey on 14/10/2015.
//  Copyright © 2015 Tasvir H Rohila. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EarthquakeDataModel : NSObject

@property (nonatomic, strong) NSMutableArray* locationDataArray;

-(void) populateData: (NSArray *) dataArray;

- (NSUInteger) getDataCount;
- (NSString *) getDateTime: (NSInteger) index;
- (NSString *) getLocation: (NSInteger) index;
- (NSString *) getLat: (NSInteger) index;
- (NSString *) getLon: (NSInteger) index;
- (NSArray*) getallLocations;
@end
