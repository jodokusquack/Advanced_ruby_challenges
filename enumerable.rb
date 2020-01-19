module Enumerable
  def my_each
    if block_given?
      for i in self do
        yield(i)
      end
      self
    else
      to_enum(__method__)
    end
  end

  def my_each_with_index
    if block_given?
      index = 0
      self.my_each do |el|
        yield(el, index)
        index += 1
      end
      self
    else
      to_enum(__method__)
    end
  end

  def my_select
    res = self.dup
    self.my_each do |el|
      unless yield(el)
        if self.is_a? Array
          res.delete(el)
        elsif self.is_a? Hash
          res.delete(el[0])
        end
      end
    end
    res
  end

  def my_all?(&block)
    res = self.my_select(&block)
    if res.length == self.length
      return true
    else
      return false
    end
  end

  def my_none? 
    for el in self do
      return false if yield(el)
    end
    return true
  end

  def my_count(obj=nil, &block)
    if block_given?
      return self.my_select(&block).length
    elsif obj != nil
      return self.my_select{|el| el == obj}.length
    else 
      return self.length
    end
  end

  def my_map(proc= nil)
    if proc
      res = []
      for el in self do
        res << proc.call(el)
      end
      return res
    elsif block_given?
      res = []
      for el in self do
        res << yield(el)
      end
      return res
    else
      return to_enum(__method__)
    end
  end

  def my_inject(init_value=nil)
    enum = self.dup 
    memo = init_value || enum.shift
    for el in enum do 
      memo = yield(memo, el)
    end
    memo
  end
end

def multiply_els(arr)
  arr.my_inject {|prod, num| prod * num }
end

array = [1,2,3]
hash = {"a" => "A", "b" => "B"}

#print array.my_each {|num| puts "Current number is: #{num}"}
#print hash.my_each {|key, val| puts "Current key and val are: #{key}, #{val}"} , "\n"
#print hash.my_count {|k,v| v == "A"}
#print array.my_count {|num| num < 5}
#print array.my_map {|num| num*2}

p = Proc.new {|num| num*2}
print array.my_map p

print [2,4,5].my_inject(5) {|prod, num| prod * num }
print multiply_els([2,4,5])