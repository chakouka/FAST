//
//  TBView.m
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

#import "TBView.h"
#import "AMPopoverSelectTableViewController.h"
#import "AMCheckoutViewController.h"
#import "AMFilterTableViewCell.h"

typedef NS_ENUM (NSInteger, PopViewType) {
    PopViewType_Select_RepairCode = 1000,
    PopViewType_Select_HoursWorked,
    PopViewType_Select_InvoiceCode,
    PopViewType_Select_FilterName,
    PopViewType_Select_PartName,
    PopViewType_Select_FilterType,//bkk 2/5/15
};

@implementation TBView
@synthesize qtyLabel;
@synthesize parentVC;
@synthesize numFilters = _numFilters;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(!self){
        return nil;
    }
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(updateFilterButtonText:)
                                                 name:@"Filter_Item_Changed"
                                               object:nil];
    loadView()
    self.otherFiltersText.delegate = self;
    
    self.numFilters = [NSMutableArray arrayWithArray:@[@{ @"NAME" : @"Filter2", @"QTY" : @1  }, @{ @"NAME" : @"Filter5", @"QTY" : @3 }, @{@"NAME" : @"Filter1", @"QTY" : @4 }, @{@"NAME" : @"Filter4", @"QTY" : @2 }, @{@"NAME" : @"Filter9", @"QTY" : @3 }]];
    
    
return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if(!self){
        return nil;
    }
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(updateFilterButtonText:)
                                                 name:@"Filter_Item_Changed"
                                               object:nil];
    loadView()
    self.otherFiltersText.delegate = self;
    //self.label.text = [NSString stringWithFormat:@"%s", __PRETTY_FUNCTION__];

return self;
}
- (IBAction)selectFilter:(id)sender {
    [self.parentVC showFiltersList:sender];
    self.otherFiltersText.text = @"";
}
- (IBAction)stepperChanged:(id)sender {
    double value = ((UIStepper *)sender).value;
    
    [self.qtyLabel setText:[NSString stringWithFormat:@"%d", (int)value]];
}
- (IBAction)confirmAndSaveCase:(id)sender {
    if ([self.numFilters count] > 0)
    {
        NSDictionary *notification = @{ @"POST_FILTERS_AND_QUANTITIES" : self.numFilters, @"POST_FILTERS_AND_QUANTITIES_SENDER" : sender};
        [[NSNotificationCenter defaultCenter] postNotificationName:@"POST_FILTERS_AND_QUANTITIES" object:self userInfo:notification];
    } else {
        NSString *errorMsg = @"No filters selected.";
        [AMUtilities showAlertWithInfo:errorMsg];
    }
}
-(void)updateFilterButtonText:(NSNotification *) notification {
    if ([[notification name] isEqualToString:@"Filter_Item_Changed"]) {
        [self.filterSelectButton setTitle:[notification.userInfo objectForKey:@"VALUE"] forState:UIControlStateNormal];
    }
}
- (IBAction)addNewFilter:(id)sender {
    NSString *errorMsg;
    if ([self.qtyLabel.text isEqualToString:@"0"]) {
        errorMsg = @"Qty is required";
        [AMUtilities showAlertWithInfo:errorMsg];
        return;
    }
    
    if ([self.filterSelectButton.titleLabel.text isEqualToString:@"Select a Filter"] && [self.otherFiltersText.text isEqualToString: @""]) {
        errorMsg = @"Must select a filter";
        [AMUtilities showAlertWithInfo:errorMsg];
        return;
    }
    
    int qty = [self.qtyLabel.text integerValue];
    if ([self.otherFiltersText.text length] > 0)
    {
      //  NSNumber *qty = [self.qtyLabel.text integerValue];
        //use the freeform text box value
        [self.numFilters addObject:@{@"NAME" : self.otherFiltersText.text, @"QTY" : @(qty) }];
    } else {
        [self.numFilters addObject:@{@"NAME" : self.filterSelectButton.titleLabel.text, @"QTY" : @(qty) }];
    }
    [self.myTableview reloadData];
}

-(void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

-(IBAction)textViewDidChange:(UITextView *)textView {
    [self.filterSelectButton setTitle:@"Select a Filter" forState:UIControlStateNormal];
    [self.qtyLabel setText:@"0"];
    self.qtyStepper.value = 0;
}
#pragma mark - uitableview stuff

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.numFilters count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AMFilterTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"custCell"];
    if(!cell)
    {
        [tableView registerNib:[UINib nibWithNibName:@"AMFilterTableViewCell" bundle:nil] forCellReuseIdentifier:@"custCell"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"custCell"];
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(AMFilterTableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *dict = [self.numFilters objectAtIndex:indexPath.row];
    cell.lblFilterName.text = [dict objectForKey:@"NAME"];

    cell.lblFilterQty.text = [[dict objectForKey:@"QTY"] stringValue];
   
    
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.numFilters removeObjectAtIndex:indexPath.row];
    
    [tableView reloadData];
}
@end
