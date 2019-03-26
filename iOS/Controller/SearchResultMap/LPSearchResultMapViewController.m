//
//  LPSearchResultMapViewController.m
//  LessonPepper
//
//  Created by ~JunBjn~ on 3/26/19.
//  Copyright © 2019 RSD. All rights reserved.
//

#import "LPSearchResultMapViewController.h"

@interface LPSearchResultMapViewController ()
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@end

@implementation LPSearchResultMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.mapView.showsUserLocation = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
