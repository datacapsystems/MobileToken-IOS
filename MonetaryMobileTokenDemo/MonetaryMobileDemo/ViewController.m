//
//  ViewController.m
//  MonetaryMobileTokenDemo
//
//  Copyright © 2016 Monetary. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnGetAToken_Pressed:(id)sender
{
    MonetaryTokenizer *tokenizer = [MonetaryTokenizer new];
    [tokenizer requestKeyedTokenWithPublicKey:@"test_public00000000000000000000000000000006"
                                  andDelegate:self
                           overViewController:self];
}

- (void)tokenLoading
{
    [_btnGetAToken setHidden:YES];
    [_aiLoadingSpinner startAnimating];
}

- (void)tokenCreated:(MonetaryToken *)token
{
    [_aiLoadingSpinner stopAnimating];

    NSString *tokenMessage = [NSString stringWithFormat:@"Token: %@\nLast 4: %@\nExp Month: %@\nExp Year: %@\nBrand: %@", token.Token, token.Last4, token.ExpirationMonth, token.ExpirationYear, token.Brand];
    
    UIAlertController *alertController = [UIAlertController
                                          alertControllerWithTitle:@"Token Response"
                                          message:tokenMessage
                                          preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okAction = [UIAlertAction
                               actionWithTitle:NSLocalizedString(@"OK", @"OK action")
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction *action)
                               {
                                   
                               }];
    
    [alertController addAction:okAction];
    
    [self presentViewController:alertController animated:YES completion:^(){[_btnGetAToken setHidden:NO];}];
}

- (void)tokenizationError:(NSError *)error
{
    [_aiLoadingSpinner stopAnimating];
    UIAlertController *alertController = [UIAlertController
                                          alertControllerWithTitle:error.localizedFailureReason
                                          message:error.localizedRecoverySuggestion
                                          preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okAction = [UIAlertAction
                               actionWithTitle:NSLocalizedString(@"OK", @"OK action")
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction *action)
                               {
                                   NSLog(@"OK action");
                               }];
    
    [alertController addAction:okAction];
    
    [self presentViewController:alertController animated:YES completion:^(){[_btnGetAToken setHidden:NO];}];
}

- (void)tokenizationCancelled
{
    [_aiLoadingSpinner stopAnimating];
    UIAlertController *alertController = [UIAlertController
                                          alertControllerWithTitle:@"User cancelled!"
                                          message:@"The user has cancelled entering account data."
                                          preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okAction = [UIAlertAction
                               actionWithTitle:NSLocalizedString(@"OK", @"OK action")
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction *action)
                               {
                                   
                               }];
    
    [alertController addAction:okAction];
    
    [self presentViewController:alertController animated:YES completion:^(){[_btnGetAToken setHidden:NO];}];
}

@end
