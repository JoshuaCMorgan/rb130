# Minitest Questions

#### What is Minitest?

  - Minitest is the default testing library that comes with Ruby.
  - It uses a more straight forward syntax.

#### Define these key terms: Test Suite, Test, Assertion

ANSWER:

  - **Test Suite:**  This is the entire set of tests that accompanies your program or application.  Its all the tests for a project.

  - **Test:**  This describes a situation or context in which tests are run. A test can have multiple assertions.

  -**Assertion:**  This is the actual verification step to confirm that the data returned by your program or application is indeed what is expected.  You make one or more assertions within a test.

#### Using this code below, lets create a test file. What is our first step? Show code.

```ruby
class Car
  attr_accessor :wheels

  def initialize
    @wheels = 4
  end
end
```

ANSWER:

  - Our first step is to load all necessary files from `minitest` gem.  
  - Then we require the file that we are testing, `car.rb`, which contains `Car` class.  
    - We will use `require_relative` to specify the file name from the directory of the file we are in currently. 
    - The, we make a reference to the `Car` class.
  - We can do that like this:
  ```ruby
  require 'minitest/autorun`

  require_relative 'car'
  ```

#### What does `require 'minitest/autorun'` do?

ANSWER:

- This loads all necessary files from the `minitest` gem. 


#### What does `require_relative 'car'` do?

ANSWER:
- To test, we require the file that we are testing.  
- This syntax specifies the file name Ruby needs, from the current file's directory.
- When we make references to the `Car` class, Ruby will know where to look for it. 


#### Create a test class.  Identify important element and explain its relevance.

ANSWER:

```ruby
require 'minitest/autorun'

require_relative 'car'

class CarTest < Minitest::Test
  # code necessary for test
end
```
- We created a class where we house our tests.
- Its necessary that this class subclass `Minitest::Test`.
  - This will allow our test class to inherit all the necessary methods for writing tests.


#### Why is it necessary for your test class to subclass `MiniTest::Test`?

ANSWER:

- Doing so allows our test class to inherit all the necessay methods for writing tests.


#### What is the starting point necessary condition for writing tests within a test class? How does this help Minitest? Add this code to the previous, below. 

ANSWER:

- Within a test class, you write tests by creating an instance method that starts with `test_`.
- Through this naming convention, Minitest will known that these methods are individual tests that need to be run.

```ruby
require 'minitest/autorun'

require_relative 'car'

class CarTest < MiniTest::Test
  def test_wheels
    # assertion here
  end
end
```

#### After creating an instance method that starts with `test_`, what is the next step? Just identify the two parts.

ANSWER:

- We first need to set up the appropriate data or objects to make assertions against. 
- Then we will need to make some assertions.
  - these assertions are what we are trying to verify.


#### Continue with the code above, verify that newly created `Car` objects indeed have four wheels.

ANSWER:

```ruby
require 'minitest/autorun'

require_relative 'car'

class CarTest < MiniTest::Test
  def test_wheels
    car = Car.new
    assert_equal(4, car.wheels)
  end
end
```

#### What does the method `assert_equal` in the code above do?

ANSWER:

- it checks the expected value against the actual value
- It takes two parameters
  - The first is the expected value.
  - the second is the test or actual value.
- If there is a discrepancy, `assert_equal` will save the error and Minitest will report that error to you at the end of the test run.

#### If we want to colorize our Minitest output, what can we do? Show code.

ANSWER:

- We can use `minitest-reporters` gem. Like so:
```ruby
require 'minitest/reporters'
MiniTest::Test.reporters.use!
```

#### You will most likely have multiple tests.  But you may not want to run all of them.  What can you do for this? Show with code used above.

ANSWER:

- Minitest allows you to skip certain tests.
- You can skip a test via the `skip` keyword.
```ruby
  require 'minitest/autorun'
  require 'minitest-reporters'

  MiniTest::Reporters.use!

  class CarTest< MiniTest::Test
    def test_wheels
      skip
      car = Car.new
      assert_equal(4, car.wheels)
    end
  end
```

#### Minitest comes in two syntax.  We have looked at assertion style syntax.  What is the other? Explain its structure. Use the code above to show its syntax.

ANSWER:

-  Minitest comes in two syntax flavors: assertion style and expectation style. 
- Expectation style tests are grouped into `describe` blocks.
- Individual tests are written with the `it` method. 
- Instead of assertions, *expectation matchers* are used.

```ruby
require 'minitest/autorun'
require 'minitest-reporter'
MiniTest::Reporter.use!

require_relative 'car'

describe 'Car#wheels` do
  it 'has 4 wheels` do
    car = Car.new
    car.wheels.must_equal 4
  end
end
```

### Overview

**Using IDE or any other material, use this code to explain the foundational aspect of testing with Minitest.**

```ruby
class Car
  attr_accessor :wheels

  def initialize
    @wheels = 4
  end
end
```

- Minitest is an intuitive test library that comes with Ruby.
- Create/setup a test file for code to be tested.
- Create a test class by subclassing MiniTest::Test.
- Create a test by creating an instance method that starts with test_.
-  Create assertions with assert_equal, and pass it the expected value and the actual value.
- Colorize Minitest output with minitest-reporters
- skip tests with skip.
- Minitest comes in two syntax flavors: assertion style and expectation style. The latter is to appease RSpec users, but the former is far more intuitive for beginning Ruby developers.

# Assertion Q&A

**We will use this code for the questions below:**
```ruby
class Car
  attr_accessor :wheels, :name

  def initialize
    @wheels = 4
  end
end
```

#### Make an assertion that car objects exist.  Explain your code.

```ruby
def test_car_exists
  car = Car.new
  assert(car)
end
```

- `assert(test)` will fail unless `test` is truthy.

#### Make an assertion that car object does not have a name. Explain code.

```ruby
def test_name_is_nil
  assert_nil(car.name)
end
```

- `assert_nil(obj)` fails unless object is `nil`. 
- instance variables are initially set to `nil`.

#### Make an assertion that an argument error is raised.  Argument is not passed in at initialization of object. (name set to Joey)

```ruby
def test_raise_initialize_with_arg
  assert_raise(ArgumentError) do
    car = Car.new(name: "Joey")
  end
end
```

- This code raises ArgumentError, so this assertion passes
- `assert_raises(*exp) {...}` will fail unless block raises one of  `*exp`.

#### Make an assertion that an object must be an object of a specific class. Explain.

```ruby
def test_instance_of_car
  car = Car.new
  assert_instance_(Car, car)
end
```
- This test is more useful when dealing with inheritance. This example is a little contrived.
- `assert_instance_of(cls, obj)` will fail unless `obj` is an instance of `cls`.

#### make an assertion that an object is part of a collection.  That `car` is part of array collection.
```ruby
def test_includes_car
  car = Car.new
  arr = [1, 2, 3]
  arr << car

  assert_include(arr, car)
end
```
- `assert_include(collection, obj)`
- `assert_include` calls `assert_equal` in its implementation, as a seperate assertion. 
- For each `assert_includes` call, you will get 2 assertions, not 1. 
- `assert_include` will fail unless `collection` includes `obj`.

#### Beside making assertions, you can make refutations.  What are refutations. Give main characteristic.

- Refutations are the opposite of assertions. 
  - They *refute* rather than *assert*
- Every assertion has a corresponding refultation. 
  - `assert`'s opposite is `refute`
- `refute` passes if the object you pass to it is falsey.


# SEAT Approach

#### Identify and briefly describe the 4 steps to writing a test

ANSWER:
- S: setup the necessary objects.
- E: Execute the code against the object we're testing.
- A: Assert the results of the execution.
- T: Tear down and clean up any lingering artifacts.

#### Using the code below, set up the necessary object and change any necessary code.

```ruby
require 'minitest/autorun'

require_relative 'car'

class CarTest < MiniTest::Test
  def test_car_exists
    car = Car.new
    assert(car)
  end
end
```

ANSWER:
```ruby
require 'minitest/autorun'

require_relative 'car'

class CarTest < MiniTest::Test
  def setup
    @car = Car.new
  end

  def test_car_exists
    assert(@car)
  end
end
```

# Testing Equality

#### What we use `assert_equal`, what are we actually testing for? How do you know?

ANSWER:
- `assert_equal` uses `==` to test for equality.
- This means we are testing for *value equality*

#### If we want to test for object equality instead of value equality, what method should we use?

ANSWER:

- We should use `assert_same` assertion.

#### Because the Ruby core library classes all implement sensible `==` to test for value equality, we can get away with using `assert_equal` on strings, arrays, hashes, etc. But what happens if we try to use `assert_equal` on our own custom classes?

ANSWER:
- we have to tell Minitest how to compare those objects by implementing our own `==` method. 

#### What will happen with our our assertion in the code below?

```ruby
class Car
  attr_accessor :wheels, :name

  def initialize
    @wheels = 4
  end
end

class CarTest < MiniTest::Test
  def test_value_equality
    car1 = Car.new
    car2 = Car.new

    car1.name = "Kim"
    car2.name = "Kim"

    assert_equal(car1, car2)
  end
end
```

ANSWER:

- We are comparing two object ids rather than two values. Minitest doesn't know how to assert value equality here.

##### Using this code below, create an instance method that will allow us to assert value equality.

```ruby
class Car
  attr_accessor :wheels, :name

  def initialize
    @wheels = 4
  end
end
```

ANSWER:

```ruby
def ==(other)
  other.is_a?(Car)  && name == other.name
end
```
- The first method call `is_a?` protects from the method returning `nil`