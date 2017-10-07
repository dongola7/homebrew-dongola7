require 'formula'

class Tclreadline < Formula
  homepage 'http://tclreadline.sourceforge.net'
  url 'http://downloads.sourceforge.net/project/tclreadline/tclreadline/tclreadline-2.1.0/tclreadline-2.1.0.tar.gz'
  sha256 'def2325e45e2b7f30b04ad5078481740596599622c253043c503c2285f5672e7'

  depends_on 'readline'
  depends_on 'autoconf' => :build
  depends_on 'automake' => :build
  depends_on 'libtool' => :build

  def install
    # Need to execute autoreconf as per notes on http://wiki.tcl.tk/5632
    system "autoreconf -fvi"
    system "egrep -v '#define (FREE|MALLOC)' tclreadline.c | sed 's/MALLOC/malloc/; s/FREE/free/' > tclreadline.c.new"
    system "mv -f tclreadline.c.new tclreadline.c"

    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}", "--mandir=#{man}"

    system "make install"

    ohai "The system Tcl installation does not, by default, include #{HOMEBREW_PREFIX}/lib"
    ohai "in the package search path (auto_path variable). Please append"
    ohai "#{HOMEBREW_PREFIX}/lib to the TCLLIBPATH environment variable to ensure"
    ohai "Tcl is able to locate the tclreadline package."
  end
end
