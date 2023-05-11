cask 'git-credential-manager-core' do
  arch = Hardware::CPU.intel? ? "x64" : "arm64"
  name 'Git Credential Manager'
  homepage 'https://aka.ms/gcm'

  version "2.1.2"
  if Hardware::CPU.intel?
    sha256 '475b7b7f9537ce61d6ec1337f4aa566af51a5885fb66b4086f978909cd743812'
  else
    sha256 'e56c371c964fdd12434058b9672b7fa2cea02b4acae3d5ec5aa9581fa88a2f15'
  end

  url "https://github.com/GitCredentialManager/git-credential-manager/releases/download/v#{version.major_minor_patch}/gcm-osx-#{arch}-#{version.major_minor_patch}.pkg"
  pkg "gcm-osx-#{arch}-#{version}.pkg", allow_untrusted: true
  uninstall script: {
                      executable: "/usr/local/share/gcm-core/uninstall.sh",
                      sudo:       true,
                    },
            pkgutil: 'com.microsoft.GitCredentialManager'
end
