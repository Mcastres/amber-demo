require "granite_orm/adapter/mysql"

class Language < Granite::ORM::Base
  adapter mysql


  # id : Int64 primary key is created for you
  field name : String
  field content : String
  timestamps
end
