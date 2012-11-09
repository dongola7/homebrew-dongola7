require 'formula'

class Tcllib < Formula
  homepage 'http://tcllib.sourceforge.net'
  url 'http://sourceforge.net/projects/tcllib/files/tcllib/1.14/tcllib-1.14.tar.gz'
  version '1.14'
  sha1 '8c3612099eaf11c767f3908a97fcd299d42ee21f'

  depends_on 'homebrew/dupes/tcl'

  def install
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}", "--man=#{man}"

    system "make install"
  end

end
