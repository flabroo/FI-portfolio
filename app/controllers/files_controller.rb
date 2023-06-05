class FilesController < ApplicationController
  def fairul_izwan_cv
    send_file(
      "#{Rails.root}/public/docs/Fairul-CV.pdf",
      filename: 'Fairul-CV.pdf',
      type: 'application/pdf',
      disposition: 'inline'
    )
  end
end
