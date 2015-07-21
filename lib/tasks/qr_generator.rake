require 'rqrcode'

namespace :qr do
  desc "task to create 10 alchups QR codes"
  task :generate => :environment do
    (1..10).each do |index|
      qrcode = RQRCode::QRCode.new("http://alchups.com/qr/#{index}")
      image = qrcode.as_png
      f = File.new("qrs/#{index}.png", "w")
      f.write(image)
      f.close
    end
  end
end