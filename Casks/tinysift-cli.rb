cask "tinysift-cli" do
  version "0.1.0"
  sha256 "ade7aa31ba470f9b2df5cfa30189191e24e342a65228eab0b5240be4cf8e48b5"

  url "https://github.com/mxrsv/tinysift/releases/download/cli-v#{version}/tinysift-#{version}-aarch64-apple-darwin.tar.gz"
  name "TinySift CLI"
  desc "See what fills the disk and clean developer caches, dry run first"
  homepage "https://tinysift.app/"

  livecheck do
    url "https://github.com/mxrsv/tinysift"
    regex(/^cli-v(\d+(?:\.\d+)+)$/i)
    strategy :git
  end

  depends_on arch: :arm64
  depends_on macos: :sonoma

  executable = "tinysift-#{version}-aarch64-apple-darwin/tinysift"
  # sift is the name the guides teach. Another tool may already own it (homebrew-core has a
  # formula sift): leave that one alone, tinysift is the same program.
  short_name = Pathname("#{HOMEBREW_PREFIX}/bin/sift")
  short_name_is_free = !short_name.exist? || short_name.realpath.to_s.include?("/Caskroom/tinysift-cli/")

  binary executable
  binary executable, target: "sift" if short_name_is_free

  caveats do
    unless short_name_is_free
      <<~EOS
        Another sift is already installed, so the short name was left to it.
        Type tinysift wherever the guides say sift: it is the same tool.
      EOS
    end
  end
end
