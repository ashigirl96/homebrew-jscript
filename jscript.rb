# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Jscript < Formula
  desc "Show scripts from package.json 'scripts' | Run script"
  homepage "https://github.com/ashigirl96/jscript"
  url "https://github.com/ashigirl96/jscript/archive/refs/tags/0.0.1.tar.gz"
  sha256 "75f3d548cd8e1547a74e59f4b3b68810b88c2ab627cae105dcc34046a730c5b6"
  license ""

  depends_on "make" => :build
  depends_on "go" => :build

  def install
    print buildpath
    ENV["GOPATH"] = buildpath
    jscript_path = buildpath/"src/github.com/ashigirl96/jscript/"
    jscript_path.install buildpath.children

    cd jscript_path do
      system "make", "build"
      bin.install "jscript"
    end
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test 0.0.1`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
