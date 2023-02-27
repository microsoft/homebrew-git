cask 'git-credential-manager-core' do
  arch = Hardware::CPU.intel? ? "x64" : "arm64"
  name 'Git Credential Manager'
  homepage 'https://aka.ms/gcm'

  version "2.0.931"
  if Hardware::CPU.intel?
    sha256 '61ad3da8efecb576e3f0960fe15bb919e801e21c9fb55deeec0128a74724c6cc'
  else
    sha256 '8d6e168c2ea1d359cfe3ad8591cb5f61b45be42ad4f44d249cc8c9994e3cb097'
  end

  url "https://github.com/GitCredentialManager/git-credential-manager/releases/download/v#{version.major_minor_patch}/gcm-osx-#{arch}-#{version.major_minor_patch}.pkg"
  pkg "gcm-osx-#{arch}-#{version}.pkg", allow_untrusted: true
  uninstall script: {
                      executable: "/usr/local/share/gcm-core/uninstall.sh",
                      sudo:       true,
                    },
            pkgutil: 'com.microsoft.GitCredentialManager'
end
