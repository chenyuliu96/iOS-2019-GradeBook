//
//  Second.m
//  iOS-HW2
//
//  Created by Chenyu Liu on 3/5/19.
//  Copyright © 2019 Chenyu Liu. All rights reserved.
//

#import "Second.h"
#import "ViewController.h"

@interface Second ()
@property (weak, nonatomic) IBOutlet UITextField *studentName;
@property (weak, nonatomic) IBOutlet UITextField *studentAddress;
@property ViewController *first;
@property (weak, nonatomic) IBOutlet UIImageView *studentImage;

@end

@implementation Second
- (IBAction)backButtonPressed:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _studentName.text = _name;
    _studentAddress.text = _address;
    _studentImage.image = [UIImage imageNamed:_imageName];
    [_studentName setEnabled:NO];
    [_studentAddress setEnabled:NO];
}


@end
