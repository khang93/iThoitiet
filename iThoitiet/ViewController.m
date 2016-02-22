//
//  ViewController.m
//  iThoitiet
//
//  Created by Minh Khang on 2/21/16.
//  Copyright © 2016 Minh Khang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *lbLocation;

@property (weak, nonatomic) IBOutlet UILabel *lbC;
@property (weak, nonatomic) IBOutlet UILabel *lbF;

@property (weak, nonatomic) IBOutlet UIButton *temp;

@property (weak, nonatomic) IBOutlet UIImageView *iconWeather;

@property (weak, nonatomic) IBOutlet UILabel *lbQuote;

@end


@implementation ViewController{
    
    NSArray* quotes;
    NSArray* locations;
    NSArray* photoFiles;
    int count;
    
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    count = 0;
    quotes = @[@"Một con ngựa đau cả tàu bỏ cỏ",@"Chớ thấy sóng cả mà ngã tay chèo",@"Đi một ngày đàng học một sàng khôn"];
    photoFiles = @[@"rain",@"windy",@"thunder"];
    locations = @[@"Hải Phòng",@"Thanh Hoá",@"Huế"];
    [self.lbF setHidden:YES];
    
}

- (IBAction)btnUpdate:(id)sender {
    int quoteIndex = arc4random_uniform(quotes.count);
    //NSLog(@"%d",quoteIndex);
    self.lbQuote.text = quotes[quoteIndex];
    int photoIndex = arc4random_uniform(photoFiles.count);
    self.iconWeather.image = [UIImage imageNamed:photoFiles[photoIndex]];
    int locationsIndex = arc4random_uniform(photoFiles.count);
    self.lbLocation.text = locations[locationsIndex];

    
    NSString* string = [NSString stringWithFormat:@"%2.1f", [self getTemperature]];
   [self.temp setTitle:string forState:UIControlStateNormal];
}

- (float) getTemperature {
    return 14.0 + arc4random_uniform(18) + (float)arc4random() /(float) INT32_MAX;
}


- (IBAction)btnConvertTemp:(id)sender {
    
    
    if(count %2 == 0){
        float doF = ([self.temp.currentTitle floatValue] * 1.8) + 32;
        NSString* strDoF = [NSString stringWithFormat:@"%2.1f", doF];
        [self.temp setTitle:strDoF forState:UIControlStateNormal];
        [self.lbF setHidden:NO];
        [self.lbC setHidden:YES];
        
    }
    else{
        float doC = ([self.temp.currentTitle floatValue] -32)/1.8;
        NSString* strDoC = [NSString stringWithFormat:@"%2.1f", doC];
        [self.temp setTitle:strDoC forState:UIControlStateNormal];
        [self.lbC setHidden:NO];
        [self.lbF setHidden:YES];

    }
    count++;
    
}

@end
