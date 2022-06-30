cask 'git-credential-manager-core' do
  name 'Git Credential Manager'
  homepage 'https://aka.ms/gcm'

  version "2.0.779"
  sha256 '4df32ca342b6ec7661b0143b96b78a069fa309174af82678bcdb21ce8e85ebee'

  url "https://github.com/GitCredentialManager/git-credential-manager/releases/download/v#{version.major_minor_patch}/gcm-osx-x64-#{version.major_minor_patch}.pkg"

  pkg "gcm-osx-x64-#{version}.pkg", allow_untrusted: true

  uninstall script: {
                      executable: '/usr/local/share/gcm-core/uninstall.sh',
                      sudo:       true,
                    },
            pkgutil: 'com.microsoft.GitCredentialManager'
end
