class Spawn < Formula
  desc "A small command-line tool to quickly tryout a Swift Package Manager package locally."
  homepage "https://github.com/vinhnx/spawn"
  url "https://github.com/vinhnx/spawn.git",
      :tag => "0.1.0", :revision => "baaa73aaa5a9aa3a2d6300d1147345dd0ca9e310"
  head "https://github.com/vinhnx/spawn.git"
  depends_on :xcode => ["10.2", :build]

  def install
    if MacOS::Xcode.version >= "9.0"
      system "swift", "package", "--disable-sandbox", "update"
      system "swift", "build", "-c", "release", "--disable-sandbox"
    else
      ENV.delete("CC") # https://bugs.swift.org/browse/SR-3151
      system "swift", "package", "update"
      system "swift", "build", "-c", "release", "-Xswiftc", "-static-stdlib"
    end

    system "make", "install_bin", "PREFIX=#{prefix}"
  end

  test do
    system "#{bin}/spawn" "import Foundation\n"
  end
end