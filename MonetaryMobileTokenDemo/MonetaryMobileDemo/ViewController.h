//
//  ViewController.h
//  MonetaryMobileTokenDemo
//
//  Copyright © 2020 Datacap Systems, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MonetaryMobileToken/MonetaryMobileToken.h>

@interface ViewController : UIViewController <MonetaryTokenDelegate>

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *aiLoadingSpinner;
@property (weak, nonatomic) IBOutlet UIButton *btnGetAToken;

- (IBAction)btnGetAToken_Pressed:(id)sender;

@end

