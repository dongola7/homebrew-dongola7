require 'formula'

class Tclreadline < Formula
  homepage 'http://tclreadline.sourceforge.net'
  url 'http://downloads.sourceforge.net/project/tclreadline/tclreadline/tclreadline-2.1.0/tclreadline-2.1.0.tar.gz'
  sha256 'e4bd772bf567591530c3401a8c5d2107fb87efc5096a7c4411ef31d91f89d557'

  depends_on 'readline'
  depends_on 'autoconf' => :build
  depends_on 'automake' => :build
  depends_on 'libtool' => :build

  def install
    # Need to execute autoreconf as per notes on http://wiki.tcl.tk/5632
    system "autoreconf -fvi"

    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}", "--mandir=#{man}"

    system "make install"

    ohai "The system Tcl installation does not, by default, include #{HOMEBREW_PREFIX}/lib"
    ohai "in the package search path (auto_path variable). Please append"
    ohai "#{HOMEBREW_PREFIX}/lib to the TCLLIBPATH environment variable to ensure"
    ohai "Tcl is able to locate the tclreadline package."
  end
end
