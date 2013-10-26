require 'formula'

class Tcllib < Formula
  homepage 'http://tcllib.sourceforge.net'
  url 'http://sourceforge.net/projects/tcllib/files/tcllib/1.14/tcllib-1.14.tar.gz'
  sha1 '8c3612099eaf11c767f3908a97fcd299d42ee21f'

  def install
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}", "--man=#{man}"

    system "make install"

    ohai "The system Tcl installation does not, by default, include #{HOMEBREW_PREFIX}/lib"
    ohai "in the package search path (auto_path variable). Please append"
    ohai "#{HOMEBREW_PREFIX}/lib to the TCLLIBPATH environment variable to ensure"
    ohai "Tcl is able to locate the tcllib packages."
  end

end
