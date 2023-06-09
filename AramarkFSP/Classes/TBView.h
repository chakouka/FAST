//
//  TBView.h
//  TBReusableUIView
//
//  Created by Markos Charatzas on 16/03/2013.
//  Copyright (c) 2013 Markos Charatzas (@qnoid).
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy of
//  this software and associated documentation files (the "Software"), to deal in
//  the Software without restriction, including without limitation the rights to
//  use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
//  of the Software, and to permit persons to whom the Software is furnished to do
//  so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
//

#import <UIKit/UIKit.h>
#import "AMCheckoutViewController.h"

@class AMPopoverSelectTableViewController;

#define loadView() \
NSBundle *mainBundle = [NSBundle mainBundle]; \
NSArray *views = [mainBundle loadNibNamed:NSStringFromClass([self class]) owner:self options:nil]; \
[self addSubview:views[0]];
NSMutableArray *numFilters;
UIPickerView *picker;
UITextField *pickerViewTextField;
NSArray *filterNames;

@interface TBView : UIView <UITextViewDelegate, UITableViewDataSource, UITableViewDelegate, UIPickerViewDataSource, UIPickerViewDelegate>
@property(nonatomic, weak) IBOutlet UILabel *qtyLabel;
@property (strong, nonatomic) IBOutlet UIButton *filterSelectButton;
@property (nonatomic, strong) AMCheckoutViewController *parentVC;
@property (weak, nonatomic) IBOutlet UITextView *otherFiltersText;
@property (strong, nonatomic) NSMutableArray *numFilters;
@property (weak, nonatomic) IBOutlet UITableView *myTableview;
@property(nonatomic, weak) IBOutlet UIStepper *qtyStepper;
@property (nonatomic, strong) UITextField *pickerViewTextField;
@property (nonatomic, strong) NSArray *filterNames;
@property (nonatomic, strong) IBOutlet UILabel *unlistedFilterLabel;
@property (nonatomic, strong) IBOutlet UILabel *filterQtyLabel;
@property (nonatomic, strong) IBOutlet UIButton *addNewButton;
@property (nonatomic, strong) IBOutlet UIButton *confirmAndCreateButton;
@property (nonatomic, strong) IBOutlet UILabel *orLabel;

@end
