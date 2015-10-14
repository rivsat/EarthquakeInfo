//
//  EarthquakeLocation.m
//  EarthquakeInfo
//
//  Created by Tasvir H Rohila on 14/10/2015.
//  Copyright © 2015 Tasvir H Rohila All rights reserved.
//

#import "EarthquakeLocation.h"

@interface EarthquakeLocation ()
@property (nonatomic, copy) NSString *location;
@property (nonatomic, copy) NSString *dateTime;
@property (nonatomic, assign) CLLocationCoordinate2D theCoordinate;
@end

@implementation EarthquakeLocation

- (id)initWithName:(NSString*)location withDateTime:(NSString*)dateTime withCoordinate:(CLLocationCoordinate2D)coordinate {
    if ((self = [super init])) {
        self.location = location;
        self.dateTime = dateTime;
        self.theCoordinate = coordinate;
    }
    return self;
}

- (NSString *)title {
    return _location;
}

- (NSString *)subtitle {
    return _dateTime;
}

- (CLLocationCoordinate2D)coordinate {
    return _theCoordinate;
}

- (MKMapItem*)mapItem {
    /*
    
    */
    return nil;
}


@end
