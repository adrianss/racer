require 'racer/dynamic_column.rb'
require 'racer/dynamic_table.rb'
require 'racer/dynamic_table_helper.rb'

ActionView::Base.send(:include, DynamicTableHelper)
