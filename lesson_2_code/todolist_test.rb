require 'minitest/autorun'
require 'minitest/reporters'
require 'simplecov'
SimpleCov.start
Minitest::Reporters.use!

require_relative 'todolist'

class TodolistTest < Minitest::Test 
  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  #assert that our created list is the same added list
  def test_to_a 
    assert_equal(@todos, @list.to_a)
  end

  def test_size
    assert_equal(3, @list.size)
  end

  def test_first
    assert_equal(@todo1, @list.first)
  end

  def test_last
    assert_equal(@todo3, @list.last)
  end

  def test_shift
    todo = @list.shift
    assert_equal(@todo1, todo)
    assert_equal([@todo2, @todo3], @list.to_a)
  end

  # set variable to last item in list
  # assert that last todo item is same as last one taken off
  # assert that remaining collection is same as current list converted to array
  def test_pop
    todo = @list.pop
    assert_equal(@todo3, todo)
    assert_equal([@todo1, @todo2], @list.to_a)
  end

  # return true if all items in list are done, false otherwise.
  # assert that the list is not completed
  def test_done_question
    assert_equal(false, @list.done?)
    #@list.to_a.each do |task|
    #  assert(task.done?)
    #end 
  end

  # verify that TypeError is raised when adding item into the list that is not
  # a Todo item.
  # Add string value and integer value to list.
  def test_add_raise_error
    assert_raises(TypeError) { @list.add("buy milk") }
    assert_raises(TypeError) {@list.add(3) }
  end

  # verify that `<<` method (shovel method) actually adds a `Todo` to `Todolist`
  # shovel task into list
  # shovel task into todo list
  # assert that collection includes shoveled element
  # assert that todos elements is same as list elements
  def test_shovel_works_properly
    todo4 = Todo.new("Buy chocolate")
    @list << todo4
    @todos << todo4

    assert_includes(@list.to_a, todo4)
    assert_equal(@todos, @list.to_a)
  end

  # verify that `add` and its alias `<<` do the same 
  # shovel new task to todos and add new task to list
  # assert that todos is same as list.
  def test_add_shovel_same
    todo4 = Todo.new("Buy Chocolate")
    @todos << todo4
    @list.add(todo4)

    assert_equal(@todos, @list.to_a)
  end

  # raise IndexError if we specify index with no element
  # verify that calling `item_at` will raise IndexError if argument an index
  # outside the list
  # verify that the first element of list is the same at the element returned
  # when we call `item_at` with 0 index passed in.
  def test_item_at
    assert_raises(IndexError) { @list.item_at(4) }
    assert_equal(@todo1, @list.item_at(0))
    assert_equal(@todo2, @list.item_at(1))
  end

  # raise IndexError if we specify an index that is not marked as done.
  # assert IndexError pass in block that marks task done at index out of bounds
# assert equality between tasking being done and boolean
  def test_mark_done_at
    assert_raises(IndexError) { @list.mark_done_at(5) }

    @list.mark_done_at(1)
    assert_equal(false, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(false, @todo3.done?)
  end

  # raise IndexError if we specify an index that is marked done
  # mark first todo item done.  then mark list item as undone.
  # assert that todo item done is false since it was undone
  # assert other todo items done is true
  def test_mark_undone_at
    assert_raises(IndexError) { @list.mark_undone_at(5) }

    @todo1.done! 
    @todo2.done!
    @todo3.done!

    @list.mark_undone_at(0)
    assert_equal(false, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(true, @todo3.done?)
  end

  # verify that all Todo items in list are done.
  # mark list as done
  # assert that each item done is same as true
  # assert that list done is true
  def test_done
    @list.done! 

    assert_equal(true, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(true, @todo3.done?)
    assert_equal(true, @list.done?)
  end

  # raise IndexError if argument passed does not return item
  # remove item at index 1 position from list
  # assert as equal todo # 3 is same as item now at index 1 position
  # assert as equal an array of items without removed item as same as
  # current list converted to array.
  def test_remove_at
    assert_raises(IndexError) { @list.remove_at(4) }

    @list.remove_at(1)
    assert_equal(@todo3, @list.item_at(1))
    assert_equal([@todo1, @todo3], @list.to_a)
  end

  #heredoc gives us ability to take off preceding spaces and trailing newlines.
  # remove trailing newlin character(\n) and spaces at beginning of new line. 
  def test_to_s
    output = <<-OUTPUT.chomp.gsub /^\s+/, ""
    ---- Today's Todos ----
    [ ] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT
  
    assert_equal(output, @list.to_s)
  end

  def test_to_s_done
    output = <<-OUTPUT.chomp.gsub /^\s+/, ""
    ---- Today's Todos ----
    [X] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT

    @list.mark_done_at(0)
    assert_equal(output, @list.to_s)
  end

  def test_to_s_all_done
    output = <<-OUTPUT.chomp.gsub /^\s+/, ""
    ---- Today's Todos ----
    [X] Buy milk
    [X] Clean room
    [X] Go to gym
    OUTPUT

    #@list.done!
    @list.mark_all_done
    assert_equal(output, @list.to_s)
  end

  # verify that each iterates through list
  def test_each
    result = []
    @list.each { |todo| result << todo }
    assert_equal([@todo1, @todo2, @todo3], result)
  end

  # verify that each returns original object.
  def test_each_origin_obj
    result = @list.each {|task| nil }
    assert_equal(@list, result)
  end

  #verify that select creates new collection with items
  # select items from list that are done
  # compare the selection list against a newly created list with that item also included
  # compare the printed versions
  def test_select
    new_list = TodoList.new(@list.title)
    new_list.add(@todo1)
    @todo1.done!
    first_list = @list.select { |task| task.done? }
    
    assert_equal(new_list.title, @list.title)
    assert_equal(new_list.to_s, first_list.to_s)
  end

end