require 'formula'

# adapted from https://github.com/paulp/homebrew-extras/blob/8184f9a962ce0758f4cf7a07b702bc1c3d16dfaa/coursier.rb

class Coursier < Formula
  desc "Coursier launcher."
  homepage "https://get-coursier.io"
  version "1.1.0-M10"
  url "https://github.com/coursier/coursier/releases/download/v1.1.0-M10/coursier"
  sha256 "2fff1bbad7135812c0e3e68f3c5ba842fbdcd9ce"
  bottle :unneeded

  depends_on :java => "1.8+"

  def install
    bin.install 'coursier'
    
    zsh_completion.install "scripts/_coursier"
  end

  test do
    ENV["COURSIER_CACHE"] = "#{testpath}/cache"
    output = shell_output("#{bin}/coursier launch io.get-coursier:echo:1.0.2 -- foo")
    assert_equal ["foo\n"], output.lines
  end
end
