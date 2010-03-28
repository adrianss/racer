ActiveRecord::Schema.define(:version => 0) do
  create_table :journals, :force => true do |t|
    t.string :number
    t.string :reference
    t.datetime :date
  end
  create_table :ledger_accounts, :force => true do |t|
    t.string :name
    t.string :description
  end
  create_table :orders, :force => true do |t|
    t.string :comments
  end
end
