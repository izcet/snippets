# include <stdio.h>

int main(void) {
    int n = 1;
    // little endian if true
    if(*(char *)&n == 1)
        printf("Little\n");
    else
        printf("Big\n");
    return (0);
}

