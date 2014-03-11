Friday's airplanes app
=====================

# BORIS AIRPLANES !!!
almost didn't see it

tests are poluted with puts messages, okay for debugging but do not commit them.

The plane is flying when it's created?!

```

if plane.status == 'flying' && weather.now == 'sunny' #&& @planes.lenght < @capacity
  @planes << plane
  plane.land
end

```

What if the plane doesn't land? How about.

```

if plane.status == 'flying' && weather.now == 'sunny' #&& @planes.lenght < @capacity
  plane.land
  @plane << plane
end

```

Have a think about moving the weather colaborator to initialize.

In weather.rb you don't need initialize as it isn't doing anything. It can be removed.

Passing round a true of false to indicate that something has happend or is an error is bad practice. If you tell the airport you need to check the return value to see if it has happend.

```
def land(plane, weather=Weather.new)
  return false if full?
  ...
end
```
Then when we use it we need to do something like
```
if airport.land(plane)
  #do more things
end
```
If we raise an exception instead
```
def land(plane, weather=Weather.new)
raise "Airport full" if full?
  ...
end
```
Then when we use it we don't need to check for an exception, we can let it throw an exception and now worry about.
```
airport.land(plane)
#do more things

```

Think about it another way, that magic true false status gets passed around in classes that shouldn't care about it.

#PASS
