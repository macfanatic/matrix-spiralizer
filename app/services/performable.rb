module Performable

  # Would use ActiveSupport::Concern for this, but adhering to no-dependencies requirement
  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def perform(*args); new.perform(*args); end
  end
end
