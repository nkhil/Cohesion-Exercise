# Understanding cohesion, dependency injection, encapsulation more deeply

This was a Makers academy exercise in understanding best practices for cohesion, dependency injection, encapsulation better. 

## Learnings

### Dependency injection

**Best Practice**

```
class SecretDiary
  def initialize(lock = Locker.new) #Where Locker is a dependency
    @lock = lock
  end
end
```

instead of...

```ruby
class SecretDiary
  def initialize
    @lock = lock = Locker.new #Where Locker is a dependency
  end
end
```
