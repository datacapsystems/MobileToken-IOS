//
//  MonetaryTokenDelegate.h
//  MonetaryMobileToken
//
//  Copyright © 2016 Monetary. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MonetaryMobileToken/MonetaryToken.h>

/**
 MonetaryTokenizer Result Protocol
 */
@protocol MonetaryTokenDelegate <NSObject>

/**
 Called when MonetaryTokenizer begins tokenizing user-input account data.
 
 Where implemented, this method will be called from a MonetaryTokenizer has begun tokenzing user-input account data.
 */
- (void)tokenLoading;

/**
 Called when MonetaryTokenizer successfully tokenizes user-input account data.
 
 Where implemented, this method will be called from a MonetaryTokenizer that has successfully tokenized user-input account data.
 
 @param  token A MonetaryToken object containing the token properties of the tokenized user-entered account data.
 */
- (void)tokenCreated:(MonetaryToken *)token;

/**
 Called when MonetaryTokenizer fails to tokenize user-input account data.
 
 Where implemented, this method will be called from a MonetaryTokenizer that has failed to tokenized user-input account data.
 
 @param  error An NSError object containing details of the tokenization failure.
 */
- (void)tokenizationError:(NSError *)error;

/**
 Called when user cancels MonetaryTokenizer account data input process.
 
 Where implemented, this method will be called from a MonetaryTokenizer from which user has cancelled the account data input process.
 */
- (void)tokenizationCancelled;

@end