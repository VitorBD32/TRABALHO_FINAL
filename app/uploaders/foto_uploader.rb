class FotoUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :file # ou :fog para armazenamento em nuvem

  process resize_to_fit: [400, 400]  # Redimensiona a imagem ao fazer upload

  # Diretório onde os arquivos serão armazenados
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Permite apenas imagens nos formatos .jpg, .jpeg, .png, .gif
  def extension_whitelist
    %w[jpg jpeg gif png]
  end

  # Personaliza o nome do arquivo de imagem
  def filename
    if original_filename.present?
      "#{mounted_as}.#{file.extension}"
   end
  end
end