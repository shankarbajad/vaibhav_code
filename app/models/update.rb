class Update < ActiveRecord::Base
  belongs_to :updateable, :polymorphic => true
end
