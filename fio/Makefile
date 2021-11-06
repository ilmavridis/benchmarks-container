BENCHMARK = fio
URL = http://brick.kernel.dk/snaps/
FILENAME = fio-3.27.tar.gz
UNTAR_DIR = fio-3.27


all: $(BENCHMARK)


$(BENCHMARK): 
	wget $(URL)$(FILENAME)
	tar xvzf $(FILENAME)
	cd $(UNTAR_DIR); ./configure; make


clean:
	rm -rf $(FILENAME) $(DIRNAME)
