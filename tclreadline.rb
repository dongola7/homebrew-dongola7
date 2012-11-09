require 'formula'

class Tclreadline < Formula
  homepage 'http://tclreadline.sourceforge.net'
  url 'http://downloads.sourceforge.net/project/tclreadline/tclreadline/tclreadline-2.1.0/tclreadline-2.1.0.tar.gz'
  version '2.1.0'
  sha1 '3b44f92ce1921ebccebab9b44d7cda6992cf8923'

  depends_on 'readline'
  depends_on 'autoconf'
  depends_on 'automake'
  depends_on 'libtool'
  depends_on 'homebrew/dupes/tcl'

  def install
    # Need to execute autoreconf as per notes on http://wiki.tcl.tk/5632
    system "autoreconf -fvi"

    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}", "--mandir=#{man}"

    system "make install"
  end

end
