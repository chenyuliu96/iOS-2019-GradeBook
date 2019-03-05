//
//  ViewController.m
//  iOS-HW2
//
//  Created by Chenyu Liu on 3/4/19.
//  Copyright © 2019 Chenyu Liu. All rights reserved.
//

#import "ViewController.h"
#import "Student.h"
#import "Second.h"
@interface ViewController ()
//@property NSMutableArray* SArr;
@property int currentIndex;
@property (weak, nonatomic) IBOutlet UITextField *nameTextBox;
@property (weak, nonatomic) IBOutlet UITextField *addressTextBox;
@property (weak, nonatomic) IBOutlet UITextField *midtermTextBox;
@property (weak, nonatomic) IBOutlet UITextField *finalTextBox;
@property (weak, nonatomic) IBOutlet UITextField *HW1TextBox;
@property (weak, nonatomic) IBOutlet UITextField *HW2TextBox;
@property (weak, nonatomic) IBOutlet UITextField *HW3TextBox;
@property (weak, nonatomic) IBOutlet UIButton *leftButton;
@property (weak, nonatomic) IBOutlet UIButton *rightButton;
@property (weak, nonatomic) IBOutlet UILabel *error;
@property (weak, nonatomic) IBOutlet UIButton *addStudentButton;
@property (weak, nonatomic) IBOutlet UISlider *slider;


@end



@implementation ViewController


- (IBAction)nameChanged:(id)sender {
    Student *s;
    if(!([_leftButton isHidden] && [_rightButton isHidden])){
        s = [_SArr objectAtIndex:_currentIndex];
        s.name = _nameTextBox.text;
    
    }
    
}
- (IBAction)addressChanged:(id)sender {
     if(!([_leftButton isHidden] && [_rightButton isHidden])){
    Student * s = [_SArr objectAtIndex:_currentIndex];
         s.address = _addressTextBox.text;}
}
- (IBAction)midtermChanged:(id)sender {
     if(!([_leftButton isHidden] && [_rightButton isHidden])){
    Student * s = [_SArr objectAtIndex:_currentIndex];
         s.midtermExam = [_midtermTextBox.text intValue];}
}

- (IBAction)finalChanged:(id)sender {
     if(!([_leftButton isHidden] && [_rightButton isHidden])){
    Student * s = [_SArr objectAtIndex:_currentIndex];
         s.finalExam = [_finalTextBox.text intValue];}
}
- (IBAction)hw1Changed:(id)sender {
     if(!([_leftButton isHidden] && [_rightButton isHidden])){
    Student * s = [_SArr objectAtIndex:_currentIndex];
         s.HW1 = [_HW1TextBox.text intValue];}
}

- (IBAction)hw2Changed:(id)sender {
     if(!([_leftButton isHidden] && [_rightButton isHidden])){
    Student * s = [_SArr objectAtIndex:_currentIndex];
         s.HW2 = [_HW2TextBox.text intValue];}
    
}
- (IBAction)hw3Changed:(id)sender {
     if(!([_leftButton isHidden] && [_rightButton isHidden])){
    Student * s = [_SArr objectAtIndex:_currentIndex];
         s.HW3 = [_HW3TextBox.text intValue];}
}





- (IBAction)slide:(id)sender {
    _currentIndex = _slider.value;
    if(_currentIndex == [_SArr count]-1){
        _rightButton.enabled = NO;
    }
    else{
        _rightButton.enabled = YES;
    }
    if(_currentIndex == 0){
        _leftButton.enabled = NO;
    }
    else{
        _leftButton.enabled = YES;
    }
    if([_SArr count] == 1){
        _leftButton.enabled = NO;
        _rightButton.enabled = NO;
    }
    [self displayStudent];
}

- (IBAction)addStudentPreesed:(id)sender {
    if([self filled]){
        
        _error.hidden = YES;
        Student *s = [[Student alloc] init];
        s.name = _nameTextBox.text;
        s.address = _addressTextBox.text;
        s.midtermExam = [_midtermTextBox.text intValue];
        s.finalExam = [_finalTextBox.text intValue];
        s.HW1 = [_HW1TextBox.text intValue];
        s.HW2 = [_HW2TextBox.text intValue];
        s.HW3 = [_HW3TextBox.text intValue];
        s.imageFile = @"4";
        [_SArr addObject: s];
        _currentIndex = (int)([_SArr count] -1);
        NSLog(@"size is %d", _currentIndex);
        [_segment setUserInteractionEnabled:YES];
        _rightButton.enabled = YES;
        _leftButton.enabled = YES;
        _slider.maximumValue= [_SArr count]-1;
        _slider.value = _slider.maximumValue;
    }
    else{
        _error.hidden = NO;
    }
}


- (BOOL)filled{
    if([_nameTextBox hasText] &&
       [_addressTextBox hasText] &&
       [_midtermTextBox hasText] &&
       [_finalTextBox hasText] &&
       [_HW1TextBox hasText] &&
       [_HW2TextBox hasText] &&
       [_HW3TextBox hasText])
        return YES;
    else{
        return NO;
    }
}

- (IBAction)segmentControl:(id)sender {
    if([_segment selectedSegmentIndex] == 2){
        _addStudentButton.hidden = NO;
        _nameTextBox.text = nil;
        _addressTextBox.text = nil;
        _midtermTextBox.text = nil;
        _finalTextBox.text = nil;
        _HW1TextBox.text = nil;
        _HW2TextBox.text = nil;
        _HW3TextBox.text = nil;
        _rightButton.hidden = YES;
        _leftButton.hidden = YES;
        _slider.hidden = YES;
        [_segment setUserInteractionEnabled:NO];
        UIColor * mycolor = [UIColor colorWithRed:0.66 green:0.78 blue:0.88 alpha:1.0];
        self.view.backgroundColor = mycolor;
        
    }
  
    if([_segment selectedSegmentIndex] == 0){
        _leftButton.hidden = NO;
       
        _rightButton.hidden = NO;
        if(_currentIndex == [_SArr count]-1){
            _rightButton.enabled = NO;
        }
        _addStudentButton.hidden = YES;
        [self displayStudent];
        _segment.enabled = YES;
        _slider.hidden = NO;
    }
    if([_segment selectedSegmentIndex] == 1){
        [self performSegueWithIdentifier:@"routeToSecond" sender:self];
        [_segment setSelectedSegmentIndex:0];
        _slider.hidden = NO;
    }
 
}


- (IBAction)leftButtonPressed:(id)sender {
    if(_currentIndex !=0){
        _currentIndex--;
        
    }
    _rightButton.enabled = YES;
    [self displayStudent];
    if(_currentIndex == 0){
        _leftButton.enabled = NO;
       
    }
    _slider.value = _currentIndex;
    
}

- (IBAction)rightButtonPressed:(id)sender {
    _currentIndex++;
    _leftButton.enabled = YES;
    [self displayStudent];
    if(_currentIndex == [_SArr count]-1){
        _rightButton.enabled = NO;
    }
    _slider.value = _currentIndex;

    
}

- (void) displayStudent{
    self.view.backgroundColor = [UIColor whiteColor];
    Student * s = [_SArr objectAtIndex:_currentIndex];
    _nameTextBox.text = s.name;
    _addressTextBox.text = s.address;
    _midtermTextBox.text = [NSString stringWithFormat:@"%d", s.midtermExam];
    _finalTextBox.text = [NSString stringWithFormat:@"%d", s.finalExam];
    _HW1TextBox.text = [NSString stringWithFormat:@"%d", s.HW1];
    _HW2TextBox.text = [NSString stringWithFormat:@"%d", s.HW2];
    _HW3TextBox.text = [NSString stringWithFormat:@"%d", s.HW3];
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([[segue identifier] isEqualToString:@"routeToSecond"]){
        Second * s = [segue destinationViewController];
        s.name = _nameTextBox.text;
        s.address = _addressTextBox.text;
        Student * student = [_SArr objectAtIndex:_currentIndex];
        s.imageName = student.imageFile;
        
        
    }
}



- (void)viewDidLoad {
    _slider.value = 0;
   
    NSLog(@"start");
    NSLog(@"insex of arr is %d",_currentIndex );
    [super viewDidLoad];
    _error.hidden = YES;
    _addStudentButton.hidden = YES;
    
    _SArr = [[NSMutableArray alloc] init];
    _currentIndex = 0;
    Student * s1= [[Student alloc] init];
    s1.name = @"s1";
    s1.address = @"England";
    s1.finalExam = 45;
    s1.midtermExam = 35;
    s1.HW1 = 87;
    s1.HW2 = 90;
    s1.HW3 = 100;
    s1.imageFile = @"1";
    
    Student * s2= [[Student alloc] init];
    s2.name = @"s2";
    s2.address = @"Denmark";
    s2.finalExam = 35;
    s2.midtermExam = 25;
    s2.HW1 = 77;
    s2.HW2 = 100;
    s2.HW3 = 90;
    s2.imageFile = @"2";
    
    Student * s3= [[Student alloc] init];
    s3.name = @"s3";
    s3.address = @"England";
    s3.finalExam = 3;
    s3.midtermExam = 5;
    s3.HW1 = 7;
    s3.HW2 = 10;
    s3.HW3 = 9;
    s3.imageFile = @"3";
    [_SArr addObject: s1];
    [_SArr addObject: s2];
    [_SArr addObject: s3];
    [self displayStudent];
    _leftButton.enabled = NO;
     _slider.maximumValue = (int)([_SArr count]-1);
    }



@end
