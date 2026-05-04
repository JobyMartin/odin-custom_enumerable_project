module Enumerable
  # Your code goes here
  def my_each_with_index
    if block_given?
      index = 0
      my_each do |item| 
        yield(item, index)
        index += 1
      end
    else
      to_enum(:my_each_with_index)
    end
  end

  def my_map
    if block_given?
      new_array = []
      my_each do |item|
        new_array << yield(item)
      end
      new_array
    else
      to_enum(:my_map)
    end
  end

  def my_count
    count = 0
    if block_given?
      my_each do |item|
        count += 1 if yield(item)
      end
    else
      return length
    end
    count
  end

  def my_any?
    my_each do |item|
      return true if yield(item)
    end
    false
  end

  def my_all?
    all = nil
    my_each do |item|
      yield(item) ? all = true : all = false
    end
    all
  end

  def my_none?
    my_each do |item|
      return false if yield(item)
    end
    true
  end

  def my_select
    if block_given?
      selected = []
      my_each do |item|
        selected << item if yield(item)
      end
      selected
    else
      to_enum(:my_select)
    end
  end

  def my_inject(acc = nil)
    my_each do |item|
      acc = yield(acc, item)
    end
    acc
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    if block_given?
      for item in self
        yield(item)
      end
    else
      to_enum(:my_each)
    end
  end
end
