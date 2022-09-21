class Payload < ApplicationRecord
  def self.generate(params)
    cmd = self.build_cmd(params)
    fname = SecureRandom.hex(8)
    path = Rails.root.join("tmp", "storage", "#{fname}")
    cmd = cmd + " -o #{path}"
    res = system(cmd)
    p "code: #{res}"
    if res
      return [path, fname]
    else
      return false
    end
  end
  def self.build_cmd(params)
    cmd = ["msfvenom"]
    options = {
      "arch" => "-a ",
      "payload" => "-p ",
      "lhost" => "LHOST=",
      "lport" => "LPORT=",
      "format" => "-f ",
      "encoder" => "-e ",
      "encrypt" => "--encrypt ",
      "encrypt_key" => "--encrypt-key ",
      "encrypt_iv" => "--encrypt-iv",
      "iterations" => "-i ",
      "nopsled" => "--nopsled ",
      "pad_nops" => "--pad-nops ",
      "platform" => "--platform ",
      "sec_name" => "--sec-name ",
      "service_name" => "--service-name ",
      "smallest" => "--smallest ",
      "a" => "-a ",
      "e" => "-e ",
      "b" => "-b ",
      "f" => "-f ",
      "i" => "-i ",
      "n" => "-n ",
      "p" => "-p ",
      "s" => "-s ",
      "v" => "-v "
    }
    any_true = [
      "smallest",
      "pad_nops"
    ]
    params.keys.each do |k|
      #basic cmd sanitize
      val = params[k].to_s.gsub(/[^\w\/\.]/, '')
      k = k.to_s.gsub(/[^\w\/]/, '')
      next if options[k].nil?
      if any_true[k] != nil
        cmd << options[k]
      else
        cmd << "#{options[k]}#{val}"
      end
    end
    p cmd.join(" ")
    return cmd.join(" ")
  end
end
