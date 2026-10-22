cask "tinysift" do
  version "0.1.2"
  sha256 "8c20590a0d0d096b29207614d0719e88f91df9bd3753dedf8b81334dfb323f09"

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
