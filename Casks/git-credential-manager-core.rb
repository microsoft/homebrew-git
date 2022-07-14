cask 'git-credential-manager-core' do
  arch = Hardware::CPU.intel? ? "x64" : "arm64"
  prefix = Hardware::CPU.intel? ? "/usr/local" : "/opt/homebrew"
  name 'Git Credential Manager'
  homepage 'https://aka.ms/gcm'

  version "2.0.785"
  if Hardware::CPU.intel?
    sha256 '064f8422122d84577b1dcd7845c942ad78aa899190fa5b5811a96528d1e89896'
  else
    sha256 'fcbad7768f97cbff58a594c926b1db74472da676ddda569076d2f20fc4d55575'
  end

  url "https://github.com/GitCredentialManager/git-credential-manager/releases/download/v#{version.major_minor_patch}/gcm-osx-#{arch}-#{version.major_minor_patch}.pkg"
  pkg "gcm-osx-#{arch}-#{version}.pkg", allow_untrusted: true
  uninstall script: {
                      executable: "#{prefix}/share/gcm-core/uninstall.sh",
                      sudo:       true,
                    },
            pkgutil: 'com.microsoft.GitCredentialManager'
end
