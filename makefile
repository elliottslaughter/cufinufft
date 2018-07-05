CC=g++
NVCC=nvcc
INCLUDE_DIR=/mnt/xfs1/flatiron-sw/pkg/devel/cuda/8.0.61/samples/common/inc/
spread1d: spread1d.o utils.o main_1d.cu
	$(NVCC) main_1d.cu -o spread1d spread1d.o utils.o -I$(INCLUDE_DIR)
spread1d.o: utils.o spread1d.cu
	$(NVCC) -c spread1d.cu -I$(INCLUDE_DIR)

spread2d: spread2d.o utils.o main_2d.cu
	$(NVCC) main_2d.cu -o spread2d spread2d.o utils.o -I$(INCLUDE_DIR)
spread2d.o: utils.o spread2d.cu
	$(NVCC) -c spread2d.cu -I$(INCLUDE_DIR)
utils.o: utils.cpp
	$(CC) -c utils.cpp 
clean:
	rm *.o
	rm -f spread1d
	rm -r spread2d

