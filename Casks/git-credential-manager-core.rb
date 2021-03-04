cask 'git-credential-manager-core' do
  name 'Git Credential Manager Core'
  homepage 'https://aka.ms/gcmcore'

  version "2.0.374.5910"
  sha256 '2fa7a1d06e90b84f1699e6d324a53b301cc7cc0f27563ea10b0e764b7bf77284'

  url "https://github.com/microsoft/Git-Credential-Manager-Core/releases/download/v#{version.major_minor_patch}-beta/gcmcore-osx-#{version}.pkg"

  pkg "gcmcore-osx-#{version}.pkg", allow_untrusted: true

  uninstall script: {
                      executable: '/usr/local/share/gcm-core/uninstall.sh',
                      sudo:       true,
                    },
            pkgutil: 'com.microsoft.GitCredentialManager'
end
