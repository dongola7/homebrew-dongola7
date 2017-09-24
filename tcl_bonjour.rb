require 'formula'

class TclBonjour < Formula
  homepage 'https://github.com/dongola7/tcl_bonjour'
  url 'https://github.com/dongola7/tcl_bonjour/archive/v1.1.tar.gz'
  sha256 'fd8aa3841919c71855ee0d0b438d2cd1da6c92a9c2e816fec3c447fbc5007625'

  def install
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}", "--exec-prefix=#{prefix}",
                          "--man=#{man}"
    system "make install"

    ohai "The system Tcl installation does not, by default, include #{HOMEBREW_PREFIX}/lib"
    ohai "in the package search path (auto_path variable). Please append"
    ohai "#{HOMEBREW_PREFIX}/lib to the TCLLIBPATH environment variable to ensure"
    ohai "Tcl is able to locate the tcl_bonjour package."
  end

end
