class SecretDiary
  attr_accessor :locked

  def initialize(lock = Locker.new)
    @lock = lock
  end

  def lock(self)
    @lock.lock
  end

  def unlock(self)
    @lock.unlock
  end

  def add_entry
    raise "error" if locked? 
  end

  def get_entries
    raise "error" if locked?
  end
end

class Locker

  def unlock
    @diary.locked = false
  end

  def lock
    @diary.locked = true
  end
end
