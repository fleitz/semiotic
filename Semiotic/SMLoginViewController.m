//
//  SMLoginViewController.m
//  Semiotic
//
//  Created by Fred Leitz on 2013-05-23.
//
//

#import "SMLoginViewController.h"
#import <QuartzCore/QuartzCore.h>
@interface SMLoginViewController ()

@end

@implementation SMLoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIColor *textColor = [UIColor colorWithWhite:0.4 alpha:1.0];
    [self.logInView setBackgroundColor:[UIColor colorWithWhite:0.9 alpha:1.0]];
    UILabel* logo = [[UILabel alloc] initWithFrame: CGRectMake(10, 100, 250, 250)];
    logo.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    logo.textColor = textColor;
    logo.textAlignment = NSTextAlignmentCenter;
    logo.backgroundColor = [UIColor clearColor];
    logo.text = @"◉";
    logo.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:144];
    self.logInView.usernameField.layer.shadowOpacity = 0;
    self.logInView.passwordField.layer.shadowOpacity = 0;
    self.logInView.usernameField.textColor = textColor;
    self.logInView.passwordField.textColor = textColor;

    self.logInView.logInButton.titleLabel.shadowOffset = CGSizeZero;
    self.logInView.logo = logo;

    
	// Do any additional setup after loading the view.
}

//- (void)viewDidAppear:(BOOL)animated{
//    [super viewDidAppear:animated];
//    [UIView animateWithDuration: 3.0 delay:0 options:UIViewAnimationOptionRepeat | UIViewAnimationOptionAutoreverse animations:^{
//        self.logInView.logo.transform = CGAffineTransformMakeScale(0.5, 0.5);
//    } completion:^(BOOL finished) {
//        
//    }];
//
//}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
