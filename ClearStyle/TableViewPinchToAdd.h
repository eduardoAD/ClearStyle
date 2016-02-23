//
//  TableViewPinchToAdd.h
//  ClearStyle
//
//  Created by Eduardo Alvarado Díaz on 2/15/16.
//  Copyright © 2016 personal. All rights reserved.
//

#import "TableView.h"

// A behavior that adds the facility to pinch the list in order to insert a new
// item at any location.
@interface TableViewPinchToAdd : NSObject

// associates this behavior with the given table
-(id)initWithTableView:(TableView*)tableView;

@end
