class LlvmEmbeddedArmAT16 < Formula
  desc "LLVM toolchain for 32-bit Arm embedded targets"
  homepage "https://github.com/ARM-software/LLVM-embedded-toolchain-for-Arm"
  head do
    url  "https://github.com/ARM-software/LLVM-embedded-toolchain-for-Arm.git", branch: "llvm-16"
  end 
  license "Apache-2.0"
  version "16.0.0"

  depends_on "cmake" => :build
  depends_on "gnu-tar" => :build
  depends_on "meson" => :build
  depends_on "ninja" => :build
  depends_on "virtualenv" => :build
  depends_on "zstd"


  def install
    system "cmake", "-S", ".", "-B", "builddir", "-GNinja", *std_cmake_args
    system "cmake", "--build", "builddir"
    system "cmake", "--install", "builddir"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test llvm-embedded-arm`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
