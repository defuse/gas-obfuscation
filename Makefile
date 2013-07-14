test: test.c
	gcc -c -S test.c -o test.s
	gcc -c test.s -o test.o
	gcc test.o -o test

testobf: test.c obf.rb
	gcc -c -S test.c -o test.s
	ruby obf.rb test.s > testobf.s
	gcc -c testobf.s -o testobf.o
	gcc testobf.o -o testobf
