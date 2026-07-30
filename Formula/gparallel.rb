class Gparallel < Formula
  desc "GNU Parallel installed as gparallel (g-prefixed to coexist with moreutils)"
  homepage "https://savannah.gnu.org/projects/parallel/"
  url "https://ftpmirror.gnu.org/gnu/parallel/parallel-20260722.tar.bz2"
  mirror "https://ftp.gnu.org/gnu/parallel/parallel-20260722.tar.bz2"
  sha256 "afe4b572a4334aac3a002a080ad618249f00b84d7659d03e77412727d18f1ad6"
  license "GPL-3.0-or-later"
  version_scheme 1
  head "https://git.savannah.gnu.org/git/parallel.git", branch: "master"

  livecheck do
    url :homepage
    regex(/GNU Parallel v?(\d{6,8}).*? released/i)
  end

  def install
    ENV.append_path "PATH", bin

    system "./configure", "--prefix=#{prefix}"
    system "make", "install"

    # Rename binaries to g-prefixed versions (like coreutils gls, gsed, etc.)
    bin.find.each do |f|
      next unless f.file? && f.executable?
      new_name = "g#{f.basename}"
      f.rename(f.dirname/new_name) unless f.basename.to_s.start_with?("g")
    end

    # Rename man pages to match
    man1.find.each do |f|
      next unless f.file? && f.extname == ".1"
      stem = f.basename(".1").to_s
      f.rename(f.dirname/"g#{stem}.1") unless stem.start_with?("g")
    end

    bash_completion.install share/"bash-completion/completions/parallel" => "gparallel"
  end

  def caveats
    <<~EOS
      GNU Parallel is installed as "gparallel" to avoid conflict with moreutils.

      If you need the original names, add a "gnubin" directory to your PATH:
        PATH="#{opt_libexec}/gnubin:$PATH"

      To use the --csv option, the Perl Text::CSV module has to be installed:
        perl -MCPAN -e'install Text::CSV'
    EOS
  end

  test do
    assert_equal "test\ntest\n",
                 shell_output("#{bin}/gparallel --will-cite echo ::: test test")
  end
end
