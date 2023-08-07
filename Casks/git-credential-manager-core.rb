cask 'git-credential-manager-core' do
  arch = Hardware::CPU.intel? ? "x64" : "arm64"
  name 'Git Credential Manager'
  homepage 'https://aka.ms/gcm'

  version "2.3.0"
  if Hardware::CPU.intel?
    sha256 '2c835e24eb5223ef190c528f12a7d7054b8ca143f7399ab23f61c68c0b8e029b'
  else
    sha256 '8acfa913307140c06ec9b2692f9abfef32ecde4c83634d728597a94d34e0e773'
  end

  url "https://github.com/GitCredentialManager/git-credential-manager/releases/download/v#{version.major_minor_patch}/gcm-osx-#{arch}-#{version.major_minor_patch}.pkg"
  pkg "gcm-osx-#{arch}-#{version}.pkg", allow_untrusted: true
  uninstall script: {
                      executable: "/usr/local/share/gcm-core/uninstall.sh",
                      sudo:       true,
                    },
            pkgutil: 'com.microsoft.GitCredentialManager'
end
