# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array

  def span
    if self.empty?
      return nil
    end
    num = self.max - self.min 
    num
  end

  def average
    if self.empty?
      return nil
    end
    avg = self.sum / (self.length * 1.0)
    avg 
  end

  def median
    return nil if self.empty?

    if self.length.odd? 
      mid_idx = self.length / 2
      return self.sort[mid_idx]
    else
      mid_idx = self.length / 2
      mid = self.sort[mid_idx]
      next_mid = self.sort[mid_idx - 1]
      return (mid + next_mid) / 2.0
    end
  end

  def counts
    hash = Hash.new(0)

    self.each do |ele|
      hash[ele] += 1
    end

    hash
  end


  def my_count(value)
    count = 0

    self.each do |ele|
      if value.include?(ele)
        count += 1
      end
    end

    count 
  end


  def my_index(value)
    self.each_with_index do |ele, i|
      if value.include?(ele)
        return i 
      end
    end

    return nil 
  end


  def my_uniq
    result = []

    self.each do |ele|
      if !result.include?(ele)
        result << ele
      end
    end

    result 
  end


  def my_transpose
    result = []

    self.each_with_index do |ele1, idx1|
      row = []

      self.each_with_index do |ele2, idx2|
        row << self[idx2][idx1]
      end
      result << row
    end

    result 
  end

end
