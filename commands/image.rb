# frozen_string_literal: true

class ChatImage
  def self.handle(msg)
    match_data = msg.text.match />>([0-9]+)/

    if match_data
      ChatImage.send_image(msg, match_data[1])
      SweetieBot.log "image (#{match_data[1]}) from #{msg.sender.username}"
    end
  end

  def self.send_image(msg, id)
    data = Booru.image(id)

    if data
      Image.embed data, message: msg
      return true
    end
  end
end

CommandDispatcher.register name: 'image' do |msg, args|
  msg.reply 'no such image!' unless ChatImage.send_image(msg, args.raw)
end

CommandDispatcher.alias 'i', 'image'
CommandDispatcher.alias 'img', 'image'