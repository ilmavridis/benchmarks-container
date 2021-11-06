BENCHMARK = stream
URL = https://www.cs.virginia.edu/stream/FTP/Code/
FILENAME = stream.c
CC = gcc
CFLAGS = -O3
ARRAY_SIZE = -DSTREAM_ARRAY_SIZE=100000000 #Default value 100000000


all: $(BENCHMARK)
$(BENCHMARK): $(FILENAME)
	${CC} ${CFLAGS} ${ARRAY_SIZE} $@.c -o $@


$(FILENAME):
	wget $(URL)$(FILENAME)


clean:
	rm -f $(BENCHMARK)