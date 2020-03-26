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
