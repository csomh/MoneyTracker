
CPP = g++
AR = ar crf
CPPFLAGS = -Wall

INCLUDES = -I../a -I../b

HEADERS = \
	../a/A.h \
	../b/B.h

main.a: main.o
	$(AR) main.a main.o

main.o: main.cpp $(HEADERS)
	$(CPP) $(CPPFLAGS) $(INCLUDES) -c main.cpp

clean:
	del main.a
	del main.o
