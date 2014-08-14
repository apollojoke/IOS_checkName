//
//  WDWViewController.m
//  CheckName
//
//  Created by twer on 8/13/14.
//  Copyright (c) 2014 Jun Lee. All rights reserved.
//

#import "WDWViewController.h"
#import "WDWPerson.h"

@interface WDWViewController ()

@end

@implementation WDWViewController{
    WDWPerson *person;
    UITextField *inputName;
    UILabel * result;
}




- (void)viewDidLoad
{
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    person=[[WDWPerson alloc]init];
    //subview init
    [self.view setBackgroundColor:[UIColor whiteColor]];
    self.title=@"测试你的猥琐程度～～";
    //input text field
    inputName=[[UITextField alloc]initWithFrame:CGRectMake(20, 20,200, 30)];
    [inputName setPlaceholder:@"请输入姓名"];
    inputName.returnKeyType=UIReturnKeyDone;
    inputName.delegate=self;
    [self.view addSubview:inputName];
    // add button
    UIButton * ok = [[UIButton alloc] initWithFrame:CGRectMake(20, 100, 200, 50)];
    [ok setTitle:@"戳我测人品" forState:UIControlStateNormal];
    [ok setTitle:@"戳的好疼" forState:UIControlStateHighlighted];
    [ok setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [ok setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    
    [ok addTarget:self action:@selector(clickedButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview: ok];
    
    // add lable to display result
    result = [[UILabel alloc]initWithFrame:CGRectMake(20, 200, 300, 50)];
    result.numberOfLines=2;
    [self.view addSubview: result];
    
}

-(void)clickedButton{
    if (inputName.text.length==0) {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"注意" message:@"请先输入姓名" delegate:self cancelButtonTitle:@"遵命" otherButtonTitles:nil, nil];
        [alert show];
        return;
    }
    [self checkName:inputName.text];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    if (textField.text.length>20) {
        return NO;
    }
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    NSLog(@"you push done!");
    [textField resignFirstResponder];
    [self checkName:inputName.text];
    return YES;
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

-(void)checkName:(NSString *)name{
    person.name = name;
    NSString *score=[person checkName];
    result.text = [NSString stringWithFormat:@"%@的猥琐度是%@",name,score];
//    NSLog(@"你的猥琐度是%d",score);
}

@end
