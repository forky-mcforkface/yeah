# Manages spaces and context.
module Yeah

class Game
  def self.resolution(*value)
    @resolution = value
  end

  def self.space(value)
    @space = value
  end

  def initialize(context = NullContext.new, data = {})
    @context = context
    @data = data

    class_resolution = self.class.instance_variable_get(:@resolution)
    self.resolution = class_resolution || V[640, 360]

    class_space = self.class.instance_variable_get(:@space)
    self.space = class_space || Space.new
  end

  # @return [Context]
  attr_reader :context

  def resolution
    @context.resolution
  end
  def resolution=(*value)
    @context.resolution = V[*value]
  end

  attr_accessor :data

  attr_reader :space
  def space=(value)
    if value.respond_to?(:to_sym)
      space_data = data[:spaces][value]
      value = Space.new(space_data)
    end

    @space = value
    @space.game = self if space.game != self
  end

  # Start the game.
  def start
    context.each_tick do
      update
      render
      break if @stopped
    end
  end

  # Stop the game.
  def stop
    @stopped = true
  end

  protected

  def update
    space.update
  end

  def render
    context.render(space)
  end
end

end
