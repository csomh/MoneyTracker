CPP = g++
AR = ar crf
CPPFLAGS = -Wall

# INCLUDES = -I../a -I../b

HEADERS = \
    ../b/B.h

B.a: B.o
	$(AR) B.a B.o

B.o: B.cpp $(HEADERS)
	$(CPP) $(CPPFLAGS) $(INCLUDES) -c B.cpp

clean:
	del A.a
	del A.o
