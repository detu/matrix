CXX           = g++
CXXFLAGS      = -std=c++17 -Wall -Wextra -O2 -fmax-errors=2
LINK          = $(CXX)
LFLAGS        = -O2 -pthread -lstdc++fs

####### Output directory
OBJECTS_DIR   = .
BIN_DIR       = .
LIB_DIR       = .
LOG_DIR       = .

all: test example

test: tests/test.cc ./matrix.hpp
	$(CXX) -c $(CXXFLAGS) -o $(OBJECTS_DIR)/test.o tests/test.cc
	$(LINK) -o $(BIN_DIR)/test_test $(OBJECTS_DIR)/test.o $(LFLAGS)

example: examples/example.cc ./matrix.hpp
	$(CXX) -c $(CXXFLAGS) -o $(OBJECTS_DIR)/example.o examples/example.cc
	$(LINK) -o $(BIN_DIR)/test_example $(OBJECTS_DIR)/example.o $(LFLAGS)

.PHONY: clean clean_obj clean_test clean_example
clean: clean_obj clean_test clean_example
clean_obj:
	rm ./*.o
clean_test:
	rm ./test_test
clean_example:
	rm ./test_example

