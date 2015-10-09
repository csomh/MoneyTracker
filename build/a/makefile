CPP = g++
AR = ar crf
CPPFLAGS = -Wall

# INCLUDES = -I../a -I../b

HEADERS = \
    ../a/A.h

A.a: A.o
	$(AR) A.a A.o

A.o: A.cpp $(HEADERS)
	$(CPP) $(CPPFLAGS) $(INCLUDES) -c A.cpp

clean:
	del A.a
	del A.o
