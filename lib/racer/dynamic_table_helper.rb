module DynamicTableHelper
  def dynamic_table(*args, &block)
    DynamicTable.new(*args, &block)
  end

  def dynamic_column(*args, &block)
    DynamicColumn.new(*args, &block)
  end
end
