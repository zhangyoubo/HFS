//
//  ViewController.m
//  TableViewCell Delete Insert
//
//  Created by Apple on 16/2/4.
//  Copyright (c) 2016年 zf. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *tableview;
    NSMutableArray *array;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    tableview=[[UITableView alloc] initWithFrame:[UIScreen mainScreen].applicationFrame style:UITableViewStylePlain];
    
    tableview.backgroundColor=[UIColor whiteColor];
    
    tableview.delegate=self;
    tableview.dataSource=self;
    
    array=[[NSMutableArray alloc] init];
    array=[NSMutableArray arrayWithObjects:@"我",@"们",@"一",@"定",@"要",@"幸",@"福",@"啊",@"哈哈",@"呵呵", nil];
    
    [tableview setEditing:YES];
    [self.view addSubview:tableview];
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [array count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *str=@"cell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:str];
    if (cell==nil) {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
    }
    
    cell.textLabel.text=[array objectAtIndex:[indexPath row]];
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle==UITableViewCellEditingStyleDelete) {
        NSInteger row=[indexPath row];
        [array removeObjectAtIndex:row];
        [tableview deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
    // 添加一个
//    if (editingStyle==UITableViewCellEditingStyleInsert) {
//        NSInteger row=[indexPath row];
//        [array insertObject:@"嘻嘻" atIndex:row];
//        
//        //indexPath=[NSIndexPath indexPathForRow:row+3 inSection:0];
//        
//        [tableview insertRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath, nil] withRowAnimation:UITableViewRowAnimationRight];
//    }
    // 添加多个
    if (editingStyle==UITableViewCellEditingStyleInsert) {
        NSInteger row=[indexPath row];
        
        NSMutableArray *indexPaths = [NSMutableArray array];
        
        for (int i=1; i<3; i++) {
            
            [array insertObject:@"嘻嘻" atIndex:row+i];
            indexPath=[NSIndexPath indexPathForRow:row+i inSection:0];
            [indexPaths addObject:indexPath];
            
        }
        
        [tableview insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationTop];
    }
}


- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    NSInteger fromRow=[sourceIndexPath row];
    NSInteger toRow=[destinationIndexPath row];
    id object=[array objectAtIndex:fromRow];
    
    [array removeObjectAtIndex:fromRow];
    [array insertObject:object atIndex:toRow];
    
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleInsert;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
