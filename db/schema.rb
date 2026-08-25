# frozen_string_literal: true

require "active_record/railtie"
ActiveRecord::Base.establish_connection(adapter: "sqlite3", database: ":memory:")
ActiveRecord::Schema.define do
  # Component specs do not require persisted models.
end
