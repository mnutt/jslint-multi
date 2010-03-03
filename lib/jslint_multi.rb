class JSLintMulti
  VERSION = "0.1.1"

  def self.root
    File.expand_path(File.join(File.dirname(__FILE__), '..'))
  end

  def self.jar_path
    File.join(self.root, "vendor", "rhino1_7R2-RC1.jar")
  end

  def self.jslint_path
    File.join(self.root, "vendor", "jslint-1.0-multi.js")
  end

  def self.command(args)
    "java -jar #{jar_path} #{jslint_path} #{args.join(' ')}"
  end

  def self.run(args)
    exec(self.command(args))
  end
end
