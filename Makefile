clean:
	@rm -f input/sample.csv output/*.output

all:	c_simple benchmark

c_simple: c/c_simple.c
	@echo "Compiling c_simple..."
	gcc -Wall -O2 -o c/c_simple c/c_simple.c

benchmark:
	@echo "Creating sample.csv..."
	@./input/generate_csv.rb > ./input/sample.csv
	@echo
	@echo "C Simple CSV Parser:"
	@time ./c/c_simple ./input/sample.csv > ./output/c_simple.output
	@echo
	@echo "Ruby Simple CSV Parser:"
	@time ./ruby/ruby_simple.rb ./input/sample.csv > ./output/ruby_simple.output
	@echo
	@echo "Ruby Complete CSV Parser:"
	@time ./ruby/ruby_complete.rb ./input/sample.csv > ./output/ruby_complete.output
