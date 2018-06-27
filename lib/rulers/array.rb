class Array
  def hello(start = 0)
    inject(start, &:+)
  end
end
