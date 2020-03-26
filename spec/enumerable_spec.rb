 require './enumerable.rb'

 RSpec.describe Enumerable do

    describe "#my_each" do
      it "executes a given block for each element" do
        expect{ [1,2,3].my_each {|i| print i} }.to output("123").to_stdout
      end

      it "returns an enumerator if no block is given" do
         enum = [1,2,3].my_each

         expect{enum.my_each {|i| puts i}}.to output("1\n2\n3\n").to_stdout
      end
    end

    describe "#my_each_with_index" do
      it "executes a given block for each element and passes the index too" do
        expect{ [0,1,2].my_each_with_index {|el, index| print el,index} }.to \
          output("001122").to_stdout
      end

      it "returns an enumerator if no block is given" do
        enum = [].my_each_with_index

        expect(enum).to be_instance_of Enumerator
      end
    end

    describe "#my_all?" do
      it "returns true if all elements of the array evaluate to true \
      with the given block" do
        expect( [1,2].my_all? { |el| el > 0 } ).to be true
      end

      it "returns false if not all elments are true" do
        expect( [true, false].my_all? { |el| el } ).to be false
      end
    end

    describe "#my_select" do
      it "returns only the elements for which the block returns true" do
        expect( [1,0,1,0,1,0,1].my_select { |el| el == 0 } ).to eq([0,0,0])
      end
    end

    describe "#my_map" do
      it "applies the block to every element" do
        expect( [0,1,2,3,4].my_map { |el| el**2 } ).to eq([0,1,4,9,16])
      end
    end

    describe "#my_count" do
      it "returns the number of elements for which a block returns true" do
        expect( [0,1,2,3,4,5,6].my_count { |el| el % 2 == 0 } ).to eq(4)
      end

      it "returns the number of elements which equal the argument" do
        expect( [0,1,0,1,0].my_count(0) ).to eq(3)
      end

      it "returns the length of the object of no argument is given" do
        expect( [1,2,3,4].my_count ).to eq(4)
      end
    end

    describe "#my_inject" do
      it "applies the block to all elements and returns the result" do
        expect( [0,2,4,6].my_inject(0) { |acc, el| acc += el } ).to eq(12)
      end
    end
 end
