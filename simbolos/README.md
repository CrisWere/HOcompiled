# Símbolos 
 
El archivo `visibility.c` tiene muchos tipos de símbolos. En
este trabajo sólo tienen que compilar el objeto `visibility.o` 
e identificar los símbolos, ejecutando:

```
make object
```

COMANDOS UTILIZADOS

	gcc -c visibility.c   !Genera archivo binario visibility.o
	nm visibility.o

		
CONTENIDO ARCHIVO visibility.c
```
/* file: visibility.c */
#include <stdio.h>

static const int val1 = -5;
const int val2 = 10;
static int val3 = -20;
int val4 = -15;

static int add_abs(const int v1, const int v2) {
  return abs(v1)+abs(v2);
}

int main(int argc, char **argv) {
  int val5 = 20;
  printf("%d / %d / %d\n",
	 add_abs(val1,val2),
	 add_abs(val3,val4),
	 add_abs(val1,val5));
  return 0;
}
```





		0000000000000000 t add_abs
		000000000000002a T main
		                 U printf
		0000000000000000 r val1
		0000000000000004 R val2
		0000000000000000 d val3
		0000000000000004 D val4

