class DynamicTable
  attr_accessor :columns
  
  def initialize(collection, columns = [])
    @columns = []
    columns.each do |column|
      @columns << DynamicColumn.new(column)
    end
    @collection = collection
  end

  def titles
    @columns.map { |column| column.title }
  end

  def records
    @collection.map do |record|
      @columns.map { |field| field.value_for(record) } 
    end
  end
end
