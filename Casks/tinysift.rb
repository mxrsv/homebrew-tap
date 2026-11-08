cask "tinysift" do
  version "0.7.0"
  sha256 "7637fd5044bd10aeeff8804f459cbc96d5bb71f2f704acf8472e6425060600d8"

  url "https://github.com/mxrsv/tinysift/releases/download/app-v#{version}/TinySift-#{version}.dmg"
  name "TinySift"
  desc "Disk cleaner, folder map, app uninstaller and activity monitor"
  homepage "https://tinysift.app/"

  livecheck do
    url "https://tinysift.app/updates/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "TinySift.app"

  zap trash: [
    "~/Library/Application Support/com.mxrsv.tinysift",
    "~/Library/Caches/com.mxrsv.tinysift",
    "~/Library/HTTPStorages/com.mxrsv.tinysift",
    "~/Library/Preferences/com.mxrsv.tinysift.plist",
  ]
end
