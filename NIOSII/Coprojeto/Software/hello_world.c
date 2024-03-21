#include <stdio.h>
#include <io.h>
#include <system.h>

int main()
{
	unsigned int inp;
	printf("Hello from Nios II!\n");

  	 while(1)
  	 {
  		 IOWR(SOMADOR_BASE,0,4);
  		 IOWR(SOMADOR_BASE,1,3);

  		 inp=IORD(SOMADOR_BASE,0);
  		 IOWR(LED_BASE,0,inp);
  	 }
  return 0;
}
