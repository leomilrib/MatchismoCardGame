//
//  GameResultViewController.m
//  Matchismo
//
//  Created by leo on 9/11/13.
//  Copyright (c) 2013 leomilrib. All rights reserved.
//

#import "GameResultViewController.h"

@interface GameResultViewController ()

@end

@implementation GameResultViewController

-(void)setup{
    //initializatoin that can't wait for viewDidLoad.
}

-(void)awakeFromNib{
  [self setup];
}

-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
//    if (self) {
    [self setup];
//    }
    return self;
}

-(void)viewDidLoad{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

-(void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
