=begin
Below we have a listening device. It lets us record something that is said and 
store it for later use. In general, this is how the device should be used:

Listen for something, and if anything is said, record it for later use. If 
nothing is said, then do not record anything.

class Device
  def initialize
    @recordings = []
  end

  def record(recording)
    @recordings << recording
  end
end

Anything that is said is retrieved by this listening device via a block. If 
nothing is said, then no block will be passed in. The listening device can 
also output the most recent recording using a Device#play method.

listener = Device.new
listener.listen { "Hello World!" }
listener.listen
listener.play # Outputs "Hello World!"

Finish the above program so that the specifications listed above are met.
=end

class Device
  def initialize
    @recordings = []
  end

  def record(recording)
    @recordings << recording
  end

  # if something is said, record it. Otherwise, do nothing.
  def listen
    return unless block_given? 
    recording = yield
    record(recording)
  end

  # output the most recent recording, othewise output nothing.
  def play
    puts @recordings.last
  end
end

listener = Device.new
listener.listen { "Hello World!" }
listener.listen
listener.play # Outputs "Hello World!"