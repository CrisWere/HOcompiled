#Ma. Cristina Werenitzky Curia
# Compilador
 
El archivo `calculator.c` es un programa sencillo, que suma
dos números y los imprime en pantalla; así y todo compilarlo 
requiere un montón de pasos intermedios. Estos pasos los podemos 
clasificar en 4:

1. Pre-procesador: `make preprocessing`
2. Compilacion I: `make assembler`
3. Compilacion II: `make object`
4. Linkeo: `make executable`

Ejecutando cada una de las instrucciones de `make` van a poder
construir cada uno de los pasos intermedios.

Ejercicios:

En un archivo de texto `respuestas.md`:

1. Escriban qué esperan de cada uno de los pasos

   Pasos
	1. Pre-procesador: `make preprocessing`
```
	gcc -E calculator.c -o calculator.pp.c
	
	En este paso se espera que se analicen las directivas del preprocesador. 
 	Se extiendan las librerias y se expandan las macros declaradas.
```

	2. Compilacion I: `make assembler`
```
        gcc -S calculator.c -o calculator.asm
        gcc -S calculator.c -masm=intel -o calculator.asm  #-masm=intel Cambia la sintaxis de assembler a la sintaxis de intel en este caso, 		 						   # por defecto en GNU es bell

        
        En esta etapa se realiza la optimización del código, se traduce en assembler y se realiza optimización de hardware.
```

	3. Compilacion II: `make object`
```
        gcc -c calculator.c -o calculator.o
        En este paso, se traduce de assembler a lenguaje de máquina. El archivo obtenido es binario.

	Con el comando nm presente en el SO, podemos examinar archivos binarios. Obtenemos una lista de descriptores del archivo. con el      		comando:

	nm calculator.o

	Obtenemos:

	000000000000003c T add_numbers
	0000000000000000 T main
        	         U printf
```

	4. Linkeo: `make executable`
```
        gcc -v calculator.o -o calculator.e
	
	En esta etapa se realiza el linkeo del archivo y se genera el archivo ejecutable.
```	

2. ¿Qué agregó el preprocesador?
```
        El preprocesador agregó las definiciones presentes en los headers incluidos.
```

3. Identificar en la rutina de assembler las funciones
```
.LC0:
	.string	"I know how to add! 31 + 11 is %d\n"
	.text
	.globl	main
	.type	main, @function

add_numbers:
.LFB1:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	mov	DWORD PTR [rbp-4], edi
	mov	DWORD PTR [rbp-8], esi
	mov	eax, DWORD PTR [rbp-8]
	mov	edx, DWORD PTR [rbp-4]
	add	eax, edx
	pop	rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
```

4. Explicar qué quieren decir los símbolos que se crean en el objeto
```       
	Con el comando nm obtenemos una lista de descriptores del archivo. Algunos posibles descriptores son:

	    A :  Global absolute symbol.
	    a  :  Local absolute symbol.
	    B : Global bss symbol.
	    b : Local bss symbol.
	    D : Global data symbol.
	    d : Local data symbol.
	    f : Source file name symbol.
	    L : Global thread-local symbol (TLS).
	    l : Static thread-local symbol (TLS).
	    T : Global text symbol.
	    t  : Local text symbol.
	    U : Undefined symbol.
```


5. ¿En qué se diferencian los símbolos del objeto y del ejecutable?
```
	En los descriptores que se obtienen de un archivo ejecutables se utilizan simbolos para realizar los pasos de relocation obtenidos en  		el proceso de linkeo.
```
(siéntanse libres, si quieren, de usar la sintaxis markdown. no hace falta)
