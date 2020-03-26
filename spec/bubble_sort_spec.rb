require './bubble_sort.rb'

RSpec.describe "bubble_sort" do
  it "sorts a regular list in ascending order" do
    expect(bubble_sort([3,6,1,2,0,-4,0,9,104])).to eq([-4,0,0,1,2,3,6,9,104])
  end
end

RSpec.describe "bubble_sort_by" do
  it "can sort a list of strings by length" do
    sorter = Proc.new { |l,r| l.length - r.length }

    expect( bubble_sort_by(["one", "two", "three", "four"], &sorter )).to eq(
      ["one", "two", "four", "three"]
    )
  end

  it "can sort a list of numbers in descending order" do
    sorter = Proc.new { |a,b| b-a }

    expect(bubble_sort_by [0,34,56,2,1,-300,-1,1], &sorter ).to eq(
      [56, 34, 2, 1, 1, 0, -1, -300]
    )
  end
end
