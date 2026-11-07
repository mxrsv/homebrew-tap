cask "tinysift" do
  version "0.6.0"
  sha256 "6b511f6364835ea14827171c9215d66d1e802524dc859be097ba85220b2a3737"

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
