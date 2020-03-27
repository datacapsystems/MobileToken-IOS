//
//  MonetaryToken.h
//  MonetaryMobileToken
//
//  Copyright © 2016 Monetary. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 MonetaryToken class representing tokenized account data.
 */
@interface MonetaryToken : NSObject

/**
 * Token of user-entered account data.
 */
@property (strong, nonatomic) NSString *Token;

/**
 * Card brand of account represented by token.
 */
@property (strong, nonatomic) NSString *Brand;

/**
 * Expiration month of account represented by token.
 */
@property (strong, nonatomic) NSString *ExpirationMonth;

/**
 * Expiration year of account represented by token.
 */
@property (strong, nonatomic) NSString *ExpirationYear;

/**
 * Last four digits of account represented by token.
 */
@property (strong, nonatomic) NSString *Last4;

@end
