//
//  SecondViewController.m
//  EarthquakeInfo
//
//  Created by Alex Louey on 14/10/2015.
//  Copyright © 2015 Tasvir H Rohila. All rights reserved.
//
//  Created by Tasvir H Rohila on 03/10/15.
//  Copyright (c) 2015 Tasvir H Rohila. All rights reserved.

#import "SecondViewController.h"
#import <MapKit/MapKit.h>
#import "EarthquakeLocation.h"

@interface SecondViewController ()
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (retain, nonatomic) EarthquakeViewModel *earthQuakeViewModel;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self intiViewModel];
    [self showEarthquakePointsOnMap];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-  (void) intiViewModel {
    _earthQuakeViewModel = [EarthquakeViewModel sharedInstance];
    _earthQuakeViewModel.delegate = self;
}

- (void) showEarthquakePointsOnMap {
    NSArray *locations = [_earthQuakeViewModel getallLocations];
    [self plotPositions:locations];
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation {
    static NSString *identifier = @"MyLocation";
    if ([annotation isKindOfClass:[EarthquakeLocation class]]) {
        
        MKAnnotationView *annotationView = (MKAnnotationView *) [_mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
        if (annotationView == nil) {
            annotationView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier];
            annotationView.enabled = YES;
            annotationView.canShowCallout = YES;
            //annotationView.image = [UIImage imageNamed:@"arrest.png"];//here we use a nice image instead of the default pins
        } else {
            annotationView.annotation = annotation;
        }
        
        return annotationView;
    }
    
    return nil;
}

- (void)plotPositions:(NSArray *)responseData {
    for (id<MKAnnotation> annotation in _mapView.annotations) {
        [_mapView removeAnnotation:annotation];
    }
    
    
    for (NSDictionary *row in responseData) {
        NSNumber * latitude = [row objectForKey:@"lat"];
        NSNumber * longitude = [row objectForKey:@"lon"];
        NSString * location = [row objectForKey:@"region"];
        NSString * dateTime = [row objectForKey:@"timedate"];
        
        CLLocationCoordinate2D coordinate;
        coordinate.latitude = latitude.doubleValue;
        coordinate.longitude = longitude.doubleValue;
        EarthquakeLocation *annotation = [[EarthquakeLocation alloc] initWithName:location
                                                                     withDateTime:dateTime
                                                                   withCoordinate:coordinate];
        [_mapView addAnnotation:annotation];
    }
}

- (void) didFinishLoadingData:(NSError *)error {
    [self showEarthquakePointsOnMap];
}

@end
