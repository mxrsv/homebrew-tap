cask "tinysift" do
  version "0.4.1"
  sha256 "6c2b4d738927edfab29590e07b2c5e91f71dd8e4b71bb6456ffad3a10f157dc5"

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
