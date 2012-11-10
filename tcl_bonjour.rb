require 'formula'

class TclBonjour < Formula
  homepage 'http://github.com/dongola7/tcl_bonjour'
  url 'https://github.com/dongola7/tcl_bonjour/archive/v1.1.tar.gz'
  version '1.1'
  sha1 '4dae930141c41c8c12422d2338ed38ecbfda8539'

  depends_on 'homebrew/dupes/tcl'

  def install
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}", "--man=#{man}",
                          "--with-tcl=#{HOMEBREW_PREFIX}/lib"
    system "make install"
  end

end
