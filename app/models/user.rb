# created a user class 

class User < ActiveRecord::Base
    has_many :tasks
    
end