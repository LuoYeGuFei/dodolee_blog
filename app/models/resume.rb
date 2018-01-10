class Resume < ApplicationRecord

  belongs_to :user

  def generate_pdf(content)
    Prawn::Document.generate("test.pdf") do
      file = "#{Prawn::DATADIR}/fonts/gkai00mp.ttf"
      font_families["Kai"] = {
        :normal => { :file => file, :font => "Kai" }
      }
      text content, :fallback_fonts => ["Times-Roman", "Kai"]
    end
  end
end
