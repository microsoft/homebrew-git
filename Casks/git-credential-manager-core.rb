cask 'git-credential-manager-core' do
  arch = Hardware::CPU.intel? ? "x64" : "arm64"
  name 'Git Credential Manager'
  homepage 'https://aka.ms/gcm'

  version "2.0.886"
  if Hardware::CPU.intel?
    sha256 '9ab97bffb2277e67ab24b0eea6a06e798f73097b560df513d0ebccf72149959e'
  else
    sha256 '64670143a0a6236fabc548aa2c98a1ce947cdc09f8fba110843a53aef2247d04'
  end

  url "https://github.com/GitCredentialManager/git-credential-manager/releases/download/v#{version.major_minor_patch}/gcm-osx-#{arch}-#{version.major_minor_patch}.pkg"
  pkg "gcm-osx-#{arch}-#{version}.pkg", allow_untrusted: true
  uninstall script: {
                      executable: "/usr/local/share/gcm-core/uninstall.sh",
                      sudo:       true,
                    },
            pkgutil: 'com.microsoft.GitCredentialManager'
end
