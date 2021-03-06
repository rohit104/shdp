CC = g++ -O2 -DHAVE_INLINE=1 -DGSL_RANGE_CHECK=0 -Wall
#CC = g++ -ansi -Wall -pedantic
#CFLAGS = -g -Wall -O3 -ffast-math -DHAVE_INLINE -DGSL_RANGE_CHECK_OFF
# CFLAGS = -g -Wall
LDFLAGS = -lgsl -lm -lgslcblas #-latlas

GSL_INCLUDE = /u/chongw/libs/gsl/include
GSL_LIB = /u/chongw/libs/gsl/lib

GSL_INCLUDE_MAC = /usr/local/include/
GSL_LIB_MAC = /usr/local/lib/

LSOURCE = main.cpp utils.cpp stirln.cpp corpus.cpp state.cpp
LHEADER = utils.h stirln.h corpus.h state.h

mac: $(LSOURCE) $(HEADER)
	  $(CC) -I$(GSL_INCLUDE_MAC) -L$(GSL_LIB_MAC) $(LSOURCE) -o shdp $(LDFLAGS)

mac-d: $(LSOURCE) $(HEADER)
	  $(CC) -g -I$(GSL_INCLUDE_MAC) -L$(GSL_LIB_MAC) $(LSOURCE) -o shdp $(LDFLAGS)

linux: $(LSOURCE) $(HEADER)
	  $(CC) -I$(GSL_INCLUDE) -L$(GSL_LIB) $(LSOURCE) -o shdp $(LDFLAGS)

linux-d: $(LSOURCE) $(HEADER)
	  $(CC) -g -I$(GSL_INCLUDE) -L$(GSL_LIB) $(LSOURCE) -o shdp $(LDFLAGS)


clean:
	-rm shdp
