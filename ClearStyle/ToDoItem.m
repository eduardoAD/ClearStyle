//
//  ToDoItem.m
//  ClearStyle
//
//  Created by Eduardo Alvarado Díaz on 2/11/16.
//  Copyright © 2016 personal. All rights reserved.
//

#import "ToDoItem.h"


@implementation ToDoItem

-(id)initWithText:(NSString*)text {
    if (self = [super init]) {
        self.text = text;
    }
    return self;
}

+(id)toDoItemWithText:(NSString *)text {
    return [[ToDoItem alloc] initWithText:text];
}


@end
