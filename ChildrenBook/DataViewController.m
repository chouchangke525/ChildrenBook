//
//  DataViewController.m
//  ChildrenBook
//
//  Created by Yu Yichen on 4/7/13.
//  Copyright (c) 2013 Yu Yichen. All rights reserved.
//

#import "DataViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface DataViewController ()

@end

@implementation DataViewController
@synthesize location;
@synthesize appleToDrag;
@synthesize imageToTap;
@synthesize endView;
@synthesize infoLabel;
@synthesize backgroundMusic;
@synthesize text1;
@synthesize string1;
@synthesize text2;
@synthesize string2;
@synthesize text3;
@synthesize string3;
@synthesize text4;
@synthesize string4;
@synthesize text5;
@synthesize string5;
@synthesize text6;
@synthesize string6;
@synthesize text7;
@synthesize string7;
@synthesize text8;
@synthesize string8;
@synthesize text9;
@synthesize string9;
@synthesize text10;
@synthesize string10;
@synthesize text11;
@synthesize string11;
@synthesize text12;
@synthesize string12;
@synthesize text13;
@synthesize string13;
@synthesize text14;
@synthesize string14;
@synthesize text15;
@synthesize string15;




- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    appleToDrag.userInteractionEnabled=YES;
    UIPanGestureRecognizer *panRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panPiece:)];
    [appleToDrag addGestureRecognizer:panRecognizer];
    
    endView.alpha=0.0;
    
    imageToTap.userInteractionEnabled=YES;
    UITapGestureRecognizer *tapRecognizer=
    [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapImage:)];
    [imageToTap addGestureRecognizer:tapRecognizer];

    
}


-(void)highlight:(NSMutableAttributedString *)attributeString inView:(UITextView *)textView from:(NSInteger)fromValue length:(NSInteger)lengthValue
{
    [attributeString addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor] range:NSMakeRange(0,attributeString.length)];
    [attributeString addAttribute:NSForegroundColorAttributeName value:[UIColor blueColor] range:NSMakeRange(fromValue,lengthValue)];
    [textView setAttributedText:attributeString];

}

-(void)clearHighlight:(NSMutableAttributedString *)attributeString inView:(UITextView *)textView
{
    [attributeString addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor] range:NSMakeRange(0,attributeString.length)];
    [textView setAttributedText:attributeString];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.dataLabel.text = [NSString stringWithFormat:@"Page %@",[self.dataObject description]];
    
    UIImage *image=[UIImage imageNamed:@"7.jpg"];
    [self.imageToChange setImage:image];
  
  
}


//this method is to erase the rect to appeal the underlying content
- (UIImage *)clearRect:(CGRect)rect inImage:(UIImage *)image {
    
    if (UIGraphicsBeginImageContextWithOptions != NULL)
        UIGraphicsBeginImageContextWithOptions([image size], NO, 0.0);
    else
        UIGraphicsBeginImageContext([image size]);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    [image drawInRect:CGRectMake(0.0, 0.0, [image size].width, [image size].height)];
    CGContextClearRect(context, rect);
    
    UIImage *result = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return result;
}


-(void)panPiece: (UIPanGestureRecognizer *)gestureRecognizer
{
    
    
    
    UIView *piece=[gestureRecognizer view];
    [[piece superview] bringSubviewToFront:piece];
    [self adjustAnchorPoint:gestureRecognizer];
    
    if([gestureRecognizer state]==UIGestureRecognizerStateBegan||[gestureRecognizer state]==UIGestureRecognizerStateChanged)
    {
        
        
        CGPoint translation=[gestureRecognizer translationInView:[piece superview]];
        if ([piece center].x+translation.x<40&&[piece center].y+translation.y<50)
            [piece setCenter:CGPointMake(40, 50)];
        else if ([piece center].x+translation.x>550&&[piece center].y+translation.y<50)
            [piece setCenter:CGPointMake(550, 50)];
        else if ([piece center].x+translation.x<40&&[piece center].y+translation.y>780)
            [piece setCenter:CGPointMake(40, 780)];
        else if ([piece center].x+translation.x>550&&[piece center].y+translation.y>780)
            [piece setCenter:CGPointMake(550, 780)];
        else if ([piece center].x<40)
            [piece setCenter:CGPointMake(40, [piece center].y+translation.y)];
        else if ([piece center].x>550)
            [piece setCenter:CGPointMake(550, [piece center].y+translation.y)];
        else if([piece center].y+translation.y<50)
            [piece setCenter:CGPointMake([piece center].x+translation.x, 50)];
        else if([piece center].y+translation.y>780)
            [piece setCenter:CGPointMake([piece center].x+translation.x, 780)];
        else
        [piece setCenter:CGPointMake([piece center].x+translation.x, [piece center].y+translation.y)];
        
        [gestureRecognizer setTranslation:CGPointZero inView: [piece superview]];
        if([piece center].x<=100&&[piece center].y<=100)
        {NSLog(@"New event is triggered");
            infoLabel.text=@"The apple is a switch. Try to drag it back.";
            [UIView animateWithDuration:0.0 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                endView.alpha=1.0;
                
                
            }
                             completion:^(BOOL completed){
                                 
                             }
             ];

            
        }
        if([piece center].x>=500&&[piece center].y>=730)
        {NSLog(@"Other event is triggered");
            infoLabel.text=@"Want to know the end? Drag this apple to the top-left.";
            [UIView animateWithDuration:0.0 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                endView.alpha=0.0;
                
                
            }
                             completion:^(BOOL completed){
                                 
                             }
             ];
            
            
        }

        
    }
    
}

-(void)tapImage:(UITapGestureRecognizer *)gestureRecognizer
{
    NSLog(@"You tapped me, %@",gestureRecognizer);
//    NSError *error;
//    NSString *backgroundMusicPath = [[NSBundle mainBundle]
//                                     pathForResource:@"music" ofType:@"mp3"];
//    NSURL *backgroundMusicURL = [NSURL
//                                 fileURLWithPath:backgroundMusicPath];
//    backgroundMusic = [[AVAudioPlayer alloc]
//                       initWithContentsOfURL:backgroundMusicURL error:&error];
//    [backgroundMusic prepareToPlay];
//    [backgroundMusic play];
    
}

-(void)adjustAnchorPoint:(UIGestureRecognizer *)gestureRecognizer{
    if (gestureRecognizer.state==UIGestureRecognizerStateBegan)
    {UIView *piece=gestureRecognizer.view;
        CGPoint locationInView=[gestureRecognizer locationInView:piece];
        CGPoint locationInSuperview=[gestureRecognizer locationInView:piece.superview];
        piece.layer.anchorPoint=CGPointMake(locationInView.x/piece.bounds.size.width, locationInView.y/piece.bounds.size.height);
        piece.center=locationInSuperview;
        
    }
}

-(void)readText1
{
    UIView *cover=[[UIView alloc]initWithFrame:CGRectMake(450, 0, 238, 50)];
    cover.backgroundColor=self.view.backgroundColor;
    
    [self.view addSubview:cover];
   
    
    
    NSError *error;
    NSString *backgroundMusicPath = [[NSBundle mainBundle]
                                     pathForResource:@"text1" ofType:@"mp3"];
    NSURL *backgroundMusicURL = [NSURL
                                 fileURLWithPath:backgroundMusicPath];
    backgroundMusic = [[AVAudioPlayer alloc]
                       initWithContentsOfURL:backgroundMusicURL error:&error];
    [backgroundMusic prepareToPlay];
        [backgroundMusic play];
    
    
    string1=[[NSMutableAttributedString alloc]initWithString:  @"One winter's day, when the snow was falling, a beautiful queen sat sewing by a window. As she looked out on to the white garden she saw a black raven, and while she looked at it she accidentally pricked her finger with the needle. When she saw the drop of blood she thought to herself,\" How wonderful it would be if I could have a little girl whose skin was as white as the snow out there, her hair as black as the raven and her lips as red as this drop of blood.\" "];
    
    
    NSMutableArray *blank=[[NSMutableArray alloc]initWithCapacity:10];
    for(int i=0;i<string1.length;i++)
    {if([[string1.string substringWithRange:NSMakeRange(i, 1)] isEqualToString:@" "])
        
    { NSNumber *blankPlace=[NSNumber numberWithInt:i];
        [blank addObject:blankPlace];
    }}
    
    for (int i=0; i<[blank count]; i++) {
        NSLog(@"%d",[[blank objectAtIndex:i] integerValue]);
        
    }
    
    NSLog(@"%d",[blank count]);
    
    
    NSInvocation *invocation;
    NSInteger fromValue;
    NSInteger lengthValue;
    
    invocation= [NSInvocation invocationWithMethodSignature:
                 [self methodSignatureForSelector:@selector(highlight:inView:from:length:)]];
    [invocation setTarget:self];
    [invocation setSelector:@selector(highlight:inView:from:length:)];
    [invocation setArgument:&string1 atIndex:2];
    [invocation setArgument:&text1 atIndex:3];
    fromValue=0;
    lengthValue=[[blank objectAtIndex:0] integerValue];
    [invocation setArgument:&fromValue atIndex:4];
    [invocation setArgument:&lengthValue atIndex:5];
    [NSTimer scheduledTimerWithTimeInterval:0 invocation:invocation repeats:NO];
    
    
    for (int i=1;i<[blank count];i++)
    {
        invocation = [NSInvocation invocationWithMethodSignature:
                      [self methodSignatureForSelector:@selector(highlight:inView:from:length:)]];
        [invocation setTarget:self];
        [invocation setSelector:@selector(highlight:inView:from:length:)];
        [invocation setArgument:&string1 atIndex:2];
        [invocation setArgument:&text1 atIndex:3];
        fromValue=[[blank objectAtIndex:i-1] integerValue];
        lengthValue=[[blank objectAtIndex:i] integerValue]-[[blank objectAtIndex:i-1] integerValue];
        [invocation setArgument:&fromValue atIndex:4];
        [invocation setArgument:&lengthValue atIndex:5];
        [NSTimer scheduledTimerWithTimeInterval:i*0.4574 invocation:invocation repeats:NO];
    }
    
    invocation= [NSInvocation invocationWithMethodSignature:
                 [self methodSignatureForSelector:@selector(clearHighlight:inView:)]];
    [invocation setTarget:self];
    [invocation setSelector:@selector(clearHighlight:inView:)];
    [invocation setArgument:&string1 atIndex:2];
    [invocation setArgument:&text1 atIndex:3];
    [NSTimer scheduledTimerWithTimeInterval:43 invocation:invocation repeats:NO];
    
    [UIView animateWithDuration:0.0 delay:44.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        cover.alpha=0;
        
        
    }
                     completion:^(BOOL completed){
                         
                     }
     ];
    
   

    
    

}
-(void)readText2
{
    UIView *cover=[[UIView alloc]initWithFrame:CGRectMake(450, 0, 238, 50)];
    cover.backgroundColor=self.view.backgroundColor;
    
    [self.view addSubview:cover];
    
    NSError *error;
    NSString *backgroundMusicPath = [[NSBundle mainBundle]
                                     pathForResource:@"text2" ofType:@"mp3"];
    NSURL *backgroundMusicURL = [NSURL
                                 fileURLWithPath:backgroundMusicPath];
    backgroundMusic = [[AVAudioPlayer alloc]
                       initWithContentsOfURL:backgroundMusicURL error:&error];
    [backgroundMusic prepareToPlay];
    [backgroundMusic play];
    
    
    string2=[[NSMutableAttributedString alloc]initWithString:  @"Not long afterwards the queen had a baby daughter, and when she saw her jet black hair, snowy white skin and red red lips she remembered her wish and called her Snow White. "];
    
    
    NSMutableArray *blank=[[NSMutableArray alloc]initWithCapacity:10];
    for(int i=0;i<string2.length;i++)
    {if([[string2.string substringWithRange:NSMakeRange(i, 1)] isEqualToString:@" "])
        
    { NSNumber *blankPlace=[NSNumber numberWithInt:i];
        [blank addObject:blankPlace];
    }}
    
    for (int i=0; i<[blank count]; i++) {
        NSLog(@"%d",[[blank objectAtIndex:i] integerValue]);
        
    }
    
    NSLog(@"%d",[blank count]);
    
    
    NSInvocation *invocation;
    NSInteger fromValue;
    NSInteger lengthValue;
    
    invocation= [NSInvocation invocationWithMethodSignature:
                 [self methodSignatureForSelector:@selector(highlight:inView:from:length:)]];
    [invocation setTarget:self];
    [invocation setSelector:@selector(highlight:inView:from:length:)];
    [invocation setArgument:&string2 atIndex:2];
    [invocation setArgument:&text2 atIndex:3];
    fromValue=0;
    lengthValue=[[blank objectAtIndex:0] integerValue];
    [invocation setArgument:&fromValue atIndex:4];
    [invocation setArgument:&lengthValue atIndex:5];
    [NSTimer scheduledTimerWithTimeInterval:0 invocation:invocation repeats:NO];
    
    
    for (int i=1;i<[blank count];i++)
    {
        invocation = [NSInvocation invocationWithMethodSignature:
                      [self methodSignatureForSelector:@selector(highlight:inView:from:length:)]];
        [invocation setTarget:self];
        [invocation setSelector:@selector(highlight:inView:from:length:)];
        [invocation setArgument:&string2 atIndex:2];
        [invocation setArgument:&text2 atIndex:3];
        fromValue=[[blank objectAtIndex:i-1] integerValue];
        lengthValue=[[blank objectAtIndex:i] integerValue]-[[blank objectAtIndex:i-1] integerValue];
        [invocation setArgument:&fromValue atIndex:4];
        [invocation setArgument:&lengthValue atIndex:5];
        [NSTimer scheduledTimerWithTimeInterval:i*0.4848 invocation:invocation repeats:NO];
    }
    
    invocation= [NSInvocation invocationWithMethodSignature:
                 [self methodSignatureForSelector:@selector(clearHighlight:inView:)]];
    [invocation setTarget:self];
    [invocation setSelector:@selector(clearHighlight:inView:)];
    [invocation setArgument:&string2 atIndex:2];
    [invocation setArgument:&text2 atIndex:3];
    [NSTimer scheduledTimerWithTimeInterval:16 invocation:invocation repeats:NO];
    
    [UIView animateWithDuration:0.0 delay:17.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        cover.alpha=0;
        
        
    }
                     completion:^(BOOL completed){
                         
                     }
     ];
    
    
    
    
}
-(void)readText3
{
    UIView *cover=[[UIView alloc]initWithFrame:CGRectMake(450, 0, 238, 50)];
    cover.backgroundColor=self.view.backgroundColor;
    
    [self.view addSubview:cover];
    
    NSError *error;
    NSString *backgroundMusicPath = [[NSBundle mainBundle]
                                     pathForResource:@"text3" ofType:@"mp3"];
    NSURL *backgroundMusicURL = [NSURL
                                 fileURLWithPath:backgroundMusicPath];
    backgroundMusic = [[AVAudioPlayer alloc]
                       initWithContentsOfURL:backgroundMusicURL error:&error];
    [backgroundMusic prepareToPlay];
    [backgroundMusic play];
    
    
    string3=[[NSMutableAttributedString alloc]initWithString:  @"Snow White grew up to be a pretty child, but sadly, after a few years, her mother died and her father married again. The new queen, Snow White's stepmother, was a beautiful woman too, but she was very vain. More than anything else she wanted to be certain that she was the most beautiful woman in the world. She had a magic mirror, and she used to look at herself in it each clay and say: "];
    
    
    NSMutableArray *blank=[[NSMutableArray alloc]initWithCapacity:10];
    for(int i=0;i<string3.length;i++)
    {if([[string3.string substringWithRange:NSMakeRange(i, 1)] isEqualToString:@" "])
        
    { NSNumber *blankPlace=[NSNumber numberWithInt:i];
        [blank addObject:blankPlace];
    }}
    
    for (int i=0; i<[blank count]; i++) {
        NSLog(@"%d",[[blank objectAtIndex:i] integerValue]);
        
    }
    
    NSLog(@"%d",[blank count]);
    
    
    NSInvocation *invocation;
    NSInteger fromValue;
    NSInteger lengthValue;
    
    invocation= [NSInvocation invocationWithMethodSignature:
                 [self methodSignatureForSelector:@selector(highlight:inView:from:length:)]];
    [invocation setTarget:self];
    [invocation setSelector:@selector(highlight:inView:from:length:)];
    [invocation setArgument:&string3 atIndex:2];
    [invocation setArgument:&text3 atIndex:3];
    fromValue=0;
    lengthValue=[[blank objectAtIndex:0] integerValue];
    [invocation setArgument:&fromValue atIndex:4];
    [invocation setArgument:&lengthValue atIndex:5];
    [NSTimer scheduledTimerWithTimeInterval:0 invocation:invocation repeats:NO];
    
    
    for (int i=1;i<[blank count];i++)
    {
        invocation = [NSInvocation invocationWithMethodSignature:
                      [self methodSignatureForSelector:@selector(highlight:inView:from:length:)]];
        [invocation setTarget:self];
        [invocation setSelector:@selector(highlight:inView:from:length:)];
        [invocation setArgument:&string3 atIndex:2];
        [invocation setArgument:&text3 atIndex:3];
        fromValue=[[blank objectAtIndex:i-1] integerValue];
        lengthValue=[[blank objectAtIndex:i] integerValue]-[[blank objectAtIndex:i-1] integerValue];
        [invocation setArgument:&fromValue atIndex:4];
        [invocation setArgument:&lengthValue atIndex:5];
        [NSTimer scheduledTimerWithTimeInterval:i*0.4473 invocation:invocation repeats:NO];
    }
    
    invocation= [NSInvocation invocationWithMethodSignature:
                 [self methodSignatureForSelector:@selector(clearHighlight:inView:)]];
    [invocation setTarget:self];
    [invocation setSelector:@selector(clearHighlight:inView:)];
    [invocation setArgument:&string3 atIndex:2];
    [invocation setArgument:&text3 atIndex:3];
    [NSTimer scheduledTimerWithTimeInterval:34 invocation:invocation repeats:NO];
    
    [UIView animateWithDuration:0.0 delay:35.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        cover.alpha=0;
        
        
    }
                     completion:^(BOOL completed){
                         
                     }
     ];
    
    
    
    
}

-(void)readText4
{
    UIView *cover=[[UIView alloc]initWithFrame:CGRectMake(450, 0, 238, 50)];
    cover.backgroundColor=self.view.backgroundColor;
    
    [self.view addSubview:cover];
    
    NSError *error;
    NSString *backgroundMusicPath = [[NSBundle mainBundle]
                                     pathForResource:@"text4" ofType:@"mp3"];
    NSURL *backgroundMusicURL = [NSURL
                                 fileURLWithPath:backgroundMusicPath];
    backgroundMusic = [[AVAudioPlayer alloc]
                       initWithContentsOfURL:backgroundMusicURL error:&error];
    [backgroundMusic prepareToPlay];
    [backgroundMusic play];
    
    
    string4=[[NSMutableAttributedString alloc]initWithString:  @"\"Mirror, mirror on the wall, Who is the fairest one of all?\" and the mirror would always reply, \"You, oh Queen, are the fairest one of all.\"\n The queen would smile when she heard this for she knew the mirror never failed to speak the truth. "];
    
    
    NSMutableArray *blank=[[NSMutableArray alloc]initWithCapacity:10];
    for(int i=0;i<string4.length;i++)
    {if([[string4.string substringWithRange:NSMakeRange(i, 1)] isEqualToString:@" "])
        
    { NSNumber *blankPlace=[NSNumber numberWithInt:i];
        [blank addObject:blankPlace];
    }}
    
    for (int i=0; i<[blank count]; i++) {
        NSLog(@"%d",[[blank objectAtIndex:i] integerValue]);
        
    }
    
    NSLog(@"%d",[blank count]);
    
    
    NSInvocation *invocation;
    NSInteger fromValue;
    NSInteger lengthValue;
    
    invocation= [NSInvocation invocationWithMethodSignature:
                 [self methodSignatureForSelector:@selector(highlight:inView:from:length:)]];
    [invocation setTarget:self];
    [invocation setSelector:@selector(highlight:inView:from:length:)];
    [invocation setArgument:&string4 atIndex:2];
    [invocation setArgument:&text4 atIndex:3];
    fromValue=0;
    lengthValue=[[blank objectAtIndex:0] integerValue];
    [invocation setArgument:&fromValue atIndex:4];
    [invocation setArgument:&lengthValue atIndex:5];
    [NSTimer scheduledTimerWithTimeInterval:0 invocation:invocation repeats:NO];
    
    
    for (int i=1;i<[blank count];i++)
    {
        invocation = [NSInvocation invocationWithMethodSignature:
                      [self methodSignatureForSelector:@selector(highlight:inView:from:length:)]];
        [invocation setTarget:self];
        [invocation setSelector:@selector(highlight:inView:from:length:)];
        [invocation setArgument:&string4 atIndex:2];
        [invocation setArgument:&text4 atIndex:3];
        fromValue=[[blank objectAtIndex:i-1] integerValue];
        lengthValue=[[blank objectAtIndex:i] integerValue]-[[blank objectAtIndex:i-1] integerValue];
        [invocation setArgument:&fromValue atIndex:4];
        [invocation setArgument:&lengthValue atIndex:5];
        [NSTimer scheduledTimerWithTimeInterval:i*0.4782 invocation:invocation repeats:NO];
    }
    
    invocation= [NSInvocation invocationWithMethodSignature:
                 [self methodSignatureForSelector:@selector(clearHighlight:inView:)]];
    [invocation setTarget:self];
    [invocation setSelector:@selector(clearHighlight:inView:)];
    [invocation setArgument:&string4 atIndex:2];
    [invocation setArgument:&text4 atIndex:3];
    [NSTimer scheduledTimerWithTimeInterval:22 invocation:invocation repeats:NO];
    
    [UIView animateWithDuration:0.0 delay:23.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        cover.alpha=0;
        
        
    }
                     completion:^(BOOL completed){
                         
                     }
     ];
    
    
    
    
}

-(void)readText5
{
    UIView *cover=[[UIView alloc]initWithFrame:CGRectMake(450, 0, 238, 50)];
    cover.backgroundColor=self.view.backgroundColor;
    
    [self.view addSubview:cover];
    
    NSError *error;
    NSString *backgroundMusicPath = [[NSBundle mainBundle]
                                     pathForResource:@"text5" ofType:@"mp3"];
    NSURL *backgroundMusicURL = [NSURL
                                 fileURLWithPath:backgroundMusicPath];
    backgroundMusic = [[AVAudioPlayer alloc]
                       initWithContentsOfURL:backgroundMusicURL error:&error];
    [backgroundMusic prepareToPlay];
    [backgroundMusic play];
    
    
    string5=[[NSMutableAttributedString alloc]initWithString:  @"The years passed. Each year Snow White grew prettier and prettier, until one day, her stepmother looked in the magic mirror and said, \"Mirror, mirror on the wall, Who is the fairest one of all?\" and the mirror replied, \"You, oh Queen, are fair, \'tis true, But Snow White is fairer now than you.\" "];
    
    
    NSMutableArray *blank=[[NSMutableArray alloc]initWithCapacity:10];
    for(int i=0;i<string5.length;i++)
    {if([[string5.string substringWithRange:NSMakeRange(i, 1)] isEqualToString:@" "])
        
    { NSNumber *blankPlace=[NSNumber numberWithInt:i];
        [blank addObject:blankPlace];
    }}
    
    for (int i=0; i<[blank count]; i++) {
        NSLog(@"%d",[[blank objectAtIndex:i] integerValue]);
        
    }
    
    NSLog(@"%d",[blank count]);
    
    
    NSInvocation *invocation;
    NSInteger fromValue;
    NSInteger lengthValue;
    
    invocation= [NSInvocation invocationWithMethodSignature:
                 [self methodSignatureForSelector:@selector(highlight:inView:from:length:)]];
    [invocation setTarget:self];
    [invocation setSelector:@selector(highlight:inView:from:length:)];
    [invocation setArgument:&string5 atIndex:2];
    [invocation setArgument:&text5 atIndex:3];
    fromValue=0;
    lengthValue=[[blank objectAtIndex:0] integerValue];
    [invocation setArgument:&fromValue atIndex:4];
    [invocation setArgument:&lengthValue atIndex:5];
    [NSTimer scheduledTimerWithTimeInterval:0 invocation:invocation repeats:NO];
    
    
    for (int i=1;i<[blank count];i++)
    {
        invocation = [NSInvocation invocationWithMethodSignature:
                      [self methodSignatureForSelector:@selector(highlight:inView:from:length:)]];
        [invocation setTarget:self];
        [invocation setSelector:@selector(highlight:inView:from:length:)];
        [invocation setArgument:&string5 atIndex:2];
        [invocation setArgument:&text5 atIndex:3];
        fromValue=[[blank objectAtIndex:i-1] integerValue];
        lengthValue=[[blank objectAtIndex:i] integerValue]-[[blank objectAtIndex:i-1] integerValue];
        [invocation setArgument:&fromValue atIndex:4];
        [invocation setArgument:&lengthValue atIndex:5];
        [NSTimer scheduledTimerWithTimeInterval:i*0.5 invocation:invocation repeats:NO];
    }
    
    invocation= [NSInvocation invocationWithMethodSignature:
                 [self methodSignatureForSelector:@selector(clearHighlight:inView:)]];
    [invocation setTarget:self];
    [invocation setSelector:@selector(clearHighlight:inView:)];
    [invocation setArgument:&string5 atIndex:2];
    [invocation setArgument:&text5 atIndex:3];
    [NSTimer scheduledTimerWithTimeInterval:27 invocation:invocation repeats:NO];
    
    [UIView animateWithDuration:0.0 delay:28.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        cover.alpha=0;
        
        
    }
                     completion:^(BOOL completed){
                         
                     }
     ];
    
    
    
    
}

-(void)readText6
{
    UIView *cover=[[UIView alloc]initWithFrame:CGRectMake(450, 0, 238, 50)];
    cover.backgroundColor=self.view.backgroundColor;
    
    [self.view addSubview:cover];
    
    NSError *error;
    NSString *backgroundMusicPath = [[NSBundle mainBundle]
                                     pathForResource:@"text6" ofType:@"mp3"];
    NSURL *backgroundMusicURL = [NSURL
                                 fileURLWithPath:backgroundMusicPath];
    backgroundMusic = [[AVAudioPlayer alloc]
                       initWithContentsOfURL:backgroundMusicURL error:&error];
    [backgroundMusic prepareToPlay];
    [backgroundMusic play];
    
    
    string6=[[NSMutableAttributedString alloc]initWithString:  @"The queen was angry and jealous. In a terrible rage she decided that Snow White should be killed.\n She called for a hunter and told him to take Snow White far into the forest and to kill her there. In order to prove that Snow White was indeed dead, she commanded him to cut out Snow White's heart and bring it back to her. The hunter was very sad. Like everyone in the king's household he loved Snow White, but he knew he must obey his orders. He took her deep into the forest and, as he drew his knife, Snow White fell to her knees.\n \"Please spare my life,\" she begged. \"Leave me here. I'll never return to the palace, I promise.\" The hunter agreed gladly. He was sure the queen would never know he had disobeyed her. He killed a young deer and cut out its heart and took this to the queen, pretending it was Snow White's heart. "];
    
    
    NSMutableArray *blank=[[NSMutableArray alloc]initWithCapacity:10];
    for(int i=0;i<string6.length;i++)
    {if([[string6.string substringWithRange:NSMakeRange(i, 1)] isEqualToString:@" "])
        
    { NSNumber *blankPlace=[NSNumber numberWithInt:i];
        [blank addObject:blankPlace];
    }}
    
    for (int i=0; i<[blank count]; i++) {
        NSLog(@"%d",[[blank objectAtIndex:i] integerValue]);
        
    }
    
    NSLog(@"%d",[blank count]);
    
    
    NSInvocation *invocation;
    NSInteger fromValue;
    NSInteger lengthValue;
    
    invocation= [NSInvocation invocationWithMethodSignature:
                 [self methodSignatureForSelector:@selector(highlight:inView:from:length:)]];
    [invocation setTarget:self];
    [invocation setSelector:@selector(highlight:inView:from:length:)];
    [invocation setArgument:&string6 atIndex:2];
    [invocation setArgument:&text6 atIndex:3];
    fromValue=0;
    lengthValue=[[blank objectAtIndex:0] integerValue];
    [invocation setArgument:&fromValue atIndex:4];
    [invocation setArgument:&lengthValue atIndex:5];
    [NSTimer scheduledTimerWithTimeInterval:0 invocation:invocation repeats:NO];
    
    
    for (int i=1;i<[blank count];i++)
    {
        invocation = [NSInvocation invocationWithMethodSignature:
                      [self methodSignatureForSelector:@selector(highlight:inView:from:length:)]];
        [invocation setTarget:self];
        [invocation setSelector:@selector(highlight:inView:from:length:)];
        [invocation setArgument:&string6 atIndex:2];
        [invocation setArgument:&text6 atIndex:3];
        fromValue=[[blank objectAtIndex:i-1] integerValue];
        lengthValue=[[blank objectAtIndex:i] integerValue]-[[blank objectAtIndex:i-1] integerValue];
        [invocation setArgument:&fromValue atIndex:4];
        [invocation setArgument:&lengthValue atIndex:5];
        [NSTimer scheduledTimerWithTimeInterval:i*0.4223 invocation:invocation repeats:NO];
    }
    
    invocation= [NSInvocation invocationWithMethodSignature:
                 [self methodSignatureForSelector:@selector(clearHighlight:inView:)]];
    [invocation setTarget:self];
    [invocation setSelector:@selector(clearHighlight:inView:)];
    [invocation setArgument:&string6 atIndex:2];
    [invocation setArgument:&text6 atIndex:3];
    [NSTimer scheduledTimerWithTimeInterval:68 invocation:invocation repeats:NO];
    
    [UIView animateWithDuration:0.0 delay:69.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        cover.alpha=0;
        
        
    }
                     completion:^(BOOL completed){
                         
                     }
     ];
    
    
    
    
}

-(void)readText7
{
    UIView *cover=[[UIView alloc]initWithFrame:CGRectMake(450, 0, 238, 50)];
    cover.backgroundColor=self.view.backgroundColor;
    
    [self.view addSubview:cover];
    
    NSError *error;
    NSString *backgroundMusicPath = [[NSBundle mainBundle]
                                     pathForResource:@"text7" ofType:@"mp3"];
    NSURL *backgroundMusicURL = [NSURL
                                 fileURLWithPath:backgroundMusicPath];
    backgroundMusic = [[AVAudioPlayer alloc]
                       initWithContentsOfURL:backgroundMusicURL error:&error];
    [backgroundMusic prepareToPlay];
    [backgroundMusic play];
    
    
    string7=[[NSMutableAttributedString alloc]initWithString:  @"Poor Snow White was tired, lonely and hungry in the forest. She wandered through the trees, hoping she would find enough berries and nuts to keep herself alive. Then she came to a clearing and found a little house. She thought it must be a woodman's cottage where she might be able to stay, so she knocked at the door. When there was no answer, she opened it and went inside. "];
    
    
    NSMutableArray *blank=[[NSMutableArray alloc]initWithCapacity:10];
    for(int i=0;i<string7.length;i++)
    {if([[string7.string substringWithRange:NSMakeRange(i, 1)] isEqualToString:@" "])
        
    { NSNumber *blankPlace=[NSNumber numberWithInt:i];
        [blank addObject:blankPlace];
    }}
    
    for (int i=0; i<[blank count]; i++) {
        NSLog(@"%d",[[blank objectAtIndex:i] integerValue]);
        
    }
    
    NSLog(@"%d",[blank count]);
    
    
    NSInvocation *invocation;
    NSInteger fromValue;
    NSInteger lengthValue;
    
    invocation= [NSInvocation invocationWithMethodSignature:
                 [self methodSignatureForSelector:@selector(highlight:inView:from:length:)]];
    [invocation setTarget:self];
    [invocation setSelector:@selector(highlight:inView:from:length:)];
    [invocation setArgument:&string7 atIndex:2];
    [invocation setArgument:&text7 atIndex:3];
    fromValue=0;
    lengthValue=[[blank objectAtIndex:0] integerValue];
    [invocation setArgument:&fromValue atIndex:4];
    [invocation setArgument:&lengthValue atIndex:5];
    [NSTimer scheduledTimerWithTimeInterval:0 invocation:invocation repeats:NO];
    
    
    for (int i=1;i<[blank count];i++)
    {
        invocation = [NSInvocation invocationWithMethodSignature:
                      [self methodSignatureForSelector:@selector(highlight:inView:from:length:)]];
        [invocation setTarget:self];
        [invocation setSelector:@selector(highlight:inView:from:length:)];
        [invocation setArgument:&string7 atIndex:2];
        [invocation setArgument:&text7 atIndex:3];
        fromValue=[[blank objectAtIndex:i-1] integerValue];
        lengthValue=[[blank objectAtIndex:i] integerValue]-[[blank objectAtIndex:i-1] integerValue];
        [invocation setArgument:&fromValue atIndex:4];
        [invocation setArgument:&lengthValue atIndex:5];
        [NSTimer scheduledTimerWithTimeInterval:i*0.5211 invocation:invocation repeats:NO];
    }
    
    invocation= [NSInvocation invocationWithMethodSignature:
                 [self methodSignatureForSelector:@selector(clearHighlight:inView:)]];
    [invocation setTarget:self];
    [invocation setSelector:@selector(clearHighlight:inView:)];
    [invocation setArgument:&string7 atIndex:2];
    [invocation setArgument:&text7 atIndex:3];
    [NSTimer scheduledTimerWithTimeInterval:37 invocation:invocation repeats:NO];
    
    [UIView animateWithDuration:0.0 delay:38.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        cover.alpha=0;
        
        
    }
                     completion:^(BOOL completed){
                         
                     }
     ];
    
    
    
    
}

-(void)readText8
{
    UIView *cover=[[UIView alloc]initWithFrame:CGRectMake(450, 0, 238, 50)];
    cover.backgroundColor=self.view.backgroundColor;
    
    [self.view addSubview:cover];
    
    NSError *error;
    NSString *backgroundMusicPath = [[NSBundle mainBundle]
                                     pathForResource:@"text8" ofType:@"mp3"];
    NSURL *backgroundMusicURL = [NSURL
                                 fileURLWithPath:backgroundMusicPath];
    backgroundMusic = [[AVAudioPlayer alloc]
                       initWithContentsOfURL:backgroundMusicURL error:&error];
    [backgroundMusic prepareToPlay];
    [backgroundMusic play];
    
    
    string8=[[NSMutableAttributedString alloc]initWithString:  @"There she saw a room all spick and span with a long table laid with seven places —seven knives and forks, seven wooden plates and drinking cups, and on the plates and in the cups were food and drink. Snow White was so hungry she could not bear to leave the food untouched so she took a little from each plate and each cup. She did not want to empty one person's plate and cup only.\n Beyond the table were seven little beds all neatly made. She tried out some of them, and when she found one that was comfortable, she fell into a deep sleep, for she was exhausted by her long journey through the forest.\n The cottage was the home of seven dwarfs. All day long they worked in a nearby mine digging diamonds from deep inside the mountain.\n When they returned home that evening, they were amazed to see that someone had been into their cottage and had taken some food and drink from each place at their table. They were also surprised to find their beds disturbed, until one dwarf called out that he had found a lovely girl asleep on his bed. The Seven Dwarfs gathered round her, holding their candles high, as they marvelled at her beauty. But they decided to leave her sleeping for they were kind men. "];
    
    
    NSMutableArray *blank=[[NSMutableArray alloc]initWithCapacity:10];
    for(int i=0;i<string8.length;i++)
    {if([[string8.string substringWithRange:NSMakeRange(i, 1)] isEqualToString:@" "])
        
    { NSNumber *blankPlace=[NSNumber numberWithInt:i];
        [blank addObject:blankPlace];
    }}
    
    for (int i=0; i<[blank count]; i++) {
        NSLog(@"%d",[[blank objectAtIndex:i] integerValue]);
        
    }
    
    NSLog(@"%d",[blank count]);
    
    
    NSInvocation *invocation;
    NSInteger fromValue;
    NSInteger lengthValue;
    
    invocation= [NSInvocation invocationWithMethodSignature:
                 [self methodSignatureForSelector:@selector(highlight:inView:from:length:)]];
    [invocation setTarget:self];
    [invocation setSelector:@selector(highlight:inView:from:length:)];
    [invocation setArgument:&string8 atIndex:2];
    [invocation setArgument:&text8 atIndex:3];
    fromValue=0;
    lengthValue=[[blank objectAtIndex:0] integerValue];
    [invocation setArgument:&fromValue atIndex:4];
    [invocation setArgument:&lengthValue atIndex:5];
    [NSTimer scheduledTimerWithTimeInterval:0 invocation:invocation repeats:NO];
    
    
    for (int i=1;i<[blank count];i++)
    {
        invocation = [NSInvocation invocationWithMethodSignature:
                      [self methodSignatureForSelector:@selector(highlight:inView:from:length:)]];
        [invocation setTarget:self];
        [invocation setSelector:@selector(highlight:inView:from:length:)];
        [invocation setArgument:&string8 atIndex:2];
        [invocation setArgument:&text8 atIndex:3];
        fromValue=[[blank objectAtIndex:i-1] integerValue];
        lengthValue=[[blank objectAtIndex:i] integerValue]-[[blank objectAtIndex:i-1] integerValue];
        [invocation setArgument:&fromValue atIndex:4];
        [invocation setArgument:&lengthValue atIndex:5];
        [NSTimer scheduledTimerWithTimeInterval:i*0.4755 invocation:invocation repeats:NO];
    }
    
    invocation= [NSInvocation invocationWithMethodSignature:
                 [self methodSignatureForSelector:@selector(clearHighlight:inView:)]];
    [invocation setTarget:self];
    [invocation setSelector:@selector(clearHighlight:inView:)];
    [invocation setArgument:&string8 atIndex:2];
    [invocation setArgument:&text8 atIndex:3];
    [NSTimer scheduledTimerWithTimeInterval:107 invocation:invocation repeats:NO];
    
    [UIView animateWithDuration:0.0 delay:108.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        cover.alpha=0;
        
        
    }
                     completion:^(BOOL completed){
                         
                     }
     ];
    
    
    
    
}

-(void)readText9
{
    UIView *cover=[[UIView alloc]initWithFrame:CGRectMake(450, 0, 238, 50)];
    cover.backgroundColor=self.view.backgroundColor;
    
    [self.view addSubview:cover];
    
    NSError *error;
    NSString *backgroundMusicPath = [[NSBundle mainBundle]
                                     pathForResource:@"text9" ofType:@"mp3"];
    NSURL *backgroundMusicURL = [NSURL
                                 fileURLWithPath:backgroundMusicPath];
    backgroundMusic = [[AVAudioPlayer alloc]
                       initWithContentsOfURL:backgroundMusicURL error:&error];
    [backgroundMusic prepareToPlay];
    [backgroundMusic play];
    
    
    string9=[[NSMutableAttributedString alloc]initWithString:  @"The next morning Snow White awoke and met the dwarfs, and she told them her story. When she explained how she now had no home, the dwarfs immediately asked her whether she would like to stay with them.\n \"With all my heart, I'd love to do that,\" Snow White replied, happy that she now had a home, and she hoped she could be of help to these kind little people.\n The dwarfs suspected that Snow White's stepmother, the wicked queen, had magic powers and they were worried that she would find out that Snow White had not been killed by the hunter. They warned Snow White that when she was alone all day she should be wary of strangers who might come to the cottage.\n Back at the palace the queen welcomed the hunter when he returned with the deer's heart. She was happy that now she was once more the most beautiful woman in the world. As soon as she was alone, she looked in her magic mirror and said, confidently, \"Mirror, mirror on the wall, Who is the fairest one of all?\" To her horror, the mirror replied, \"You, oh Queen, are fair, \'tis true, But Snow White is fairer still than you.\"\n The queen trembled with anger as she realized that the hunter had tricked her. She decided that she would now find Snow White and kill her herself.\n The queen disguised herself as an old pedlar woman with a tray of ribbons and pretty things to sell and she set out into the forest. When she came to the dwarfs' cottage in the clearing, she knocked and smiled a wicked smile when she saw Snow White come to the door.\n \"Why, pretty maid,\" she said pleasantly, \"won't you buy some of the wares I have to sell? Would you like some ribbons or buttons, some buckles, a new lacing for your dress perhaps?\" "];
    
    
    NSMutableArray *blank=[[NSMutableArray alloc]initWithCapacity:10];
    for(int i=0;i<string9.length;i++)
    {if([[string9.string substringWithRange:NSMakeRange(i, 1)] isEqualToString:@" "])
        
    { NSNumber *blankPlace=[NSNumber numberWithInt:i];
        [blank addObject:blankPlace];
    }}
    
    for (int i=0; i<[blank count]; i++) {
        NSLog(@"%d",[[blank objectAtIndex:i] integerValue]);
        
    }
    
    NSLog(@"%d",[blank count]);
    
    
    NSInvocation *invocation;
    NSInteger fromValue;
    NSInteger lengthValue;
    
    invocation= [NSInvocation invocationWithMethodSignature:
                 [self methodSignatureForSelector:@selector(highlight:inView:from:length:)]];
    [invocation setTarget:self];
    [invocation setSelector:@selector(highlight:inView:from:length:)];
    [invocation setArgument:&string9 atIndex:2];
    [invocation setArgument:&text9 atIndex:3];
    fromValue=0;
    lengthValue=[[blank objectAtIndex:0] integerValue];
    [invocation setArgument:&fromValue atIndex:4];
    [invocation setArgument:&lengthValue atIndex:5];
    [NSTimer scheduledTimerWithTimeInterval:0 invocation:invocation repeats:NO];
    
    
    for (int i=1;i<[blank count];i++)
    {
        invocation = [NSInvocation invocationWithMethodSignature:
                      [self methodSignatureForSelector:@selector(highlight:inView:from:length:)]];
        [invocation setTarget:self];
        [invocation setSelector:@selector(highlight:inView:from:length:)];
        [invocation setArgument:&string9 atIndex:2];
        [invocation setArgument:&text9 atIndex:3];
        fromValue=[[blank objectAtIndex:i-1] integerValue];
        lengthValue=[[blank objectAtIndex:i] integerValue]-[[blank objectAtIndex:i-1] integerValue];
        [invocation setArgument:&fromValue atIndex:4];
        [invocation setArgument:&lengthValue atIndex:5];
        [NSTimer scheduledTimerWithTimeInterval:i*0.4605 invocation:invocation repeats:NO];
    }
    
    invocation= [NSInvocation invocationWithMethodSignature:
                 [self methodSignatureForSelector:@selector(clearHighlight:inView:)]];
    [invocation setTarget:self];
    [invocation setSelector:@selector(clearHighlight:inView:)];
    [invocation setArgument:&string9 atIndex:2];
    [invocation setArgument:&text9 atIndex:3];
    [NSTimer scheduledTimerWithTimeInterval:146 invocation:invocation repeats:NO];
    
    [UIView animateWithDuration:0.0 delay:147.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        cover.alpha=0;
        
        
    }
                     completion:^(BOOL completed){
                         
                     }
     ];
    
    
    
    
}

-(void)readText10
{
    UIView *cover=[[UIView alloc]initWithFrame:CGRectMake(450, 0, 238, 50)];
    cover.backgroundColor=self.view.backgroundColor;
    
    [self.view addSubview:cover];
    
    NSError *error;
    NSString *backgroundMusicPath = [[NSBundle mainBundle]
                                     pathForResource:@"text10" ofType:@"mp3"];
    NSURL *backgroundMusicURL = [NSURL
                                 fileURLWithPath:backgroundMusicPath];
    backgroundMusic = [[AVAudioPlayer alloc]
                       initWithContentsOfURL:backgroundMusicURL error:&error];
    [backgroundMusic prepareToPlay];
    [backgroundMusic play];
    
    
    string10=[[NSMutableAttributedString alloc]initWithString:  @"Snow White looked eagerly at the tray.\n The queen could see that she was tempted by the pretty lacing and so she asked if she could help to tie it on for her. Then she pulled the lacing so tight that Snow White could not breathe, and fell to the floor, as if she were dead. The queen hurried back to her palace, sure that this time Snow White was really dead. "];
    
    
    NSMutableArray *blank=[[NSMutableArray alloc]initWithCapacity:10];
    for(int i=0;i<string10.length;i++)
    {if([[string10.string substringWithRange:NSMakeRange(i, 1)] isEqualToString:@" "])
        
    { NSNumber *blankPlace=[NSNumber numberWithInt:i];
        [blank addObject:blankPlace];
    }}
    
    for (int i=0; i<[blank count]; i++) {
        NSLog(@"%d",[[blank objectAtIndex:i] integerValue]);
        
    }
    
    NSLog(@"%d",[blank count]);
    
    
    NSInvocation *invocation;
    NSInteger fromValue;
    NSInteger lengthValue;
    
    invocation= [NSInvocation invocationWithMethodSignature:
                 [self methodSignatureForSelector:@selector(highlight:inView:from:length:)]];
    [invocation setTarget:self];
    [invocation setSelector:@selector(highlight:inView:from:length:)];
    [invocation setArgument:&string10 atIndex:2];
    [invocation setArgument:&text10 atIndex:3];
    fromValue=0;
    lengthValue=[[blank objectAtIndex:0] integerValue];
    [invocation setArgument:&fromValue atIndex:4];
    [invocation setArgument:&lengthValue atIndex:5];
    [NSTimer scheduledTimerWithTimeInterval:0 invocation:invocation repeats:NO];
    
    
    for (int i=1;i<[blank count];i++)
    {
        invocation = [NSInvocation invocationWithMethodSignature:
                      [self methodSignatureForSelector:@selector(highlight:inView:from:length:)]];
        [invocation setTarget:self];
        [invocation setSelector:@selector(highlight:inView:from:length:)];
        [invocation setArgument:&string10 atIndex:2];
        [invocation setArgument:&text10 atIndex:3];
        fromValue=[[blank objectAtIndex:i-1] integerValue];
        lengthValue=[[blank objectAtIndex:i] integerValue]-[[blank objectAtIndex:i-1] integerValue];
        [invocation setArgument:&fromValue atIndex:4];
        [invocation setArgument:&lengthValue atIndex:5];
        [NSTimer scheduledTimerWithTimeInterval:i*0.4583 invocation:invocation repeats:NO];
    }
    
    invocation= [NSInvocation invocationWithMethodSignature:
                 [self methodSignatureForSelector:@selector(clearHighlight:inView:)]];
    [invocation setTarget:self];
    [invocation setSelector:@selector(clearHighlight:inView:)];
    [invocation setArgument:&string10 atIndex:2];
    [invocation setArgument:&text10 atIndex:3];
    [NSTimer scheduledTimerWithTimeInterval:33 invocation:invocation repeats:NO];
    
    [UIView animateWithDuration:0.0 delay:34.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        cover.alpha=0;
        
        
    }
                     completion:^(BOOL completed){
                         
                     }
     ];
    
    
    
    
}


-(void)readText11
{
    UIView *cover=[[UIView alloc]initWithFrame:CGRectMake(450, 0, 238, 50)];
    cover.backgroundColor=self.view.backgroundColor;
    
    [self.view addSubview:cover];
    
    NSError *error;
    NSString *backgroundMusicPath = [[NSBundle mainBundle]
                                     pathForResource:@"text11" ofType:@"mp3"];
    NSURL *backgroundMusicURL = [NSURL
                                 fileURLWithPath:backgroundMusicPath];
    backgroundMusic = [[AVAudioPlayer alloc]
                       initWithContentsOfURL:backgroundMusicURL error:&error];
    [backgroundMusic prepareToPlay];
    [backgroundMusic play];
    
    
    string11=[[NSMutableAttributedString alloc]initWithString:  @"When the dwarfs came home that evening, they found Snow White lying on the floor, deathly pale and still. Horrified, they gathered around her. Then one of them spotted that she had a new lacing on her dress, and that it was tied very tightly. Quickly they cut it. Immediately Snow White began to breathe again and colour came back to her cheeks. All seven dwarfs heaved a tremendous sigh of relief as by now they loved her clearly. After this they begged Snow White to allow no strangers into the cottage while she was alone, and Snow White promised she would do as they said.\n Once again in the palace the queen asked the mirror, \"Mirror, mirror on the wall, Who is the fairest one of all?\" And the mirror replied, \"You, oh Queen, are fair, 'tis true, But Snow White is fairer still than you.\" "];
    
    
    NSMutableArray *blank=[[NSMutableArray alloc]initWithCapacity:10];
    for(int i=0;i<string11.length;i++)
    {if([[string11.string substringWithRange:NSMakeRange(i, 1)] isEqualToString:@" "])
        
    { NSNumber *blankPlace=[NSNumber numberWithInt:i];
        [blank addObject:blankPlace];
    }}
    
    for (int i=0; i<[blank count]; i++) {
        NSLog(@"%d",[[blank objectAtIndex:i] integerValue]);
        
    }
    
    NSLog(@"%d",[blank count]);
    
    
    NSInvocation *invocation;
    NSInteger fromValue;
    NSInteger lengthValue;
    
    invocation= [NSInvocation invocationWithMethodSignature:
                 [self methodSignatureForSelector:@selector(highlight:inView:from:length:)]];
    [invocation setTarget:self];
    [invocation setSelector:@selector(highlight:inView:from:length:)];
    [invocation setArgument:&string11 atIndex:2];
    [invocation setArgument:&text11 atIndex:3];
    fromValue=0;
    lengthValue=[[blank objectAtIndex:0] integerValue];
    [invocation setArgument:&fromValue atIndex:4];
    [invocation setArgument:&lengthValue atIndex:5];
    [NSTimer scheduledTimerWithTimeInterval:0 invocation:invocation repeats:NO];
    
    
    for (int i=1;i<[blank count];i++)
    {
        invocation = [NSInvocation invocationWithMethodSignature:
                      [self methodSignatureForSelector:@selector(highlight:inView:from:length:)]];
        [invocation setTarget:self];
        [invocation setSelector:@selector(highlight:inView:from:length:)];
        [invocation setArgument:&string11 atIndex:2];
        [invocation setArgument:&text11 atIndex:3];
        fromValue=[[blank objectAtIndex:i-1] integerValue];
        lengthValue=[[blank objectAtIndex:i] integerValue]-[[blank objectAtIndex:i-1] integerValue];
        [invocation setArgument:&fromValue atIndex:4];
        [invocation setArgument:&lengthValue atIndex:5];
        [NSTimer scheduledTimerWithTimeInterval:i*0.5170 invocation:invocation repeats:NO];
    }
    
    invocation= [NSInvocation invocationWithMethodSignature:
                 [self methodSignatureForSelector:@selector(clearHighlight:inView:)]];
    [invocation setTarget:self];
    [invocation setSelector:@selector(clearHighlight:inView:)];
    [invocation setArgument:&string11 atIndex:2];
    [invocation setArgument:&text11 atIndex:3];
    [NSTimer scheduledTimerWithTimeInterval:76 invocation:invocation repeats:NO];
    
    [UIView animateWithDuration:0.0 delay:77.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        cover.alpha=0;
        
        
    }
                     completion:^(BOOL completed){
                         
                     }
     ];
    
    
    
    
}

-(void)readText12
{
    UIView *cover=[[UIView alloc]initWithFrame:CGRectMake(450, 0, 238, 50)];
    cover.backgroundColor=self.view.backgroundColor;
    
    [self.view addSubview:cover];
    
    NSError *error;
    NSString *backgroundMusicPath = [[NSBundle mainBundle]
                                     pathForResource:@"text12" ofType:@"mp3"];
    NSURL *backgroundMusicURL = [NSURL
                                 fileURLWithPath:backgroundMusicPath];
    backgroundMusic = [[AVAudioPlayer alloc]
                       initWithContentsOfURL:backgroundMusicURL error:&error];
    [backgroundMusic prepareToPlay];
    [backgroundMusic play];
    
    
    string12=[[NSMutableAttributedString alloc]initWithString:  @"The queen was speechless with rage. She realized that once more her plans to kill Snow White had failed. She made up her mind to try again. She chose an apple with one rosy-red side and one yellow side. Carefully she inserted poison into the red part of the apple. Then, disguised as a peasant woman, she set out once more into the forest. "];
    
    
    NSMutableArray *blank=[[NSMutableArray alloc]initWithCapacity:10];
    for(int i=0;i<string12.length;i++)
    {if([[string12.string substringWithRange:NSMakeRange(i, 1)] isEqualToString:@" "])
        
    { NSNumber *blankPlace=[NSNumber numberWithInt:i];
        [blank addObject:blankPlace];
    }}
    
    for (int i=0; i<[blank count]; i++) {
        NSLog(@"%d",[[blank objectAtIndex:i] integerValue]);
        
    }
    
    NSLog(@"%d",[blank count]);
    
    
    NSInvocation *invocation;
    NSInteger fromValue;
    NSInteger lengthValue;
    
    invocation= [NSInvocation invocationWithMethodSignature:
                 [self methodSignatureForSelector:@selector(highlight:inView:from:length:)]];
    [invocation setTarget:self];
    [invocation setSelector:@selector(highlight:inView:from:length:)];
    [invocation setArgument:&string12 atIndex:2];
    [invocation setArgument:&text12 atIndex:3];
    fromValue=0;
    lengthValue=[[blank objectAtIndex:0] integerValue];
    [invocation setArgument:&fromValue atIndex:4];
    [invocation setArgument:&lengthValue atIndex:5];
    [NSTimer scheduledTimerWithTimeInterval:0 invocation:invocation repeats:NO];
    
    
    for (int i=1;i<[blank count];i++)
    {
        invocation = [NSInvocation invocationWithMethodSignature:
                      [self methodSignatureForSelector:@selector(highlight:inView:from:length:)]];
        [invocation setTarget:self];
        [invocation setSelector:@selector(highlight:inView:from:length:)];
        [invocation setArgument:&string12 atIndex:2];
        [invocation setArgument:&text12 atIndex:3];
        fromValue=[[blank objectAtIndex:i-1] integerValue];
        lengthValue=[[blank objectAtIndex:i] integerValue]-[[blank objectAtIndex:i-1] integerValue];
        [invocation setArgument:&fromValue atIndex:4];
        [invocation setArgument:&lengthValue atIndex:5];
        [NSTimer scheduledTimerWithTimeInterval:i*0.5625 invocation:invocation repeats:NO];
    }
    
    invocation= [NSInvocation invocationWithMethodSignature:
                 [self methodSignatureForSelector:@selector(clearHighlight:inView:)]];
    [invocation setTarget:self];
    [invocation setSelector:@selector(clearHighlight:inView:)];
    [invocation setArgument:&string12 atIndex:2];
    [invocation setArgument:&text12 atIndex:3];
    [NSTimer scheduledTimerWithTimeInterval:36 invocation:invocation repeats:NO];
    [UIView animateWithDuration:0.0 delay:37.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        cover.alpha=0;
    }
                     completion:^(BOOL completed){
                         }
     ];
    
    
    
    
}

-(void)readText13
{
    UIView *cover=[[UIView alloc]initWithFrame:CGRectMake(450, 0, 238, 50)];
    cover.backgroundColor=self.view.backgroundColor;
    
    [self.view addSubview:cover];
    
    NSError *error;
    NSString *backgroundMusicPath = [[NSBundle mainBundle]
                                     pathForResource:@"text13" ofType:@"mp3"];
    NSURL *backgroundMusicURL = [NSURL
                                 fileURLWithPath:backgroundMusicPath];
    backgroundMusic = [[AVAudioPlayer alloc]
                       initWithContentsOfURL:backgroundMusicURL error:&error];
    [backgroundMusic prepareToPlay];
    [backgroundMusic play];
    
    
    string13=[[NSMutableAttributedString alloc]initWithString:  @"When she knocked at the cottage door, the queen was quick to explain she had not come to sell anything. She guessed that Snow White would have been warned not to buy from anybody who came by. She simply chatted to Snow White and when Snow White became more at ease she offered her an apple as a present. Snow White was tempted, but she refused, saying she had been told not to accept anything from strangers.\n \"Let me show you how harmless it is,\" said the disguised queen. \"I will take a bite, and if I come to no harm, you will see it is safe for you too.\" "];
    
    
    NSMutableArray *blank=[[NSMutableArray alloc]initWithCapacity:10];
    for(int i=0;i<string13.length;i++)
    {if([[string13.string substringWithRange:NSMakeRange(i, 1)] isEqualToString:@" "])
        
    { NSNumber *blankPlace=[NSNumber numberWithInt:i];
        [blank addObject:blankPlace];
    }}
    
    for (int i=0; i<[blank count]; i++) {
        NSLog(@"%d",[[blank objectAtIndex:i] integerValue]);
        
    }
    
    NSLog(@"%d",[blank count]);
    
    
    NSInvocation *invocation;
    NSInteger fromValue;
    NSInteger lengthValue;
    
    invocation= [NSInvocation invocationWithMethodSignature:
                 [self methodSignatureForSelector:@selector(highlight:inView:from:length:)]];
    [invocation setTarget:self];
    [invocation setSelector:@selector(highlight:inView:from:length:)];
    [invocation setArgument:&string13 atIndex:2];
    [invocation setArgument:&text13 atIndex:3];
    fromValue=0;
    lengthValue=[[blank objectAtIndex:0] integerValue];
    [invocation setArgument:&fromValue atIndex:4];
    [invocation setArgument:&lengthValue atIndex:5];
    [NSTimer scheduledTimerWithTimeInterval:0 invocation:invocation repeats:NO];
    
    
    for (int i=1;i<[blank count];i++)
    {
        invocation = [NSInvocation invocationWithMethodSignature:
                      [self methodSignatureForSelector:@selector(highlight:inView:from:length:)]];
        [invocation setTarget:self];
        [invocation setSelector:@selector(highlight:inView:from:length:)];
        [invocation setArgument:&string13 atIndex:2];
        [invocation setArgument:&text13 atIndex:3];
        fromValue=[[blank objectAtIndex:i-1] integerValue];
        lengthValue=[[blank objectAtIndex:i] integerValue]-[[blank objectAtIndex:i-1] integerValue];
        [invocation setArgument:&fromValue atIndex:4];
        [invocation setArgument:&lengthValue atIndex:5];
        [NSTimer scheduledTimerWithTimeInterval:i*0.4909 invocation:invocation repeats:NO];
    }
    
    invocation= [NSInvocation invocationWithMethodSignature:
                 [self methodSignatureForSelector:@selector(clearHighlight:inView:)]];
    [invocation setTarget:self];
    [invocation setSelector:@selector(clearHighlight:inView:)];
    [invocation setArgument:&string13 atIndex:2];
    [invocation setArgument:&text13 atIndex:3];
    [NSTimer scheduledTimerWithTimeInterval:54 invocation:invocation repeats:NO];
    
    [UIView animateWithDuration:0.0 delay:55.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        cover.alpha=0;
        
        
    }
                     completion:^(BOOL completed){
                         
                     }
     ];
    
    
    
    
}
-(void)readText14
{
    UIView *cover=[[UIView alloc]initWithFrame:CGRectMake(450, 0, 238, 50)];
    cover.backgroundColor=self.view.backgroundColor;
    
    [self.view addSubview:cover];
    
    NSError *error;
    NSString *backgroundMusicPath = [[NSBundle mainBundle]
                                     pathForResource:@"text14" ofType:@"mp3"];
    NSURL *backgroundMusicURL = [NSURL
                                 fileURLWithPath:backgroundMusicPath];
    backgroundMusic = [[AVAudioPlayer alloc]
                       initWithContentsOfURL:backgroundMusicURL error:&error];
    [backgroundMusic prepareToPlay];
    [backgroundMusic play];
    
    
    string14=[[NSMutableAttributedString alloc]initWithString:  @"She knew the yellow side was not poisoned and took a bite from there. Thinking it harmless, Snow White stretched out her hand for the apple and also took a bite, but from the rosy-red side.\n At once Snow White was affected by the poison and fell down as though dead. That evening when the dwarfs returned they were quite unable to revive her. They turned her over to see if her dress had been laced too tightly. But they could find nothing different about her. They watched over her through the night, but when morning came she still lay without any sign of life, and they decided she must be dead. Weeping bitterly, they laid herein a coffin and placed a glass lid over the top so that all could admire her beauty, even though she was dead. Then they carried the coffin to the top of a hill where they took turns to stand guard.\n The queen was delighted that day when she looked in her mirror and asked, \"Mirror, mirror on the wall, Who is the fairest one of all?\" and the mirror replied, \"You, oh Queen, are the fairest one of all.\" "];
    
    
    NSMutableArray *blank=[[NSMutableArray alloc]initWithCapacity:10];
    for(int i=0;i<string14.length;i++)
    {if([[string14.string substringWithRange:NSMakeRange(i, 1)] isEqualToString:@" "])
        
    { NSNumber *blankPlace=[NSNumber numberWithInt:i];
        [blank addObject:blankPlace];
    }}
    
    for (int i=0; i<[blank count]; i++) {
        NSLog(@"%d",[[blank objectAtIndex:i] integerValue]);
        
    }
    
    NSLog(@"%d",[blank count]);
    
    
    NSInvocation *invocation;
    NSInteger fromValue;
    NSInteger lengthValue;
    
    invocation= [NSInvocation invocationWithMethodSignature:
                 [self methodSignatureForSelector:@selector(highlight:inView:from:length:)]];
    [invocation setTarget:self];
    [invocation setSelector:@selector(highlight:inView:from:length:)];
    [invocation setArgument:&string14 atIndex:2];
    [invocation setArgument:&text14 atIndex:3];
    fromValue=0;
    lengthValue=[[blank objectAtIndex:0] integerValue];
    [invocation setArgument:&fromValue atIndex:4];
    [invocation setArgument:&lengthValue atIndex:5];
    [NSTimer scheduledTimerWithTimeInterval:0 invocation:invocation repeats:NO];
    
    
    for (int i=1;i<[blank count];i++)
    {
        invocation = [NSInvocation invocationWithMethodSignature:
                      [self methodSignatureForSelector:@selector(highlight:inView:from:length:)]];
        [invocation setTarget:self];
        [invocation setSelector:@selector(highlight:inView:from:length:)];
        [invocation setArgument:&string14 atIndex:2];
        [invocation setArgument:&text14 atIndex:3];
        fromValue=[[blank objectAtIndex:i-1] integerValue];
        lengthValue=[[blank objectAtIndex:i] integerValue]-[[blank objectAtIndex:i-1] integerValue];
        [invocation setArgument:&fromValue atIndex:4];
        [invocation setArgument:&lengthValue atIndex:5];
        [NSTimer scheduledTimerWithTimeInterval:i*0.4897 invocation:invocation repeats:NO];
    }
    
    invocation= [NSInvocation invocationWithMethodSignature:
                 [self methodSignatureForSelector:@selector(clearHighlight:inView:)]];
    [invocation setTarget:self];
    [invocation setSelector:@selector(clearHighlight:inView:)];
    [invocation setArgument:&string14 atIndex:2];
    [invocation setArgument:&text14 atIndex:3];
    [NSTimer scheduledTimerWithTimeInterval:96 invocation:invocation repeats:NO];
    
    [UIView animateWithDuration:0.0 delay:97.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        cover.alpha=0;
        
        
    }
                     completion:^(BOOL completed){
                         
                     }
     ];
    
    
    
    
}
-(void)readText15
{
    UIView *cover=[[UIView alloc]initWithFrame:CGRectMake(450, 0, 238, 50)];
    cover.backgroundColor=self.view.backgroundColor;
    
    [self.view addSubview:cover];
    
    NSError *error;
    NSString *backgroundMusicPath = [[NSBundle mainBundle]
                                     pathForResource:@"text15" ofType:@"mp3"];
    NSURL *backgroundMusicURL = [NSURL
                                 fileURLWithPath:backgroundMusicPath];
    backgroundMusic = [[AVAudioPlayer alloc]
                       initWithContentsOfURL:backgroundMusicURL error:&error];
    [backgroundMusic prepareToPlay];
    [backgroundMusic play];
    
    
    string15=[[NSMutableAttributedString alloc]initWithString:  @"How cruelly she laughed when she heard those words. Not long after this a prince came riding through the forest and came to the hill where Snow White lay in her glass-topped coffin. She looked so beautiful that he loved her at once and he asked the dwarfs if he might have the coffin and take it to his castle. The dwarfs would not allow him to do this, but they did let the prince kiss her.\n As the prince kissed Snow White gently, he moved her head. The piece of poisoned apple fell from her lips. She stirred and then she stretched a little. Slowly she came back to life. Snow White saw the handsome prince kneeling on the ground beside her, and fell in love with him straight away.\n Then the queen far away in the palace heard from the mirror, \"You, oh Queen, are fair, 'tis true, But Snow White is fairer still than you.\"\n She was furious that Snow White had escaped death once more. And now the king discovered what mischief she had been up to, and banished her from his land. No one ever saw her or her mirror again.\n As for Snow White, she said farewell to her kind friends, the dwarfs, and rode away on the back of the prince's horse. At his castle they were married and they both lived happily forever afterwards. "];
    
    
    NSMutableArray *blank=[[NSMutableArray alloc]initWithCapacity:10];
    for(int i=0;i<string15.length;i++)
    {if([[string15.string substringWithRange:NSMakeRange(i, 1)] isEqualToString:@" "])
        
    { NSNumber *blankPlace=[NSNumber numberWithInt:i];
        [blank addObject:blankPlace];
    }}
    
    for (int i=0; i<[blank count]; i++) {
        NSLog(@"%d",[[blank objectAtIndex:i] integerValue]);
        
    }
    
    NSLog(@"%d",[blank count]);
    
    
    NSInvocation *invocation;
    NSInteger fromValue;
    NSInteger lengthValue;
    
    invocation= [NSInvocation invocationWithMethodSignature:
                 [self methodSignatureForSelector:@selector(highlight:inView:from:length:)]];
    [invocation setTarget:self];
    [invocation setSelector:@selector(highlight:inView:from:length:)];
    [invocation setArgument:&string15 atIndex:2];
    [invocation setArgument:&text15 atIndex:3];
    fromValue=0;
    lengthValue=[[blank objectAtIndex:0] integerValue];
    [invocation setArgument:&fromValue atIndex:4];
    [invocation setArgument:&lengthValue atIndex:5];
    [NSTimer scheduledTimerWithTimeInterval:0 invocation:invocation repeats:NO];
    
    
    for (int i=1;i<[blank count];i++)
    {
        invocation = [NSInvocation invocationWithMethodSignature:
                      [self methodSignatureForSelector:@selector(highlight:inView:from:length:)]];
        [invocation setTarget:self];
        [invocation setSelector:@selector(highlight:inView:from:length:)];
        [invocation setArgument:&string15 atIndex:2];
        [invocation setArgument:&text15 atIndex:3];
        fromValue=[[blank objectAtIndex:i-1] integerValue];
        lengthValue=[[blank objectAtIndex:i] integerValue]-[[blank objectAtIndex:i-1] integerValue];
        [invocation setArgument:&fromValue atIndex:4];
        [invocation setArgument:&lengthValue atIndex:5];
        [NSTimer scheduledTimerWithTimeInterval:i*0.5043 invocation:invocation repeats:NO];
    }
    
    invocation= [NSInvocation invocationWithMethodSignature:
                 [self methodSignatureForSelector:@selector(clearHighlight:inView:)]];
    [invocation setTarget:self];
    [invocation setSelector:@selector(clearHighlight:inView:)];
    [invocation setArgument:&string15 atIndex:2];
    [invocation setArgument:&text15 atIndex:3];
    [NSTimer scheduledTimerWithTimeInterval:117 invocation:invocation repeats:NO];
    
    [UIView animateWithDuration:0.0 delay:118.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        cover.alpha=0;
        
        
    }
                     completion:^(BOOL completed){
                         
                     }
     ];
    
    
    
    
}





- (IBAction)tapPage4:(UITapGestureRecognizer *)sender {
    NSLog(@"You tapped me, %@",sender);
    UIView *place= sender.view;
    self.location=[sender locationInView:[place superview]];
    NSLog(@"\nTap Location:x=%5.2f,y=%5.2f",self.location.x,self.location.y);
    
    UIImage *image=[UIImage imageNamed:@"7.jpg"];
    UIImage *maskedImage;
    if (self.location.y>=87&&self.location.y<=263)
        maskedImage = [self clearRect:CGRectMake(10, 0, 420, 88) inImage:image];
    else if(self.location.y>263&&self.location.y<=407)
        maskedImage = [self clearRect:CGRectMake(10, 88, 420, 64) inImage:image];
    else if(self.location.y>407&&self.location.y<=646)
        maskedImage = [self clearRect:CGRectMake(10, 152, 420, 106) inImage:image];
    else if(self.location.y>646&&self.location.y<=844)
        maskedImage = [self clearRect:CGRectMake(10, 258, 420, 88) inImage:image];
    else maskedImage= [self clearRect:CGRectMake(0, 0, 0, 0) inImage:image];
    
    [self.imageToChange setImage:maskedImage];
    
 
}

- (IBAction)text1Button:(UIButton *)sender {
    
    [self readText1];
}

- (IBAction)text2Button:(UIButton *)sender {
    
    [self readText2];
}

- (IBAction)text3Button:(UIButton *)sender {
    [self readText3];
}

- (IBAction)text4Button:(UIButton *)sender {
    [self readText4];
}

- (IBAction)text5Button:(UIButton *)sender {
    
    [self readText5];
    
}

- (IBAction)text6Button:(UIButton *)sender {
    [self readText6];
}

- (IBAction)text7Button:(UIButton *)sender {
    [self readText7];
}

- (IBAction)text8Button:(UIButton *)sender {
    [self readText8];
}

- (IBAction)text9Button:(UIButton *)sender {
    [self readText9];
}

- (IBAction)text10Button:(UIButton *)sender {
    [self readText10];
}

- (IBAction)text11Button:(UIButton *)sender {
    [self readText11];
}

- (IBAction)text12Button:(UIButton *)sender {
    [self readText12];
}

- (IBAction)text13Button:(UIButton *)sender {
    [self readText13];
}

- (IBAction)text14Button:(UIButton *)sender {
    [self readText14];
}

- (IBAction)text15Button:(UIButton *)sender {
    [self readText15];
}


@end
