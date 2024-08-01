module Comboboxable
  extend ActiveSupport::Concern

  def to_combobox_display
    name
  end
end