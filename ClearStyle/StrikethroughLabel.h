//
//  StrikethroughLabel.h
//  ClearStyle
//
//  Created by Eduardo Alvarado Díaz on 2/12/16.
//  Copyright © 2016 personal. All rights reserved.
//

#import <UIKit/UIKit.h>

// A UILabel subclass that can optionally have a strikethrough
@interface StrikethroughLabel : UITextField

// A Boolean value that determines whether the label should have a strikethrough
@property (nonatomic) BOOL strikethrough;

@end
