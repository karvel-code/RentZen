module ApplicationHelper
  include Pagy::Frontend
  # def tailwind_classes_for(flash_type)
  #   {
  #     notice: "bg-green-400 border-l-4 border-green-700 text-white",
  #     error:   "bg-red-400 border-l-4 border-red-700 text-black",
  #   }.stringify_keys[flash_type.to_s] || flash_type.to_s
  # end

  def render_flash_stream
    turbo_stream.replace "flash", partial: "shared/alerts/flash"
  end
end
