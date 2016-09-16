class Stack

  def initialize
    @stack = []
  end

  def add(el)
    @stack.push(el)
  end

  def remove
    @stack.pop
  end

  def show
    p @stack
  end
end

Polkovodets_Rumyantsev = Stack.new
Polkovodets_Rumyantsev.add('Rokossovsky')
Polkovodets_Rumyantsev.show
Polkovodets_Rumyantsev.add('Vatutin')
Polkovodets_Rumyantsev.show
Polkovodets_Rumyantsev.add('Kozhedub')
Polkovodets_Rumyantsev.show
Polkovodets_Rumyantsev.remove
Polkovodets_Rumyantsev.show
Polkovodets_Rumyantsev.remove
Polkovodets_Rumyantsev.show
Polkovodets_Rumyantsev.remove
Polkovodets_Rumyantsev.show
puts '-----End of stack test-----'


puts '-----Queue test starts-----'

class Queue

  def initialize
    @queue = []
  end

  def enqueue(el)
    @queue.unshift(el)
  end

  def dequeue
    @queue.pop
  end

  def show
    p @queue
  end
end

Iskra = Queue.new
Iskra.enqueue('Rokossovsky')
Iskra.show
Iskra.enqueue('Vatutin')
Iskra.show
Iskra.enqueue('Kozhedub')
Iskra.show
Iskra.dequeue
Iskra.show
Iskra.dequeue
Iskra.show
Iskra.dequeue
Iskra.show
puts '-----End of stack test-----'

puts '------Map test starts------'

class Map

  def initialize
    @map = []
  end

  def assign(key, value)
    if lookup(key).nil?
      @map.push([key, value])
    else
      @map.each do |resident|
        if resident[0] == key
          resident[1] = value
          break
        end
      end
    end
  end

  def lookup(key)
    @map.each do |resident|
      if resident[0] == key
        return resident[1]
      end
    end
    nil
  end

  def remove(key)
    @map.each do |resident|
      if resident_key == key
        @map.delete(resident)
      end
    end
  end

  def show
    p @map
  end
end

Sovetsky_Soyuz = Map.new
Sovetsky_Soyuz.assign('Russian','SFSR')
Sovetsky_Soyuz.show
p "look up Russian => #{Sovetsky_Soyuz.lookup("Russian")}"
Sovetsky_Soyuz.assign('Ukrainian', 'UkSSR')
Sovetsky_Soyuz.show
p "look up Ukrainian => #{Sovetsky_Soyuz.lookup("Ukrainian")}"
Sovetsky_Soyuz.assign('Byelorussian', 'BSSR')
Sovetsky_Soyuz.show
p "look up Byelorussian => #{Sovetsky_Soyuz.lookup("Ukrainian")}"
p "look up USA : #{Sovetsky_Soyuz.lookup("USA")}"
puts "1991, Russian SFSR becomes Russian Federation (RF)"
Sovetsky_Soyuz.assign('Russian', 'RF')
Sovetsky_Soyuz.show
p "look up Russian => #{Sovetsky_Soyuz.lookup("Russian")}"




puts '-----End of Map test-----'
