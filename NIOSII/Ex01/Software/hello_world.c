#include <stdio.h>
#include <io.h>
#include <system.h>

int main()
{
	unsigned int num;

	printf("Hello from Nios II!\n");

 	 while(1)
 	 {
 		 num=IORD(SW_BASE,0);
 		 IOWR(LED_BASE,0,num);
 	 }
  return 0;
}
