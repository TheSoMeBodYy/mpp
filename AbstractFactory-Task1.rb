class AbstractFactory
  # @abstract
  def create_small_dog
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

  # @abstract
  def create_big_dog
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end

class ConcreteFactory1 < AbstractFactory
  def create_small_dog
    ConcreteSmall1.new
  end

  def create_big_dog
    ConcreteBig1.new
  end
end

class ConcreteFactory2 < AbstractFactory
  def create_small_dog
    ConcreteSmall2.new
  end

  def create_big_dog
    ConcreteBig2.new
  end
end

class AbstractSmall
  # @abstract
  # @return [String]
  def res_func
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end

class ConcreteSmall1 < AbstractSmall
  def res_func
    'the result of the small t1.'
  end
end

class ConcreteSmall2 < AbstractSmall
  def res_func
    'the result of the small t2.'
  end
end

class AbstractBig
  def res_func_big
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

  def another_res_func(_collaborator)
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end

class ConcreteBig1 < AbstractBig
  # @return [String]
  def res_func_big
    'The result of the big t1.'
  end

  def another_res_func(collaborator)
    result = collaborator.res_func
    "The result of the big t1 collaborating with the #{result}"
  end
end

class ConcreteBig2 < AbstractBig
  # @return [String]
  def res_func_big
    'The result of the big t2.'
  end

  def another_res_func(collaborator)
    result = collaborator.res_func
    "The result of the big t2 collaborating with the #{result}"
  end
end

def client_code(factory)
  small_dog = factory.create_small_dog
  big_dog = factory.create_big_dog

  puts big_dog.res_func_big.to_s
  puts big_dog.another_res_func(small_dog).to_s
end

puts 'Client: Testing client code with the first factory type:'
client_code(ConcreteFactory1.new)

puts "\n"

puts 'Client: Testing the same client code with the second factory type:'
client_code(ConcreteFactory2.new)

