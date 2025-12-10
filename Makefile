# VARIABLES 
CC = gcc                           
CFLAGS = -Wall -Wextra -O2 -Isrc_c 
LDFLAGS = -lm                    
 
# TARGETS 
all: igrf_test                     

igrf_test: src_c/main.c src_c/igrf.c
	$(CC) $(CFLAGS) $^ -o $@ $(LDFLAGS)  
	@echo "Build complete." 
	@echo "Magnetic Field generated. Please keep credit cards away from the CPU."             

# Clean up
clean:
	rm -f igrf_test src_c/*.o