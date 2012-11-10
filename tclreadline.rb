require 'formula'

class Tclreadline < Formula
  homepage 'http://tclreadline.sourceforge.net'
  url 'http://downloads.sourceforge.net/project/tclreadline/tclreadline/tclreadline-2.1.0/tclreadline-2.1.0.tar.gz'
  sha1 '3b44f92ce1921ebccebab9b44d7cda6992cf8923'

  depends_on 'readline'
  depends_on 'homebrew/dupes/tcl'
  depends_on 'autoconf' => :build
  depends_on 'automake' => :build
  depends_on 'libtool' => :build

  def install
    # Need to execute autoreconf as per notes on http://wiki.tcl.tk/5632
    system "autoreconf -fvi"

    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}", "--mandir=#{man}",
                          "--with-tcl=#{HOMEBREW_PREFIX}/lib"

    system "make install"
  end

end
