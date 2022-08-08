package ThisIsAlgo api;

fn Swap(var A: i32*, var B: i32*) {
    var Temp: i32 = *A;
    *A = *B;
    *B = Temp;
}

fn Partition(var DataSet: [i32; 10]*, var Left: i32, var Right: i32) -> i32 {
    var First: i32 = Left;
    var Pivot: i32 = &DataSet[First];
    Left = Left + 1;    
    while(Left <= Right) {
        while((DataSet[Left] <= Pivot) and (Left < Right)) {
            Left = Left + 1;
        }
        while((DataSet[Right] >= Pivot) and (Left <= Right)) {
            Right = Right - 1;            
        }
        if (Left < Right) {
            Swap(&DataSet[Left], &DataSet[Right]);
        } else {
            break;
        }
    }
    Swap(&DataSet[First], &DataSet[Right]);

    return Right;
}

fn QuickSort(var DataSet: [i32; 10], var Left: i32, var Right: i32) {
    if (Left < Right) {
        var Index: i32 = Partition(DataSet, Left, Right);
        QuickSort(DataSet, Left, Index - 1);
        QuickSort(DataSet, Index + 1, Right);
    }
}

fn Main() -> i32 {
    var DataSet: [i32; 10] = (1, 10, 5, 7, 3, 6, 4, 9, 8, 2);
    QuickSort(DataSet, 0, 10 - 1);
    return 0;
}
