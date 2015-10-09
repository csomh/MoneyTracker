
CPP = g++
RM = del

# first target, reached when calling make without a target
app:
# call make in 'main' subdir
	$(MAKE) -C main
# call make in 'a' subdir
	$(MAKE) -C a
# call make in 'b' subdir
	$(MAKE) -C b
# call make with target 'application.exe'
	$(MAKE) application.exe

# this should be called only by 'app',
# to make sure that libraries are up to date
application.exe: main\main.a a\A.a b\B.a
	$(CPP) -o application.exe main\main.a a\A.a b\B.a

clean:
	$(MAKE) -C main clean
	$(MAKE) -C a clean
	$(MAKE) -C b clean
	$(RM) application.exe
