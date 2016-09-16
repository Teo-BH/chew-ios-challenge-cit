//
//  ViewController.m
//  chew-ios-challenge-cit
//
//  Created by Enir Francisco Silva Ferraz on 16/09/16.
//  Copyright © 2016 Enir Francisco Silva Ferraz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSDictionary* json;
    __weak IBOutlet UITableView *tview;
}



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self executarPesquisa:@"http://swapi.co/api/"];
}


-(void)executarPesquisa: (NSString*) paramUrl {
    
    NSURLSessionConfiguration *defaultConfigObject = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration: defaultConfigObject delegate: nil delegateQueue: [NSOperationQueue mainQueue]];
    
    NSURL * url = [NSURL URLWithString:paramUrl];
    
    NSURLSessionDataTask * dataTask = [defaultSession dataTaskWithURL:url
                                                    completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                        if(error == nil)
                                                        {
                                                            json = [NSJSONSerialization JSONObjectWithData:data
                                                                                                                 options:kNilOptions
                                                                                                                   error:nil];
                                                            
                                                            [tview reloadData];
                                                            
                                                        }
                                                        
                                                    }];
    
    [dataTask resume];
    
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [json count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
   
    if(indexPath.row == 0){
        cell.textLabel.text = [json[@"people"] substringFromIndex:20];
    } else if(indexPath.row == 1){
        cell.textLabel.text = [json[@"planets"] substringFromIndex:20];
    } else if(indexPath.row == 2){
        cell.textLabel.text = [json[@"films"] substringFromIndex:20];
    } else if(indexPath.row == 3){
        cell.textLabel.text = [json[@"species"] substringFromIndex:20];
    } else if(indexPath.row == 4){
        cell.textLabel.text = [json[@"species"] substringFromIndex:20];
    } else {
        cell.textLabel.text = [json[@"starships"] substringFromIndex:20];
    }
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}



@end
