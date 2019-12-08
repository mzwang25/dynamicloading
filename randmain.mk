randmain: randmain.o randcpuid.o
	gcc $(CFLAGS) -ldl -Wl,-rpath=$(PWD) -o $@ randmain.o randcpuid.o

randmain.o: randmain.c
	gcc $(CFLAGS) -c randmain.c -o $@

randcpuid.o: randcpuid.c
	gcc $(CFLAGS) -c randcpuid.c -o $@

randlibhw.so: randlibhw.o
	gcc $(CFLAGS) -shared randlibhw.o -o $@

randlibsw.so: randlibsw.o
	gcc $(CFLAGS) -shared randlibsw.o -o $@

randlibhw.o : randlibhw.c
	gcc $(CFLAGS) -fPIC -c randlibhw.c -o $@

randlibsw.o : randlibsw.c
	gcc $(CFLAGS) -fPIC -c randlibsw.c -o $@
