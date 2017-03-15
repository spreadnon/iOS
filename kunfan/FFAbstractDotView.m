//
//  FFAbstractDotView.m
//  FFBannerView
//
//  Created by Fan on 16/10/12.
//  Copyright © 2016年 Fan. All rights reserved.
//

#import "FFAbstractDotView.h"

@implementation FFAbstractDotView

- (id)init
{
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:[NSString stringWithFormat:@"You must override %@ in %@", NSStringFromSelector(_cmd), self.class]
                                 userInfo:nil];
}


- (void)changActiveState:(BOOL)active
{
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:[NSString stringWithFormat:@"You must override %@ in %@", NSStringFromSelector(_cmd), self.class]
                                 userInfo:nil];
}

- (void)setDotColor:(UIColor *)dotColor
{
    
}

- (void)setCurrentDotColor:(UIColor *)currentDotColor
{
    
}
@end
