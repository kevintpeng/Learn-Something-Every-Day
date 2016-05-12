# Minitest
- minitest/test is a lightweight testing framework with assertions
- minitest/spec is a spec engine, that hooks onto minitest/test bridging assertions over to spec expectations (as in Rspec)
- minitest/benchmark asserts algorithm performance 
- minitest/mock is a mock and stub framework

### Synopsis
For testing some class `Meme`, create a class `TestMeme < Minitest::Test` with functions:
```ruby
def setup
    @meme = Meme.new
  end

  def test_that_kitty_can_eat
    assert_equal "OHAI!", @meme.i_can_has_cheezburger?
  end
```

to run, `ruby -Ilib:test test/minitest/test_minitest_test.rb`
