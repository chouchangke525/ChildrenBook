//
//  DataViewController.h
//  ChildrenBook
//
//  Created by Yu Yichen on 4/7/13.
//  Copyright (c) 2013 Yu Yichen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>


@interface DataViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *dataLabel;
@property (strong, nonatomic) id dataObject;

@property AVAudioPlayer *backgroundMusic;

@property (weak, nonatomic) IBOutlet UIImageView *imageToChange;
@property CGPoint location;
@property (weak, nonatomic) IBOutlet UIImageView *appleToDrag;
@property (weak, nonatomic) IBOutlet UIView *endView;
@property (weak, nonatomic) IBOutlet UILabel *infoLabel;
@property (weak, nonatomic) IBOutlet UITextView *text1;
@property (weak, nonatomic) IBOutlet UITextView *text2;
@property (weak, nonatomic) IBOutlet UITextView *text3;
@property (weak, nonatomic) IBOutlet UITextView *text4;
@property (weak, nonatomic) IBOutlet UITextView *text5;
@property (weak, nonatomic) IBOutlet UITextView *text6;
@property (weak, nonatomic) IBOutlet UITextView *text7;
@property (weak, nonatomic) IBOutlet UITextView *text8;
@property (weak, nonatomic) IBOutlet UITextView *text9;
@property (weak, nonatomic) IBOutlet UITextView *text10;
@property (weak, nonatomic) IBOutlet UITextView *text11;
@property (weak, nonatomic) IBOutlet UITextView *text12;
@property (weak, nonatomic) IBOutlet UITextView *text13;
@property (weak, nonatomic) IBOutlet UITextView *text14;
@property (weak, nonatomic) IBOutlet UITextView *text15;


@property NSMutableAttributedString *string1;
@property NSMutableAttributedString *string2;
@property NSMutableAttributedString *string3;
@property NSMutableAttributedString *string4;
@property NSMutableAttributedString *string5;
@property NSMutableAttributedString *string6;

@property NSMutableAttributedString *string7;
@property NSMutableAttributedString *string8;
@property NSMutableAttributedString *string9;
@property NSMutableAttributedString *string10;
@property NSMutableAttributedString *string11;
@property NSMutableAttributedString *string12;
@property NSMutableAttributedString *string13;
@property NSMutableAttributedString *string14;
@property NSMutableAttributedString *string15;


- (IBAction)tapPage4:(UITapGestureRecognizer *)sender;
- (IBAction)text1Button:(UIButton *)sender;
- (IBAction)text2Button:(UIButton *)sender;
- (IBAction)text3Button:(UIButton *)sender;
- (IBAction)text4Button:(UIButton *)sender;
- (IBAction)text5Button:(UIButton *)sender;
- (IBAction)text6Button:(UIButton *)sender;
- (IBAction)text7Button:(UIButton *)sender;
- (IBAction)text8Button:(UIButton *)sender;
- (IBAction)text9Button:(UIButton *)sender;
- (IBAction)text10Button:(UIButton *)sender;
- (IBAction)text11Button:(UIButton *)sender;
- (IBAction)text12Button:(UIButton *)sender;
- (IBAction)text13Button:(UIButton *)sender;
- (IBAction)text14Button:(UIButton *)sender;
- (IBAction)text15Button:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIImageView *imageToTap;





@end
