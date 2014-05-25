//
//  ListDetailViewController.m
//  Checklists
//
//  Created by Matthijs on 12-24-13.
//  Copyright (c) 2013 Happy Bubsy. All rights reserved.
//

#import "ListDetailViewController.h"
#import "Checklist.h"

@interface ListDetailViewController ()

@end

@implementation ListDetailViewController{
    
    NSString *_iconName;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder{
    
    if((self = [super initWithCoder:aDecoder])){
        
        _iconName = @"Folder";
    }
    return self;
}

- (void)viewDidLoad
{
  [super viewDidLoad];

  if (self.checklistToEdit != nil) {
    self.title = @"Edit Checklist";
    self.textField.text = self.checklistToEdit.name;
    self.doneBarButton.enabled = YES;
      _iconName = self.checklistToEdit.iconName;
  }
    self.iconImageView.image = [UIImage imageNamed:_iconName];
}

- (void)viewWillAppear:(BOOL)animated
{
  [super viewWillAppear:animated];

  [self.textField becomeFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//
- (IBAction)cancel
{
  [self.delegate listDetailViewControllerDidCancel:self];
}

- (IBAction)done
{
  if (self.checklistToEdit == nil) {
    Checklist *checklist = [[Checklist alloc] init];
    checklist.name = self.textField.text;
      checklist.iconName = _iconName;

    [self.delegate listDetailViewController:self didFinishAddingChecklist:checklist];

  } else {
    self.checklistToEdit.name = self.textField.text;
      self.checklistToEdit.iconName = _iconName;
    [self.delegate listDetailViewController:self didFinishEditingChecklist:self.checklistToEdit];
  }
}

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if(indexPath.section ==1){
        return indexPath;
    }else{
  return nil;
    }
}

- (BOOL)textField:(UITextField *)theTextField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
  NSString *newText = [theTextField.text stringByReplacingCharactersInRange:range withString:string];
  self.doneBarButton.enabled = ([newText length] > 0);
  return YES;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    
    if([segue.identifier isEqualToString:@"PickIcon"]){
        
        IconPickerViewController *controller = segue.destinationViewController;
        
        controller.delegate = self;
    }
}

-(void)iconPicker:(IconPickerViewController *)picker didPickIcon:(NSString *)iconName{
    
    
    _iconName = iconName;
    
    self.iconImageView.image = [UIImage imageNamed:_iconName];
    
    [self.navigationController popViewControllerAnimated:YES];
}



@end
