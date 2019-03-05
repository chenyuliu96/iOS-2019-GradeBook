//
//  ViewController.h
//  iOS-HW2
//
//  Created by Chenyu Liu on 3/4/19.
//  Copyright © 2019 Chenyu Liu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Student.h"
@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UISegmentedControl *segment;
@property NSMutableArray* SArr;
- (void) displayStudent;
- (BOOL) filled;
@end

