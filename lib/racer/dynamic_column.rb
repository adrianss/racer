class DynamicColumn
  attr_accessor :title, :value
  attr_writer :behavior
  
  def initialize(column, &block)
    @title = @value = nil
    @behavior = Proc.new { |record| ERB::Util.h(record.send @value) }
    
    case column
    when Array
      @value = column[0]
      @title = column[1] || @value
    when Hash
      @title = column[:title]
      @value = column[:value]
    when Symbol, String
      @title = column
      if block
        @behavior = block
      else
        @value = @title
      end
    end
  end

  def value_for(record)
    @behavior.call record
  end
end
