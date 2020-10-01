//
//  ViewController.m
//  TableViewWithDictionary
//
//  Created by The App Experts on 01/10/2020.
//  Copyright © 2020 The App Experts. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *mainTableView;
@property NSMutableDictionary* dictionary;

@end

@implementation ViewController
@synthesize dictionary;

-(void)populateDictionary {
    NSArray*fruits = @[@"apple", @"banan", @"watermelon", @"kiwi", @"mango"];
    NSArray *colors = @[@"Red", @"Yellow", @"Orange", @"Green", @"Blue", @"Violet"];
    NSArray *cities = [NSArray arrayWithObjects:@"New Delhi", @"London", @"Brisbane", @"Adelaide", nil];
    NSArray*cars = @[@"Mazda", @"Fiat", @"Nissan", @"Honda", @"Volvo", @"Lexus"];
    NSArray*programmingLanguages = @[@"Java", @"Objective-c", @"C++", @"Kotlin", @"Swift", @"C#", @"PHP"];
    
    self.dictionary = [[NSMutableDictionary alloc]initWithObjectsAndKeys:fruits,@"FRUITS", colors, @"COLORS", cities, @"CITIES", cars, @"CARS", programmingLanguages, @"PROGRAMMING LANGUAGES", nil];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self populateDictionary];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [[self.dictionary allKeys] count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    int count;
    NSArray*keys = [self.dictionary allKeys];
    count = (int)[[self.dictionary valueForKey:keys[section]]count];
    return count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSArray*keys = [self.dictionary allKeys];
    return [[NSString alloc] initWithFormat: @"%@", keys[section]];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * cellIdentifer = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifer forIndexPath:indexPath ];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifer];
    }
    
    NSArray*keys = [self.dictionary allKeys];
    
    NSArray*valuesForKey = [self.dictionary valueForKey:keys[indexPath.section]];

    NSLog(@"# values > %@", valuesForKey);

    cell.textLabel.text = valuesForKey[indexPath.row];
    return cell;
}

@end
