cask 'scalar-azrepos' do
  version '20.04.168.2'
  sha256 'd10a6b8ae84f9ba4251a77983e8117554f3a19223fb7287ae2fa179410d51b4b'

  url "https://github.com/microsoft/scalar/releases/download/v#{version}/Installers_macOS_Release.zip"

  name 'Scalar for Azure Repos'
  homepage 'https://github.com/microsoft/scalar'

  pkg "Installers_macOS_Release/Scalar/Scalar.#{version}.pkg", allow_untrusted: true

  conflicts_with cask: 'scalar'

  depends_on formula: 'microsoft-git'
  depends_on cask: 'git-credential-manager-core'

  uninstall script: {
                      executable: '/usr/local/scalar/uninstall_scalar.sh',
                      sudo:       true,
                    },
            pkgutil: 'com.scalar.pkg'
end
