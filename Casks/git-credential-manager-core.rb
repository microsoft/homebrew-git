cask 'git-credential-manager-core' do
  arch = Hardware::CPU.intel? ? "x64" : "arm64"
  name 'Git Credential Manager'
  homepage 'https://aka.ms/gcm'

  version "2.2.2"
  if Hardware::CPU.intel?
    sha256 '92f0d53a1042d3f827f199eb05b3e0041e9af6983f2fe5929d6d44f11eecde54'
  else
    sha256 '2a51a513ae4dc7f5221b4708bce9c7dd6444aa6ba133def5354ace7382a55c15'
  end

  url "https://github.com/GitCredentialManager/git-credential-manager/releases/download/v#{version.major_minor_patch}/gcm-osx-#{arch}-#{version.major_minor_patch}.pkg"
  pkg "gcm-osx-#{arch}-#{version}.pkg", allow_untrusted: true
  uninstall script: {
                      executable: "/usr/local/share/gcm-core/uninstall.sh",
                      sudo:       true,
                    },
            pkgutil: 'com.microsoft.GitCredentialManager'
end
