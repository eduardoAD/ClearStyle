//
//  ToDoItem.h
//  ClearStyle
//
//  Created by Eduardo Alvarado Díaz on 2/11/16.
//  Copyright © 2016 personal. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ToDoItem : NSObject

// A text description of this item
@property (nonatomic,copy) NSString *text;

// A Boolean value that determines the completed state of this item
@property (nonatomic) BOOL completed;

// Returns an ToDoItem item initialized with the given text
-(id)initWithText:(NSString*)text;

// Returns an ToDoItem item initialized with the given text
+(id)toDoItemWithText:(NSString*)text;

@end
