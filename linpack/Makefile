BENCHMARK = linpack
CC = gcc
CFLAGS = -O3


all: $(BENCHMARK)
$(BENCHMARK):
	${CC} ${CFLAGS} $@.c -o $@


clean:
	rm -f $(BENCHMARK)